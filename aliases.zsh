# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias root="cd /"

alias cl="clear"
alias reload!=". ~/.zshrc"

# Shortcuts
alias dr="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias g="git"
alias h="history"
alias j="jobs"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias Projects="cd $HOME/Projects"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias mute="osascript -e 'set volume output muted true'"
alias blast="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# # Shut up pyenv shim config warning!!!
# alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

#######
# Git #
#######
alias gs='git status'
alias gc="git checkout"
alias gb="git branch"
alias ga='git add .'
alias gd='git diff'
alias gl="git log --oneline --decorate --color"
alias pull='git pull'
alias push='git push'
alias commit="git add . && git commit -m"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"

##########
# Docker #
##########
alias d='docker $*'
alias dc='docker-compose $*'
alias dcs='docker ps -f "status=exited"'
alias di='docker image ls'

##############
# Kubernetes #
##############

# Kubernetes
alias k='kubectl'
alias kv='kubectl config view'              # Show Merged kubeconfig settings.
alias kgc='kubectl config get-contexts'       # display list of contexts
alias kcc='kubectl config current-context'    # display the current-context
alias kuc='kubectl config use-context'        # set the default context to my-cluster-name

# Kubernetes - Creating
alias ka='kubectl apply -f'                     # create resource(s) (supply a .yaml resource)

# Kubernetes - Viewing
alias kgs='kubectl get services --sort-by=.metadata.name'  # List all services in the namespace
alias kgp='kubectl get pods -o wide'          # List all pods in the current namespace, with more details
alias kgd='kubectl get deployment'          # List a particular deployment
alias kgp='kubectl get pods'                  # List all pods in the namespace
alias kgpy='kubectl get pod -o yaml'          # Get a pod's YAML (supply pod name)
alias kgn='kubectl get nodes'          # Get nodes
alias kgns='kubectl get namespaces'          # Get nodes


alias kds='kubectl describe services'
alias kdp='kubectl describe pods'
alias kdd='kubectl describe deployments'
alias kdn='kubectl describe nodes'

# Kubernetes – Updating
alias krr='kubectl rollout restart deployment/'         # Rolling restart of a deployment (supply a deployment name)

# Helm
alias hsh='helm search hub'                 # shows you all of the available charts from The Artifact Hub
alias hsr='helm search repo'                # searches the repositories that you have added to your local helm client

######
# PATH
######
alias path="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"