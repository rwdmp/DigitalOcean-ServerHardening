################################################
# BASIC SET-UP
################################################

################################################
## Change SSH Port #############################

sudo nano /etc/ssh/sshd_config
# Replace default port e.g. to NEWPORT
service sshd restart

################################################
## Set up UFW firewall #########################

sudo apt update
sudo apt install ufw
sudo ufw status verbose
# sudo ufw allow ssh
sudo ufw allow MEWPORT/tcp comment 'Open port ssh tcp port 1110'
sudo ufw limit NEWPORT/tcp # restricts access attempts to 6 within 30 seconds
sudo ufw allow http
sudo ufw enable

#################################################
## Set up Fail2ban ##############################

sudo apt-get install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano sudo /etc/fail2ban/jail.local
# Set bantime to several hours
# Set sshd enabled = true
# Set ignoreip = 127.0.0.1/8 ::1
# In SSHD Section Configure maxretry = 3 and set enable = true
sudo systemctl enable fail2ban


#################################################
## Activate Security Enhanced Linux #############

sudo nano /etc/sysconfig/selinux
# SELINUX=enforcing


##################################################
## Install fireHOL ###############################

# Get a way tp keep IPTables updated with known 
# malicious IPs

