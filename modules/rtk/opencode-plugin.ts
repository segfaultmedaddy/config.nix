// RTK OpenCode V2 plugin: rewrites shell commands to use rtk for token savings.
//
// Port of https://github.com/rtk-ai/rtk/blob/develop/hooks/opencode/rtk.ts to
// the V2 plugin API (https://opencode.ai/v2/docs/build/plugins). All rewrite
// logic lives in `rtk rewrite`; this file only delegates to it.
//
// Kept as a plain, dependency-free default export (no `@opencode/plugin`
// import) so it loads without a node_modules next to it.

import { spawn } from "node:child_process"

const RTK = "@rtk@"
const REWRITE_TIMEOUT_MS = 2_000
const SHELL_TOOLS = new Set(["shell", "bash"])

// `rtk rewrite` reports its decision via the exit code (0/3 = rewritten,
// 1 = passthrough, 2 = deny), printing the rewritten command on stdout.
// Only stdout matters here, so read it regardless of the exit status.
function rewrite(command: string): Promise<string | undefined> {
  return new Promise((resolve) => {
    let stdout = ""
    let child: ReturnType<typeof spawn>
    try {
      child = spawn(RTK, ["rewrite", command], {
        stdio: ["ignore", "pipe", "ignore"],
        timeout: REWRITE_TIMEOUT_MS,
      })
    } catch {
      resolve(undefined)
      return
    }
    child.stdout?.setEncoding("utf8")
    child.stdout?.on("data", (chunk: string) => (stdout += chunk))
    child.on("error", () => resolve(undefined))
    child.on("close", () => resolve(stdout.trim() || undefined))
  })
}

export default {
  id: "rtk.rewrite",
  async setup(ctx: {
    tool: {
      hook(
        name: "execute.before",
        callback: (event: { tool: string; input: unknown }) => Promise<void> | void,
      ): Promise<unknown>
    }
  }) {
    await ctx.tool.hook("execute.before", async (event) => {
      if (!SHELL_TOOLS.has(String(event.tool ?? "").toLowerCase())) return

      const input = event.input
      if (!input || typeof input !== "object") return
      const command = (input as Record<string, unknown>).command
      if (typeof command !== "string" || !command) return

      const rewritten = await rewrite(command)
      if (!rewritten || rewritten === command) return

      event.input = { ...(input as Record<string, unknown>), command: rewritten }
    })
  },
}
