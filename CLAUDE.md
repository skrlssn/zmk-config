# ZMK Config — Corne Choc Pro

ZMK firmware configuration for a Corne Choc Pro split keyboard. Firmware is built via GitHub Actions on every push.

## Hardware

- **Keyboard**: Corne Choc Pro (6-column split, 46 keys)
- **No rotary encoders** — ignore any `sensor-bindings` lines
- **Two physical layouts** defined: `default_layout` (6-col) and `five_col_layout` (5-col)
- The board definition lives in [boards/arm/corne_choc_pro/](boards/arm/corne_choc_pro/)

## Key files

| File | Purpose |
|------|---------|
| [config/corne_choc_pro.keymap](config/corne_choc_pro.keymap) | Main keymap — edit this |
| [config/corne_choc_pro.conf](config/corne_choc_pro.conf) | Firmware config (power, BT, etc) |
| [config/west.yml](config/west.yml) | ZMK version pinned to `v0.3` |
| [.github/workflows/build.yml](.github/workflows/build.yml) | CI build |

## Key positions (default 6-col layout)

```
Row 0:  0   1   2   3   4   5   6   7   8   9  10  11  12  13
Row 1: 14  15  16  17  18  19  20  21  22  23  24  25  26  27
Row 2: 28  29  30  31  32  33               34  35  36  37  38  39
Thumb:             40  41  42               43  44  45
```

Positions 6/7 and 20/21 are the two inner columns (currently used for extra keys like CAPS, C_PP, sticky mods).

## Layer map

| Index | Name | Activated by |
|-------|------|-------------|
| 0 | MAC | default |
| 1 | WIN | `tog 1` |
| 2 | NUM | `mo 2` (left thumb) |
| 3 | MAC SYM | `mo 3` (right thumb, mac) |
| 4 | WIN SYM | `mo 4` (right thumb, win) |
| 5 | FUNC | `mo 2` + `mo 3/4` simultaneously (conditional layer) |

## Home row mods

Both MAC and WIN layers use `hml`/`hmr` (balanced hold-tap, 280ms, 150ms prior-idle):

```
Left:  A=LGUI  S=LALT  D=LCTRL  F=LSHFT
Right: J=RSHFT K=RCTRL L=RALT   ;=RGUI
```

`hold-trigger-key-positions` is set so mods only activate on opposite-hand keypresses, preventing accidental holds during fast same-hand typing.

## ZMK tips

- Use `&trans` to fall through to the layer below
- `&sk` = sticky key (one-shot modifier)
- `&mo` = momentary layer, `&tog` = toggle layer
- `&lt` = layer-tap (hold for layer, tap for keycode)
- Combos are defined with `key-positions` matching the position map above