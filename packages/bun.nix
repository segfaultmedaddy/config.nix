# I don't use bun for anything else beside the opencode, so it makes sense to
# keep the global bun in sync with the opencode deps version.
#
# The proper fix is prolly to backport the override to opencode's flake.
{ bun, fetchurl }:
bun.overrideAttrs (old: {
  version = "1.3.14";

  # Remove warnings about missing src override.
  __intentionallyOverridingVersion = true;

  passthru = old.passthru // {
    sources = old.passthru.sources // {
      "aarch64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.14/bun-darwin-aarch64.zip";
        hash = "sha256-2LliIYKK1vl6x6wKt+lYcjQa92MAHogD6CZ2UsJlJiA=";
      };
      "aarch64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.14/bun-linux-aarch64.zip";
        hash = "sha256-on/7Y6gxA3WDbg1vZorhf6jY0YuIw3yCHGUzGXOhmjs=";
      };
      "x86_64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.14/bun-darwin-x64-baseline.zip";
        hash = "sha256-PjWtb1OXGpg0v55nhuKt9ytfGSHMmpxf3gc9KXKUQHY=";
      };
      "x86_64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v1.3.14/bun-linux-x64.zip";
        hash = "sha256-lR7iruhV8IWVruxiJSJqKY0/6oOj3NZGXAnLzN9+hI8=";
      };
    };
  };
})
