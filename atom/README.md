# Config files for atom IDE

keymap.cson should be placed into atom config directory
$ ln -s keymap.cson ~/.atom/ 
$ ln -s config.cson ~/.atom


In `config.cson` change python path to the correct local interpreter



## Packages
* atom-ide-ui
* atom-unsaved-changes
* color-indent
* git-diff-plus
* ide-python
* jekyll-syntax-highlighting
* language-gitignore
* todo
=======
# Atom

To restore packages from package.list, run:
    
    apm install --packages-file ~/.atom/package.list

To update package.list from installed packages, run:

    apm list --installed --bare > ~/.atom/package.list

