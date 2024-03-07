self: super: {
  osu-lazer-bin = super.osu-lazer-bin.overrideAttrs (oldAttrs: rec {
    pname = "osu-lazer-bin";
    version = "2024.302.1";
    src = super.fetchurl {
      url =
        "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
      sha256 = "sha256-vYG3viY9GBtgaY8ThCSWss+zzjAyVa4fmrWrQdYcUow=";
    };
  });
}
