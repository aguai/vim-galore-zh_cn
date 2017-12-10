## 內置插件

出乎很多人的意料，Vim自己默認加載了大把大把的插件。啓動 Vim 後，用`:scriptnames`查看所有加載的源文件

這些文件多數永遠不會被用到，所以請禁止如你所見的以下插件。
這些插件仍舊會在源文件列出，但是當Vim啓動時，只有第一行會被讀取，而之後的配置，命令和日誌都不會執行。

| 插件     | 禁用                  | 幫助 |
|------------|-------------------------------------|------|
| 2html      | `let g:loaded_2html_plugin = 1`     | `:h 2html` |
| getscript  | `let g:loaded_getscriptPlugin = 1`  | `:h pi_getscript` |
| gzip       | `let g:loaded_gzip = 1`             | `:h pi_gzip` |
| logipat    | `let g:loaded_logipat = 1`          | `:h pi_logipat` |
| matchparen | `let g:loaded_matchparen = 1`       | `:h pi_paren` |
| netrw      | `let g:loaded_netrwPlugin = 1`      | `:h pi_netrw` |
| rrhelper   | `let g:loaded_rrhelper = 1`         | `:e $VIMRUNTIME/plugin/rrhelper.vim` |
| spellfile  | `let g:loaded_spellfile_plugin = 1` | `:h spellfile.vim` |
| tar        | `let g:loaded_tarPlugin = 1`        | `:h pi_tar` |
| vimball    | `let g:loaded_vimballPlugin = 1`    | `:h pi_vimball` |
| zip        | `let g:loaded_zipPlugin = 1`        | `:h pi_zip` |
