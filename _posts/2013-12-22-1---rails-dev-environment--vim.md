---
layout: cast
title: "#1 - Rails Dev Environment & Vim"
subtitle: 
cover_image: 
excerpt: "Introduction to setting up Rails development environment, and a demo to my Vim plugins"
category: ""
youtube: "EOU4VGs4j2Y"
video: 
tags: [rails, ruby, vim]
thumbnail: "001-thumb.jpg"
---

## Installing Ruby on Rails

Alternative to `rvm` is `rbenv`. I prefer using `rvm`

	\curl -sSL https://get.rvm.io | bash -s stable
	
## Configure development environment using my dotfiles

[Here is my dotfiles repository on Github.](https://github.com/allenlsy/dotfiles/)

__Please ensure you understand what I'm doing in the `bootstrap.sh` before running it.__ It will replace your own `.zshrc` and some other important files.

## Vim plugins

I list my usage of these plugins in the viode. You can searhc in Google about these plugins for more information.

#### ctrlp.vim

`Ctrl+p` to fuzzy search any file in the project.

#### tabular

This is a [screencast](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/) on Tabular. For more information please refer to it.

In my video, I used `:Tab/:` to format the text.

#### vim-colorscheme-switcher

Press `F8` to use next colorscheme, `Shift+F8` to use previous one.

#### vim-easymotion

A good [youtube video here](http://www.youtube.com/watch?v=Dmv6-dguS3g‎) demonstrates vim-easymotion.

#### vim-indent-guides

`\ig` to goggle the indentation guidelines.

#### vim-surround

Another video from [Jeffery Way](http://www.youtube.com/watch?v=5HF4jSyPpvs‎). (Yes, Tutsplus makes better video than I do)

Select the text in visual mode first, then press `Shift+S` followed by `<div class="container">` (I made a typo in the video).

#### vim-sparkup

I forgot to mention it in the video. It is a better implementation of Zen-coding in Vim.

[Click to watch the video](http://www.youtube.com/watch?v=dB2Q9EN37eY)
