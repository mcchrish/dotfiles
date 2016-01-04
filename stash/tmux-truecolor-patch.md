Run `brew edit tmux` and paste it before the line `def intall`.

```
option "with-truecolor", "Build with truecolor patch enabled"
patch do
  url "https://gist.githubusercontent.com/zchee/9f6f2ca17acf49e04088/raw/0c9bf0d84e69cb49b5e59950dd6dde6ca265f9a1/tmux-truecolor.diff"
  sha1 "8e91ab1c076899feba1340854e96594aafee55de"
end if build.with? "truecolor"
```

And install `brew install --HEAD --with-truecolor tmux`.
