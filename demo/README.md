# Short Neovim Demo

This folder contains resources for a hands-on demo of Neovim. This demo is far
from comprehensive; it only covers a few common topics and scenarios. The rest
I leave up to you to discover as you take the Neovim journey.


## Orient yourself

Let's open Neovim and try to identify all the parts we see on the screen.

- bufferline (row of "tabs" at the top)
- statusline ("almost" bottom of the screen)
- command window ("real" bottom of the screen bottom of the screen)
- line numbers (note relative)

## Text editing & navigation

- ["modal editor"](https://en.wikipedia.org/wiki/Vi#Interface).
- normal/insert mode
- insert mode is boring, arrow keys, usual typing : just like VS Code/Sublime
- normal mode is where it's at!

- navigation (motions):
  + by-character movement (h/j/k/l)
  + top/bottom of buffer : gg / G
  + beginning/end of line : 0 / $
  + beginning of the first non-blank character : ^
  + forward/backward to beginning of words (w/b)
  + forward/backward to end of words (e/ge)
  + jump to absolute line number : <number>G
  + relative jumps are even more cool: <number>j / <number>k
  + jump forward/backward to next occurrence of X: fX / Fx

- editing
  + again normal node is where it's at! edit without explicit insert mode!
  + delete character under cursor : x
  + replace character under cursor : r
  + u : undo last edit
  + ctrl + r : redo
  + yy : copy line
  + p : paste
  + dd : cut line
  + TIME TO LEVEL UP!
  + vim editing commands actually have a grammar
  + rule 1 = <operator> <motion>
  + common operators = d (delete), c (change), y (yank/copy), p (paste),

## Demo section

vi (pronounced as distinct letters, /ˌviːˈaɪ/)[1] is a screen-oriented text
editor originally created for the Unix operating system. The portable subset of
the behavior of vi and programs based on it, and the ex editor language
supported within these programs, is described by (and thus standardized by) the
Single Unix Specification and POSIX.[2]

The original code for vi was written by Bill Joy in 1976, as the visual mode
for a line editor called ex that Joy had written with Chuck Haley.[3] Bill
Joy's ex 1.1 was released as part of the first Berkeley Software
Distribution (BSD) Unix release in March 1978. It was not until version 2.0
of ex, released as part of Second BSD in May 1979 that the editor was
installed under the name "vi" (which took users straight into ex's visual
mode),[4] and the name by which it is known today. Some current
implementations of vi can trace their source code ancestry to Bill Joy;
others are completely new, largely compatible reimplementations.[citation
needed][discuss]

The name "vi" is derived from the shortest unambiguous abbreviation for the ex
command visual, which switches the ex line editor to its full-screen mode. The
name is pronounced /ˌviːˈaɪ/ (the English letters v and i).[5][6]

In addition to various non–free software variants of vi distributed with proprietary implementations of Unix, vi was opensourced with OpenSolaris, and several free and open source software vi clones exist. A 2009 survey of Linux Journal readers found that vi was the most widely used text editor among respondents, beating gedit, the second most widely used editor, by nearly a factor of two (36% to 19%).[7


## Code editing & navigation

- LSP servers (Language Server Protocol)
- Code formatters and linters
- Python
- Markdown

## Embedded terminals

## Git integration

- [lazygit](https://github.com/jesseduffield/lazygit)

