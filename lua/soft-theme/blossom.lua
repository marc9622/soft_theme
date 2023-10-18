
local lush = require('lush')
local hsl = lush.hsl

local bgColor = hsl('#ffddd0')

-- White
local whiteLight  = hsl('#ffffff')
local whiteMedium = hsl('#fff0ee')

-- Blue-Gray
local grayVLight = hsl('#f5d5d0').sa(10)
local grayLight  = hsl('#e6c8bc').sa(10)
local grayMedium = hsl('#bfa79f').sa(10)
local grayDark   = hsl('#806f69').sa(10)
local grayVDark  = hsl('#403834').sa(10)

-- Heliotrope
local purpleLight  = hsl('#d0a0f0')
local purpleMedium = hsl('#b770e0')
local purpleDark   = hsl('#a263c7')

local purpleSat    = hsl('#7030b0')
local purpleVSat   = hsl('#8e00e0')

-- Crimson
local redLight  = hsl('#f0a0b0')
local redMedium = hsl('#e07096')
local redDark   = hsl('#c76385')

local redSat    = hsl('#b03060')
local redVSat   = hsl('#e0004b')

-- Marigold
local yellowMedium = hsl('#e0b470').sa(10)
local yellowDark   = hsl('#c79f63').sa(10)

local yellowSat    = hsl('#b07020').sa(10)
local yellowVSat   = hsl('#e08700').sa(10)

-- Spring Green
local greenLight  = hsl('#a0f0c0')
local greenMedium = hsl('#70e0ae')
local greenDark   = hsl('#63c79a')

local greenSat    = hsl('#30b070')
local greenVSat   = hsl('#00e07b')

-- Turquise
local cyanMedium = hsl('#69d1c5')
local cyanDark   = hsl('#5cb8ad')

local cyanSat    = hsl('#20b0a0')
local cyanVSat   = hsl('#00d1b9')

-- Azure
local blueLight  = hsl('#90d0f0')
local blueMedium = hsl('#70b4e0')
local blueDark   = hsl('#639fc7')

local blueSat    = hsl('#2080b0')
local blueVSat   = hsl('#0087e0')

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- ColorColumn  { }, -- Columns set with 'colorcolumn'
    -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = bgColor, bg = bgColor.mix(redMedium, 70) }, -- Character under the cursor
    lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bgColor.mix(redMedium, 2)  },--hsl(bgColor).li(1).sa(3) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = bgColor.mix(redMedium, 10) }, --hsl(bgColor).li(1).sa(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = grayMedium }, -- Directory names (and other special names in listings)
    DiffAdd      { fg = greenSat }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = blueSat }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg = redSat }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = bgColor }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = redVSat, bg = bgColor.da(10) }, -- Error messages on the command line
    VertSplit    { fg = grayLight, bg = bgColor.mix(grayLight, 25), gui = 'bold' }, -- Column separating vertically split windows
    Folded       { bg = bgColor.mix(grayLight, 50) }, -- Line used for closed folds
    FoldColumn   { fg = bgColor.mix(grayDark, 30) }, -- 'foldcolumn'
    SignColumn   { FoldColumn }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg = bgColor, bg = yellowMedium }, -- |:substitute| replacement text highlighting
    LineNr       { fg = bgColor.mix(grayDark, 30) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = bgColor.mix(redMedium, 70), bg = CursorLine.bg, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = bgColor, bg = greenLight.da(10).de(10) }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = grayDark, bg = bgColor }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { ModeMsg }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = greenSat }, -- |more-prompt|
    NonText      { fg = bgColor.mix(grayMedium, 75) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = redMedium, bg = bgColor }, -- Normal text
    NormalFloat  { fg = whiteMedium, bg = grayLight, blend = 20 }, -- Normal text in floating windows.
    NormalNC     { fg = redMedium.de(10).da(10) , bg = VertSplit.bg }, -- normal text in non-current windows
    Pmenu        { fg = redDark, bg = NormalFloat.bg }, -- Popup menu: Normal item.
    PmenuSel     { fg = whiteMedium, bg = redMedium }, --{ fg = whiteMedium, bg = bgColor.mix(redLight, 50).li(25)  }, -- Popup menu: Selected item.
    PmenuSbar    { fg = whiteMedium, bg = grayLight }, -- Popup menu: Scrollbar.
    PmenuThumb   { fg = whiteMedium, bg = redLight }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = greenSat }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg = whiteLight, bg = VertSplit.fg }, --{ fg = bgColor, bg = redMedium }, -- Status line of current window
    StatusLineNC { StatusLine }, --{ fg = bgColor.de(10).da(10), bg = redDark }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = redMedium, gui = "italic_bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = bgColor.mix(redLight, 50).li(25) }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = redVSat }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Status line
    StatusLineViMode  { Normal },
    StatusLineNormal  { fg = grayVLight, bg = redMedium },
    StatusLineVisual  { fg = whiteMedium, bg = redLight },
    StatusLineInsert  { fg = whiteMedium, bg = redLight },
    StatusLineReplace { fg = whiteMedium, bg = redLight },
    StatusLineCommand { fg = whiteMedium, bg = grayMedium },

    StatusLineLevel3 { fg = grayVLight, bg = StatusLine.bg.mix(redMedium, 75), gui = 'italic' },
    StatusLineLevel2 { fg = whiteMedium, bg = StatusLine.bg.mix(redMedium, 50), gui = 'italic' },
    StatusLineLevel1 { fg = whiteLight, bg = StatusLine.bg.mix(redMedium, 25), gui = 'bold italic' },
    StatusLineLevel0 { StatusLine },

    StatusLineError { fg = redVSat, bg = StatusLineLevel0.bg },
    StatusLineWarn  { fg = yellowVSat, bg = StatusLineLevel0.bg },
    StatusLineInfo  { fg = blueMedium, bg = StatusLineLevel0.bg },
    StatusLineHint  { fg = whiteLight, bg = StatusLineLevel0.bg },

    StatusLineViModeTo3  { Normal },
    StatusLineNormalTo3  { fg = StatusLineNormal.bg, bg = StatusLineLevel3.bg },
    StatusLineVisualTo3  { fg = StatusLineVisual.bg, bg = StatusLineLevel3.bg },
    StatusLineInsertTo3  { fg = StatusLineInsert.bg, bg = StatusLineLevel3.bg },
    StatusLineReplaceTo3 { fg = StatusLineReplace.bg, bg = StatusLineLevel3.bg },
    StatusLineCommandTo3 { fg = StatusLineCommand.bg, bg = StatusLineLevel3.bg },

    StatusLineViModeTo2  { Normal },
    StatusLineNormalTo2  { fg = StatusLineNormal.bg, bg = StatusLineLevel2.bg },
    StatusLineVisualTo2  { fg = StatusLineVisual.bg, bg = StatusLineLevel2.bg },
    StatusLineInsertTo2  { fg = StatusLineInsert.bg, bg = StatusLineLevel2.bg },
    StatusLineReplaceTo2 { fg = StatusLineReplace.bg, bg = StatusLineLevel2.bg },
    StatusLineCommandTo2 { fg = StatusLineCommand.bg, bg = StatusLineLevel2.bg },

    StatusLineViModeTo1  { Normal },
    StatusLineNormalTo1  { fg = StatusLineNormal.bg, bg = StatusLineLevel1.bg },
    StatusLineVisualTo1  { fg = StatusLineVisual.bg, bg = StatusLineLevel1.bg },
    StatusLineInsertTo1  { fg = StatusLineInsert.bg, bg = StatusLineLevel1.bg },
    StatusLineReplaceTo1 { fg = StatusLineReplace.bg, bg = StatusLineLevel1.bg },
    StatusLineCommandTo1 { fg = StatusLineCommand.bg, bg = StatusLineLevel1.bg },

    StatusLineViModeTo0  { Normal },
    StatusLineNormalTo0  { fg = StatusLineNormal.bg, bg = StatusLineLevel0.bg },
    StatusLineVisualTo0  { fg = StatusLineVisual.bg, bg = StatusLineLevel0.bg },
    StatusLineInsertTo0  { fg = StatusLineInsert.bg, bg = StatusLineLevel0.bg },
    StatusLineReplaceTo0 { fg = StatusLineReplace.bg, bg = StatusLineLevel0.bg },
    StatusLineCommandTo0 { fg = StatusLineCommand.bg, bg = StatusLineLevel0.bg },

    StatusLineLevel3To2 { fg = StatusLineLevel3.bg, bg = StatusLineLevel2.bg },
    StatusLineLevel2To1 { fg = StatusLineLevel2.bg, bg = StatusLineLevel1.bg },
    StatusLineLevel1To0 { fg = StatusLineLevel1.bg, bg = StatusLineLevel0.bg },

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = NonText.fg, gui = "italic" }, -- Any comment

    Constant       { fg = greenDark }, -- (*) Any constant
    String         { fg = purpleMedium }, --   A string constant: "this is a string"
    Character      { String }, --   A character constant: 'c', '\n'
    Number         { Constant }, --   A number constant: 234, 0xff
    Boolean        { Constant }, --   A boolean constant: TRUE, false
    Float          { Constant }, --   A floating point constant: 2.3e10

    Identifier     { fg = blueMedium }, -- (*) Any variable name
    Function       { fg = yellowMedium }, --   Function name (also: methods for classes)

    Keyword        { fg = purpleDark }, --   any other keyword
    Statement      { Keyword }, -- (*) Any statement
    Conditional    { Keyword }, --   if, then, else, endif, switch, etc.
    Repeat         { Keyword }, --   for, do, while, etc.
    Label          { Keyword }, --   case, default, etc.
    Operator       { fg = grayMedium }, --   "sizeof", "+", "*", etc.
    Exception      { Keyword }, --   try, catch, throw

    PreProc        { fg = yellowDark.mix(redMedium, 50) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = cyanDark }, -- (*) int, long, char, etc.
    StorageClass   { fg = purpleDark }, --   static, register, volatile, etc.
    Structure      { fg = purpleDark }, --   struct, union, enum, etc.
    Typedef        { fg = purpleDark }, --   A typedef

    Special        { fg = redMedium }, -- (*) Any special symbol
    SpecialChar    { Special }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = grayMedium }, --   Character that needs attention
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
    LspSignatureActiveParameter { fg = Normal.fg, gui = 'italic_underline', sp = Normal.fg } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    DiagnosticError            { fg = StatusLineError.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = StatusLineWarn.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = StatusLineInfo.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = StatusLineHint.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = 'undercurl', sp = redMedium } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = 'undercurl', sp = yellowMedium } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = 'undercurl', sp = blueMedium } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = 'undercurl', sp = whiteLight } , -- Used to underline "Hint" diagnostics.
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
    sym'@punctuation.bracket'   { fg = Normal.fg },
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
    sym"@type.qualifier"    { Keyword },
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    sym"@namespace"         { Type }, -- Identifier
    sym"@include"           { Keyword }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    --CmpItemAbbr           { },
    CmpItemAbbrDeprecates { gui = 'strikethrough' },
    --CmpItemAbbrMatch      { fg = magentaDark, bg = Visual.bg },
    --CmpItemAbbrMatch      { fg = magentaDark, gui = 'underline bold', sp = magentaMedium.sa(20) },
    CmpItemAbbrMatch      { fg = whiteMedium, gui = 'bold' },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
    --CmpItemKind           { Comment },
    CmpItemMenu           { fg = grayMedium },

    --CmpItemKindArray      { Number }, -- I don't think this exists
    --CmpItemKindBoolean    { Boolean }, -- I don't think this exists
    CmpItemKindClass      { Keyword },
    CmpItemKindColor      { Function },
    CmpItemKindConstant   { Constant },
    CmpItemKindConstructor{ Function },
    CmpItemKindEnum       { Type },
    CmpItemKindEnumMember { Constant },
    CmpItemKindEvent      { Type },
    CmpItemKindField      { Identifier },
    CmpItemKindFile       { Operator },
    CmpItemKindFolder     { Operator },
    CmpItemKindFunction   { Function },
    CmpItemKindInterface  { Identifier },
    --CmpItemKindKey        { Keyword }, -- I don't think this exists
    CmpItemKindKeyword    { Keyword },
    CmpItemKindMethod     { Function },
    CmpItemKindModule     { Operator },
    --CmpItemKindNamespace  { Keyword }, -- I dont' think this exists
    --CmpItemKindNull       { Number }, -- I don't think this exists
    --CmpItemKindNumber     { Number }, -- I don't think this exists
    --CmpItemKindObject     { Identifier }, -- I don't think this exists
    CmpItemKindOperator   { Operator },
    --CmpItemKindPackage    { Operator }, -- I don't think this exists
    CmpItemKindProperty   { Identifier },
    CmpItemKindReference  { Identifier },
    CmpItemKindSnippet    { Operator },
    --CmpItemKindString     { String }, -- I don't think this exists
    CmpItemKindStruct     { Function },
    CmpItemKindText       { fg = Normal.fg },
    CmpItemKindTypeParameter { }, -- idk
    CmpItemKindUnit       { Function },
    CmpItemKindValue      { Number },
    CmpItemKindVariable   { Identifier },

    CopilotSuggestion     { Comment },

    TelescopeSelection      { PmenuSel },
    TelescopeSelectionCaret { fg = Normal.fg },
    --TelescopeMultiSelection { },
    --TelescopeMultiIcon      { },

    --TelescopeNormal         { },
    TelescopePreviewNormal  { Normal },
    TelescopePromptNormal   { Normal },
    TelescopeResultsNormal  { Pmenu },

    --TelescopeBorder         { },
    --TelescopePromptBorder   { },
    --TelescopeResultsBorder  { },
    --TelescopePreviewBorder  { },

    --TelescopeTitle          { },
    --TelescopePromptTitle    { },
    --TelescopeResultsTitle   { },
    --TelescopePreviewTitle   { },

    --TelescopePrompCounter   { Comment },

    TelescopeMatching       { CmpItemAbbrMatch },

    TelescopePromptPrefix   { Normal },

    --TelescopePreviewLine    { },
    --TelescopePreviewMatch   { },

    --TelescopePreviewPipe    { },
    --TelescopePreviewCharDev { },
    --TelescopePreviewDirectory { },
    --TelescopePreviewBlock   { },
    --TelescopePreviewLink    { },
    --TelescopePreviewSocket  { },
    --TelescopePreviewRead    { },
    --TelescopePreviewWrite   { },
    --TelescopePreviewExecute { },
    --TelescopePreviewHyphen  { },
    --TelescopePreviewSticky  { },
    --TelescopePreviewSize    { },
    --TelescopePreviewUser    { },
    --TelescopePreviewGroup   { },
    --TelescopePreviewDate    { },
    --TelescopePreviewMessage { },
    --TelescopePreviewMessageFillchar { },

    --TelescopeResultsClass   { },
    --TelescopeResultsConstant { },
    --TelescopeResultsField   { },
    --TelescopeResultsFunction { },
    --TelescopeResultsMethod  { },
    --TelescopeResultsOperator { },
    --TelescopeResultsStruct  { },
    --TelescopeResultsVariable { },

    --TelescopeResultsLineNr  { },
    --TelescopeResultsIdentifier { },
    --TelescopeResultsNumber  { },
    --TelescopeResultsComment { },
    --TelescopeResultsSpecialComment { },

    --TelescopeResultsDiffChange { },
    --TelescopeResultsDiffAdd { },
    --TelescopeResultsDiffDelete { },
    --TelescopeResultsDiffUntracked { },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
