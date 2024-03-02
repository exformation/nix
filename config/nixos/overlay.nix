self: super: {
  osu-lazer-bin = super.osu-lazer-bin.overrideAttrs (oldAttrs: rec {
    pname = "osu-lazer-bin";
    version = "2024.302.0";
    src = {
      x86_64-linux = super.fetchurl {
        url =
          "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
        sha256 = "sha256-4+ACEWYgXvr8eoRJZHmTq74Bh159V+p2K+Pn1IPi2l4=";
      };
    };
  });
}
