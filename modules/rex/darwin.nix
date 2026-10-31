{ ... }:
{
  # These settings belong to the macOS client, not the server's init.lua.
  system.defaults.CustomUserPreferences."com.superlogical.rex" = {
    "Workspace.terminalFontName" = "SF Mono";
    "Workspace.terminalFallbackFontNames" = [ "Symbols Nerd Font Mono" ];
    "Workspace.terminalFontPointSize" = 15;
    SUAutomaticallyUpdate = true;
    SUEnableAutomaticChecks = true;
  };
}
