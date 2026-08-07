{
  hasMasSupport ? true,
  ...
}:
{
  homebrew = {
    casks = [
      "1password"
      "1password-cli"
    ];
  }
  // (
    if hasMasSupport then
      {
        masApps = {
          "1Password for Safari" = 1569813296;
        };
      }
    else
      { }
  );
}
