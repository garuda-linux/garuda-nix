{
  config,
  garuda-lib,
  lib,
  pkgs,
  ...
}:
with lib;
with garuda-lib;
{
  config = {
    # Use the Terminus font for the console
    console = {
      earlySetup = config.garuda.system.isGui;
      font = lib.mkIf config.garuda.system.isGui "${pkgs.terminus_font}/share/consolefonts/ter-v32b.psf.gz";
      packages = lib.mkIf config.garuda.system.isGui (with pkgs; [ terminus_font ]);
    };
    boot.kernelParams = lib.mkIf config.garuda.system.isGui (
      gExcludableArray config "kernelparameters" [ "fbcon=font:TER16x32" ]
    );
  };
}
