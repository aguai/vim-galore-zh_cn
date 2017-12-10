## 映射大寫鎖定鍵（CapsLock）到控制鍵（Ctrl）

大寫鎖定鍵屬於鍵盤上最少用到的按鍵，但是它要比控制鍵更加容易按到，
因爲它位於你手放在鍵盤時的[起始行](https://raw.githubusercontent.com/mhinz/vim-galore/master/contents/images/content-homerow.png)。
如果你敲很多代碼的話，映射大寫鎖定鍵（CapsLock）到控制鍵（Ctrl）可以有效降低
[重複使力傷害](https://de.wikipedia.org/wiki/Repetitive-Strain-Injury-Syndrom) (ps:爲什麼將 jk 映射爲 esc，而不是 jj，重複點擊同一個按鍵對手指傷害很大)。

友情提示：當你習慣這個設定後，你就離不開它了。

**OSX**:

`System Preferences -> Keyboard -> Keyboard Tab -> Modifier Keys`. 變更
"CapsLock" 爲 "Control"。

**Linux**:

爲了使按鍵生效，請把以下幾行放入 `~/.xmodmap` 文件:

    remove Lock = Caps_Lock
    keysym Caps_Lock = Control_L
    add Control = Control_L

用以下命令使之生效<br> `$ xmodmap ~/.xmodmap`。

替代方法有[caps2esc](https://github.com/oblitum/caps2esc) 或者
[xcape](https://github.com/alols/xcape)。

**Windows**:

請參看 [superuser.com: 在Windows8.1映射大寫鎖定鍵到控制鍵](http://superuser.com/questions/764782/map-caps-lock-to-control-in-windows-8-1)。
