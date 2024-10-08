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

It seems to me like an ideal state of affairs would be for git to take the good parts of gyatt (and I think they're all good, to be clear, but de gustibus et coloribus non est disputandum) and incorporate them as official parts of git, possibly entirely obsoleting gyatt in the process. But I'm not holding my breath about this, especially because I've expended literally no effort towards making it happen, myself.

## other software somewhat like gyatt

I've recently discovered Git Extras ( (dis)claimer: and contributed a couple improvements to it ), which is a similar project to gyatt. For example, both gyatt and Git Extras have a `git touch` command, because great minds think alike https://github.com/tj/git-extras/blob/main/Commands.md . However, there are differences: for example, gyatt has `git chmod` and `git whoami`; Git Extras has `git repl` and `git abort`. (But not `git continue`? Odd. I would love to have a `git continue`, that continues the current revert, rebase, merge or cherry-pick, without the need to find exact command in history.) So, they both have independently-useful features. If I were more ambitious I would maybe try to contribute all of Gyatt to Git Extras, thus making it Not My Problem (although, simultaneously acquiring an interest in Git Extras (using it every day) that would make Git Extras a little bit more of My Problem). As it stands, I think they're both pretty good projects (or at least seem to me to be — caveat emptor and all that) and you should install both.

There are probably other projects like that out there as well. The only one that springs to mind is https://en.wikipedia.org/wiki/Cogito_(software), which is obsolete but I know about it because it's named "Cogito" and I have a philsophy degree so that amuses me. That wiki page mentions EasyGit (the git wrapper, https://github.com/smarr/eg ; not the git server for iCloud https://easygit.app/), which I've looked at briefly and also looks kind of good. I'm a fan, in principle, of these git "total conversion mods" (if you will) because I think the default git UX is pretty bad. I've mastered git but, having mastered it, can't necessarily wish anyone else have to master it. However, I've never used any of these total conversion mods so they could be good or bad — who knows.

Ah... while investigating [another crippling insufficiency of git](https://stackoverflow.com/questions/1964470/whats-the-equivalent-of-subversions-use-commit-times-for-git/13284229#13284229), I've come across [git-tools](https://github.com/MestreLion/git-tools), a similar (but small) suite of git addtions, which also has some great goodies in it, including the semi-famous git-restore-mtime (at least, famous in the sense that that's the name by which I'm installing it in the apt package manager... which is famous to me! It's also known as git-mestrelion-tools on debian, apparently). Note that git-restore-mtime is more-or-less equivalent to git-extra's git-utimes (which is presumably named after utimes, a system call which can change file modification times — why exactly it has a u in it is not exactly clear to me. The u doesn't seem to indicate microseconds given that sister system call `utime` only has a resolution of one second; it may indicate "unsigned" or "unix", although neither of these are mandated by the specification...).

## installation

Get gyatt by either doing a git clone of it or downloading it from https://github.com/wyattscarpenter/gyatt/archive/refs/heads/master.zip

You will probably want to keep the entire gyatt folder together in one place, instead of taking the gyatt.gitconfig file away from the other files and putting it somewhere else, but on the other hand you might have some highly sophisticated thing you'd like to do with it, in which case go ahead.

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

Gyatt sets gc.auto to 0, completely disabling automatic garbage collection in Git. Why do this? Well a couple reasons. The first is that once upon a time I watched a YouTube video, or part of a YouTube video, with advanced git user tips, and it recommended setting this setting to zero to disable automatic garbage collection so that all of your git commands would run faster. I like it when software runs faster. His solution to gc was, if I remember correctly, that you set a cron job that runs git gc --aggressive for you. That seems like a huge hassle to me so instead of that my recommended solution is that you occasionally run git dugc in the repo, like whenever you feel like you're done working on the project for a while or you feel like you would like a little more disk space. The second reason, which was brought to my mind recently when I read https://donatstudios.com/yagni-git-gc, is that once you turn off auto gc there is never any risk of losing orphaned history, which is a great boon. Jesse Donat's solution was to simply never run gc afterwards, so you never ever risk losing old orphaned history, but I am bolder than him, and more regularly commit larger files, and value disk space a little bit more than him, so my preferred solution is to run git dugc once I'm certain I won't need any of that history. (A secret truth of Git that most people don't learn for a while is that most history is bad and you don't need it.) It was actually a comment on this blog post that tipped me over the edge; previously I was thinking I would put auto.gc = 0 in the "things I didn't do" category, thinking that turning auto gc off was a power-user move that would subtly harm regular users. But LurkerBoi, on Nov. 15, 2021, commented "This is the one thing I never did until it was too late". This caused me to realize that, actually, having auto gc *on* is the power-user move that subtly harms regular users *even worse*. (Although, also, once you become an even more powerful power user you turn auto GC off again because you feel (possibly out of delusion) like you want more control over when it GCs.) Like all settings, you can return this setting to default (whatever it would have been on your system) by deleting this line in gyatt.gitconfig.

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

## contributing

If you want to contribute to this project, first of all: thanks! Second of all, please note that your contributions will be released into the public domain under the license of this project. Third of all, note that you should probably use the full names of flags for commands, as this will save everyone a lot of time when trying to figure out what the command does. and, fourthly, note that I reserve the right to be a terrible maintainer, take a long time to review everything, and reject your very sensible changes because they aren't exactly precisely what I want for this project — or even just out of mere caprice!

## coda

And remember the ancient wisdom: “a voluptuous charmer takes food; a scoundrel is cursed to dwell restlessly in strange places”.
