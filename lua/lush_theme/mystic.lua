--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local bgColor = hsl('#252232')

-- White
local whiteMedium = hsl('#d5d0f0')
local whiteLight  = hsl('#ffffff')

-- Blue-Gray
local grayVLight = hsl('#c5c0e5')
local grayLight  = hsl('#8580c0')
local grayMedium = hsl('#656090')
local grayDark   = hsl('#454065')
local grayVDark  = hsl('#25203a')

-- Heliotrope
local purpleLight  = hsl('#d0a0f0') -- Mauve
local purpleMedium = hsl('#b770e0') -- Heliotrope

local purpleSat    = hsl('#7030b0') -- Purple
local purpleVSat   = hsl('#8e00e0') -- Electric Violet

-- Crimson
local redMedium = hsl('#e07096') -- Deep Blush

local redSat    = hsl('#b03060') -- Hibiscus
local redVSat   = hsl('#e0004b') -- Radical Red

-- Marigold
local yellowMedium = hsl('#e0b470') -- Harvest Gold

local yellowSat    = hsl('#b07020') -- Bourbon
local yellowVSat   = hsl('#e08700') -- Gold

-- Spring Green
local greenLight  = hsl('#a0f0c0') -- Magic Mint
local greenMedium = hsl('#70e0ae') -- Aquamarine

local greenSat    = hsl('#30b070') -- Jungle Green
local greenVSat   = hsl('#00e07b') -- Spring Green

-- Turquise
local cyanMedium = hsl('#69d1c5') -- Downy

local cyanSat    = hsl('#20b0a0') -- Persian Green
local cyanVSat   = hsl('#00d1b9') -- Robin's Egg

-- Azure
local blueLight  = hsl('#90d0f0') -- Anakiwa
local blueMedium = hsl('#70b4e0') -- Malibu

local blueSat    = hsl('#2080b0') -- Eastern Blue
local blueVSat   = hsl('#0087e0') -- Azure

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn  { }, -- Columns set with 'colorcolumn'
    -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = bgColor, bg = purpleMedium }, -- Character under the cursor
    lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bgColor.mix(purpleMedium, 2)  },--hsl(bgColor).li(1).sa(3) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = bgColor.mix(purpleMedium, 10) }, --hsl(bgColor).li(1).sa(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = grayLight }, -- Directory names (and other special names in listings)
    DiffAdd      { fg = greenSat }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = blueSat }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg = redSat }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = redVSat, bg = bgColor.da(10) }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded       { bg = bgColor.mix(grayVDark, 50) }, -- Line used for closed folds
    FoldColumn   { fg = bgColor.mix(grayLight, 30) }, -- 'foldcolumn'
    SignColumn   { FoldColumn }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg = bgColor, bg = yellowMedium }, -- |:substitute| replacement text highlighting
    LineNr       { fg = bgColor.mix(grayLight, 30) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = grayLight, bg = bgColor.mix(purpleMedium, 10) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = bgColor, bg = cyanVSat.li(30).de(40) }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = grayLight, bg = bgColor }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { ModeMsg }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = greenSat }, -- |more-prompt|
    NonText      { fg = bgColor.mix(grayMedium, 75) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = purpleLight, bg = bgColor }, -- Normal text
    NormalFloat  { fg = grayVLight, bg = grayVDark, blend = 20 }, -- Normal text in floating windows.
    NormalNC     { fg = purpleLight.de(10).da(10) , bg = bgColor.de(10).da(10) }, -- normal text in non-current windows
    Pmenu        { NormalFloat }, -- Popup menu: Normal item.
    PmenuSel     { fg = whiteMedium, bg = grayLight  }, -- Popup menu: Selected item.
    PmenuSbar    { fg = whiteMedium, bg = grayMedium }, -- Popup menu: Scrollbar.
    PmenuThumb   { fg = whiteMedium, bg = purpleLight }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = greenSat }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg = bgColor, bg = purpleLight }, -- Status line of current window
    StatusLineNC { fg = bgColor.de(10).da(10), bg = grayMedium }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = purpleSat, gui = "italic_bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = grayDark.mix(purpleVSat, 10) }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = redVSat }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = NonText.fg, gui = "italic" }, -- Any comment

    Constant       { fg = greenLight }, -- (*) Any constant
    String         { fg = purpleLight }, --   A string constant: "this is a string"
    Character      { String }, --   A character constant: 'c', '\n'
    Number         { Constant }, --   A number constant: 234, 0xff
    Boolean        { Constant }, --   A boolean constant: TRUE, false
    Float          { Constant }, --   A floating point constant: 2.3e10

    Identifier     { fg = blueLight }, -- (*) Any variable name
    Function       { fg = yellowMedium }, --   Function name (also: methods for classes)

    Keyword        { fg = purpleMedium }, --   any other keyword
    Statement      { Keyword }, -- (*) Any statement
    Conditional    { Keyword }, --   if, then, else, endif, switch, etc.
    Repeat         { Keyword }, --   for, do, while, etc.
    Label          { Keyword }, --   case, default, etc.
    Operator       { fg = grayVLight }, --   "sizeof", "+", "*", etc.
    Exception      { Keyword }, --   try, catch, throw

    PreProc        { fg = yellowMedium.mix(redMedium, 50) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = cyanMedium }, -- (*) int, long, char, etc.
    StorageClass   { fg = purpleMedium }, --   static, register, volatile, etc.
    Structure      { fg = purpleMedium }, --   struct, union, enum, etc.
    Typedef        { fg = purpleMedium }, --   A typedef

    Special        { fg = purpleMedium }, -- (*) Any special symbol
    SpecialChar    { Special }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = grayLight }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { fg = blueVSat, gui = 'italic_underline', sp = blueVSat }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = redVSat }, -- Any erroneous construct
    Todo           { fg = blueMedium, gui = 'italic' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg = redVSat } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = yellowVSat } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = blueMedium } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = whiteMedium } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = 'undercurl', sp = redMedium } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = 'undercurl', sp = yellowMedium } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = 'undercurl', sp = blueMedium } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = 'undercurl', sp = bgColor.mix(whiteMedium, 80)} , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109
    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    sym"@punctuation"           { Delimiter }, -- Delimiter
    sym'@punctuation.delimiter' { Delimiter },
    sym'@punctuation.bracket'   { Keyword },
    -- sym'@punctuation.special' { },
    -- sym"@constant"          { }, -- Constant
    sym"@constant.builtin"  { Constant }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    sym"@function.builtin"  { Function }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    sym"@property"          { fg = blueMedium }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    sym"@namespace"         { Type }, -- Identifier
    sym"@include"           { Keyword }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    CmpItemAbbrDeprecates { gui = 'strikethrough' },
    --CmpItemAbbrMatch      { fg = magentaMedium, bg = Visual.bg },
    --CmpItemAbbrMatch      { fg = magentaMedium, gui = 'underline bold', sp = magentaMedium.sa(20) },
    CmpItemAbbrMatch      { fg = purpleMedium },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
    CmpItemMenu           { fg = grayLight },

    --CmpItemKindArray      { fg = greenLight }, -- I don't think this exists
    --CmpItemKindBoolean    { fg = redMedium }, -- I don't think this exists
    CmpItemKindClass      { fg = yellowMedium },
    CmpItemKindColor      { fg = yellowMedium },
    CmpItemKindConstant   { fg = blueMedium },
    CmpItemKindConstructor{ fg = purpleMedium },
    CmpItemKindEnum       { fg = blueMedium },
    CmpItemKindEnumMember { fg = cyanMedium },
    CmpItemKindEvent      { fg = purpleMedium },
    CmpItemKindField      { fg = blueLight },
    CmpItemKindFile       { fg = blueLight },
    CmpItemKindFolder     { fg = yellowMedium },
    CmpItemKindFunction   { fg = yellowMedium },
    CmpItemKindInterface  { fg = blueLight },
    --CmpItemKindKey        { fg = cyanMedium }, -- I don't think this exists
    CmpItemKindKeyword    { fg = purpleMedium },
    CmpItemKindMethod     { fg = purpleMedium },
    CmpItemKindModule     { fg = blueMedium },
    --CmpItemKindNamespace  { fg = magentaMedium }, -- I dont' think this exists
    --CmpItemKindNull       { fg = redMedium }, -- I don't think this exists
    --CmpItemKindNumber     { fg = greenMedium }, -- I don't think this exists
    --CmpItemKindObject     { fg = yellowMedium }, -- I don't think this exists
    CmpItemKindOperator   { fg = redMedium },
    --CmpItemKindPackage    { fg = magentaMedium }, -- I don't think this exists
    CmpItemKindProperty   { fg = blueMedium },
    CmpItemKindReference  { fg = purpleMedium },
    CmpItemKindSnippet    { fg = grayVLight },
    --CmpItemKindString     { fg = magentaLight }, -- I don't think this exists
    CmpItemKindStruct     { fg = yellowMedium },
    CmpItemKindText       { fg = purpleLight },
    CmpItemKindTypeParameter { fg = cyanMedium },
    CmpItemKindUnit       { fg = cyanMedium },
    CmpItemKindValue      { fg = greenLight },
    CmpItemKindVariable   { fg = cyanMedium },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
