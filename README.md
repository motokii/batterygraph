# Battery Graph
バッテリのログを記録し、バッテリ容量の変化をグラフに表示

## インストール

好きな場所でgit clone する
``` sh
git clone https://github.com/motokii/batterygraph.git
```

実行ファイルをパスの通った場所にリンクを貼る
``` sh
ln -s $(pwd)/batterygraph/batterygraph.sh ~/.local/bin/batterygraph
```

補完ファイルをパスの取った場所にリンクを貼る
``` sh
ln -s $(pwd)/batterygraph/completion/_batterygraph /usr/local/share/zsh-completions/_batterygraph
```

## 使い方

launchctl にロードする(ロギングを開始する)
``` sh
batterygraph load
```

バッテリのグラフを見る
``` sh
batterygraph show
```

## アンインストール

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

