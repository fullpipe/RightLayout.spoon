# RightLayout.spoon

It is good when you switch to specific app always with right layout.

## Intallation

You need [Hammerspoon](http://www.hammerspoon.org/) installed.

```bash
brew install hammerspoon
```

Clone spoon

```bash
mkdir -p ~/.hammerspoon
git clone --depth 1 git@github.com:fullpipe/RightLayout.spoon.git ~/.hammerspoon/Spoons/RightLayout.spoon
echo "hs.loadSpoon('RightLayout'):add("Alacritty", "ABC"):add("Slack", "Russian"):start()" >> ~/.hammerspoon/init.lua
```

Reload hammerspoon config. Now when you switch to Alacritty keyboard layout will be changed to `ABC`.
