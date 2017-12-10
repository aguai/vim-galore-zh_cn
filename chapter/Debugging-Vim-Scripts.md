## Vim腳本調試

如果你以前使用過命令行調試器的話，對於`:debug`命令你很快就會感到熟悉。

只需要在任何其他命令之前加上`:debug`就會讓你進入調試模式。也就是，被調試的Vim腳本會在第一行停止運行，同時該行會被顯示出來。

想了解可用的6個調試命令，可以查閱`:h >cont`和閱讀下面內容。需要指出的是，類似gdb和其他相似調試器，調試命令可以使用它們的簡短形式：`c`、 `q`、`n`、`s`、 `i`和 `f`。

除了上面的之外，你還可以自由地使用任何Vim的命令。比如，`:echo myvar`，該命令會在當前的腳本代碼位置和上下文上被執行。

只需要簡單使用`:debug 1`，你就獲得了[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)調試特性。

當然，調試模式下是可以定義斷點的，不然的話每一行都去單步調試就會十分痛苦。（斷點之所以被叫做斷點，是因爲運行到它們的時候，運行就會停止下來。因此，你可以利用斷點跳過自己不感興趣的代碼區域）。請查閱`:h :breakadd`、 `:h :breakdel`和 `:h :breaklist`獲取更多細節。

假設你需要知道你每次在保存一個文件的時候有哪些代碼在運行：

```vim
:au BufWritePost
" signify  BufWritePost
"     *         call sy#start()
:breakadd func *start
:w
" Breakpoint in "sy#start" line 1
" Entering Debug mode.  Type "cont" to continue.
" function sy#start
" line 1: if g:signify_locked
>s
" function sy#start
" line 3: endif
>
" function sy#start
" line 5: let sy_path = resolve(expand('%:p'))
>q
:breakdel *
```

正如你所見，使用`<cr>`命令會重複之前的調試命令，也就是在該例子中的`s`命令。

`:debug`命令可以和[verbose](#verbosity)選項一起使用。

