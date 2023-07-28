
https://github.com/exformation/vial-qmk/tree/vial/keyboards/fingerpunch/barobord
make fingerpunch/barobord:default RGBLIGHT_ENABLE=no ENCODER_ENABLE=no PIMORONI_TRACKBALL_ENABLE=no
qmk flash -kb fingerpunch/barobord -km default





```c
// sudo util/docker_build.sh gergoplex:notgate:flash
// make gergoplex:notgate:flash
#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[0] = LAYOUT_gergoplex(
    XXXX, 6  ,4   ,2   ,XXXX,XXXX,12  ,14  ,16  ,XXXX,
    7   , 5  ,3   ,1   ,XXXX,XXXX,11  ,13  ,15  ,17  ,
    XXXX,XXXX,XXXX,XXXX,XXXX,XXXX,XXXX,XXXX,XXXX,XXXX,
              XXXX,8   ,9   ,19  ,18  ,XXXX),
};

static uint16_t state;
uint16_t start = 0;
enum SIDE{NONE,RIGHT,LEFT};
enum SIDE side = NONE;
#define X 1<<1
#define Z 1<<2
#define K 1<<3
#define J 1<<4
#define V 1<<5
#define Q 1<<6
#define PINKIE 1<<7
#define THUMB1 1<<8
#define THUMB2 1<<9
#define TAP(KC) tap_code16(KC);break;
#define OS(KC) set_oneshot_mods(KC);break;

static void process(uint16_t val) {
    switch (val) {
        // Alphabet
        case X    :TAP(KC_X)
        case Z    :TAP(KC_Z)
        case K    :TAP(KC_K)
        case J    :TAP(KC_J)
        case V    :TAP(KC_V)
        case Q    :TAP(KC_Q)
        case X|K  :TAP(KC_A)
        case X|J  :TAP(KC_L)
        case X|V  :TAP(KC_E)
        case X|Q  :TAP(KC_C)
        case Z|K  :TAP(KC_R)
        case Z|J  :TAP(KC_N)
        case Z|V  :TAP(KC_D)
        case Z|Q  :TAP(KC_I)
        case K|V  :TAP(KC_T)
        case K|Q  :TAP(KC_S)
        case J|V  :TAP(KC_H)
        case J|Q  :TAP(KC_O)
        case X|K|V:TAP(KC_B)
        case X|K|Q:TAP(KC_Y)
        case X|J|V:TAP(KC_M)
        case X|J|Q:TAP(KC_F)
        case Z|K|V:TAP(KC_G)
        case Z|K|Q:TAP(KC_U)
        case Z|J|V:TAP(KC_P)
        case Z|J|Q:TAP(KC_W)

        // Capital Alphabet
        case THUMB1|PINKIE      :TAP(KC_TAB)
        case THUMB1|PINKIE|X    :TAP(S(KC_X))
        case THUMB1|PINKIE|Z    :TAP(S(KC_Z))
        case THUMB1|PINKIE|K    :TAP(S(KC_K))
        case THUMB1|PINKIE|J    :TAP(S(KC_J))
        case THUMB1|PINKIE|V    :TAP(S(KC_V))
        case THUMB1|PINKIE|Q    :TAP(S(KC_Q))
        case THUMB1|PINKIE|X|K  :TAP(S(KC_A))
        case THUMB1|PINKIE|X|J  :TAP(S(KC_L))
        case THUMB1|PINKIE|X|V  :TAP(S(KC_E))
        case THUMB1|PINKIE|X|Q  :TAP(S(KC_C))
        case THUMB1|PINKIE|Z|K  :TAP(S(KC_R))
        case THUMB1|PINKIE|Z|J  :TAP(S(KC_N))
        case THUMB1|PINKIE|Z|V  :TAP(S(KC_D))
        case THUMB1|PINKIE|Z|Q  :TAP(S(KC_I))
        case THUMB1|PINKIE|K|V  :TAP(S(KC_T))
        case THUMB1|PINKIE|K|Q  :TAP(S(KC_S))
        case THUMB1|PINKIE|J|V  :TAP(S(KC_H))
        case THUMB1|PINKIE|J|Q  :TAP(S(KC_O))
        case THUMB1|PINKIE|X|K|V:TAP(S(KC_B))
        case THUMB1|PINKIE|X|K|Q:TAP(S(KC_Y))
        case THUMB1|PINKIE|X|J|V:TAP(S(KC_M))
        case THUMB1|PINKIE|X|J|Q:TAP(S(KC_F))
        case THUMB1|PINKIE|Z|K|V:TAP(S(KC_G))
        case THUMB1|PINKIE|Z|K|Q:TAP(S(KC_U))
        case THUMB1|PINKIE|Z|J|V:TAP(S(KC_P))
        case THUMB1|PINKIE|Z|J|Q:TAP(S(KC_W))

        // Pinkie Chords
        case PINKIE      :TAP(KC_ENT)
        case PINKIE|X    :TAP(KC_UNDS)
        case PINKIE|Z    :TAP(KC_BSLASH)
        case PINKIE|K    :TAP(KC_1)
        case PINKIE|J    :TAP(KC_CIRC)
        case PINKIE|V    :TAP(KC_0)
        case PINKIE|Q    :TAP(KC_SLASH)
        case PINKIE|X|K  :TAP(KC_RBRC)
        case PINKIE|X|J  :TAP(KC_GT)
        case PINKIE|X|V  :TAP(KC_EQL)
        case PINKIE|X|Q  :TAP(KC_MINUS)
        case PINKIE|Z|K  :TAP(KC_RCBR)
        case PINKIE|Z|J  :TAP(KC_RPRN)
        case PINKIE|Z|V  :TAP(KC_ASTR)
        case PINKIE|Z|Q  :TAP(KC_PLUS)
        case PINKIE|K|V  :TAP(KC_LBRC)
        case PINKIE|K|Q  :TAP(KC_LCBR)
        case PINKIE|J|V  :TAP(KC_LT)
        case PINKIE|J|Q  :TAP(KC_LPRN)
        case PINKIE|X|K|V:TAP(KC_8)
        case PINKIE|X|K|Q:TAP(KC_7)
        case PINKIE|X|J|V:TAP(KC_3)
        case PINKIE|X|J|Q:TAP(KC_4)
        case PINKIE|Z|K|V:TAP(KC_6)
        case PINKIE|Z|K|Q:TAP(KC_2)
        case PINKIE|Z|J|V:TAP(KC_5)
        case PINKIE|Z|J|Q:TAP(KC_9)

        // Thumb1 Chords
        case THUMB1      :TAP(KC_SPC)
        case THUMB1|X    :TAP(KC_DLR)
        case THUMB1|Z    :TAP(KC_TILD)
        case THUMB1|K    :TAP(KC_F1)
        case THUMB1|J    :TAP(KC_GRV)
        case THUMB1|V    :TAP(KC_ESC)
        case THUMB1|Q    :TAP(KC_PERC)
        case THUMB1|X|K  :TAP(KC_DOT)
        case THUMB1|X|J  :TAP(KC_AMPR)
        case THUMB1|X|V  :TAP(KC_DQT)
        case THUMB1|X|Q  :TAP(KC_AT)
        case THUMB1|Z|K  :TAP(KC_EXLM)
        case THUMB1|Z|J  :TAP(KC_COLN)
        case THUMB1|Z|V  :TAP(KC_HASH)
        case THUMB1|Z|Q  :TAP(KC_QUOT)
        case THUMB1|K|V  :TAP(KC_COMM)
        case THUMB1|K|Q  :TAP(KC_QUES)
        case THUMB1|J|V  :TAP(KC_PIPE)
        case THUMB1|J|Q  :TAP(KC_SCLN)
        case THUMB1|X|K|V:TAP(KC_F8)
        case THUMB1|X|K|Q:TAP(KC_F7)
        case THUMB1|X|J|V:TAP(KC_F3)
        case THUMB1|X|J|Q:TAP(KC_F4)
        case THUMB1|Z|K|V:TAP(KC_F6)
        case THUMB1|Z|K|Q:TAP(KC_F2)
        case THUMB1|Z|J|V:TAP(KC_F5)
        case THUMB1|Z|J|Q:TAP(KC_F9)

        // Thumb2 Chords
        case THUMB2      :TAP(KC_BSPC)
        case THUMB2|X    :OS(MOD_LCTL)
        case THUMB2|Z    :layer_move(0); break;
        case THUMB2|K    :OS(MOD_LGUI)
        case THUMB2|J    :layer_move(2); break;
        case THUMB2|V    :OS(MOD_LALT)
        case THUMB2|Q    :TAP(XX)
        case THUMB2|X|K  :OS(MOD_LCTL|MOD_LGUI)
        case THUMB2|X|J  :TAP(XX)
        case THUMB2|X|V  :OS(MOD_LCTL|MOD_LALT)
        case THUMB2|X|Q  :TAP(XX)
        case THUMB2|Z|K  :TAP(XX)
        case THUMB2|Z|J  :TAP(XX)
        case THUMB2|Z|V  :TAP(XX)
        case THUMB2|Z|Q  :TAP(XX)
        case THUMB2|K|V  :OS(MOD_LGUI|MOD_LALT)
        case THUMB2|K|Q  :TAP(XX)
        case THUMB2|J|V  :TAP(XX)
        case THUMB2|J|Q  :TAP(XX)
        case THUMB2|X|K|V:OS(MOD_LCTL|MOD_LGUI|MOD_LALT)
        case THUMB2|X|K|Q:TAP(XX)
        case THUMB2|X|J|V:TAP(XX)
        case THUMB2|X|J|Q:TAP(XX)
        case THUMB2|Z|K|V:TAP(XX)
        case THUMB2|Z|K|Q:TAP(XX)
        case THUMB2|Z|J|V:TAP(XX)
        case THUMB2|Z|J|Q:TAP(XX)
    }
    // KC_LOCK?
    // printscreen
    // audio controls (up,down,mute)
    // brightness controls (up,down)
    // media controls (pause,play,next,prev)
    // arrows (lrud)
    // Home, End, PageUp, PageDown
}



void matrix_scan_user() {
    if(side!=NONE && timer_elapsed(start)>500){
        process(state);
    }
}


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    if(record->event.pressed && keycode != KC_NO) {
        if(side != keycode/10+1 && side != NONE) {
            process(state);
            state = 0;
        }
        side = keycode/10+1;
        if(state==0) start = timer_read();
        state |= 1 << (keycode%10);
    }else if(state > 0){
        process(state);
        state = 0;
        side = NONE;
    }
};
```
