# gyatt

## introduction

Gyatt is my suite of git aliases and configurations. I have quite a few.

## etymology

Git + Wyatt (my name)

## installation

Get gyatt by either doing a git clone of it or downloading it from https://github.com/wyattscarpenter/gyatt/archive/refs/heads/master.zip

Once you have gyatt on your system, in whatever location you want it to live, you can run `git config --global include.path /path/to/folder/gyatt.gitconfig` to enable it globally, where /path/to/folder/gyatt.gitconfig should probably be the absolute, fully-qualified path of the gyatt.gitconfig (because otherwise it will be considered as a relative path relative to the global .gitconfig file that includes the line, which is probably wrong). You should also add the gyatt folder to PATH.

For example, my commands were `git config --global include.path C:\Users\wyatt\files\gits\wyattscarpenter\gyatt\gyatt.gitconfig` and (on WSL) `git config --global include.path /mnt/c/Users/wyatt/files/gits/wyattscarpenter/gyatt/gyatt.gitconfig`. On regular linux it's probably something like `git config --global include.path /home/you/bin/gyatt` or something. (I also don't remember if git config does tilde-expansion.)

You can then test if gyatt is successfully included by running `git s`, which will then print out the message of git status.

If gyatt is successfully included, the message will begin:

- `On branch` if you're in a git repo
- `fatal: not a git repository` if you're not in a git repo

If gyatt is NOT successfully included, the message will begin:

`git: 's' is not a git command. See 'git --help'.`

Or perhaps something like
```
warning: unable to access '/mnt/c/Users/wyatt/files/gits/wyattscarpenter/gyatt': Is a directory
fatal: bad config line 18 in file /home/user/.gitconfig
```
if you made the same bone-headed mistake I did and tried to make the git include.path the directory of gyatt instead of the file itself.

You should also add the gyatt folder to your PATH on your operating system, so that various scripts that are too big to fit in the config are runnable.

Git depends on sh/bash for a lot of things. This is bad. However, parts of gyatt also depend on sh/bash. They could pretty easily be rewritten to not so depend — I mean this in merely the cosmic sense. They're just little programs so it would be easy to rewrite them; however it would be a chunk of effort perhaps best spent elsewhere. If git the project is going to keep relying on sh/bash (not to mention perl!) for so many things, thus necessitating any git installation (like git-for-windows, for example)also lugs those around with it, then there's no point in rewriting gyatt to not need them. In some halcyon future where git is freed of that dependency— which, to be clear, they aren't even working towards, as far as I can tell (which, in the cosmic sense, is fine)— maybe I'd rewrite the components of gyatt that also so depend.

## warnings

Gyatt enables rerere, which is turned off by default. If this ever causes you a problem, please explain it to me—to me, currently, it seems like a crucial git feature that is erroneously turned off for no reason.

Gyatt sets init.defaultBranch to "master", for compatibility with the majority of the git ecosystem. However, in certain obscure cases this may cause incompatibility with GitHub repos. This is very easy to fix, but even easier if I've told you about it in advance, like I'm doing now. For what it's worth, you can also set the default branch name to "master" in GitHub, and you probably should, for greatest compatibility with the git ecosystem.

Gyatt sets credential.useHttpPath to true. This is mainly because I have a work and a personal github account, so it's aggravating when git fails to differentiate per-repo on github, and simply comes back to me with a "your login failed :/" message. On the other hand, this means you will have to sign in to your repos once per repo, instead of once per website, which is also a bit aggravating, sorry.

## things I didn't do, because they are unsafe I guess

Gyatt *doesn't* do several things that would be useful to me, but probably hostile to other users (or me in the future when I inevitably work on a different machine with different constraints). For example:

- on my own machine I run `git config --global --add safe.directory '*'` (`git config --global --add safe.directory *` on Windows).

- I probably would have run `core.protectNTFS = false`, except it never comes up for me, so probably keeping it true on Windows for the security benefit is wise.

- I did not set core.fileMode, because the default of true (or, on git for windows: false) works well for me (although arguably you should just ignore file modes altogether, anyway).

- I did not set credential.helper to what I use, because maybe you use something different.

  - Same for core.autocrlf=false and core.symlink=true .

- I did not include the options that set up git-lfs, simply because I don't understand it.

## brief and irrelevant history

Gyatt used to be a number of scripts in my util repo, until I realized that I needed to use both git for linux and git for windows, so I had better figure out the git-native solutions for aliasing, etc.

## mutterings about future projects

A git ui that isn't bad if I ever make one of those. Oh My Git, while a game, is actually pretty good as a git ui. Limited in some ways, of course. Also, it's a fairly good way to learn git concepts, I expect! (I played it after I had mastered git so I can't attest firsthand.)

One of the weird things about github is that most of their value-adds are things you could technically do in git repos already, like wikis and issue tracking. So, anyway, I'm thinking I could create a git tool that just does that stuff in git, maybe it could be in here as well (you could gyatt open an issue from the command line, etc). I guess there are already a lot of projects that do those things, though.

This might finally implement something I've been thinking about which is the ability to mark git repos as COMPLETE within the software itself (this would show up in the status, and possibly also as a COMPLETE file). And maybe other statuses a project can have. A STATUS file?

My readme about this project should complain about git, its usability, its inability to handle large files, link to the handmade hero parody of git ( https://www.youtube.com/watch?v=3a37D4NWRbg ) which suggests I guess maybe using svn, caution against using git, say that I have mastered git but maybe you shouldn't, maybe link to other things written about git, etc.

## coda

And remember the ancient wisdom: “a voluptuous charmer takes food; a scoundrel is cursed to dwell restlessly in strange places”.
