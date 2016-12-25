Iron Code Vim Configuration
===========================

A Vim Configuration focused on WordPress development and predominantly used on a Mac with [MacVim](https://code.google.com/p/macvim/)

This project is a fork of [Curtis McHale](https://github.com/curtismchale)'s excellent [WPTT Vim Config](https://github.com/curtismchale/WPTT-Vim-Config)

Lazy Installation
-----------------
From the command line run
```
bash <(curl "https://raw.githubusercontent.com/salcode/ironcode-vim/master/install-ironcode-vim.sh")
```

Updating Plugins
----------------
From within Vim type `:BundleInstall!`

Plugins and Detailed Settings
-----------------------------
Plugins and detailed settings are listed as comments within __init.vim__

Detailed Installation
---------------------
Run the following steps
```
git clone https://github.com/salcode/ironcode-vim.git
~/ironcode-vim/install.sh
```
This will
- copy your current Vim configuration to `.gvimrc.bkup`, `.vimrc.bkup`, and `.vim.bkup/`
- create symbolic links to the `/ironcode-vim` configuration files
- run vim and trigger an install of all plugins defined for [Vim Plug](https://github.com/junegunn/vim-plug)

Recommended Utilities
---------------------
There are a few recommended utilities that don't come with this
repository.  This configuration works fine without these but they are nice.
I recommend both of them and my preferred installation method is
[homebrew](http://brew.sh/).

#### Once homebrew is installed
1. [Exuberant CTags](http://ctags.sourceforge.net/): `brew install ctags`
2. [Ag](http://geoff.greer.fm/ag/): `brew install the_silver_searcher`

### Problems with Git Commit Messages
On a Mac, if you're getting the message
```
error: There was a problem with the editor 'vi'.
Please supply the message using either -m or -F option.
```
when you try to create a Git commit message with Vim, the issue is an [incorrect error code being returned](http://tooky.co.uk/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x/).

You can fix this problem by running
`git config --global core.editor /usr/bin/vim`

Ctags
-----
Ctags are an index of your project.

### Generating Ctags
- From the command line navigate to root of your project/git repo
- Run `ctags --tag-relative -Rf.git/tags --exclude=node_modules --exclude=.git --languages=-javascript,sql` this will create a file called __tags__ in your `/.git/` directory
- You can re-run this command to generate new Ctags at any time (see below for details on automating this)

### Using Ctags
- In Vim, when your cursor is over a function or method hit `Ctrl+]` to jump to where it is defined.
- `Ctrl+t` will jump back to where you started your tag lookup

### Automate Ctag Generation
You can automate the generation of Ctags. Tim Pope discusses generating Ctags based on Git hooks in his post [Effortless Ctags with Git](http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html).  This behavior is integrated in another project of mine, [Iron Code Studio Git Enhancements](https://github.com/ironcodestudio/ironcode-git-enhancements).

Credits
-------
[@salcode](https://github.com/salcode), [@curtismchale](https://github.com/curtismchale/), [@mkoppmann](https://github.com/mkoppmann), [@andrey-starodubtsev](https://github.com/andrey-starodubtsev)
