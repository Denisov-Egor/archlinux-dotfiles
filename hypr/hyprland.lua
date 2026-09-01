---@module 'hl'

-- #############################################################################
-- HYPRLAND LUA CONFIG
-- Чистая версия текущей конфигурации
-- #############################################################################


-- =========================================================
-- NVIDIA / WAYLAND
-- =========================================================

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- =========================================================
-- CURSOR
-- =========================================================

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    cursor = {
        no_hardware_cursors = 1,
    },
})

hl.env("__GL_GSYNC_ALLOWED", "1")
hl.env("__GL_VRR_ALLOWED", "1")

-- =========================================================
-- MONITOR
-- =========================================================

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


-- =========================================================
-- APPLICATIONS
-- =========================================================

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local browser = "firefox"
local code = "code"
local obsidian = "obsidian"
local telegram = "Telegram"

-- =========================================================
-- GENERAL
-- =========================================================

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 3,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
})


-- ============================================================================
-- DECORATION
-- ============================================================================

hl.config({
    decoration = {
        rounding = 10,
        rounding_power = 4,

        active_opacity = 0.97,
        inactive_opacity = 0.97,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})


-- ============================================================================
-- ANIMATIONS
-- ============================================================================

hl.config({
    animations = {
        enabled = true,
    },
})


-- ----------------------------------------------------------------------------
-- BEZIER CURVES
-- ----------------------------------------------------------------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        { 0.23, 1 },
        { 0.32, 1 },
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        { 0.65, 0.05 },
        { 0.36, 1 },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        { 0, 0 },
        { 1, 1 },
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        { 0.5, 0.5 },
        { 0.75, 1 },
    },
})

hl.curve("quick", {
    type = "bezier",
    points = {
        { 0.15, 0 },
        { 0.1, 1 },
    },
})


-- ----------------------------------------------------------------------------
-- ANIMATION PRESETS
-- ----------------------------------------------------------------------------

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 7,
    bezier = "quick",
})

-- ============================================================================
-- MISC
-- ============================================================================

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})


-- =========================================================
-- INPUT
-- =========================================================

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle,grp:alt_shift_toggle",
        kb_rules = "",

        numlock_by_default = true,

        follow_mouse = 1,
        sensitivity = 0,
    },
})


-- ============================================================================
-- DEVICES
-- ============================================================================

-- =========================================================
-- TOUCHPAD
-- =========================================================

hl.device({
    name = "asup1205:00-093a:2008-touchpad",
    enabled = false,
})

-- ============================================================================
-- MAIN MODIFIER
-- ============================================================================

local mainMod = "SUPER"

-- ============================================================================
-- APPLICATION HOTKEYS
-- ============================================================================

-- Super + Q — Terminal
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)

-- Super + C — VS Code
hl.bind(
    mainMod .. " + C",
    hl.dsp.exec_cmd(code)
)

-- Super + W — Close window
hl.bind(
    mainMod .. " + W",
    hl.dsp.window.close()
)

-- Super + E — File manager
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)

-- Super + B — Browser
hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd(browser)
)

-- Super + R — Application launcher
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd(menu)
)

-- Super + O — Obsidian
hl.bind(
    mainMod .. " + O",
    hl.dsp.exec_cmd(obsidian)
)

-- Super + T — Telegram
hl.bind(
    mainMod .. " + T",
    hl.dsp.exec_cmd(telegram)
)

-- Super + Y — Yandex Music
hl.bind(
    mainMod .. " + Y",
    hl.dsp.exec_cmd("yandex-music")
)

-- Super + H — HAPP
hl.bind(
    mainMod .. " + H",
    hl.dsp.exec_cmd("happ")
)

-- Super + X — Power menu
hl.bind(
    mainMod .. " + X",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/power-menu.sh"
    )
)

-- Super + Esc — Exit Hyprland
hl.bind(
    mainMod .. " + ESCAPE",
    hl.dsp.exit()
)


-- ============================================================================
-- CLIPBOARD
-- ============================================================================

-- Super + V — Clipboard history
hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(
        "cliphist list | wofi --dmenu | cliphist decode | wl-copy"
    )
)

-- Super + Shift + V — Clear clipboard history
hl.bind(
    mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("cliphist wipe")
)


-- ============================================================================
-- WALLPAPER
-- ============================================================================

-- Super + L — Random wallpaper
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/wallpaper.sh"
    )
)


-- =========================================================
-- DWINDLE
-- =========================================================

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- Super + J — Toggle split direction
hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)


-- ============================================================================
-- WINDOW FOCUS
-- ============================================================================

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


-- ============================================================================
-- WORKSPACES 1-10
-- ============================================================================

for i = 1, 9 do
    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Workspace 10
hl.bind(
    mainMod .. " + 0",
    hl.dsp.focus({ workspace = 10 })
)

hl.bind(
    mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({ workspace = 10 })
)


-- ============================================================================
-- WORKSPACE SCROLL
-- ============================================================================

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)


-- ============================================================================
-- MOUSE WINDOW CONTROL
-- ============================================================================

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-- ============================================================================
-- AUDIO
-- ============================================================================

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    { locked = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    { locked = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    { locked = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    { locked = true }
)


-- ============================================================================
-- BRIGHTNESS
-- ============================================================================

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    { locked = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    { locked = true }
)


-- ============================================================================
-- MEDIA CONTROL
-- ============================================================================

-- Shift + Num 8 — Pause
hl.bind(
    "SHIFT + KP_Up",
    hl.dsp.exec_cmd("playerctl pause"),
    { locked = true }
)

-- Shift + Num 2 — Play
hl.bind(
    "SHIFT + KP_Down",
    hl.dsp.exec_cmd("playerctl play"),
    { locked = true }
)

-- Shift + Num 4 — Previous
hl.bind(
    "SHIFT + KP_Left",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

-- Shift + Num 6 — Next
hl.bind(
    "SHIFT + KP_Right",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)


-- ============================================================================
-- SCREENSHOTS
-- ============================================================================

-- Print — Full screen
hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        [[grim ~/Pictures/$(date +'%Y-%m-%d_%H-%M-%S.png') && notify-send "Скриншот" "Полный экран сохранён"]]
    )
)

-- Super + Shift + W — Select area and save
hl.bind(
    mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" ~/Pictures/$(date +'%Y-%m-%d_%H-%M-%S.png') && notify-send "Скриншот" "Область сохранена"]]
    )
)

-- Super + Ctrl + S — Select area and copy
hl.bind(
    mainMod .. " + CTRL + S",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | wl-copy && notify-send "Скриншот" "Область скопирована в буфер"]]
    )
)

-- Super + Shift + S — Select area and edit
hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | swappy -f - && notify-send "Swappy" "Редактор открыт"]]
    )
)


-- ============================================================================
-- WINDOW RULES
-- ============================================================================

-- Prevent maximize events
hl.window_rule({
    name = "suppress-maximize-events",

    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


-- XWayland drag fix
hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})


-- hyprland-run
hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run",
    },

    move = "20 monitor_h-120",
    float = true,
})


-- ============================================================================
-- AUTOSTART
-- ============================================================================

hl.on("hyprland.start", function()

    -- Clipboard
    hl.exec_cmd(
        "wl-paste --type text --watch cliphist store"
    )

    hl.exec_cmd(
        "wl-paste --type image --watch cliphist store"
    )

    -- Waybar
    hl.exec_cmd("waybar")

    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    -- Wallpaper
    hl.exec_cmd(
        "sleep 1 && ~/.config/hypr/scripts/wallpaper.sh"
    )

    -- Notifications
    hl.exec_cmd("swaync")

    -- Happ
    hl.exec_cmd("happ")

end)

