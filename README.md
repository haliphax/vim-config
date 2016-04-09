# haliphax's vim configuration

This is my (g)vim configuration. There are many like it, but this one is mine.

## Setup

All plugins are implemented as git submodules in the `bundle` directory.
In order to get everything setup in one fell swoop, use the `--recursive`
command line flag when you clone this repository. Since this isn't exactly
a software project, I would also recommend using the `--single-branch` and
`--depth 1` options to conserve space:

````
$ git clone --recursive --single-branch --depth 1 <repo URL> ~/.vim
````

The configuration files for vim and gvim are now in the `.vim` subdirectory
of your `$HOME`, but for them to take effect, they need to be one level higher.
We can resolve this with symlinks:

````
$ ln -s ~/.vim/vimrc ~/.vimrc
$ ln -s ~/.vim/gvimrc ~/.gvimrc
````

Have fun, you crazy kids. Don't stay out too late.
