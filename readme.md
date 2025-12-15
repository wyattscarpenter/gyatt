# gyatt

## introduction

Gyatt is my suite of git aliases and configurations. I have quite a few.

## etymology

Git + Wyatt (my name)

## other linguistic properties

The terms "git" and "gyatt" may be written either with an initial capitalized letter or with an initial lowercase letter, at the discretion of the writer in every instance. Both are correct. As far as this project is concerned. You may also completely capitalize both terms (or either), but this would be something of a fanciful affectation.

## status of project

In my personal opinion, Gyatt is production-ready and everyone who uses git should use it.

I have never lost data due to a bug in gyatt. (This should not be taken to be an implied warranty, as gyatt is supplied with absolutely no warranty etc etc and so forth.) Of course, this does not preclude the possibility of losing data by using gyatt commands wrong, as some of them are inherently "dangerous" due to the underlying git commands introducing the ability to lose work...

There are some features that don't work in Gyatt, and some features that I still hope to implement, but what software project doesn't have some of those?

I will continue to make fearless, backwards-incompatible changes to Gyatt during its development and maintenance. If this actually creates a problem for someone, let me know; I'll usually be happy to keep a depricated alias in indefinitely unless it ruins something else. Gyatt is currently versioned only implicitly, by git commit hash of the Gyatt repo. If you're interested in adopting Gyatt, and it would help you if I adopted a semver system, or more of a formal changelog, let me know, and we can work something out. These are things that I can do, and theoretically could be valuable to someone, but I'm not going to preemptively do so long as I have zero external users.

By the way, Gyatt has no tests. It's been working out pretty well so far. Especially because Gyatt is so simple, for a software project. A wise man, or possibly an idiot, once said to me that all software projects are tested; it's just that sometimes the software is tested by the end users. Currently, I am the end user, and I have a pretty good idea of what in Gyatt works, based on my normal git working habits.

It seems to me like it would be highly inadvisable to use gyatt commands in a shell script. Due to the additional complications of installing gyatt on top of git as a prerequisite. If you like some Gyatt command, you can just include the right-hand side of the alias in your script. Include a comment by it saying that it's from here and whether or not you've modified it; this is not a legal requirement I'm foisting on you (gyatt is public domain), but rather something where if you do it, whoever edits the script later when it's mysteriously failing and who is cursing your name wondering what the heck that line does, will then thank you.

(I have often considered making `gyatt` an alias for `git` so that you could explicitly mark gyatt commands differently in scripts. However, since there would be no way (in the current scheme) (as far as I can see) to enforce that gyatt is used with gyatt and git with git, this didn't seem worth it to me.

Another good idea, along the same lines but in reverse, would be to make all gyatt commands *only* usable with the gyatt prefix word (and not the git prefix word as normal), presumably by taking them out of the git alias system completely and making them standalone subcommands of a hypothetical central gyatt program. This would probably be a great and well-architected idea, and the only reason I don't do it is the labor/opportunity cost of doing so at this point (and also because it would be kind of cool for git to take most of these ideas for itself instead).)

It seems to me like an ideal state of affairs would be for git to take the good parts of gyatt (and I think they're all good, to be clear, but de gustibus et coloribus non est disputandum) and incorporate them as official parts of git, possibly entirely obsoleting gyatt in the process. But I'm not holding my breath about this, especially because I've expended literally no effort towards making it happen, myself.

## installation

Get gyatt by either doing a git clone of it or downloading (and then extracting) it from https://github.com/wyattscarpenter/gyatt/archive/refs/heads/master.zip

You will probably want to keep the entire gyatt folder together in one place, instead of taking the gyatt.gitconfig file away from the other files and putting it somewhere else, but on the other hand you might have some highly sophisticated thing you'd like to do with it, in which case go ahead.

Once you have gyatt on your system, in whatever location you want it to live, you can run `. ./install_pwd_to_git.sh` in this folder, which basically does the following with the current working directory (the value of `$PWD`):

* `git config --global include.path /path/to/folder/gyatt.gitconfig` to enable it globally, where /path/to/folder/gyatt.gitconfig should probably be the absolute, fully-qualified path of the gyatt.gitconfig (because otherwise it will be considered as a relative path relative to the global .gitconfig file that includes the line, which is probably wrong). You should also add the gyatt folder to PATH.
  * This is also what gyatt-bless does. If the relevant folder is already in your PATH, you can just run the gyatt-bless command.

  * For example, my commands were `git config --global include.path C:\Users\wyatt\files\gits\wyattscarpenter\gyatt\gyatt.gitconfig` and (on WSL) `git config --global include.path /mnt/c/Users/wyatt/files/gits/wyattscarpenter/gyatt/gyatt.gitconfig`. On regular linux it's probably something like `git config --global include.path /home/you/bin/gyatt` or something. (I also don't remember if git config does tilde-expansion.)

* Adds the working directory to your path, probably.

If you **run** the `install_pwd_to_git.sh` script like `./install_pwd_to_git.sh` instead of **source**ing it like `. ./install_pwd_to_git.sh`, then you may have to start a new session for this to take effect.

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

Gyatt enables core.longpaths so that long paths actually work. But don't worry: this configuration option is completely undocumented in git. Here are some third-party rumors about what it does and what you need to do on Windows to get it to work: https://gist.github.com/leodutra/a25bc1f51e8779943df0a95d5a4839d1

Gyatt enables rerere, which is usually turned off by default in git~~. If this ever causes you a problem, please explain it to me~~ — to me, currently, rerere seems like a crucial git feature that is erroneously turned off for no reason. Yes, I have read the blog post about its strange behavior that might justify keeping it turned off by default. No, I didn't find it convincing (it doesn't elaborate on its consequences). For more information, you — like me — can see https://gitster.livejournal.com/41795.html and https://stackoverflow.com/questions/5519244/are-there-any-downsides-to-enabling-git-rerere . If anything, it seems like the problem of rerere is that it doesn't rerere *enough*. Another problem is that maybe it rereres *too much*, but I haven't encountered a case like this. Update: I've now encountered a situation in which rerere was too eager. So, I guess there's just nothing good in this world. For details on exactly what it gets wrong, see: https://stackoverflow.com/questions/5519244/are-there-any-downsides-to-enabling-git-rerere/77453543#77453543 & https://github.com/wyattscarpenter/funny-little-rerere-example-repo/

Gyatt sets rebase.rebaseMerges to true, because I always want to "rebase merges" (preserve branch structure in a rebase, by creating merge commits by replaying the appropriate merges) when I rebase. It isn't set to rebase-cousins because I don't really understand what that would do or why I would want it and I've never been dissatisfied with how rebase --rebase-merges seems to treat "cousins", despite being a user of many very wacky branch structures myself. Anyway, you can easily countermand this by passing --no-rebase-merges (or --rebase-merges=rebase-cousins) to rebase. You can also unset this setting for yourself if you do so much merge-crushing on purpose that you find this whole needing-a-flag business inconvenient. Certain gyatt aliases may also use --rebase-merges internally. You may also countermand those if you wish.

Please keep in mind that even with rebase-merges true, and rerere on git is actually still occasionally garbage at replaying merges and keeping your solutions and history correct. I might suggest you avoid rebasing merges when possible, or even use the tool [jj](https://github.com/jj-vcs/jj) instead. You can also see my guide on rebasing and merges (https://wyattscarpenter.github.io/blog/almost_always_rebase.txt , forthcoming) for several hot tips about git history management, although the best one is that if you just want to replay merges exactly you should deal with the merge conflict by checking out the version of the files (possibly: (almost) all files, in which case you can use use eg git checkout 1293809 -- .) from the merge commit you're trying to apply, as that will have the same version of the files from last time. (Of course, usually the point of a rebase is to modify something, so make sure you don't unmodify that by checking out too aggressively — if you do, then, uh, simply check it out again from the previously-applied commit in the rebase!)

Gyatt sets init.defaultBranch to "master", for compatibility with the majority of the git ecosystem. (I don't remember why I did this, given that it defaults to "master" anyway, but I do remember needing to do this. Perhaps to override a poorly configured gitconfig on a host machine.) However, in certain obscure cases this may cause incompatibility with GitHub repos. This is very easy to fix, but even easier if I've told you about it in advance, like I'm doing now. For what it's worth, you can also set the default branch name to "master" in GitHub, and you probably should, for greatest compatibility with the git ecosystem. In fact, GitHub itself should also make that change.

Gyatt sets gc.auto to 0, completely disabling automatic garbage collection in Git. Why do this? Well, a couple reasons. The first is that once upon a time I watched a YouTube video, or part of a YouTube video, with advanced git user tips, and it recommended setting this setting to zero to disable automatic garbage collection so that all of your git commands would run faster. I like it when software runs faster. His solution to gc was, if I remember correctly, that you set a cron job that runs git gc --aggressive for you. That seems like a huge hassle to me so instead of that my recommended solution is that you occasionally run git dugc in the repo, like whenever you feel like you're done working on the project for a while or you feel like you would like a little more disk space. The second reason, which was brought to my mind recently when I read https://donatstudios.com/yagni-git-gc, is that once you turn off auto gc there is never any risk of losing orphaned history, which is a great boon. Jesse Donat's solution was to simply never run gc afterwards, so you never ever risk losing old orphaned history, but I am bolder than him, and more regularly commit larger files, and value disk space a little bit more than him, so my preferred solution is to run git dugc once I'm certain I won't need any of that history. (A secret truth of Git that most people don't learn for a while is that most history is bad and you don't need it.) It was actually a comment on this blog post that tipped me over the edge; previously I was thinking I would put auto.gc = 0 in the "things I didn't do" category, thinking that turning auto gc off was a power-user move that would subtly harm regular users. But LurkerBoi, on Nov. 15, 2021, commented "This is the one thing I never did until it was too late". This caused me to realize that, actually, having auto gc *on* is the power-user move that subtly harms regular users *even worse*. (Although, also, once you become an even more powerful power user you turn auto GC off again because you feel (possibly out of delusion) like you want more control over when it GCs.) Like all settings, you can return this setting to default (whatever it would have been on your system) by deleting this line in gyatt.gitconfig. You can also overwrite it in another config.

Gyatt sets credential.useHttpPath to true. (Note: this says http but it's not about http vs https, don't worry.) This is mainly because I have a work and a personal github account, so it's aggravating when git fails to differentiate per-repo on github, and simply comes back to me with a "your login failed :/" message. On the other hand, this means you will have to sign in to your repos once per repo, instead of once per website, which is also a bit aggravating, sorry.

Gyatt sets diff.algorithm to histogram, the latest and greatest diffing algorithm in git, because I was pretty unhappy with the default one. I'm not sure this makes any difference at all 🤔.

Gyatt sets `notes.rewriteRef = refs/notes/*`, in order to make commit rewriting (rebasing and amending) bring all notes along with it. Do you use git notes? Are you one of the rare people who not only uses git notes but also stores them in some other folder, such as refs/notes/whatever? Please tell me if you would prefer this default to be `refs/notes/commits`, `refs/notes/*`, or what. (I.E.: do you want your other notes to also follow commits, or only the ones in the default folder?) Also, while we're at it, you should tell the git maintainers that, so they can actually get a default, instead of just letting all git notes fall into the sea after rebases by default.

## things I didn't do, because they are unsafe or whatever

Gyatt *doesn't* do several things that might be useful to me, but possibly hostile to other users (or me in the future when I inevitably work on a different machine with different constraints). For example:

- on my own machine I run `git config --global --add safe.directory '*'` (`git config --global --add safe.directory *` on Windows).

- I probably would have set `core.protectNTFS = false`, except it never comes up for me, so probably keeping it true on Windows for the security benefit is wise.

- I did not set core.fileMode, because the default of true (or, on git for windows: false) works well for me (although arguably you should just ignore file modes altogether, anyway).

- I did not set credential.helper to what I use, because maybe you use something different.

  - Same for core.autocrlf=false and core.symlink=true .

    - It's kind of crazy to me to think that anyone would ever have those two settings set to any other value; that seems like it would cripple your git system for no reason. But the git defaults are sensible, so if you have those explicitly set to some value it's probably for some highly technical reason I shouldn't disturb with gyatt.

- I did not set transfer.fsckObjects to true, even though you probably should. For complicated reasons, this is more secure (in the sense of "more secure" where you want the attacker to be able to touch as few bits on your hard drive as possible, not (as far as I know) "more secure" in the related sense that often occurs where not having some setting allows anyone interested to immediately pwn your machine) than having it off. The tradeoff is that "[d]uring fsck git may find issues with legacy data which wouldn’t be generated by current versions of git". So if there's a machine sending you very old git objects (such as, perhaps, yourself, from the past) you'll immediately get into a situation where you have to personally resolve this difficulty, which is only really ideal if you're already a master of git (and not easily annoyed). I've run `git config --global transfer.fsckObjects true` on my own machine for extra peace of mind. We'll see how it goes.

- I did not set push.useForceIfIncludes to true, because sometimes (often!) pfush doesn't work but pffush does, without having to go to a full push -f. That probably doesn't mean anything to you, because those are words I made up, but the point is that --force-with-lease is still useful to my workflow without --force-if-includes; you might have a different workflow where leaving out --force-if-includes is a footgun. Unfortunately I cannot give you further advice on this arcane matter.

- There is a pretty good argument that you should set [rebase.forkPoint](https://git-scm.com/docs/git-rebase.html#Documentation/git-rebase.txt-rebaseforkPoint) to false, overriding the current complicated and confusingly-named [rebase fork-point](https://git-scm.com/docs/git-rebase.html#Documentation/git-rebase.txt---fork-point) behavior. See https://commaok.xyz/post/fork-point/ for this argument. (I think a branch necessarily has a forkpoint, the most recent commit that is on both the branch and what it splits from, which makes this name for this feature weirdly underspecific.) However, I did not set rebase.forkpoint to anything in gyatt, because it's never come up for me in practice and/or maybe I do want it and/or maybe I don't know enough about this to evaluate.

- I did not include the options that set up git-lfs, simply because I don't understand it.

## how to examine gyatt commands from the command line

`git help foo` will show you the documentation for foo, including the full text of foo if foo is an alias, which most gyatt commands are. Gyatt also provides `git text`, which is much like `git help`, except it will also show the origin file of the alias (which is useful if you have many gitconfig files active).

If a gyatt command is not an alias, just look in its script I guess.

`git bash echo $SOME_ENV_VAR`, using gyatt's provided `git bash` can also be helpful to investigate the behavior of git (when some git behavior is influenced by environment variables) (if git is, for you, like me, not located in your regular environment).

## features i would like, but which i have not made & other to-dos

* header is still not cross-platform, very confusingly.

* TODO: can you always push all objects? like tags and notes? not just the branch?. I guess push.followTags will make git push tags as well as fetch them. Notes is a half-baked feature so I guess you just have to explicitly push notes, unless maybe this configuration I haven't looked into actually works: https://gist.github.com/topheman/ec8cde7c54e24a785e52

* There are various to-dos inline in the main gyatt file and others.

* I would like a feature that's like git-add-regex or git-add-where, which stages lines if they match a regex or contain a hunk. Something like https://stackoverflow.com/a/63593719 except I can't install diffrep and naively trying to use regular grep instead does not seem to work.

* I would like a feature that gets rid of annoying accidental whitespace changes that don't matter, such as to pretty up PRs. One solution for that would be, say, git-revert-commit-whitespace, which I tried to get chatgpt to write for me one fine sunny morn but do not have a successful version of.

## brief and irrelevant history

Gyatt used to be a number of scripts in my util repo, until I realized that I needed to use both git for linux and git for windows, so I had better figure out the git-native solutions for aliasing, etc.

## other software somewhat like gyatt

I've recently discovered Git Extras ( (dis)claimer: and contributed a couple improvements to it ), which is a similar project to gyatt. For example, both gyatt and Git Extras have a `git touch` command, because great minds think alike https://github.com/tj/git-extras/blob/main/Commands.md . However, there are differences: for example, gyatt has `git chmod` and `git whoami`; Git Extras has `git repl` and `git abort`. (But not `git continue`? Odd. I would love to have a `git continue`, that continues the current revert, rebase, merge or cherry-pick, without the need to find exact command in history.) So, they both have independently-useful features. If I were more ambitious I would maybe try to contribute all of Gyatt to Git Extras, thus making it Not My Problem (although, simultaneously acquiring an interest in Git Extras (using it every day) that would make Git Extras a little bit more of My Problem). As it stands, I think they're both pretty good projects (or at least seem to me to be — caveat emptor and all that) and you should install both.

There are probably other projects like that out there as well. The only one that springs to mind is https://en.wikipedia.org/wiki/Cogito_(software), which is obsolete but I know about it because it's named "Cogito" and I have a philosophy degree so that amuses me. That wiki page mentions EasyGit (the git wrapper, https://github.com/smarr/eg ; not the git server for iCloud https://easygit.app/), which I've looked at briefly and also looks kind of good. I'm a fan, in principle, of these git "total conversion mods" (if you will) because I think the default git UX is pretty bad. I've mastered git but, having mastered it, can't necessarily wish anyone else have to master it. However, I've never used any of these total conversion mods so they could be good or bad — who knows.

Ah... while investigating [another crippling insufficiency of git](https://stackoverflow.com/questions/1964470/whats-the-equivalent-of-subversions-use-commit-times-for-git/13284229#13284229), I've come across [git-tools](https://github.com/MestreLion/git-tools), a similar (but small) suite of git addtions, which also has some great goodies in it, including the semi-famous git-restore-mtime (at least, famous in the sense that that's the name by which I'm installing it in the apt package manager... which is famous to me! It's also known as git-mestrelion-tools on debian, apparently). Note that git-restore-mtime is more-or-less equivalent to git-extra's git-utimes (which is presumably named after utimes, a system call which can change file modification times — why exactly it has a u in it is not exactly clear to me. The u doesn't seem to indicate microseconds given that sister system call `utime` only has a resolution of one second; it may indicate "unsigned" or "unix", although neither of these are mandated by the specification... perhaps it means "update"?).

## mutterings about future projects

gyote would be a good name for a third project in this trilogy (git-gyatt-gyote).

A git ui that isn't bad if I ever make one of those. Oh My Git, while a game, is actually pretty good as a git ui. Limited in some ways, of course. Also, it's a fairly good way to learn git concepts, I expect! (I played it after I had mastered git so I can't attest firsthand.)

One of the weird things about github is that most of their value-adds are things you could technically do in git repos already, like wikis and issue tracking. So, anyway, I'm thinking I could create a git tool that just does that stuff in git, maybe it could be in here as well (you could gyatt open an issue from the command line, etc). I guess there are already a lot of projects that do those things, though.

This might finally implement something I've been thinking about which is the ability to mark git repos as COMPLETE within the software itself (this would show up in the status, and possibly also as a COMPLETE file). And maybe other statuses a project can have. A STATUS file?

My readme about this project should complain about git, its usability, its inability to handle large files, link to the handmade hero parody of git ( https://www.youtube.com/watch?v=3a37D4NWRbg ) which suggests I guess maybe using svn, caution against using git, say that I have mastered git but maybe you shouldn't, maybe link to other things written about git, etc. 'Wait, what's a "ref"? What's a "tree-ish"? What, pray tell, is a "working tree", and how is that different from an "index"...?'

(Spoiler: "tree" is git for directory (despite the fact that git history is... also a tree (technically, a DAG). After you know this, a lot of git things make a lot more sense. git subtree, for example. (Not that most people have used git subtree. But at least I understand its man page now.))

One of the weird things about git is that when you're a novice you don't understand what the commands do. And then once you master git you don't understand why the commands are bad at doing the things git is supposed to be for.

I might look into using jj instead some time.

The concept of making a small core of git commands appeals to me. Sort of like jj (might build it as jj aliases), but in a way that I think makes sense. Applying deltas to things might use the verb "delt". There might be an explicit "reparent" command. Instead of conflating commits and the deltas of those commits with their parents, as git so often does. Branch is fine, though. master is master. Rebase would be, like, what, just delt with multiple commits? (I personally just think of rebase as applying a string of diffs, at this point, but it's famously hard for newbies to figure out what "rebase" means.) Squash would be a proper action and not just something we pretend is a flag to merge (it doesn't make a merge commit!). We may need a theory of patches here, idk.

If I were solving this problem, I'd also like to solve, along the way, for good, the problem of how semver and commits do not progress in lockstep; instead, every commit should increment the patch version. Or at least its metadata should say x.y.z-dev for the patch version it's working towards (although that might be skipped if instead you increment minor or major). Or, perhaps a different method altogether would be called for.

I would like git to track more file metadata. Like tags. I like the idea of tagging files. Shame many file systems don't support that.

## license

Except where otherwise noted, Gyatt is in the public domain. CC0 in the license file formalizes this.

## contributing

If you want to contribute to this project, first of all: thanks! Second of all, please note that your contributions will be released into the public domain under the license of this project. Third of all, note that you should probably use the full names of flags for commands, as this will save everyone a lot of time when trying to figure out what the command does. and, fourthly, note that I reserve the right to be a terrible maintainer, take a long time to review everything, and reject your very sensible changes because they aren't exactly precisely what I want for this project — or even just out of mere caprice!

## coda

And remember the ancient wisdom: “a voluptuous charmer takes food; a scoundrel is cursed to dwell restlessly in strange places”[.](https://www.youtube.com/watch?v=JkcbeMnLc40)

## coda 2

Lil Gyatty laptop[.](https://www.reddit.com/r/MemeRestoration/comments/utvtib/drake_helping_lil_yachty_hd/)
