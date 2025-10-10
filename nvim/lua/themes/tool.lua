-- TOOL-inspired Neovim theme for LazyVim
-- Save as: lua/themes/tool.lua

local M = {}

local colors = {
  bg        = "none",
  fg        = "#c8c8c8",
  black     = "#1a1a1b",
  red       = "#c0211a",
  green     = "#5a4c45",
  yellow    = "#cc6a1d",
  blue      = "#3b2f45",
  magenta   = "#7a3d5c",
  cyan      = "#5f6c6a",
  white     = "#b0b0b0",
  br_black  = "#3a3a3d",
  br_red    = "#ff4535",
  br_green  = "#7a6e61",
  br_yellow = "#f08a36",
  br_blue   = "#635578",
  br_magenta= "#a65b7e",
  br_cyan   = "#8aa09a",
  br_white  = "#e0e0e0",
}

function M.colors()
  return colors
end

function M.setup()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.g.colors_name = "tool"

  local set = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- UI
  set("Normal",       { fg = colors.fg, bg = colors.bg })
  set("NormalNC",     { fg = colors.fg, bg = colors.bg })
  set("CursorLine",   { bg = colors.black })
  set("CursorLineNr", { fg = colors.yellow })
  set("LineNr",       { fg = colors.br_black })
  set("SignColumn",   { bg = colors.bg })
  set("VertSplit",    { fg = colors.black, bg = colors.black })
  set("Visual",       { bg = colors.br_blue })
  set("Pmenu",        { fg = colors.fg, bg = colors.black })
  set("PmenuSel",     { fg = colors.bg, bg = colors.red })
  set("Cursor",       { fg = colors.bg, bg = colors.fg })
  set("Search",       { fg = colors.bg, bg = colors.yellow })
  set("IncSearch",    { fg = colors.bg, bg = colors.red })
  set("NormalFloat",  { fg = colors.fg, bg = colors.black })
  set("FloatBorder",  { fg = colors.br_black, bg = colors.black })
  set("WinSeparator", { fg = colors.black, bg = colors.bg })

  -- Syntax
  set("Comment",      { fg = colors.br_black, italic = true })
  set("Constant",     { fg = colors.red })
  set("String",       { fg = colors.green })
  set("Number",       { fg = colors.yellow })
  set("Boolean",      { fg = colors.red })
  set("Identifier",   { fg = colors.cyan })
  set("Function",     { fg = colors.br_red })
  set("Statement",    { fg = colors.magenta })
  set("Conditional",  { fg = colors.magenta })
  set("Repeat",       { fg = colors.magenta })
  set("Operator",     { fg = colors.fg })
  set("Keyword",      { fg = colors.br_magenta })
  set("Type",         { fg = colors.br_yellow })
  set("Special",      { fg = colors.br_green })
  set("Underlined",   { fg = colors.cyan, underline = true })
  set("Error",        { fg = colors.bg, bg = colors.red })
  set("Todo",         { fg = colors.bg, bg = colors.yellow })

  -- Statusline / Bar
  set("StatusLine",        { fg = colors.fg, bg = colors.br_black })
  set("StatusLineNC",      { fg = colors.br_black, bg = colors.black })
  set("StatusLineTerm",    { fg = colors.fg, bg = colors.br_black })
  set("StatusLineTermNC",  { fg = colors.br_black, bg = colors.black })
  set("WinBar",            { fg = colors.br_yellow, bg = colors.bg })
  set("WinBarNC",          { fg = colors.br_black, bg = colors.bg })
  set("TabLine",           { fg = colors.white, bg = colors.black })
  set("TabLineSel",        { fg = colors.bg, bg = colors.red })
  set("TabLineFill",       { fg = colors.br_black, bg = colors.bg })

  -- Lualine / LazyVim bar accents
  set("lualine_a_normal",  { fg = colors.bg, bg = colors.red })
  set("lualine_b_normal",  { fg = colors.fg, bg = colors.br_black })
  set("lualine_c_normal",  { fg = colors.yellow, bg = colors.black })
  set("lualine_a_insert",  { fg = colors.bg, bg = colors.br_green })
  set("lualine_a_visual",  { fg = colors.bg, bg = colors.br_magenta })
  set("lualine_a_command", { fg = colors.bg, bg = colors.br_yellow })
  set("lualine_a_replace", { fg = colors.bg, bg = colors.br_red })
end

return M

