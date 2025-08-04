{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubernetes-helm
    helm-docs
    kubectl
    kubectx
    tanka
    kubeconform # manifest validator
  ];
}
