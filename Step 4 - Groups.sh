
## Create Website User
sudo adduser website
su website
usermod -aG sudo website

## Configure groups
groups                                          # See which groups exist
getent groups                                   # See all groups on system

sudo groupadd website
usermod -a -G website website
usermod -a -G website benadmin201015

## move WWW folder to website user

sudo chown website:website /etc/www -R




