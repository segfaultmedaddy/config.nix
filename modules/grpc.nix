{pkgs, ...}: {
  home.packages = with pkgs; [
    grpcurl # curl but for grpc
    grpcui
    buf
    protoc-gen-connect-go
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
  ];
}
