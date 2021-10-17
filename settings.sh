#!/usr/bin/env bash
#######################
##### START CONFIG ####
#######################
str_adminEmail=''         # Example: admin@example.com  :: Where to send email when script is done. This will have the account login details email to it.
str_emailRelaySever=''    # Example: mail.example.com   :: Set set a mail RELAY for your domain
str_port=""               # Example: 22                 :: This should be the SSH port that can access the server from the Internet, so customers can SFTP here.
#######################
# Default Self-Signed SSL Cert Details.
#######################
str_country="US"
str_state="Washington"
str_locality="Seattle"
str_organizationalunit="IT"
#######################
# URLs for packages
#######################
str_modsecGitUrl='https://github.com/coreruleset/coreruleset.git'
#######################
# Configuration File locations and some minor settings.
# Normally, these don't no need to change.
#######################
bln_letsencrypt_support=true                    # This options has to be 'true' or 'false' only.
str_mysqlRootUser='root'                        # Mysql root user maybe 'adminer' also, depends on our install.
str_sftpGroup='sftp'
str_webGroup='www-data'                         # Set this to the default group apache is using.
str_postfixConfigFile='/etc/postfix/main.cf'    # Set the postfix config file location.
str_apache2Dir='/etc/apache2/'
str_webMysqlToolWebDir='/usr/share/phpmyadmin/' # Other default DIRs of MySQL management tools, "/usr/share/adminer/adminer/", or "/usr/share/phpmyadmin/"
#######################
#### END CONFIG #######
#######################
#######################
### Console Colors ####
#### DO NOT CHANGE ####
#######################
color_NC='\033[0m'              # No Color
# Regular Colors
color_BLACK="\033[0;30m"        # Black
color_RED="\033[0;31m"          # Red
color_GREEN="\033[0;32m"        # Green
color_YELLOW="\033[0;33m"       # Yellow
color_BLUE="\033[0;34m"         # Blue
color_PURPLE="\033[0;35m"       # Purple
color_CYAN="\033[0;36m"         # Cyan
color_WHITE="\033[0;37m"        # White
# Underline
color_UCyan="\033[4;36m"        # Cyan
# Bold High Intensty
color_BICyan="\033[1;96m"       # Cyan
#### END Colors #######
#######################