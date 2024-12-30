{ useColima }:
{ pkgs, ... }:
if useColima then
  {
    # Use agents instead of daemons as colima requires to run in the user space.
    launchd.agents.colima = {
      command = "${pkgs.colima}/bin/colima start --foreground";
      serviceConfig = {
        Label = "com.abiosoft.colima";
        RunAtLoad = true;
        KeepAlive = true;

        StandardOutPath = "/tmp/colima.stdout.log";
        StandardErrorPath = "/tmp/colima.stderr.log";
      };
    };
  }
else
  {
    homebrew.casks = [
      "docker"
    ];
  }
