{ bun, fetchurl }:
bun.overrideAttrs (old: {
  version = "1.3.13";

  # Remove warnings about missing src override.
  __intentionallyOverridingVersion = true;

  passthru = old.passthru // {
    sources = old.passthru.sources // {
      "aarch64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-darwin-aarch64.zip";
        hash = "sha256-VGfj9l26Umuf6pjwzOBO+vwMY+Fpcz7Ce4dqOtMtoZA=";
      };
      "aarch64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-linux-aarch64.zip";
        hash = "sha256-cLrkGzkIsKEg4eWMXIrzDnSvrjuNEbDT/djnh937SyI=";
      };
      "x86_64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-darwin-x64-baseline.zip";
        hash = "sha256-qYumpIDyL9qbNDYmuQak4mqlNhi/hdK8WSjs8rpF8O0=";
      };
      "x86_64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.13/bun-linux-x64.zip";
        hash = "sha256-ecB3H6i5LDOq5B4VoODTB+qZ0OLwAxfHHGxTI3p44lo=";
      };
    };
  };
})
