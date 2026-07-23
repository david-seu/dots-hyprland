# Upstream design review

Date: 2026-07-23

This note compares the lean personal profile with `upstream/main` from
`end-4/dots-hyprland`. The local fork currently has upstream at
`7e61a6a56ac92b767dcba65b3fc380f40fddc823` (2026-07-21), while the lean
profile was based on `20ec7717a4c67bcc074dec0cd28638f4f22516f0`.

## What changed upstream

- **Hyprland configuration moved to Lua.** Commit
  [`6c041b95`](https://github.com/end-4/dots-hyprland/commit/6c041b95)
  replaced the main Hyprland `.conf` tree with `.lua` modules for general
  settings, keybinds, rules, environment, variables, colors, and startup.
  This is a configuration-language migration, not a move from Quickshell to
  Lua: the UI remains QML.
- **The workspace bar was redesigned.** Commit
  [`446504ad`](https://github.com/end-4/dots-hyprland/commit/446504ad)
  introduced shared workspace/model/widget primitives and substantially
  reworked `Workspaces.qml`. This is the largest recent UI change relevant to
  the top bar.
- **The installer narrowed its Quickshell ownership.** Commit
  [`a8761bc6`](https://github.com/end-4/dots-hyprland/commit/a8761bc6)
  changed installation so the `ii` Quickshell tree is synchronized without
  overwriting an entire user Quickshell directory. The current upstream
  install manifest also no longer treats the old `illogical-impulse` mapping
  as the main installation surface.
- **There have been smaller stability and integration fixes.** Examples
  include the Qt 6.11 notification freeze fix in
  [`c58bb07a`](https://github.com/end-4/dots-hyprland/commit/c58bb07a),
  touchpad global-shortcut support in
  [`9f4afde0`](https://github.com/end-4/dots-hyprland/commit/9f4afde0),
  notification monitor targeting, and MPRIS/browser detection fixes.

## Decision for this profile

Switch to Lua eventually, because it is now the upstream configuration
format and future upstream changes will otherwise need manual translation.
Do not fast-forward the live lean profile or merge 435 upstream commits in
place: that would reintroduce the UI and services we intentionally removed.

The safe next step is a separate upstream-refresh branch that ports the lean
profile to the Lua layout, reapplies the intentional deletions, and validates
the keyboard-first workflow. The current `.conf` profile remains the stable
live baseline until that port is tested.

## Current personal choices to preserve during a refresh

- Keep the existing workspace behavior and numbers.
- Keep the compact bar, inferred wallpaper theme, notifications, media
  controls, calendar, volume/brightness feedback, screen recording, Google
  Lens, clipboard, math, shell commands, visible color picker, and automatic
  engineering time tracking.
- Remove Fuzzel, the periodic table/Elements cheatsheet page, emoji/web
  search, random widgets, EasyEffects UI, todo/Pomodoro, dark/light theme
  switcher, and the old calendar navigation rail.
- Keep Pixel Sprout, but load it inside the main `ii` Quickshell process so its
  `qs.modules.common` imports resolve; the binding calls `qs -c ii`.
