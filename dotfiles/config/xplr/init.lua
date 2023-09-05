---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable
version = "0.21.3"

--- xpm.xplr (plugin manager)
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

--- Install Plugins

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',
    { name = 'sayanarijit/fzf.xplr' }, -- default overwrite original ctrl-f
    "sayanarijit/dual-pane.xplr", -- add commands to ctrl + w
    "sayanarijit/map.xplr", -- M (also tab to toggle single and multiple mode)
    -- "sayanarijit/tri-pane.xplr" -- ranger like layout
    "sayanarijit/wl-clipboard.xplr", -- yy to copy paths and p to paste files
    "sayanarijit/dragon.xplr", -- select and :sD but it doesn't work? use map.xplr instead
    "Junker/nuke.xplr", -- view/open files in terminal / external (key: v / f3 / enter)
    "sayanarijit/zoxide.xplr", -- Z
    "sayanarijit/trash-cli.xplr", -- `dd` to trash, `dr` or `dR` to restore, and `dE` to empty trash.
    "dtomvan/ouch.xplr", -- :O

    -- appearance
    "prncss-xyz/icons.xplr",
    -- "sayanarijit/zentable.xplr",
  },
  auto_install = true,
  auto_cleanup = true,
})


--- Custom Keybindings

local key = xplr.config.modes.builtin.default.key_bindings.on_key

-- nuke
key.v = {
   help = "nuke",
   messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

-- xpm
key.x = {
  help = "xpm",
  messages = {
    "PopMode",
    { SwitchModeCustom = "xpm" },
  },
}

-- Q: quit print pwd, but since I make a wrap for xplr, it now serves as quit and cd
key.Q = xplr.config.modes.builtin.quit.key_bindings.on_key.p

xplr.config.modes.builtin.action.key_bindings.on_key.x = xplr.config.modes.builtin.go_to.key_bindings.on_key.x
