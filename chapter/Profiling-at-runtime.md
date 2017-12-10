### 運行時檢測

需要的特性：+profile

Vim 提供了一個內置的運行時檢查功能，能夠找出運行慢的代碼。

```:profile``` 命令後面跟着子命令來確定要查看什麼。

如果你想查看所有的：

```Vim
:profile start /tmp/profile.log
:profile file *
:profile func *
<do something in Vim>
<quit Vim>
```

Vim 不斷地在內存中檢查信息，只在退出的時候輸出出來。（Neovim 已經解決了這個問題用 ```:profile dump``` 命令）

看一下 ```/tmp/profile.log``` 文件，檢查時運行的所有代碼都會被顯示出來，包括每一行代碼運行的頻率和時間。

大多數代碼都是用戶不熟悉的插件代碼，如果你是在解決一個確切的問題，直接跳到這個日誌文件的末尾，那裏有 ```FUNCTIONS SORTED ON TOTAL TIME``` 和 ```FUNCTIONS SORTED ON SELF TIME``` 兩個部分，如果某個function運行時間過長一眼就可以看到。