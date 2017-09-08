reset=$(tput sgr0)
bold=$(tput bold)
# black=$(tput setaf 0)
# red=$(tput setaf 1)
# green=$(tput setaf 2)
# yellow=$(tput setaf 3)
# blue=$(tput setaf 4)
# magenta=$(tput setaf 5)
# cyan=$(tput setaf 6)
# white=$(tput setaf 7)
# user_color=$green
# [ "$UID" -eq 0 ] && { user_color=$red; }

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PS1="\[$reset\]\
bxshell[\
$bold\
(\$BXSHELL_TARGET) \
\$(cat ~/.bluemix/config.json | jq .Region -r)>\
\$(cat ~/.bluemix/.cf/config.json | jq .OrganizationFields.Name -r | cut -c1-5)>\
\$(cat ~/.bluemix/.cf/config.json | jq .SpaceFields.Name -r)\
$reset\
] \w> "

# Bluemix CLI
bx plugin repo-add Bluemix https://plugins.ng.bluemix.net
alias bxlogin='bx login --apikey "$BLUEMIX_API_KEY" -o "$BLUEMIX_ORG" -s "$BLUEMIX_SPACE"'

# Istio
export PATH="$PATH:/usr/local/istio/bin"

# History
export HISTFILE=$HOME/mnt/config/.bash_history
export PROMPT_COMMAND='history -a'

# Additional customization per env
if [ -f ~/mnt/config/.env_profile ]; then
  echo Loading custom environment profile
  . ~/mnt/config/.env_profile
fi

cat .motd.txt
