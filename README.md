# Battery Graph
バッテリのログを記録し、バッテリ容量の変化をグラフに表示

<img src=https://raw.githubusercontent.com/motokii/batterygraph/images/images/screenshot.png width=500px>

## インストール

## Homebrewでインストール

``` sh
brew tap motokii/batterygraph
brew install batterygraph
```

## 手動でインストール
好きな場所でgit clone する
``` sh
git clone https://github.com/motokii/batterygraph.git
```

パス($path)の通った場所に実行ファイルのリンクを貼る
``` sh
ln -s $(pwd)/batterygraph/src/batterygraph ~/.local/bin/batterygraph
```

パス($fpath)の通った場所に補完ファイルのリンクを貼る
``` sh
ln -s $(pwd)/batterygraph/completion/_batterygraph /usr/local/share/zsh-completions/_batterygraph
```

## 使い方

launchd にロードする(10分毎にログに記録される)
``` sh
batterygraph load
```

現在のバッテリー状況をログに記録する
``` sh
batterygraph write
```

バッテリのグラフを見る
``` sh
batterygraph show
```

launchd からアンロードする(ロギングを終了する)
``` sh
batterygraph unload
```

launchd での状況を確認する
``` sh
batterygraph status
```

## アンインストール(手動でインストールしたとき)

終了しておく
``` sh
batterygraph unload
```

実行ファイルのリンクを削除
``` sh
unlink ~/.local/bin/batterygraph
```

補完ファイルのリンクを削除
``` sh
unlink /usr/local/share/zsh-completions/_batterygraph
```

clone してきたディレクトリの削除
``` sh
cd <cloneしてきたディレクトリ>
rm -rf batterygraph
```

