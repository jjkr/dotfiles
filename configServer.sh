apt-get update
apt-get upgrade

# Users
USERNAME="joe"
HOMEDIR="/home/$USERNAME"
useradd -m $USERNAME
mkdir $HOMEDIR/.ssh
cp authorized_keys $HOMEDIR/.ssh

# Packages
PACKAGES="aptitude \
          ruby \
          postgresql"
apt-get install $PACKAGES

