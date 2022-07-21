{ config, pkgs, lib, ... }:

with builtins;
with lib;

{
  imports = [
    ./platform
    ./desktop
    ./network
    ./packages
    ./user
  ];
  sops.age.keyFile = "/var/lib/sops.key";
  time.timeZone = "Asia/Shanghai";
  networking.firewall.enable = false;
  programs.vim.defaultEditor = true;
  virtualisation.virtualbox.host.enable = true;
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBuDCCAV6gAwIBAgIRAN4mUTU29kmR6Frd/mxdBI8wCgYIKoZIzj0EAwIwOjEX
      MBUGA1UEChMOQW5pbGxjIE5ldHdvcmsxHzAdBgNVBAMTFkFuaWxsYyBOZXR3b3Jr
      IFJvb3QgQ0EwHhcNMjIwNDIzMTU1MzMzWhcNMzIwNDIwMTU1MzMzWjA6MRcwFQYD
      VQQKEw5BbmlsbGMgTmV0d29yazEfMB0GA1UEAxMWQW5pbGxjIE5ldHdvcmsgUm9v
      dCBDQTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABNVhfPh+481EdmHfpE15TJZ1
      HRuTimaBeQ+W4rWKDTXJ4Nhqz46j8vvJ7KsMYvIPR0j7k+2AZsAb9h99duH2FPOj
      RTBDMA4GA1UdDwEB/wQEAwIBBjASBgNVHRMBAf8ECDAGAQH/AgEBMB0GA1UdDgQW
      BBTCA7ZQ7hdNmYKwmmpnJ8PP+zhU4jAKBggqhkjOPQQDAgNIADBFAiAmNo5TVoX0
      TYsI+A1iQcT5WnGyejD0dvgOxDEBVdcg8QIhANjWSjihlT/6/DKq9QeslU8eNnVW
      Jw7M2hlSAfUFq1/0
      -----END CERTIFICATE-----
    ''
  ];
  programs.nix-ld.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  powerManagement.powertop.enable = true;
}
