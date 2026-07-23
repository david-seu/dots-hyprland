# Personal Hyprland setup plan

Status: committed, pushed, and active on `personal/lean-hyprland`; calendar,
cheatsheet, and Pixel Sprout follow-up fixes are included in the current
working change.

Live backup: `/home/zyk3l/ii-lean-hyprland-backup-20260723`

Last updated: 2026-07-23

## Goal

Keep a keyboard-first, touchpad-only engineering workstation on Fedora with Hyprland tiling, direct terminal workflows for Codex and Claude Code, Chrome, Git/worktrees, AWS, Python, and editor work.

The target is a small personal desktop layer, not a general-purpose desktop environment.

## Evidence from this machine

- The current setup comes from `end-4/dots-hyprland` / Illogical Impulse.
- Fish history contains about 3,300 commands, including heavy use of `codex`, `git`, `aws`, `poetry`, Vim/Neovim, Python, Docker, SSH, and Claude.
- The current live shell is `qs -c ii`.
- Direct shell history shows almost no manual use of Quickshell features; the shell is mainly started automatically by Hyprland.
- UI clicks and IPC actions are not recorded in the shell history, so absence of commands does not prove that a sidebar or panel was never opened.
- Current `Super+Tab` is Quickshell's workspace overview:
  `global, quickshell:overviewWorkspacesToggle`
- Current `Super` search is Quickshell search, with Fuzzel only as a fallback.

## Decisions made

### Platform

- Stay on Fedora.
- Do not switch to Windows or Ubuntu just to obtain Codex/Cowork GUI applications.
- Treat Codex CLI and Claude Code CLI as the primary engineering interfaces.

### Interaction model

- Keep Hyprland tiling.
- Optimize for keyboard use and touchpad use without requiring a mouse.
- Prefer direct, explicit application bindings over generic fallback chains.
- Keep the current numeric workspace organization and bindings; do not reorganize workspaces around projects or application types.
- Keep the current workspace app icons for occupied workspaces alongside the numeric workspace organization.
- Keep four-finger horizontal touchpad swipes for workspace navigation; remove the four-finger vertical overview gesture. Keep Quickshell overview as the keyboard launcher and clipboard surface.
- Keep the three-finger swipe-to-move and pinch-to-float touchpad gestures.
- Keep moderate visual polish: wallpaper-derived theming, rounded corners, and short window/workspace animations. Treat heavy blur, animated wallpaper, and unnecessary transparency as removable if they hurt responsiveness or battery.
- Do not start EasyEffects automatically. Keep it available for a later, separate audio-effects configuration if needed.
- Keep a static wallpaper and wallpaper-derived theme colors; remove the dead video-wallpaper restore startup path.
- Keep the CO2 Work Companion daemon at startup because it powers Pixel Sprout and the local engineering-time workflow.
- Keep `hypridle` at startup for automatic lock and suspend behavior.
- Keep the GNOME Keyring secrets component at startup for Chrome, GitHub, Codex MCP, Auth0, and other stored credentials.
- Keep the KDE polkit authentication agent at startup for on-demand administrative prompts.
- Remove the Zed theme-sync startup hook; Zed is not part of the active editor workflow.
- Do not start GeoClue automatically; weather/GPS is not part of the setup. Use explicit application permissions for location when needed.
- Keep the KDE NetworkManager settings GUI available on demand; do not keep `nm-applet` running as an always-on tray daemon.
- Remove the `nm-applet` tray item from the permanent bar; this does not affect workspace app icons or Quickshell network controls.

### Visual identity to preserve

- Current compact top-bar feel.
- Workspaces.
- English/Romanian keyboard-layout indicator.
- Battery, network, audio, and system status.
- Compact live resource counters in the top bar.
- Wallpaper-derived theme/colors.
- Current general visual character.

### Quickshell features to keep

- Top bar.
- Notifications.
- Media controls.
- Volume and brightness OSD.
- Wallpaper-derived theming.
- Lock screen.
- Clipboard history for both text and images.
- Screenshot tools.
- Network/audio/battery status.
- Right sidebar with notification history, network/Bluetooth/audio controls, and calendar.
- Right-sidebar quick toggles: network, Bluetooth, audio/mic, notifications, Night Light, power profile, and idle inhibitor.
- Polkit prompts.
- Cheatsheet.
- Pixel Sprout.
- Quickshell application search/launcher.
- Launcher behavior: app-first search; retain math, shell commands, and text/image clipboard search; remove emoji and web-search results and unrelated wallpaper/todo/theme actions.
- Keep all installed applications searchable; do not maintain a manually curated launcher allowlist.
- Make `Super+C` launch VS Code directly; keep Cursor and terminal editors available through the launcher/terminal, and remove the old editor fallback chain.
- Make `Super+E` launch Dolphin directly; remove the unused file-manager fallback chain.
- Make `Super+I` toggle the Quickshell settings window: open it when absent, focus the existing window when present, and close it on the next invocation instead of spawning duplicates.
- Make Kitty the sole terminal binding; remove duplicate terminal shortcuts and defer research into upgrading Kitty or switching to another terminal.
- Make `Ctrl+Shift+Escape` open `btop` in Kitty directly; remove desktop system-monitor fallbacks.
- Keep explicit Google Lens region search; web search is removed only from the general launcher.
- Keep one OCR shortcut (`Super+Shift+X`) and remove the duplicate hidden OCR shortcut (`Super+Shift+T`).
- Remove the dedicated emoji-copy shortcut as well as emoji launcher search.

### Features currently agreed for removal or disabling

- Left sidebar.
- Right-sidebar todo, pomodoro, EasyEffects, and random/nonessential widgets.
- Right-sidebar quick toggles for EasyEffects, on-screen keyboard, music recognition, game mode, Cloudflare Warp, and other unused features.
- Four-finger vertical overview gesture and the Waffle task-view surface.
- Dock.
- Waffle panel family.
- AI sidebar.
- Weather/GPS.
- On-screen keyboard.
- Booru/image search.
- Song recognition.
- Timers and todos.
- Translation panel.
- Task view.
- Wallpaper browser/selector unless a concrete use remains.
- Fuzzel launcher and fallback bindings. Its config/script remain in the source tree temporarily until the trimmed profile is tested; no package uninstall or source deletion is part of this stage.
- `nm-applet` as an always-on tray item.
- Notification history should not grow without bound; filter repetitive low-value system alerts and retain a bounded recent history while preserving useful engineering and communication notifications.
- Keep visual battery notifications but disable battery alert sounds.
- Notification popups: keep immediate popups for Claude Code and Slack; suppress generic Chrome website/extension popups while retaining useful history entries.
- Keep Pixel Sprout break reminders as visible popups because the user wants them, while keeping battery/system alerts silent.
- Media controls should be on-demand and appear only when media is active, not as a permanent top-bar widget.
- Utility buttons: keep Pixel Sprout, screenshots, screen recording, color picker, and power-profile switching; remove the dark/light theme button and on-screen keyboard button.
- Screen recording should default to region recording with system/output audio enabled; microphone capture remains a separate decision.
- Microphone capture should require a separate explicit recording keybind rather than being enabled by default.
- Calendar is a single full-width sidebar view; do not restore the unused
  navigation rail while it remains the only calendar tab.
- Cheatsheet keeps only Keybinds; the periodic-table/Elements page is removed.

## Waybar versus Quickshell research

Waybar is a dedicated, modular C++/GTK status bar. It is a good fit for workspaces, clock, keyboard layout, battery, network, audio, tray, and simple custom scripts. It should generally be simpler and lighter than a large QML desktop shell, but no exact smoothness or resource win has been benchmarked on this machine.

Quickshell is a QtQuick/QML toolkit for building desktop shells, including bars, widgets, lock screens, OSDs, media controls, notifications, and custom overlays. It is more powerful and more programmable, but a configuration is closer to a software project than a simple bar stylesheet.

Important consequence for this setup: because Pixel Sprout, notifications, media controls, OSD, wallpaper theming, and the cheatsheet are all Quickshell features, replacing only the bar with Waybar would leave Quickshell running as well. That could create two UI frameworks instead of reducing complexity.

### Current recommendation

First slim the existing `ii` Quickshell configuration and remove the Waffle family and unused modules. Do not migrate the bar to Waybar yet.

Use Quickshell search as the only permanent application launcher. Fuzzel is not part of the target setup. It may remain installed temporarily during the transition because current fallback bindings and scripts still reference it.

Reconsider Waybar only if the trimmed Quickshell remains slow, unstable, or too difficult to maintain. If that happens, test a Waybar bar beside a minimal Quickshell process for Pixel Sprout and the remaining overlays before committing to a migration.

Sources:

- https://quickshell.org/about/
- https://github.com/alexays/waybar
- https://wiki.hypr.land/0.51.0/Useful-Utilities/Status-Bars/

## Implementation snapshot

- The repository is on a personal fork branch, pinned to the currently installed upstream baseline rather than rebased across 435 newer upstream commits.
- Commit `36d0ebda` is pushed to `origin/personal/lean-hyprland`; the source profile was deployed with the experimental file installer and the existing `hypr/custom` overrides were then synced explicitly.
- Startup cleanup is source-only: GeoClue, video-wallpaper restore, EasyEffects, nm-applet, and Zed theme sync are disabled; keyring, hypridle, KDE polkit, clipboard watchers, Quickshell, and CO2 Work Companion remain.
- The tracked personal config enables visible color picker and screen recording, disables dark/light and on-screen keyboard buttons, keeps Pixel Sprout and resource counters, adds power-profile/sidebar toggles, disables battery sounds, and caps cliphist writes at 500 entries.
- Notification history is bounded to the newest 200 entries from the last 30 days, deduplicates repetitive NetworkManager/battery alerts, suppresses generic Chrome popups, and keeps the history entry.
- Direct bindings are staged for Kitty, Dolphin, Chrome, VS Code, btop, Pixel Sprout, and a double-invocation settings toggle.
- Pixel Sprout is embedded in the main `ii` Quickshell process because its
  widget imports `qs.modules.common`; `Super+BracketLeft` calls the matching
  `qs -c ii` IPC target, and the top bar keeps a compact `eco` toggle for the
  same shared state.
- The live profile still uses Hyprland `.conf` files for stability. The
  upstream Lua migration is documented in `UPSTREAM-DESIGN-REVIEW.md`; a
  separate, tested port is preferred over an in-place upstream merge.
- Hyprland parsing and targeted QML syntax checks pass. Live file hashes match the source profile and `hyprctl reload` returned `ok`; the running Quickshell process remains `qs -c ii`.

## Open decisions for the grilling session

1. Exact retention cap and source-specific filtering rules for notification history.
2. Which always-on background processes are actually required after the sidebar decision.

## Current non-goals

- No distro migration.
- No wholesale replacement with another dotfiles bundle.
- No destructive uninstall or deletion until the trimmed profile has been tested and the final setup is agreed.

## Future research

- Compare Kitty upgrades and alternative terminal emulators for this keyboard-first Codex/Claude workflow before changing the terminal.

## Repository strategy

- Fork `end-4/dots-hyprland` into the user's own GitHub repository.
- Use the personal fork as `origin` and retain `end-4/dots-hyprland` as `upstream` for deliberate updates.
- Keep the repository's `dots/` tree as the source of truth; treat live files under `~/.config` as deployed copies.
- Apply changes through a reversible sync/deployment step so the running setup can be tested before replacing the live copy. The current rollback copy is `/home/zyk3l/ii-lean-hyprland-backup-20260723`.
- Commit the setup plan and personal configuration changes, but never commit secrets, keyring contents, clipboard history, notification state, or generated runtime state.
- Update from upstream deliberately; do not allow upstream refreshes to silently restore removed shell modules or bindings.
