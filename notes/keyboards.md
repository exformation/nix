
https://github.com/exformation/vial-qmk/tree/vial/keyboards/fingerpunch/barobord
make fingerpunch/barobord:default RGBLIGHT_ENABLE=no ENCODER_ENABLE=no PIMORONI_TRACKBALL_ENABLE=no
qmk flash -kb fingerpunch/barobord -km default

