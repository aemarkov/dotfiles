# Vim cheatshit

## VIM language
Command structure: `verb modifier (adjective) noun`.

Verbs - action to do:
 - v: visual select
 - c: change
 - d: delete
 - y: yank (copy)

Modifiers - change how nouns are understood:
 - i: inside
 - a: around
 - t: till character
 - f: till character (include)
 - /: find string or regex
 - <num>: number

Noun - position in the document:
 - w: word
 - ): sentence
 - }: paragraph
 - b: block/parenthesem
 - t: tag
 - H, M, L, G, gg, 0, $, hjkl and other... 
 - paired chars ('', "", (), {}, [], ...)
 - marks

Examples:
 - `viw`: select inside word
 - `vip`: select inside paragraph
 - `dib`: delete inside block:
 - `dt(`: delete everything before "("


## Navigation
Note: usually, movement commands aka *position in the file* are *nouns* and can be used
in combination with different *verbs* and *modifiers*.

Cursor navigation:
 - h/l: left/right
 - j/k: down/up

Move within the line:
 - 0: move to the begining
 - $: move to the end
 - ^: move to the firest non-black char in line
 - t<ch>: move before next <ch>
 - f<ch>: move to the next <ch>
 - F<ch>: move to the previous <ch>

Move by word:
 - w: move forward to the begining of the next word
 - W: move forward to the begining of the next WORD (including symbols)
 - b: move backward to the begining of the word
 - B: move backward to the begining of the WORD
 - e: move forward to the end of the word
 - E: move forward to the end of the WORD

Move within the screen:
 - H: move to the top of the screen
 - M: move to the middle of the screen
 - L: move to the bottom of the screen
 - C-u: move up half a screen
 - C-d: move down half a screen
 - C-f: page down
 - C-b: page up
 - C-e: scroll up one line
 - C-y: scroll down one line

Move within the document:
 - gg: move to the first line
 - G: move to the last line 

Other move:
 - }: move to the next paragraph
 - {: move to the previous paragraph
 - ): move to the next sentence
 - +: move to the first non-blank char of the next line
 - -: move to the non-blank char of the previous line
 - :<num>: move to the line <num>
 - :+/-<num>: move down/up <num> lines
 - \`./'.: move to the last modification (see marks for more details)

History:
 - C-i: move to the next place
 - C-o: move to the previous place
 - \`\`: move between two last places 

### Marks
 - m<letter>: set mark <letter> at the current location
 - \`<letter>: move to the mark
 - '<letter> move to the line with mark
 - `:marks`: show marks

Lowercase marks are local to the buffer, uppercase marks are global (will change the buffer) 

## Editing text
Note: all weird "Vim language" stuff mentioned above can be used for editing

Go to the `INSERT` mode:
 - i: insert before cursor
 - a: append after cursor
 - I: insert at the begining of the line
 - A: append at the end of the line
 - o: open a new line below
 - O: open a new line above
 - gi: insert where last insert was

Changing text:
 - r: replace a single char
 - R: replace multiple char (go to the replace mode)
 - c<move>: change (remove selected and go to the inser mode) selected based on <move>

Deleting:
 - x: exterminate (delete) char under cursor
 - X: exterminate (delete) char befor cursor
 - d<move>: delete selected based on <move>

Shortcuts:
 - C: change from cursor pos to the end of the line
 - S: change entire line
 - D: delete from cursor pos to the end of the line
 - dd: delete current line
 - J: join current line with next line

Examples:
 - `ciw`: change current word (delete and go to the insert mode)
 - `d)`:  delete from cursor pos to the begining of the next sentence
 - `di"`: delete everithing in the quoute "..."
 - `ctA`: change everything till the letter "A"
 - `d/foo`: delete everything until "foo"
 - `c4k`: change 4 lines above
 - `dG`: delete everything till to the end of the file

## Copy & paste:
 - d/dd/D: deleting is cutting
 - y<move>: yank (copy) selectected based on <move>
 - yy: yank current line
 - p: paste after the cursor pos
 - P: paste before the cursor pos

Vim has multiple registers (like multiple clibpoards buffers). To use register type `"<name>`,
e.g. `"ayy` - copy current line to the register `a`.

Command `:reg` to see all registers.

Vim automatically save all previously copied text to the **numbered registers**: `"0, "1, ... "9`.

Some special registers:
 - `""`: default register (no need to type it)
 - `"y+`, `"y*`: OS primary and secondary clibpoard (useful to copy-paste outside of Vim)
 - `".`: last inputed text
 - `"%`: file path relative to the Vim working directory
 - `":`: last command

## Search and replace
 - /: search (with regex)
 - n: go next match
 - N: go previous match
 - :%s/foo/bar/g: replace foo with bar (with rege)

Escape sequence `\c` in the search pattern make search case-insensitive. This escape
sequence can be in the any place of search pattern



## References
1. [Learn vim For the Last Time: A Tutorial and Primer](https://danielmiessler.com/study/vim/).
   Very good article, it covers the Vim language and main topics
2. [The grammar of Vim](https://medium.com/@rafeco/the-grammar-of-vim-f86482876f46).
   A little more phylosofy of the Vim language. I found some things which I didn't understand from
   the previous one
3. [VIM of Programmers](http://zmievski.org/files/talks/codeworks-2009/vim-for-php-programmers.pdf).
   Presentation with lot of examples
2. [Vim registers: The basics and beyond](Learn vim For the Last Time: A Tutorial and Primer) 
