{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubernetes-helm
    helm-docs
    kubectl
    kubectx
    cue # config language
    timoni # like helm, but based on cue
    kubeconform # manifest validator
  ];
}
