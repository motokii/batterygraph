# Battery Graph
[日本語ページ](README.ja.md)

Record the battery log, and display the battery capacity on the graph.

<img src=https://raw.githubusercontent.com/motokii/batterygraph/images/images/screenshot.png width=500px>

## Install

### Install from Homebrew

``` sh
brew tap motokii/batterygraph
brew install batterygraph
```

### Install manually
Clone the repository
``` sh
git clone https://github.com/motokii/batterygraph.git
```
Make symbolic link to batterygraph in $path
``` sh
ln -s $(pwd)/batterygraph/src/batterygraph ~/.local/bin/batterygraph
```

Make symbolic link to complation file in $fpath
``` sh
ln -s $(pwd)/batterygraph/completion/_batterygraph /usr/local/share/zsh-completions/_batterygraph
```

## Usage

Load to launchd (logged every ten minutes)
``` sh
batterygraph load
```

Log the current battery status
``` sh
batterygraph write
```

View battery graph
``` sh
batterygraph show
```

Unload from launchd (Stop logging)
``` sh
batterygraph unload
```

View the status at launchd
``` sh
batterygraph status
```

## Uninstall

To be terminated beforehand
``` sh
batterygraph unload
```

Delete symbolic link to batterygraph
``` sh
unlink ~/.local/bin/batterygraph
```

Delete symbolic link to completion file
``` sh
unlink /usr/local/share/zsh-completions/_batterygraph
```

Delete the repository
``` sh
cd <the directory when clone>
rm -rf batterygraph
```

