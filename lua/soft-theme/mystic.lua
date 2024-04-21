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

local function ifBg(ifColor)
    return {
        noBg = function(elseColor)
            if vim.g.soft_theme_no_background == 1
                then return elseColor
                else return ifColor
            end
        end,
    }
end
local function ifBgOrNone(color)
    return ifBg(color).noBg("none")
end

local bgColor = hsl('#252232')

-- White
local whiteMedium = hsl('#dad5f5')
local whiteLight  = hsl('#ffffff')

-- Blue-Gray
local grayVLight = hsl('#bdb8dd')
local grayLight  = hsl('#8580c0')
local grayMedium = hsl('#656090')
local grayDark   = hsl('#454065')
local grayVDark  = hsl('#27203a')

-- Heliotrope
local purpleLight  = hsl('#d0a0f0') -- Mauve
local purpleMedium = hsl('#b770e0') -- Heliotrope
local purpleDark   = hsl('#9060c0') -- Dark Heliotrope

local purpleSat    = hsl('#7030b0') -- Purple
local purpleVSat   = hsl('#8e00e0') -- Electric Violet

-- Crimson
local redLight  = hsl('#ea90b0') -- Pink Lace
local redMedium = hsl('#e07096') -- Deep Blush

local redSat    = hsl('#b03060') -- Hibiscus
local redVSat   = hsl('#e0004b') -- Radical Red

-- Marigold
local yellowLight  = hsl('#f0e0a0')
local yellowMedium = hsl('#e0b470') -- Harvest Gold
local yellowDark   = hsl('#c09a60')

local yellowSat    = hsl('#b07020') -- Bourbon
local yellowVSat   = hsl('#e08700') -- Gold

-- Spring Green
local greenLight  = hsl('#a0f0c0') -- Magic Mint
local greenMedium = hsl('#70e0ae') -- Aquamarine
local greenDark   = hsl('#60c090') -- Sea Green

local greenSat    = hsl('#30b070') -- Jungle Green
local greenVSat   = hsl('#00e07b') -- Spring Green

-- Turquise
local cyanLight  = hsl('#8aeae0') -- Aquamarine
local cyanMedium = hsl('#69d1c5') -- Downy
local cyanDark   = hsl('#4db0a0') -- Turquoise

local cyanSat    = hsl('#20b0a0') -- Persian Green
local cyanVSat   = hsl('#00d1b9') -- Robin's Egg

-- Azure
local blueVLight = hsl('#b0e0ff') -- Pale Cornflower Blue
local blueLight  = hsl('#90d0f0') -- Anakiwa
local blueMedium = hsl('#70b4e0') -- Malibu
local blueDark   = hsl('#6090d0') -- Cornflower Blue

local blueSat    = hsl('#2080b0') -- Eastern Blue
local blueVSat   = hsl('#0087e0') -- Azure

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        -- ColorColumn  { }, -- Columns set with 'colorcolumn'
        -- Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor       { fg = ifBg(bgColor).noBg('none'), bg = purpleMedium }, -- Character under the cursor
        lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorColumn { bg = ifBg(bgColor.mix(purpleMedium, 2)).noBg(grayVDark)  },--hsl(bgColor).li(1).sa(3) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine   { bg = ifBg(bgColor.mix(purpleMedium, 10)).noBg(grayVDark) }, --hsl(bgColor).li(1).sa(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        DiffAdd      { fg = grayMedium.mix(greenSat, 75) }, -- Diff mode: Added line |diff.txt|
        DiffChange   { fg = grayMedium.mix(blueSat, 75) }, -- Diff mode: Changed line |diff.txt|
        DiffDelete   { fg = grayMedium.mix(redSat, 75) }, -- Diff mode: Deleted line |diff.txt|
        -- DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer  { fg = ifBg(bgColor).noBg(grayDark) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- Cursor in a focused terminal
        -- TermCursorNC { }, -- Cursor in an unfocused terminal
        ErrorMsg     { fg = redVSat, bg = bgColor.da(10) }, -- Error messages on the command line
        VertSplit    { fg = ifBg(grayMedium).noBg(CursorLine.bg) }, -- Column separating vertically split windows
        Folded       { bg = ifBg(bgColor.mix(grayVDark, 50)).noBg(""), sp = grayVDark, gui = "underdotted" }, -- Line used for closed folds
        FoldColumn   { fg = bgColor.mix(grayLight, 30) }, -- 'foldcolumn'
        SignColumn   { FoldColumn }, -- Column where |signs| are displayed
        -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute   { fg = bgColor, bg = yellowMedium }, -- |:substitute| replacement text highlighting
        LineNr       { fg = ifBg(bgColor.mix(grayLight, 30)).noBg(grayDark) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        CursorLineNr { fg = grayMedium, bg = LineNr.bg --[[CursorLine.bg]], gui = ifBg("").noBg("bold") }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen   { gui = "bold underline" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg      { fg = grayLight, bg = ifBgOrNone(bgColor) }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea      { ModeMsg }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg      { fg = greenSat }, -- |more-prompt|
        NonText      { fg = bgColor.mix(grayMedium, 75) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal       { fg = whiteMedium, bg = ifBgOrNone(bgColor) }, -- Normal text
        NormalFloat  { fg = grayVLight, bg = ifBg(grayVDark).noBg("none"), blend = ifBg(20).noBg(0) }, -- Normal text in floating windows.
        NormalNC     { fg = whiteMedium.de(10).da(10), bg = ifBgOrNone(bgColor.de(10).da(10)) }, -- normal text in non-current windows
        Pmenu        { NormalFloat }, -- Popup menu: Normal item.
        PmenuSel     { CursorLine, gui = "bold" }, --{ fg = whiteMedium, bg = grayLight  }, -- Popup menu: Selected item.
        PmenuSbar    { fg = whiteMedium, bg = grayMedium }, -- Popup menu: Scrollbar.
        PmenuThumb   { fg = whiteMedium, bg = purpleMedium }, -- Popup menu: Thumb of the scrollbar.
        Question     { fg = greenSat }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- Search       { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine   { fg = grayVLight, bg = ifBg(Normal.bg).noBg(CursorLine.fg) }, --{ fg = bgColor, bg = purpleLight , -- Status line of current window
        StatusLineNC { fg = grayLight, bg = Normal.bg, blend = 50 }, --{ fg = bgColor.de(10).da(10), bg = grayMedium }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine      { StatusLineNC }, -- Tab pages line, not active tab page label
        TabLineFill  { StatusLineNC }, -- Tab pages line, where there are no labels
        TabLineSel   { StatusLine }, -- Tab pages line, active tab page label
        Title        { fg = purpleSat }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual       { bg = ifBg(grayDark.mix(purpleVSat, 10)).noBg(grayVDark.mix(purpleSat, 50)) }, -- Visual mode selection
        -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg   { fg = redVSat }, -- Warning messages
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        -- WildMenu     { }, -- Current match in 'wildmenu' completion

        -- Gitsigns
        GitSignsAdd       { fg = grayLight.mix(DiffAdd.fg, 75) },
        GitSignsAddNr     { fg = grayDark .mix(DiffAdd.fg, 50) },
        GitSignsAddLn     { GitSignsAdd },
        GitSignsChange    { fg = grayLight.mix(DiffChange.fg, 75) },
        GitSignsChangeNr  { fg = grayDark .mix(DiffChange.fg, 50) },
        GitSignsChangeLn  { GitSignsChange },
        GitSignsDelete    { fg = grayLight.mix(DiffDelete.fg, 75) },
        GitSignsDeleteNr  { fg = LineNr.fg, gui = 'underline', sp = grayDark.mix(DiffDelete.fg, 50) },
        GitSignsDeleteLn  {                 gui = 'underline', sp = grayDark.mix(DiffDelete.fg, 50) },

        -- TS-Rainbow TODO: Rename these
        TSRainbowRed    { fg = blueMedium },
        TSRainbowYellow { fg = greenMedium },
        TSRainbowBlue   { fg = yellowLight },
        TSRainbowOrange { fg = redMedium },
        TSRainbowGreen  { fg = cyanMedium },
        TSRainbowViolet { fg = purpleMedium },
        TSRainbowCyan   { fg = yellowMedium },

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg = NonText.fg, gui = "italic" }, -- Any comment

        Constant       { fg = blueDark }, -- (*) Any constant
        String         { fg = purpleLight }, --   A string constant: "this is a string"
        Character      { String }, --   A character constant: 'c', '\n'
        Number         { fg = greenLight }, --   A number constant: 234, 0xff
        Boolean        { Number }, --   A boolean constant: TRUE, false
        Float          { Number }, --   A floating point constant: 2.3e10

        Property       { fg = blueMedium }, -- Only used in this file (is linked to from other groups)
        Identifier     { fg = blueLight }, -- (*) Any variable name
        Function       { fg = yellowMedium }, --   Function name (also: methods for classes)

        Keyword        { fg = purpleMedium }, --   any other keyword
        Statement      { Keyword }, -- (*) Any statement
        Conditional    { Keyword }, --   if, then, else, endif, switch, etc.
        Repeat         { Keyword }, --   for, do, while, etc.
        Label          { Keyword }, --   case, default, etc.
        Operator       { fg = grayVLight }, --   "sizeof", "+", "*", etc.
        Exception      { Keyword }, --   try, catch, throw

        Macro          { fg = yellowMedium.mix(redMedium, 50) }, --   Same as Define
        PreProc        { Macro }, -- (*) Generic Preprocessor
        -- Include        { }, --   Preprocessor #include
        -- Define         { }, --   Preprocessor #define
        -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = cyanMedium }, -- (*) int, long, char, etc.
        StorageClass   { fg = purpleMedium }, --   static, register, volatile, etc.
        Structure      { Type }, --   struct, union, enum, etc.
        Typedef        { Type }, --   A typedef
        Namespace      { fg = cyanDark }, -- Only used in this file (is linked to from other groups)

        Special        { fg = purpleMedium }, -- (*) Any special symbol
        SpecialChar    { Special }, --   Special character in a constant
        -- Tag            { }, --   You can use CTRL-] on this
        Delimiter      { fg = grayLight }, --   Character that needs attention
        -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
        -- Debug          { }, --   Debugging statements

        Unknown        { gui = "strikethrough" }, -- Only used in this file (is linked to from other groups)
        Underlined     { fg = blueVSat, gui = 'italic_underline', sp = blueVSat }, -- Text that stands out, HTML links
        -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { fg = redVSat }, -- Any erroneous construct
        Todo           { fg = blueMedium, gui = 'italic' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
        sym"@punctuation.delimiter" { Delimiter },
        sym"@punctuation.bracket"   { Keyword },
        -- sym"@punctuation.special" { },
        -- sym"@constant"          { }, -- Constant
        sym"@constant.builtin"  { Constant }, -- Special
        -- sym"@constant.macro"    { }, -- Define
        -- sym"@define"            { }, -- Define
        -- sym"@macro"             { }, -- Macro
        -- sym"@string"            { }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        sym"@string.special.url"    { Underlined }, -- SpecialChar
        -- sym"@character"         { }, -- Character
        -- sym"@character.special" { }, -- SpecialChar
        -- sym"@number"            { }, -- Number
        -- sym"@boolean"           { }, -- Boolean
        -- sym"@float"             { }, -- Float
        -- sym"@function"          { }, -- Function
        sym"@function.builtin"  { Function }, -- Special
        -- sym"@function.macro"    { }, -- Macro
        -- sym"@function.call"     { },
        -- sym"@function.method"   { }, -- Function
        -- sym"@function.method.builtin" { }, -- Function
        -- sym"@method"            { }, -- Function
        -- sym"@variable"          { }, -- Identifier
        -- sym"@variable.parameter" { }, -- Identifier
        -- sym"@variable.builtin"  { }, -- Identifier
        sym"@variable.member"   { Property },
        -- sym"@parameter"         { }, -- Identifier
        sym"@field"             { Property }, -- Identifier
        sym"@property"          { Property }, -- Identifier
        -- sym"@constructor"       { }, -- Special
        -- sym"@conditional"       { }, -- Conditional
        -- sym"@repeat"            { }, -- Repeat
        sym"@label"             { fg = purpleLight }, -- Label
        -- sym"@operator"          { }, -- Operator
        -- sym"@keyword"           { }, -- Keyword
        -- sym"@keyword.coroutine" { }, -- Keyword
        -- sym"@keyword.function"  { }, -- Keyword
        sym"@keyword.operator"  { Statement }, -- Keyword
        sym"@keyword.return"    { Statement },
        -- sym"@exception"         { }, -- Exception
        -- sym"@type"              { }, -- Type
        -- sym"@type.builtin"      { }, -- Type
        sym"@type.qualifier"    { Keyword },
        -- sym"@type.definition"   { }, -- Typedef
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        sym"@namespace"         { Namespace }, -- Identifier
        sym"@module"            { Namespace }, -- Identifier
        sym"@include"           { Keyword }, -- Include
        -- sym"@preproc"           { }, -- PreProc
        -- sym"@debug"             { }, -- Debug
        sym"@tag"               { Type }, -- Tag
        sym"@tag.attribute"     { Property },
        sym"@tag.delimiter"     { Keyword },
        sym"@attribute"         { Keyword },
        -- sym"@none"              { }, -- Found in Nix file

        -- Temporarily turn all found lsp groups to red, so we can find them and overwrite them for each language
        sym"@lsp.type.enum"             { fg = redVSat }, -- Structure
        sym"@lsp.type.path"             { fg = redVSat },
        sym"@lsp.type.type"             { fg = redVSat }, -- Type
        sym"@lsp.type.class"            { fg = redVSat }, -- Structure
        sym"@lsp.type.label"            { fg = redVSat },
        sym"@lsp.type.macro"            { fg = redVSat }, -- Macro
        sym"@lsp.type.method"           { fg = redVSat }, -- Function
        sym"@lsp.type.number"           { fg = redVSat },
        sym"@lsp.type.string"           { fg = redVSat },
        sym"@lsp.type.struct"           { fg = redVSat }, -- Structure
        sym"@lsp.type.boolean"          { fg = redVSat },
        sym"@lsp.type.builtin"          { fg = redVSat },
        sym"@lsp.type.comment"          { fg = redVSat }, -- Comment
        sym"@lsp.type.generic"          { fg = redVSat },
        sym"@lsp.type.keyword"          { fg = redVSat },
        sym"@lsp.type.unknown"          { fg = redVSat },
        sym"@lsp.type.constant"         { fg = redVSat },
        sym"@lsp.type.function"         { fg = redVSat }, -- Function
        sym"@lsp.type.lifetime"         { fg = redVSat },
        sym"@lsp.type.modifier"         { fg = redVSat },
        sym"@lsp.type.operator"         { fg = redVSat },
        sym"@lsp.type.property"         { fg = redVSat }, -- Identifier
        sym"@lsp.type.variable"         { fg = redVSat }, -- Identifier
        sym"@lsp.type.decorator"        { fg = redVSat }, -- Function
        sym"@lsp.type.interface"        { fg = redVSat }, -- Structure
        sym"@lsp.type.namespace"        { fg = redVSat }, -- Structure
        sym"@lsp.type.parameter"        { fg = redVSat }, -- Identifier
        sym"@lsp.type.typeAlias"        { fg = redVSat }, -- Structure
        sym"@lsp.type.enumMember"       { fg = redVSat }, -- Constant
        sym"@lsp.type.builtinType"      { fg = redVSat },
        sym"@lsp.type.selfKeyword"      { fg = redVSat },
        sym"@lsp.type.punctuation"      { fg = redVSat },
        sym"@lsp.type.typeParameter"    { fg = redVSat }, -- Typedef
        sym"@lsp.type.escapeSequence"   { fg = redVSat }, -- Typedef
        sym"@lsp.type.attributeBracket" { fg = redVSat },
        sym"@lsp.type.builtinAttribute" { fg = redVSat },
        sym"@lsp.type.unresolvedReference" { fg = redVSat },

        -- Bash
        sym"@keyword.bash"      { Statement }, -- Keyword

        -- C
        sym"@lsp.type.macro.c"          { Macro },
        sym"@lsp.type.function.c"       { },
        sym"@lsp.type.class.c"          { Type },
        sym"@lsp.type.parameter.c"      { gui = "italic" },
        sym"@lsp.type.variable.c"       { gui = "italic" },
        sym"@lsp.type.property.c"       { gui = "italic" },
        sym"@lsp.mod.readonly.c"        { gui = "nocombine" },
        sym"@lsp.type.type.c"           { },
        sym"@lsp.type.enumMember.c"     { },
        sym"@lsp.type.enum.c"           { },
        sym"@lsp.type.operator.c"       { },
        sym"@lsp.type.comment.c"        { Comment },
        sym"@lsp.type.unknown.c"        { Unknown },

        -- C++
        sym"@lsp.type.macro.cpp"        { Macro },
        sym"@lsp.type.function.cpp"     { },
        sym"@lsp.type.class.cpp"        { },
        sym"@lsp.type.type.cpp"         { },
        sym"@lsp.type.variable.cpp"     { gui = "italic" },
        sym"@lsp.mod.readonly.cpp"      { gui = "nocombine" },
        sym"@lsp.type.enumMember.cpp"   { },
        sym"@lsp.type.enum.cpp"         { },
        sym"@lsp.type.namespace.cpp"    { },
        sym"@lsp.type.property.cpp"     { fg = Property.fg, gui = "italic" },
        sym"@lsp.type.parameter.cpp"    { gui = "italic" },
        sym"@lsp.type.typeParameter.cpp" { Constant },
        sym"@lsp.type.method.cpp"       { },
        sym"@lsp.type.unknown.cpp"      { Unknown },
        sym"@lsp.type.operator.cpp"     { },
        sym"@lsp.type.comment.cpp"      { Comment },

        -- C#
        sym"@lsp.type.comment.cs"       { },
        sym"@lsp.type.keyword.cs"       { },
        sym"@lsp.type.namespace.cs"     { Namespace },
        sym"@lsp.type.operator.cs"      { },
        sym"@lsp.type.interface.cs"     { Type },
        sym"@lsp.type.class.cs"         { Type },
        sym"@lsp.type.property.cs"      { fg = Property.fg, gui = "italic" }, -- The C# language server does not differentiate between mutable and readonly variables in terms of semantic tokens.
        sym"@lsp.type.parameter.cs"     { gui = "italic" },
        sym"@lsp.type.method.cs"        { },
        sym"@lsp.type.variable.cs"      { gui = "italic" },
        sym"@lsp.type.enum.cs"          { Type },
        sym"@lsp.type.enumMember.cs"    { Constant },
        sym"@lsp.type.number.cs"        { },
        sym"@lsp.type.typeParameter.cs" { Type },
        sym"@lsp.type.string.cs"        { },
        sym"@lsp.type.struct.cs"        { Structure },
        sym"@constructor.c_sharp"       { Type },
        sym"@attribute.c_sharp"         { Function },

        -- Elm
        sym"@constructor.elm"           { Type },

        -- F#
        sym"@lsp.type.type.fsharp"      { Type },
        sym"@lsp.type.function.fsharp"  { Function },
        sym"@lsp.type.operator.fsharp"  { Operator },
        sym"@lsp.type.member.fsharp"    { Property },
        sym"@lsp.typemod.member.mutable.fsharp" { gui = "italic" },
        sym"@lsp.type.variable.fsharp"  { Identifier },
        sym"@lsp.type.property.fsharp"  { Property },
        sym"@lsp.type.enumMember.fsharp"{ Constant },
        sym"@lsp.type.enum.fsharp"      { Type },
        sym"@lsp.type.namespace.fsharp" { Namespace },
        sym"@lsp.type.module.fsharp"    { Namespace },
        sym"@lsp.type.struct.fsharp"    { Structure },
        sym"@lsp.type.interface.fsharp" { Type },
        sym"@lsp.type.typeParameter.fsharp" { },
        fsharpException                 { Exception },
        fsharpOpen                      { Keyword },
        fsharpSScript                   { Macro },
        fsharpSymbol                    { Identifier },

        -- Java
        sym"@lsp.type.keyword.java"     { },
        sym"@lsp.type.namespace.java"   { Namespace },
        sym"@lsp.type.class.java"       { Type },
        sym"@lsp.type.type.java"        { },
        sym"@lsp.type.annotation.java"  { Function },
        sym"@lsp.type.interface.java"   { },
        sym"@lsp.type.modifier.java"    { },
        sym"@lsp.type.method.java"      { Function },
        sym"@lsp.type.typeParameter.java" { },
        sym"@lsp.type.enum.java"        { },
        sym"@lsp.type.enumMember.java"  { },
        sym"@lsp.mod.readonly.java"     { },
        java1                           { },
        javaParen                       { Keyword },
        javaParenT                      { Identifier },
        sym"@lsp.mod.documentation.java" { Delimiter },
        sym"@lsp.typemod.namespace.documentation.java" { Namespace },
        sym"@lsp.typemod.class.documentation.java" { Namespace },
        sym"@lsp.typemod.method.documentation.java" { Function },
        sym"@lsp.typemod.parameter.documentation.java" { Identifier },
        sym"@lsp.typemod.keyword.documentation.java" { Keyword },
        sym"@lsp.typemod.enum.readonly.java" { Type },
        sym"@lsp.type.property.java"    { fg = Property.fg, gui = "italic" },
        sym"@lsp.type.parameter.java"   { gui = "italic" },
        sym"@lsp.type.variable.java"    { gui = "italic" },
        sym"@lsp.typemod.property.readonly.java" { gui = "nocombine" },
        sym"@lsp.typemod.variable.readonly.java" { gui = "nocombine" },
        sym"@lsp.typemod.parameter.readonly.java" { gui = "nocombine" },
        sym"@function.builtin.java"     { Identifier, gui = "italic" }, -- Used for 'super'
        sym"@variable.builtin.java"     { Identifier, gui = "italic" }, -- Used for 'this'

        -- JavaScript
        sym"@lsp.type.class.javascript"    { },
        sym"@lsp.type.property.javascript" { },
        sym"@lsp.type.parameter.javascript" { },
        sym"@lsp.type.variable.javascript" { },
        sym"@lsp.type.function.javascript" { },
        sym"@lsp.type.method.javascript"   { },
        sym"@constructor.javascript"       { },

        -- TypeScript
        sym"@lsp.type.namespace.typescript" { Namespace },
        sym"@lsp.typemod.variable.defaultLibrary.typescript" { fg = Namespace.fg, gui = "nocombine" }, -- Fixes namespaces such as `Math` that otherwise is tokenized as non-readonly variables.
        sym"@lsp.type.interface.typescript" { Type },
        sym"@lsp.type.class.typescript"     { Type },
        sym"@lsp.type.type.typescript"      { Type },
        sym"@lsp.type.typeParameter.typescript"      { Type },
        sym"@lsp.type.enum.typescript" { Type },
        sym"@lsp.type.enumMember.typescript" { Constant },
        sym"@lsp.type.parameter.typescript" { gui = "italic" },
        sym"@lsp.type.variable.typescript"  { gui = "italic" },
        sym"@lsp.type.property.typescript"  { gui = "italic" },
        sym"@lsp.mod.readonly.typescript"   { gui = "nocombine" },
        sym"@lsp.type.function.typescript"  { },
        sym"@lsp.type.method.typescript"    { },
        -- typescript1                     { Identifier },
        -- typescriptFuncKeyword           { },
        -- typescriptFuncName              { },
        typescriptFuncComma             { Delimiter },
        typescriptTypeAnnotation        { Delimiter },
        typescriptRestOrSpread          { Operator },
        typescriptTernaryOp             { Delimiter }, -- Actually for optional values
        typescriptBinaryOp              { Operator }, -- For union types
        typescriptUnaryOp               { Operator }, -- For + in +10
        typescriptCall                  { Identifier },
        typescriptIdentifierName        { Identifier },
        -- typescriptPredefinedType        { },
        -- typescriptType                  { },
        typescriptNull                  { Constant },
        typescriptEndColons             { Delimiter },
        typescriptAliasDeclaration      { Type },
        typescriptMember                { Property },
        typescriptParens                { TSRainbowRed },
        typescriptBraces                { TSRainbowBlue },
        typescriptTypeBrackets          { TSRainbowYellow },
        typescriptTypeBracket           { TSRainbowOrange },
        typescriptTypeReference         { Type },
        typescriptTypeParameter         { Type },
        typescriptTypeArguments         { Delimiter },
        -- typescriptFuncCallArg           { Delimiter },
        typescriptDotNotation           { Delimiter },
        typescriptVariable              { Keyword },
        typescriptVariableDeclaration   { Type },
        typescriptProp                  { Type },

        -- TypeScriptReact
        sym"@lsp.type.variable.typescriptreact" { },
        sym"@lsp.type.property.typescriptreact" { },
        sym"@lsp.type.parameter.typescriptreact" { },
        sym"@lsp.type.function.typescriptreact" { },
        sym"@lsp.type.method.typescriptreact"   { },
        sym"@lsp.type.interface.typescriptreact" { },
        sym"@lsp.type.namespace.typescriptreact" { Namespace },
        sym"@lsp.type.class.typescriptreact"    { Type },
        sym"@lsp.type.type.typescriptreact"     { },

        -- Lua
        sym"@lsp.type.comment.lua"      { },
        sym"@lsp.type.variable.lua"     { },
        sym"@lsp.type.property.lua"     { },
        sym"@lsp.type.method.lua"       { },
        sym"@lsp.type.function.lua"     { },
        sym"@lsp.type.parameter.lua"    { },
        sym"@lsp.type.keyword.lua"      { },
        sym"@lsp.type.type.lua"         { },
        sym"@keyword.luadoc"            { Delimiter },

        -- Makefile
        sym"@symbol.make"               { Identifier },
        sym"@string.make"               { Identifier },
        makeIdent                       { Identifier },
        makePreCondit                   { Conditional },
        makeCommands                    { Function },
        makeSpecial                     { Operator },
        makeDString                     { String },
        makeEscapedChar                 { Special },
        makeSpecTarget                  { Keyword },

        -- Markdown
        sym"@markup.heading.1.marker.markdown"  { fg = blueMedium, gui = "bold italic" },
        sym"@markup.heading.1.markdown"         { fg = blueMedium, gui = "bold italic" },
        sym"@markup.heading.2.marker.markdown"  { fg = greenMedium, gui = "bold italic" },
        sym"@markup.heading.2.markdown"         { fg = greenMedium, gui = "bold italic" },
        sym"@markup.heading.3.marker.markdown"  { fg = yellowLight, gui = "bold italic" },
        sym"@markup.heading.3.markdown"         { fg = yellowLight, gui = "bold italic" },
        sym"@markup.heading.4.marker.markdown"  { fg = redMedium, gui = "bold italic" },
        sym"@markup.heading.4.markdown"         { fg = redMedium, gui = "bold italic" },
        sym"@markup.heading.5.marker.markdown"  { fg = cyanMedium, gui = "bold italic" },
        sym"@markup.heading.5.markdown"         { fg = cyanMedium, gui = "bold italic" },
        sym"@markup.heading.6.marker.markdown"  { fg = purpleMedium, gui = "bold italic" },
        sym"@markup.heading.6.markdown"         { fg = purpleMedium, gui = "bold italic" },
        sym"@punctuation.special.markdown"      { fg = Comment.fg },
        sym"@markup.raw.markdown_inline"        { fg = Comment.fg, gui = "italic" },
        sym"@markup.raw.block.markdown"         { fg = Comment.fg, gui = "italic" },
        sym"@label.markdown"                    { fg = grayLight, gui = "italic" },
        sym"@markup.list"                       { fg = Comment.fg },
        sym"@markup.strong.markdown_inline"     { gui = "bold" },
        sym"@markup.italic.markdown_inline"     { gui = "italic" },
        --sym"@markup.link.markdown_inline"       { },
        sym"@markup.link.label.markdown_inline" { fg = greenLight, gui = "bold italic" },
        sym"@markup.link.url.markdown_inline"   { Underlined },
        sym"@markup.list.unchecked.markdown"    { fg = redLight },
        sym"@markup.list.checked.markdown"      { fg = greenLight },
        sym"@lsp.type.class.markdown"           { },
        sym"@lsp.type.enumMember.markdown"      { },
        sym"MarkdownError"                      { }, -- Occurs in LSP hover when containing underscores 

        -- Nix
        sym"@lsp.type.comment.nix"      { },
        sym"@lsp.type.punctuation.nix"  { },
        sym"@lsp.type.constant.nix"     { },
        sym"@lsp.type.number.nix"       { },
        sym"@lsp.type.string.nix"       { },
        sym"@lsp.type.boolean.nix"      { },
        sym"@lsp.type.parameter.nix"    { },
        sym"@lsp.type.keyword.nix"      { },
        sym"@lsp.type.operator.nix"     { },
        sym"@lsp.type.variable.nix"     { Identifier }, -- TODO: Should variables in functional languages where all variables are immutable use Constant instead?
        sym"@variable.member.nix"       { Property },
        sym"@lsp.type.property.nix"     { },
        sym"@lsp.typemod.property.definition.nix" { Property },
        sym"@lsp.type.function.nix"     { },
        sym"@lsp.typemod.struct.builtin.nix" { Constant },
        sym"@lsp.mod.delimiter.nix"     { Delimiter },
        sym"@lsp.type.path.nix"         { fg = greenLight },

        -- Rust
        sym"@lsp.type.comment.rust"     { },
        sym"@lsp.type.unresolvedReference.rust" { --[[ Unknown ]] }, -- Apparently rust_analyzer uses this on almost all identifiers, bug? TODO: Put Unknown back if it gets fixed.
        sym"@lsp.type.typeAlias.rust"   { },
        sym"@lsp.type.builtinType.rust" { },
        sym"@lsp.type.attributeBracket.rust" { },
        sym"@lsp.type.decorator.rust"   { },
        sym"@lsp.type.generic.rust"     { },
        sym"@lsp.type.struct.rust"      { },
        sym"@lsp.type.method.rust"      { },
        sym"@lsp.type.selfKeyword.rust" { },
        sym"@lsp.type.property.rust"    { Property },
        sym"@lsp.type.parameter.rust"   { Identifier },
        sym"@lsp.type.variable.rust"    { Identifier },
        sym"@lsp.typemod.selfKeyword.mutable.rust" { gui = "italic" },
        sym"@lsp.typemod.property.mutable.rust"    { gui = "italic" },
        sym"@lsp.typemod.parameter.mutable.rust"   { gui = "italic" },
        sym"@lsp.typemod.variable.mutable.rust"    { gui = "italic" },
        sym"@lsp.type.keyword.rust"     { },
        sym"@lsp.type.macro.rust"       { },
        sym"@lsp.type.operator.rust"    { },
        sym"@lsp.type.enumMember.rust"  { Constant },
        sym"@lsp.type.enum.rust"        { },
        sym"@lsp.type.interface.rust"   { },
        sym"@lsp.type.builtinAttribute.rust" { },
        sym"@lsp.type.string.rust"      { },
        sym"@lsp.type.lifetime.rust"    { },
        sym"@lsp.type.function.rust"    { },
        sym"@lsp.type.namespace.rust"   { Namespace },
        sym"@lsp.type.escapeSequence.rust" { },
        sym"@lsp.type.typeParameter.rust" { },
        sym"@lsp.type.label.rust"       { },
        sym"@keyword.rust"              { Statement },

        -- Vimdoc
        sym"@text.literal.vimdoc"       { Number },
        sym"@markup.link.vimdoc"        { Identifier },
        sym"@label.vimdoc"              { Label },

        -- Zig
        sym"@lsp.type.keyword.zig"       { },
        sym"@lsp.type.namespace.zig"     { Namespace },
        sym"@lsp.type.operator.zig"      { Operator },
        sym"@lsp.type.builtin.zig"       { Macro },
        sym"@lsp.type.string.zig"        { },
        sym"@lsp.type.comment.zig"       { },
        sym"@lsp.type.function.zig"      { Function },
        sym"@function.builtin.zig"       { Macro }, -- Only affects the '@' functions in Zig, afaik
        sym"@lsp.type.parameter.zig"     { },
        sym"@lsp.type.struct.zig"        { Structure },
        sym"@lsp.type.type.zig"          { Type },
        sym"@lsp.type.enum.zig"          { Type },
        sym"@lsp.type.typeParameter.zig" { Type },
        sym"@lsp.type.enumMember.zig"    { Constant },
        sym"@lsp.type.variable.zig"      { },
        sym"@lsp.type.property.zig"      { Property },
        sym"@lsp.type.number.zig"        { },

        -- Netrw
        netrwBak       { },
        netrwClassify  { fg = grayLight },
        netrwCmdNote   { Keyword },
        netrwCmdSep    { Delimiter },
        netrwComma     { netrwCmdSep },
        netrwComment   { Comment },
        netrwCompress  { fg = grayLight },
        netrwCoreDump  { },
        netrwData      { },
        netrwDateSep   { },
        netrwDir       { fg = grayLight, gui = 'italic' },
        netrwDoc       { fg = blueMedium },
        netrwExe       { fg = greenSat },
        netrwGray      { },
        netrwHdr       { fg = grayVLight },
        netrwHelpCmd   { Function },
        netrwHide      { Comment },
        netrwHidePat   { netrwCmdNote },
        netrwHideSep   { },
        netrwLex       { },
        netrwLib       { fg = blueVSat },
        netrwLink      { },
        netrwList      { netrwCmdNote },
        netrwMakefile  { fg = yellowDark },
        netrwMarkFile  { gui = 'bold underline', sp = purpleMedium },
        netrwObj       { fg = grayMedium },
        netrwPix       { fg = greenMedium },
        netrwPlain     { fg = grayVLight },
        netrwQHTopic   { Todo },
        netrwQuickHelp { netrwCmdNote },
        netrwSortBy    { },
        netrwSortSeq   { },
        netrwSpecFile  { },
        netrwSymLink   { },
        netrwTags      { netrwDir }, -- Idk what this is but it affects dirs named tags/
        netrwTilde     { },
        netrwTimeSep   { },
        netrwTmp       { netrwDir }, -- Idk what this is but it affects dirs named tmp/
        netrwTreeBar   { fg = grayDark },
        netrwVersion   { Todo },
        netrwYacc      { },

        -- Netrw custom syntax matches
        netrwMylang    { fg = cyanMedium },
        netrwHaskell   { fg = purpleVSat },
        netrwPython    { fg = yellowMedium },
        netrwLua       { fg = blueVSat },
        netrwJS        { fg = yellowMedium },
        netrwJSON      { fg = yellowDark },
        netrwCSS       { fg = yellowLight },
        netrwHTML      { fg = blueMedium },
        netrwJava      { fg = purpleLight },
        netrwGradle    { fg = blueLight },
        netrwClass     { netrwObj },
        netrwRust      { fg = yellowVSat },
        netrwCargo     { fg = yellowDark },
        netrwC         { fg = yellowLight }, -- .h = netrwHdr, makefile = netrwMakefile
        netrwDebug     { fg = redMedium },

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        LspReferenceText            { gui = "underdotted" } , -- Used for highlighting "text" references
        LspReferenceRead            { LspReferenceText } , -- Used for highlighting "read" references
        LspReferenceWrite           { LspReferenceText } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        LspSignatureActiveParameter { gui = 'underline' } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        DiagnosticUnnecessary      { Unknown }, -- Used for unused identifiers.
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
        DiagnosticUnderlineInfo    { gui = 'underdotted', sp = blueVSat } , -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint    { gui = 'underdotted', sp = grayLight} , -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

        --CmpItemAbbr           { },
        CmpItemAbbrDeprecates { Unknown },
        --CmpItemAbbrMatch      { fg = magentaMedium, bg = Visual.bg },
        --CmpItemAbbrMatch      { fg = magentaMedium, gui = 'underline bold', sp = magentaMedium.sa(20) },
        CmpItemAbbrMatch      { fg = purpleMedium },
        CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
        --CmpItemKind           { Comment },
        CmpItemMenu           { fg = grayLight },

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

        CopilotSuggestion     { fg = grayMedium, gui = 'italic' },

        TelescopeSelection      { CursorLine },
        TelescopeSelectionCaret { fg = Normal.fg },
        --TelescopeMultiSelection { },
        --TelescopeMultiIcon      { },

        --TelescopeNormal         { },
        TelescopePreviewNormal  { Normal },
        TelescopePromptNormal   { CursorLine },
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
