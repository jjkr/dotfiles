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
          ruby"
apt-get install $PACKAGES

# Postgres install
apt-get install postgresql
su - -c "createuser -DRSP joe" postgres
su - -c "createdb -O joe diet" postgres
echo "listen_addresses = '*'" >> /etc/postgresql/9.1/main/postgresql.conf
echo "host    all             all             174.16.112.9/32            md5" \
    >> /etc/postgresql/9.1/main/pg_hba.conf
service postgresql restart

/etc/update-motd.d/10-help-text
