## 編輯小文件很慢

對性能有重大影響的有兩個方面：

1. 複雜的**正則表達式**。尤其是 Ruby 語法文件導致人們過去一直慢慢吞吞。（[Debugging syntax files](#debugging-syntax-files)裏也有說明。）
2. **頁面刷新**。一些特性強制所有行都刷新。

| 典型敗筆 | 原因？ | 解決方法？ |
|-----------------|------|-----------|
| `:set cursorline`        | 導致所有行刷新。 | `:set nocursorline` |
| `:set cursorcolumn`      | 導致所有行刷新。 | `:set nocursorcolumn` |
| `:set relativenumber`    | 導致所有行刷新。 | `:set norelativenumber` |
| `:set foldmethod=syntax` | 語法文件算減速的話，這無異於剎車。 | `:set foldmethod=manual`, `:set foldmethod=marker` or [快速摺疊](https://github.com/Konfekt/FastFold) |
| `:set synmaxcol=3000`    | 根據內部表示規則, Vim 一般不待見對很長的行。這一設定導致3000列時纔會把所在行高亮。 | `:set synmaxcol=200` |
| matchparen.vim           | 使用默認加載。使用正則表達式去匹配括回。 | 禁用插件: `:h matchparen` |

**注意**: 只有當真的遭遇實質的性能缺陷時，你才需要做這些改進。多數情況下，上面提到的這些方面還都湊合。
