-- Sepia Automaton-inspired Neovim theme for LazyVim (blur-adapted, transparent backgrounds)
-- Save as: lua/themes/sepia_automaton.lua

local M = {}

local colors = {
  bg        = "none",      -- transparent for compositor blur
  fg        = "#cbb9a0",
  black     = "#0d0a07",
  red       = "#c27b55",
  green     = "#8f8e74",
  yellow    = "#d2b67f",
  blue      = "#7a92a6",
  magenta   = "#a37b74",
  cyan      = "#9ca38b",
  white     = "#cbb9a0",
  br_black  = "#4a4037",
  br_red    = "#e09573",
  br_green  = "#a9a480",
  br_yellow = "#e3c89f",
  br_blue   = "#96a8b7",
  br_magenta= "#c39a8b",
  br_cyan   = "#b8bfa6",
  br_white  = "#f1e8d8",
}

function M.colors()
  return colors
end

function M.setup()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.g.colors_name = "sepia_automaton"

  local set = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Transparent base UI
  local transparent_groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "SignColumn",
    "LineNr",
    "VertSplit",
    "StatusLine",
    "StatusLineNC",
  }

  for _, group in ipairs(transparent_groups) do
    set(group, { bg = "none", fg = colors.fg })
  end

  -- UI Elements
  set("CursorLine",   { bg = colors.black })
  set("CursorLineNr", { fg = colors.br_yellow })
  set("Visual",       { bg = colors.br_black })
  set("Pmenu",        { fg = colors.fg, bg = colors.black })
  set("PmenuSel",     { fg = colors.bg, bg = colors.yellow })
  set("Search",       { fg = colors.black, bg = colors.yellow })
  set("IncSearch",    { fg = colors.black, bg = colors.red })
  set("FloatBorder",  { fg = colors.br_black, bg = "none" })
  set("WinSeparator", { fg = colors.br_black, bg = "none" })

  -- Syntax
  set("Comment",      { fg = colors.br_black, italic = true })
  set("Constant",     { fg = colors.yellow })
  set("String",       { fg = colors.green })
  set("Number",       { fg = colors.br_yellow })
  set("Boolean",      { fg = colors.red })
  set("Identifier",   { fg = colors.cyan })
  set("Function",     { fg = colors.br_red })
  set("Statement",    { fg = colors.accent or colors.br_magenta })
  set("Conditional",  { fg = colors.magenta })
  set("Repeat",       { fg = colors.magenta })
  set("Operator",     { fg = colors.fg })
  set("Keyword",      { fg = colors.br_magenta })
  set("Type",         { fg = colors.br_yellow })
  set("Special",      { fg = colors.br_green })
  set("Underlined",   { fg = colors.cyan, underline = true })
  set("Error",        { fg = colors.bg, bg = colors.red })
  set("Todo",         { fg = colors.black, bg = colors.yellow })

  -- Statusline / Tabline / Winbar
  set("StatusLineTerm",    { fg = colors.fg, bg = "none" })
  set("StatusLineTermNC",  { fg = colors.br_black, bg = "none" })
  set("WinBar",            { fg = colors.br_yellow, bg = "none" })
  set("WinBarNC",          { fg = colors.br_black, bg = "none" })
  set("TabLine",           { fg = colors.white, bg = colors.black })
  set("TabLineSel",        { fg = colors.black, bg = colors.yellow })
  set("TabLineFill",       { fg = colors.br_black, bg = "none" })

  -- Lualine sections
  set("lualine_a_normal",  { fg = colors.black, bg = colors.yellow })
  set("lualine_b_normal",  { fg = colors.fg, bg = colors.br_black })
  set("lualine_c_normal",  { fg = colors.br_yellow, bg = "none" })
  set("lualine_a_insert",  { fg = colors.black, bg = colors.br_green })
  set("lualine_a_visual",  { fg = colors.black, bg = colors.br_magenta })
  set("lualine_a_command", { fg = colors.black, bg = colors.br_blue })
  set("lualine_a_replace", { fg = colors.black, bg = colors.br_red })
end

return M

