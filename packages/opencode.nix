{
  pkgs,
  inputs,
  ...
}:
let
  patched-bun = pkgs.bun.overrideAttrs (old: {
    version = "1.3.13";

    # remove warnings about missing src override.
    __intentionallyOverridingVersion = true;

    passthru = old.passthru // {
      sources = old.passthru.sources // {
        "aarch64-darwin" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-darwin-aarch64.zip";
          hash = "sha256-VGfj9l26Umuf6pjwzOBO+vwMY+Fpcz7Ce4dqOtMtoZA=";
        };
        "aarch64-linux" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-linux-aarch64.zip";
          hash = "sha256-cLrkGzkIsKEg4eWMXIrzDnSvrjuNEbDT/djnh937SyI=";
        };
        "x86_64-darwin" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-darwin-x64-baseline.zip";
          hash = "sha256-qYumpIDyL9qbNDYmuQak4mqlNhi/hdK8WSjs8rpF8O0=";
        };
        "x86_64-linux" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-linux-x64.zip";
          hash = "sha256-ecB3H6i5LDOq5B4VoODTB+qZ0OLwAxfHHGxTI3p44lo=";
        };
      };
    };
  });
in
inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode.overrideAttrs (old: {
  nativeBuildInputs =
    (builtins.filter (pkg: (pkg.pname or pkg.name or "") != "bun") (old.nativeBuildInputs or [ ]))
    ++ [ patched-bun ];

  buildInputs =
    (builtins.filter (pkg: (pkg.pname or pkg.name or "") != "bun") (old.buildInputs or [ ]))
    ++ [ patched-bun ];

  # https://github.com/anomalyco/opencode/issues/23719#issuecomment-4308932129
  preBuild = (old.preBuild or "") + ''
    substituteInPlace packages/opencode/src/cli/cmd/generate.ts \
      --replace-fail 'const prettier = await import("prettier")' 'const prettier: any = { format: async (s: string) => s }' \
      --replace-fail 'const babel = await import("prettier/plugins/babel")' 'const babel = {}' \
      --replace-fail 'const estree = await import("prettier/plugins/estree")' 'const estree = {}'
  '';
})
