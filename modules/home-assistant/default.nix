{ ... }:
{
  services.home-assistant = {
    enable = true;
    extraComponents = [
      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
      "isal"
      "matter"
    ];

    # default port is 8123
    config = {
      default_config = { };
    };
  };

  # The easiest way to get Dirigera working with HA
  services.matter-server = {
    enable = true;
  };

  networking.firewall.allowedTCPPorts = [
    8123
  ];
}
