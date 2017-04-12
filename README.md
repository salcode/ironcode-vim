Iron Code Vim Configuration
===========================

A Vim Configuration focused on WordPress development and predominantly used on a Mac with [Neovim](https://neovim.io/)

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

xdebug
------

Notes from https://github.com/joonty/vdebug

Start Vdebug with `<F5>`, which will make it wait for an incoming connection. Run the script you want to debug, with the debugging engine enabled. A new tab will open with the debugging interface.

Once in debugging mode, the following default mappings are available:

 * `<F5>`: start/run (to next breakpoint/end of script)
 * `<F2>`: step over
 * `<F3>`: step into
 * `<F4>`: step out
 * `<F6>`: stop debugging (kills script)
 * `<F7>`: detach script from debugger
 * `<F9>`: run to cursor
 * `<F10>`: toggle line breakpoint
 * `<F11>`: show context variables (e.g. after "eval")
 * `<F12>`: evaluate variable under cursor
 * `:Breakpoint <type> <args>`: set a breakpoint of any type (see :help
    VdebugBreakpoints)
 * `:VdebugEval <code>`: evaluate some code and display the result
 * `<Leader>e`: evaluate the expression under visual highlight and display the result

To stop debugging, press `<F6>`. Press it again to close the debugger interface.

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

PHP Docblock Generation
-----------------------

Place the cursor on the beginning of one of the following definition lines:

- class
- constant
- attribute
- function (method)
- interface
- trait

Then in normal mode type `<leader>db`, this will generate a template for the php docblock.

Credits
-------
[@salcode](https://github.com/salcode), [@curtismchale](https://github.com/curtismchale/), [@mkoppmann](https://github.com/mkoppmann), [@andrey-starodubtsev](https://github.com/andrey-starodubtsev)
