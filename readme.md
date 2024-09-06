# gyatt

## introduction

Gyatt is my suite of git aliases and configurations. I have quite a few.

## etymology

Git + Wyatt (my name)

## other linguistic properties

The terms "git" and "gyatt" may be written either with an initial capitalized letter or with an initial lowercase letter, at the discretion of the writer in every instance. Both are correct. As far as this project is concerned. You may also completely capitalize both terms (or either), but this would be something of a fanciful affectation.

## status of project

In my personal opinion, Gyatt is production-ready and everyone who uses git should use it.

I have never lost data due to a bug in gyatt. (This should not be taken to be an implied warranty, as gyatt is supplied with absolutely no warranty etc etc and so forth.) Of course, this does not preclude the possibility of losing data by using gyatt commands wrong, as some of them are inherently "dangerous"...

There are some features that don't work in Gyatt, and some features that I still hope to implement, but what software project doesn't have some of those?

I will continue to make fearless, backwards-incompatible changes to Gyatt during its development and maintenance. If this actually creates a problem for someone, let me know; I'll usually be happy to keep a depricated alias in indefinitely unless it ruins something else. Gyatt is currently versioned only implicitly, by git commit hash of the Gyatt repo. If you're interested in adopting Gyatt, and it would help you if I adopted a semver system, or more of a formal changelog, let me know, and we can work something out. These are things that I can do, and theoretically could be valuable to someone, but I'm not going to preemptively do so long as I have zero external users.

By the way, Gyatt has no tests. It's been working out pretty well so far. Especially because Gyatt is so simple, for a software project. A wise man, or possibly an idiot, once said to me that all software projects are tested; it's just that sometimes the software is tested by the end users. Currently, I am the end user, and I have a pretty good idea of what in Gyatt works, based on my normal git working habits.

It seems to me like it would be highly inadvisable to use gyatt commands in a shell script. Due to the additional complications of installing gyatt on top of git as a prerequisite. If you like some Gyatt command, you can just include the right-hand side of the alias in your script. Include a comment by it saying that it's from here and whether or not you've modified it; this is not a legal requirement I'm foisting on you (gyatt is public domain), but rather something where if you do it, whoever edits the script later when it's mysteriously failing and who is cursing your name wondering what the heck that line does, will then thank you.

It seems to me like an ideal state of affairs would be for git to take the good parts of gyatt (and I think they're all good, to be clear, but de gustibus et coloribus non est disputandum) and incorporate them as official parts of git, possibly entirely obsoleting gyatt in the process. But I'm not holding my breath about this, especially because I've expanded literally no effort towards making it happen, myself.

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

### software you must have installed in order to use gyatt

Gyatt depends on git, of course. Git, in turn, seems to depend on having a roughly Unix-like operating system.

Git depends on sh/bash for a lot of things. This is bad. However, parts of gyatt also depend on sh/bash. They could pretty easily be rewritten to not so depend — I mean this in merely the cosmic sense. They're just little programs so it would be easy to rewrite them; however it would be a chunk of effort perhaps best spent elsewhere. If git the project is going to keep relying on sh/bash (not to mention perl!) for so many things, thus necessitating any git installation (like git-for-windows, for example) also lugs those around with it, then there's no point in rewriting gyatt to not need them. In some halcyon future where git is freed of that dependency— which, to be clear, they aren't even working towards, as far as I can tell (which, in the cosmic sense, is fine)— maybe I'd rewrite the components of gyatt that also so depend.

Sometimes I've gone to the trouble of figuring out whether a given script will run in sh or if it needs bash, but sometimes I haven't.

Gyatt's du uses a feature that is a GNU extension of du, as far as I can tell (comma-delimitation based on locale). So far, this has never been a problem.

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

My readme about this project should complain about git, its usability, its inability to handle large files, link to the handmade hero parody of git ( https://www.youtube.com/watch?v=3a37D4NWRbg ) which suggests I guess maybe using svn, caution against using git, say that I have mastered git but maybe you shouldn't, maybe link to other things written about git, etc. 'Wait, what's a "ref"? What's a "tree-ish"? What, pray tell, is a "working tree", and how is that different from an "index"...?'

(spoiler: "tree" is git for directory (despite the fact that git history is... also a tree (technically, a DAG). After you know this, a lot of git things make a lot more sense. git subtree, for example. (Not that I've ever used git subtree. But at least I understand its man page now.))

## coda

And remember the ancient wisdom: “a voluptuous charmer takes food; a scoundrel is cursed to dwell restlessly in strange places”.
