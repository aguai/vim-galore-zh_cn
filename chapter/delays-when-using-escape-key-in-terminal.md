## 使用終端中 Esc 鍵時的延遲

如果你生活在命令行裏，你可能使用 xterm， gnome-terminal， iTerm2 等等所謂的 _終端虛擬器_。（區別於真正的[終端](https://en.wikipedia.org/wiki/Computer_terminal)）

和宿主終端一樣，終端虛擬器使用 [退出序列](https://en.wikipedia.org/wiki/Escape_sequence) （或者叫 _控制序列_）來控制光標移動，更換文本顏色等等。
退出序列是一些以退出碼（在 [插入符號](https://en.wikipedia.org/wiki/Caret_notation) 中展示爲 `^[`）開頭的 ASCII 碼串。
當接收到碼串時，終端虛擬器會從 [terminfo](https://en.wikipedia.org/wiki/Terminfo) 數據庫中尋找與之匹配的指令。

爲了使問題更清晰，我想先解釋一下映射超時。映射超時經常在模糊映射時發生：

```vim
:nnoremap ,a  :echo 'foo'<cr>
:nnoremap ,ab :echo 'bar'<cr>
```

兩個映射都有可能，鍵入 `,a` ，就會有一秒鐘的延遲，因爲 Vim 會等待用戶會再鍵入 `b` 還是不會了。

退出序列也會引起一樣的問題：

- `<esc>` 在返回正常模式或退出指令時被大量使用。
- 光標鍵使用了退出序列進行編碼
- Vim 運用 <kbd>Alt</kbd> （也被稱爲 _Meta key_）去發送固定的高位集編碼的8位比特，但是很多終端虛擬器不支持（或者默認不啓用），而用退出序列代替。

你可以用 `vim -u NONE -N` 試一試上面所說的，然後鍵入 `i<c-v><left>` ，你就會看見一串以 `^[`（表徵退出碼）開頭的被輸入序列。

簡而言之，區分鍵入的 `<esc>` 和一個嚴格意義上的退出序列對 Vim 來說是一個痛苦的過程。

默認情況下 `:set timeout timeoutlen=1000` ，Vim 會有1秒的延遲在等 _還有嗎_ 的模糊映射。
對於映射來說，這是一個穩健的值，但是通常爲了解決整個問題，你可以自定義鍵入的超時閾值：

```vim
set timeout           " 映射超時
set timeoutlen=1000   " 默認值
set ttimeout          " 鍵入超時
set ttimeoutlen=10    " 察覺不到的小值
```

執行 `:h ttimeout` 你可以找到一個小表格展示這些選項的相互關係。

如果你在 Vim 和終端虛擬器之間使用的是 tmux ，請將以下一行放入 `~/.tmux.conf`：

```tmux
set -sg escape-time 0
```
