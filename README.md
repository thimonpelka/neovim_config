
Commands
- :w - write
- :q - quite
- :Lazy - Lazy Menu
- Space + f + g = search menu
- w = next word
- b = last word
- dd = delete row
- hjkl = up, down, left, right
- Ctrl + P - Lazy Finder (File Finder)
- y - copy
- p - paste
- v - markier-modus
- < > - indent von markiertem text 5< = 5 mal links
- o - new empty line below current
- Ctrl + s - save
- Ctrl + d - duplicate
- % - does the same
- gx - open url under cursor 
- gf - das selbe mit files
- 12G go to line 12
- f + buchstabe - zu buchstabe springen
- fg - open fuzzy find and search for words inside project

- Ctrl + w + s - split
- Ctrl + w + v - vertical split
- Ctrl + w + c - close
- Ctrl + w + o - close all windows except current onejjkk

- * - mark all occurences of word
	- n - go to next occurence
	- N - go to previous occurence
- ciw - (change in word) remove current word an start writing
- ciW - same but also removes my.example.word as one (ignores dots)
- C - change from cursor to end of line
- cc - change entire line

Comments:
- gcc - comment out current line (or multiple selected lines in visual mode)

while in insert mode you can use alt + key to do some normal mode actions
- alt + o - insert in new line
- alt + i - go back one character
- alt + p - paste

Neotree (https://github.com/nvim-neo-tree/neo-tree.nvim)
- Ctrl + N - open view
- A - Add new directory
- d - delete
- r - rename
- Enter - go to file
- q - close window

LSP
- Shift + k - show function description
- gd - go to definition
- space + c + a - show code actions

formatting
- Ctrl + f - format code

Macros: (in normal mode)
- q + (custom character)
	- execute code
	- when done: q
- to execute: @ (custom character)

Visual
- V - select entire line
- vib - everything in round brackets
- viB - everything in curly brackets
- both can also be used with change (c)
- Ctrl + v - visual block mode

Git:
- space + g + a - git add .
- space + g + c - git commit
- space + g + p - git push
