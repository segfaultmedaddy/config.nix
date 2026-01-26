{ ... }:
{
  programs.clawdbot = {
    enable = true;

    firstParty = {
      summarize.enable = true;
      gogcli.enable = true;
      bird.enable = true;
    };

    documents = ./documents;
    instances.default = {
      providers.telegram = {
        enable = true;
        botTokenFile = "/run/agenix/clawdbot_telegram_token";
        allowFrom = [ 58267337 ];
        groups = {
          "*" = {
            requireMention = true;
          };
        };
      };
    };

    providers.anthropic = {
      apiKeyFile = "/run/agenix/clawdbot_anthropic_key";
    };
  };
}
