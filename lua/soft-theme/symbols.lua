
local lush = require('lush')
local hsl = lush.hsl

local bgColor = hsl('#090b06')

-- White
local whiteLight  = hsl('#ffffff')
local whiteMedium = hsl('#eef0ee')
local whiteDark   = hsl('#d9e0d9')
local whiteVDark  = hsl('#cad5ca')

-- Black
local blackVVLight= hsl('#203020')
local blackVLight = hsl('#1a251a')
local blackLight  = hsl('#101510')
local blackMedium = hsl('#060904')
local blackDark   = hsl('#000000')

-- Matrix Green
local matrixVLight = hsl('#62DE49')
local matrixLight  = hsl('#53BD3E')
local matrixMedium = hsl('#377D29')
local matrixDark   = hsl('#327025')
local matrixVDark  = hsl('#26571D')

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
local yellowMedium = hsl('#e0b470')
local yellowDark   = hsl('#c79f63')

local yellowSat    = hsl('#b07020')
local yellowVSat   = hsl('#e08700')

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
    Cursor       { fg = blackDark, bg = matrixMedium }, -- Character under the cursor
    lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bgColor.mix(matrixMedium, 2)  },--hsl(bgColor).li(1).sa(3) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = bgColor.mix(matrixMedium, 10) }, --hsl(bgColor).li(1).sa(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = matrixMedium }, -- Directory names (and other special names in listings)
    DiffAdd      { fg = greenSat }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg = blueSat }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg = redSat }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = bgColor }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = redVSat, bg = bgColor.da(10) }, -- Error messages on the command line
    -- VertSplit    { }, -- Column separating vertically split windows
    Folded       { bg = bgColor.mix(matrixLight, 50) }, -- Line used for closed folds
    FoldColumn   { fg = bgColor.mix(matrixDark, 30) }, -- 'foldcolumn'
    SignColumn   { FoldColumn }, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg = bgColor, bg = yellowMedium }, -- |:substitute| replacement text highlighting
    LineNr       { fg = bgColor.mix(matrixDark, 30) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = matrixLight, bg = CursorLine.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = matrixLight, bg = blackDark , gui = 'bold' }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = matrixDark, bg = bgColor }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { ModeMsg }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = greenSat }, -- |more-prompt|
    NonText      { fg = bgColor.mix(matrixMedium, 35) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = matrixLight, bg = bgColor }, -- Normal text
    NormalFloat  { fg = matrixLight, bg = blackLight, blend = 20 }, -- Normal text in floating windows.
    NormalNC     { fg = matrixLight.de(10).da(10) , bg = bgColor.de(20).da(3) }, -- normal text in non-current windows
    Pmenu        { fg = matrixMedium, bg = NormalFloat.bg }, -- Popup menu: Normal item.
    PmenuSel     { fg = Pmenu.bg, bg = matrixMedium  }, -- Popup menu: Selected item.
    PmenuSbar    { fg = whiteMedium, bg = matrixMedium }, -- Popup menu: Scrollbar.
    PmenuThumb   { fg = whiteLight, bg = matrixLight }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = greenSat }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { Normal }, --{ fg = blackDark, bg = matrixMedium, gui = 'bold' }, -- Status line of current window
    StatusLineNC { Normal }, --{ fg = blackMedium, bg = matrixVDark }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    -- TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg = matrixMedium, gui = "italic_bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = bgColor.mix(matrixVDark, 25), sp = bgColor.mix(matrixVDark, 50) }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = redVSat }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Status line
    StatusLineViMode  { Normal },
    StatusLineNormal  { fg = bgColor, bg = matrixMedium },
    StatusLineVisual  { fg = bgColor, bg = matrixLight },
    StatusLineInsert  { fg = bgColor, bg = matrixLight },
    StatusLineReplace { fg = bgColor, bg = matrixLight },
    StatusLineCommand { fg = bgColor, bg = matrixDark },

    StatusLineLevel3 { fg = matrixLight, bg = blackVVLight, gui = 'italic' },
    StatusLineLevel2 { fg = matrixMedium, bg = blackVLight, gui = 'italic' },
    StatusLineLevel1 { fg = matrixDark, bg = blackLight, gui = 'italic' },
    StatusLineLevel0 { fg = matrixDark, bg = StatusLine.bg },

    StatusLineError { fg = redVSat.mix(matrixMedium, 66), bg = StatusLineLevel0.bg },
    StatusLineWarn  { fg = yellowVSat.mix(matrixMedium, 66), bg = StatusLineLevel0.bg },
    StatusLineInfo  { fg = blueMedium.mix(matrixMedium, 66), bg = StatusLineLevel0.bg },
    StatusLineHint  { fg = whiteMedium.mix(matrixMedium, 66), bg = StatusLineLevel0.bg },

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

    Constant       { fg = matrixVLight }, -- (*) Any constant
    String         { Constant }, --   A string constant: "this is a string"
    Character      { String }, --   A character constant: 'c', '\n'
    Number         { Constant }, --   A number constant: 234, 0xff
    Boolean        { Constant }, --   A boolean constant: TRUE, false
    Float          { Constant }, --   A floating point constant: 2.3e10

    Identifier     { fg = whiteVDark.mix(matrixMedium, 65) }, -- (*) Any variable name
    Function       { fg = yellowDark.mix(matrixMedium, 50) }, --   Function name (also: methods for classes)

    Keyword        { fg = matrixMedium }, --   any other keyword
    Statement      { Keyword }, -- (*) Any statement
    Conditional    { Keyword }, --   if, then, else, endif, switch, etc.
    Repeat         { Keyword }, --   for, do, while, etc.
    Label          { Keyword }, --   case, default, etc.
    Operator       { fg = matrixMedium }, --   "sizeof", "+", "*", etc.
    Exception      { Keyword }, --   try, catch, throw

    PreProc        { fg = yellowSat.mix(redSat, 50).mix(matrixMedium, 50) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = matrixLight }, -- (*) int, long, char, etc.
    StorageClass   { fg = purpleSat.mix(matrixMedium, 75) }, --   static, register, volatile, etc.
    Structure      { fg = StorageClass.fg }, --   struct, union, enum, etc.
    Typedef        { fg = StorageClass.fg }, --   A typedef

    Special        { fg = matrixMedium }, -- (*) Any special symbol
    SpecialChar    { Special }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = matrixVDark }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { fg = matrixMedium.mix(blueSat, 50), gui = 'italic_underline', sp = matrixMedium.mix(blueSat, 50) }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = redVSat.mix(matrixMedium, 50) }, -- Any erroneous construct
    Todo           { fg = matrixMedium.mix(whiteVDark, 50), gui = 'italic' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
    DiagnosticUnderlineError   { gui = 'undercurl', sp = matrixMedium.mix(redSat, 75) } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = 'undercurl', sp = matrixMedium.mix(yellowSat, 50) } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = 'undercurl', sp = matrixMedium.mix(blueSat, 50) } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = 'undercurl', sp = matrixMedium.mix(whiteVDark, 50) } , -- Used to underline "Hint" diagnostics.
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
    sym"@property"          { fg = blueSat.mix(matrixMedium, 60) }, -- Identifier
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
    CmpItemAbbrMatch      { fg = matrixVLight, gui = 'bold' },
    CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
    --CmpItemKind           { Comment },
    CmpItemMenu           { fg = matrixMedium },

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
