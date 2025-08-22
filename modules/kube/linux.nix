{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 6443 ];

  services.k3s = {
    enable = true;
    role = "server";
  };
  systemd.services.k3s.serviceConfig.DeviceAllow = [
    "/dev/kvm rwm"
    "/dev/mshv rwm"
    "/dev/kmsg rwm"
    "/dev/vhost-vsock rwm"
    "/dev/vhost-net rwm"
    "/dev/net/tun rwm"
  ];
  systemd.services.k3s.serviceConfig.Delegate = "yes";
  systemd.services.k3s.path = [ pkgs.kata-runtime ];
  systemd.tmpfiles.settings."09-k3s"."/var/lib/rancher/k3s/agent/etc/containerd/config-v3.toml.tmpl"."L+".argument =
    let
      template = ''
        {{ template "base" . }}

        [plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.'kata']
            runtime_type = "io.containerd.kata.v2"
            privileged_without_host_devices = true
            pod_annotations = ["io.katacontainers.*"]
            container_annotations = ["io.katacontainers.*"]
      '';
    in
    "${pkgs.writeText "config-v3.toml.tmpl" template}";
}
