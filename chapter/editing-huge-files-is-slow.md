## 編輯大文件很慢

大文件最大的問題，就是 Vim 會一次性讀取整個文件。這一過程的完成取決於內部如何提供緩存空間。
([Vim 開發的討論](https://groups.google.com/forum/#!topic/vim_dev/oY3i8rqYGD4/discussion))

如果你只是想讀取， `tail hugefile | vim -` 會是一個很好的解決方法.

如果不用語法，設定和插件，你也能生活自理一段時間:

```
$ vim -u NONE -N
```

這將使得導航明顯提速，因爲代價高昂的語法高亮正則表達式不再被使用。你也應該讓 Vim 不要使用交換文件和 Vim 信息文件，以避免寫入時的長延遲。

```
$ vim -n -u NONE -i NONE -N
```

簡而言之，真的寫入超大文件的時候儘量別用 Vim。 :\
