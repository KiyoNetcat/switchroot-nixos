{
  buildUBoot,
  fetchFromGitLab,
}:
let
  uboot = buildUBoot {
    version = "2025.NX02.b201801";

    src = fetchFromGitLab {
      owner = "l4t-community/bootstack";
      repo = "u-boot";
      rev = "12d7116345200d8b8bcdb42690256286e73a6e37";
      hash = "sha256-MOeWhHBzbYzJ/PS6LFAEXVIRMllu33/LoL8eiC9jHZM=";
    };

    defconfig = "nintendo-switch_defconfig";

    targetPlatforms = [ "aarch64-linux" ];
    filesToInstall = [ "u-boot.bin" ];

    patches = [
      ./patches/01-conformant_version.patch
      ./patches/02-swig_4_2.patch
      ./patches/03-fix_include.patch
    ];
  };
in
uboot
