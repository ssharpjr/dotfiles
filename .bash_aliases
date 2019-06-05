# Bash Aliases

# Editors
alias v="vim"
alias e="vim"

# Shortcuts
alias c="clear"

# Youtube
alias yt="youtube-dl --add-metadata -i"  # Download video link
alias yta="yt -x --audio-format mp3  --embed-thumbnail"  # Download audio only
alias ytapl="yt -x --audio-format mp3  --embed-thumbnail --write-description --download-archive archive.txt"  # Download playlist
alias YT="youtube-viewer"

# Configs to edit
alias ebashrc="vim ~/.bashrc"
alias evimrc="vim ~/.vimrc"
alias ei3config="vim ~/.config/i3/config"
alias ei3bconfig="vim ~/.config/i3blocks/config"
alias exresources="vim ~/.Xresources"

# Configs bare repo
alias config='/usr/bin/git --git-dir=/home/ssharp/.cfg/ --work-tree=/home/ssharp'

# Directory aliases
alias gowrite="cd $WRITEDIR"
alias gowritet9r="cd $WRITEDIR/The_Nine_Realms/design_documents"
alias gomusic="cd $HOME/Dropbox/Music\ Sheets/Templates"

# Steam Game IDs
alias steam_kotor2="steam steam://rungameid/208580"
