
## Create Website User
sudo adduser WEBSITE
su website
usermod -aG sudo WEBSITE

## Configure groups
groups                                          # See which groups exist
getent groups                                   # See all groups on system

sudo groupadd website
usermod -a -G website WEBSITE

## move WWW folder to website user

sudo chown WEBSITE:WEBSITE /etc/www -R




