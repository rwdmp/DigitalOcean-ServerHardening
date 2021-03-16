################################################
# Seperate Root and Individual Admin
################################################

################################################
## Set a new admin user that is not root. ######

# e.g. TobiasTobsenAdmin230231202341
#      Password: 2j3lq239a4i2m43

sudo adduser NEWADMIN
sudo usermod -aG sudo NEWADMIN
sudo passwd NEWADMIN
sudo su NEWADMIN

################################################
## Set Up Key File Access ######################


## Step 1 Regenerate Moduli 

# Before creating SSH keys, make sure you have different moduli

ssh-keygen -G moduli-2048.candidates -b 2048
ssh-keygen -T moduli-2048 -f moduli-2048.candidates
cp moduli-2048 /etc/ssh/moduli
rm moduli-2048
#https://medium.com/@jasonrigden/hardening-ssh-1bcb99cd4cef


## Step 2 Create SSH keys (OUTDATED)

ssh-keygen - t rsa
cat ~/.ssh/id_rsa.pub
cd /home/NEWADMIN
mkdir .ssh
cd .ssh
nano authorized_keys
chown NEWADMIN authorized_keys

## Step 2 Create SSH Keys for Puttygen

sudo aptitude install putty-tools
puttygen -t rsa -b 2048 -C "user@host" -o keyfile.ppk
puttygen -L keyfile.ppk ## copy from commandline
nano ~/.ssh/authorized_keys 
# paste public key 

# Install WinSCP and SSH into your server using root
# copy your keyfile.ppk from the puttygen execution (see above) to your harddrive


## Step 3 Changes to sshd

sudo nano /etc/ssh/sshd_config
# Passwordauthentication no     (Disable log-in auth via password)
# PermitRootLogin no            (Disable log-in auth via Root. Root only accessible via Sudo/Su)
# AllowUsers NEWADMIN           (Disable all users except the whitelisted ones)
# RSAAuthentication yes         (Enable RSA Authentication)
# PubkeyAuthentication yes      (Enable AUthentication via Keyfile)
# ClientAliveIntervall 1h       (Restricts time of each session to a reasonable limit)
# ClientAltiveCountMax 2        (Restricts active sessions in parallel)
# X11Forwarding no              (Turn of GUI interface)
service sshd restart

## Step 4 Add Google Authenticator

# This prevents sudo from being used without 2-Factor

sudo apt install libpam-google-authenticator
sudo nano /etc/pam.d/common-auth
# Add auth required pam_google_authenticator.so nullok
google-authenticator
sudo nano /etc/pam.d/sshd
## Add auth required pam_google_authenticator.so nullok
sudo nano /etc/ssh/sshd_config
## ChallengeResponseAuthentication no -> yes
service sshd restart


################################################
## Harden Root #################################

# Root is now only accessible if already on the system.
# Next steps including tying core rights to root only
# For this anyone with access to to NEWADMIN should be 
# unable to brute force the root password on the system
