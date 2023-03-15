# nixos-22.11
with import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/67f26c1cfc5d5783628231e776a81c1ade623e0b.tar.gz) { };
let
  isLinux = builtins.elem system ["x86_64-linux" "aarch64-linux"];
in
mkShell {
  buildInputs = [
    nodejs-14_x
  ];

  shellHook =
    lib.optionalString (isLinux) ''
			export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="true"
			export PLAYWRIGHT_BROWSERS_PATH="${pkgs.playwright.browsers}"
			export PLAYWRIGHT_BROWSERS_VERSION="${pkgs.playwright.version}"
    '';
}
