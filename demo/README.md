# How I learned to stop worrying and love Neovim (the keyboard)

This folder contains resources for a hands-on demo of Neovim. This demo is far
from comprehensive; its only goals are as follows:

- show you what's possible with a glorious keyboard-first IDE!
- give you the tools and resources to get you editing ASAP!

DO NOT try to memorize the keymaps as we go along! They are all listed here for later perusal
and, most importantly, practice! Plus you can ping me on Teams at any time if you have
any questions!



# Contents

- [Why Neovim?](#why)
- [Orient yourself](#orient)
- [Text editing & navigation](#textediting)
  + [Level 0](#level0)
  + [Level 1](#level1)
  + [Level 2](#level2)
  + [Level 3](#level3)
  + [Level 4](#level4)
- [Higher-level operations](#highlevel)
  + [File navigation](#files)
  + [Code navigation & editing](#code)
  + [Embedded terminals & external programs](#terminals)
  + [Git integration](#git)
- [Things to explore](#extras)

<a name="why"></a>
## Why choose Neovim?

- Graphical text editors cannot run in *all* environments!
- VS Code is a great editor but closed-source, bloated, slow, and less private.
- Sublime Text is a great editor but closed-source, less functional, and ... "cosmetically challenged!"
- Vim has been around since 1991 and is not going anywhere!
- Neovim is open-source, under heavy development with a clear roadmap, really, really fast, and with a boatload of awesome plugins!

<a name="orient"></a>
## Orient yourself

Let's open Neovim and try to identify all the parts we see on the screen.

- "bufferline" (row of "tabs" at the top)
- "statusline" ("almost" bottom of the screen)
- command window ("real" bottom of the screen bottom of the screen)
- line numbers (note relative)
- `:w` (write current buffer to disk)
- quitting
  + `:q` (quit single buffer)
  + `:wq` (write and quite single buffer)
  + `:qa!` (quit all without saving)
  + `:wq!` (write all and quit)
  + shift + zz (write all and quit)
- use `:!` to run system commands

<a name="textediting"></a>
## Text editing & navigation

- ["modal editor"](https://en.wikipedia.org/wiki/Vi#Interface).
- normal/insert mode
- insert mode is boring, arrow keys, usual typing : just like VS Code/Sublime
- normal mode is where it's at!

<a name="motions"></a>
### Navigation ("motions")
  + by-character movement (h/j/k/l) <--- USED IN MANY CONTEXTS!!!
  + beginning/end of line : 0 / $
  + beginning of the first non-blank character : ^
  + forward/backward to beginning of words (w/b)
  + forward/backward to end of words (e/ge)
  + jump to top/bottom of buffer : gg / G
  + jump to absolute line number : <number> + G
  + relative jumps are even more cool: <number> + j / <number> + k
  + go back/forward in jumplist : ctrl + o / ctrl + i (very useful!)
  + jump forward/backward to next occurrence of X: f + X / F + X
  + jump forward/backward to character before next occurrence of character X: t + X / T + X
  + Use semicolon to continue search for X in same direction
  + find <TEXT> : /<TEXT> (better later!)
  + move to next / previous result : n /  n
  + clear highlights : space + h

<a name="editing"></a>
### Editing

<a name="level0"></a>
#### Level 0

- again normal node is where it's at! edit without explicit insert mode!
- delete character under cursor : x
- replace character under cursor : r
- undo last edit: u
- redo: ctrl + r
- copy line: yy
- paste after/before cursor: p / P
- cut line: dd
- insert at and of line : A
- join two lines : shift + j
- go to next/previous line and enter insert mode : o / O
- add blank line below/above and stay at current position : OO / oo
- Get suggestions for misspelled words : z=
- Mark word as correctly / incorrectly spelled : zg / zw
- Increment / decrement numbers : ctrl + a / ctrl + x
- Toggle case for character under cursor : ~
- Lowercase/uppercase until motion : gu / gU
- there are also built-in vim commands to substitute: `:s//` substitute first occurrence
  in current line, `%s//` substitute first occurrence in all buffer lines.
  Add `g` to substitute all occurrences in a line.
- Examples:
  + THIS ISS A SENTENCE.
  + THIS IS A SECOND SENTANCE.
  + THIS SENTENCE IS MISSING A PERIOD
  + THIS LINE WAS
ACCIDENTALLY SPLIT INTO TWO.
  + THIS SETNCE WRITTEN BY NITIN HAS A BADLY MISSPELLED WORD
  + MAKE THIS 1 A 2, AND VICE VERSA.
  + MAKE EVERYTHING in this sentence UPPERcASE, except this part.
  + SUBSTITUTE THIS TEXT WITH THAT STUFF.
  + SUBSTITUTE ALL OCCURRENCES OF LINES IN THIS LINE AND ONLY THIS LINE WITH FOO.

<a name="level1"></a>
#### Level 1

- vim editing commands actually have a grammar!
- RULE 1 = `<operator> [ <number> ] <motion>`
- common operators = d (delete), c (change), y (yank/copy), p (paste),
- Examples:
  + THIS LINE HAS AN EXTRA EXTRA WORD.
  + THIS IS ANOTHER LINE THAT NEEDS MANY EDITS.
  + CHANGE EVERYTHING AFTER THIS WORD.
  + COPY ONLY THE WORDS ON THIS LINE
  + DELETE THIS LINE AND ...
  + ... THIS ONE TOO ...
  + ... AND ME TOO!
  + COPY FROM HERE TILL THE SEMICOLON; BUT NOT THE SEMICOLON.
  + DELETE EVERYTHING ABOVE THIS LINE AND THEN UNDO!

<a name="level2"></a>
#### Level 2
- RULE 2 = `<operator> [ <number> ] <text object>`
- `<operator> [ <number> ] <modifier> <object>`
- `<modifier>` = a | i
- `<object>` = w | W | p | s | ( | ) | { | } | [ | ] | " | '
- `<operator>`w : apply operation from cursor to end of word
- `<operator>`iw : apply operation to word under cursor
- `<operator>`aw : apply operation to word under cursor and space before/after it
- Examples:
  - DELETE THIS WORD WITH CURSOR IN MIDDLE OF WORD.
  - DELETE THIS   WORD INCLUDING THE EXTRA WHITESPACE.
  - CHANGE THE WORDS (INSIDE THE PARENTHESES, YES!)

  - COPY THIS PARAGRAPH OF TEXT
    YES THIS LINE IS ALSO IN THE PARAGRAPH
    AND THIS TOO!

<a name="level3"></a>
#### Level 3
- Visual Mode!
- visual mode: v (press h/j/k/l to expand selection)
- visual line mode : shift + v (press j/k to select more lines)
- move visually selected lines up/down : shift + k/j
- reindent visually selected lines left/right : > / <
- visual block mode : ctrl + v
- insert while in visual block mode : shift + i
- Examples:
   - THIS IS THE SECOND LINE.
   - THIS IS THE FIRST LINE.
       - THIS LINE HAS WRONG INDENTATION LEVEL
   - REDUCE INDENTATION FOR ALL OF THESE LINES BY ONE SPACE
   - ADD THE TEXT "OH," AT THE BEGINNING OF ALL THESE LINES

<a name="level4"></a>
#### Level 4
- Surround plugins gives you new operators!
- `ys :` add surrounding, `ds :` delete surrounding, `cs :` change surrounding
- Examples:
  - SURROUND THIS PHRASE WITH DOUBLE QUOTES
  - CHANGE `BACKTICKS` WITH SINGLE QUOTES AND DELETE THESE { BRACKETS }.
  - MAKE NEOVIM A LINK.

<a name="highlevel"></a>
## Higher level operations
- Leader key for higher level operations : space
- whichkey plugin shows possible options when you press leader key

<a name="files"></a>
### File navigation
- show file explorer ("tree") on left : space + e
- gets focus automatically
- move focus back and forth : ctrl + h / ctrl + l
- move up/down in file tree : j/k
- add/delete file: a/d
- close / open folders : enter
- open selected file : enter
- move to buffer on left/right : shift + h / shift + l
- go back/forward in jumplist : ctrl + o / ctrl + i (very useful for mistyped saves!)
- close current buffer (without saving!): space + c
- Telescope plugin makes it even better!
- show searchable file list : space + f (ctrl + j/k to navigate)
- show searchable open buffer list: space + b (ctrl + j/k to navigate)
- live grep over all files under sub-tree : space + shift + f (ctrl + j/k to navigate)

<a name="code"></a>
### Code editing & navigation
- Let's open the code for `filltime` in a new terminal.
- LSP servers (Language Server Protocol)
  + Install [pyright](https://github.com/microsoft/pyright) for Python (not already installed!)
  + `:LspInstallInfo` to install new language servers (install/update: i/u)
  + `:LspInfo` to see what LSPs are attached to the current buffer.
- Code formatters and linters
  + `black`, `isort`, `pydocstyle`, `flake8` pre-installed for Python, among others.
- Two rulers at different positions as guides but no automatic wrapping!
- Must activate conda environment before opening for LSP to work properly.
- Useful keyboard shortcuts
  + Comment : space + / (combine with visual mode!)
  + go to next/previous function/class : ]m / ]m / ]] / [[ (even works in Markdown!)
  + new text objects for code : function (`f`), class (`c`), argument (`a`)
  + new operator for commenting : `gc`
  + all operators should work with these objects
  + see diagnostic message for current line as a floating window: g + l
  + go to definition of name under cursor: g + d
  + go to references of name under cursor: g + r
  + Keymap prefix for LSP actions : space + l
  + Show LSP symbol navigator : space + l + r
  + Show LSP diagnostics for whole project : space + l + d
  + Run code formatter : space + l + f
- Just start typing, and the code completion helps you, including auto-importing!
- Markdown/RST auto-wrap at 80 characters but there's a nice keyboard shortcut
  if you want to reformat yourself; shift + j to join lines and then `gqq` to
  reflow.


<a name="terminals"></a>
### Embedded terminals & external programs
- Keymap prefix for terminal mode : space + t
- Open floating terminal : space + t + f(loat)
- Open vertical terminal : space + t + v(ertical)
- Open terminal at bottom : ctrl + \ (easier to remember)
- Open htop : space + t + t (top)
- Open ncdu : space + t + u (usage)

<a name="git"></a>
### Git integration
- Driven by [lazygit](https://github.com/jesseduffield/lazygit)
- Keymap prefix for git operations : space + g
- Launch lazygit : space + g + g
- Reset buffer back to index : shift + g + shift + r
- There are other operations with space + g, but I don't really use them
- Useful lazygit keyboard shortcuts:
  + see all lazygit keyboard shortcuts : x
  + quit and go back to neovim : q
  + switch to various sections : 1-5
  + switch between tabs in a section : ] or [
  + move up/down in any section : k/j
  + stage/unstage file : space
  + commit : c (shift + c to use neovim for writing commit message!)
  + discard all changes in file/commit : d
  + reword message for selected commit: r/shift + r
  + amend selected commit to include staged files : shift + a
  + pull : p
  + push : shift + p
  + fetch any branch : f
  + create new branch : n
  + rebase active branch on selected branch : r
- Useful tips:
  + If you have pre-commit checks, better to use shift + c rather than c to commit.
  + You can press enter on any  file and then choose specific hunks to commit (v to start selection, k/j to move up/down)

<a name="extras"></a>
## Things to explore
- Resources listed at the end of the [main README](../README.md)
- Run `vimtutor` on the command line
- vim windows/splits
- repetition of vim commands using the `.` operator
- space + s
- `:help` in neovim
- `:se filetype=X` is quite helpful for scratch buffers
- Use Neovim on the ETS Linux servers
