## 語法文件調試

語法文件由於包含錯誤的或者複製的正則表達式，常常會使得Vim的運行較慢。如果Vim在編譯的時候包含了`+profile` [feature](#what-kind-of-vim-am-i-running)特性，就可以給用戶提供一個超級好用的`:syntime`命令。

```vim
:syntime on
" 多次敲擊<c-l>來重繪窗口，這樣的話就會使得相應的語法規則被重新應用一次
:syntime off
:syntime report
```
輸出結果包含了很多的度量維度。比如，你可以通過結果知道哪些正則表達式耗時太久需要被優化；哪些正則表達式一直在別使用但重來沒有一次成功匹配。

請查閱`:h :syntime`。


