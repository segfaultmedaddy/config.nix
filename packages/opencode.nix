{
  pkgs,
  inputs,
  ...
}:
inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode.overrideAttrs (old: {
  # https://github.com/anomalyco/opencode/issues/23719#issuecomment-4308932129
  preBuild = (old.preBuild or "") + ''
    substituteInPlace packages/opencode/src/cli/cmd/generate.ts \
      --replace-fail 'const prettier = await import("prettier")' 'const prettier: any = { format: async (s: string) => s }' \
      --replace-fail 'const babel = await import("prettier/plugins/babel")' 'const babel = {}' \
      --replace-fail 'const estree = await import("prettier/plugins/estree")' 'const estree = {}'
  '';
})
