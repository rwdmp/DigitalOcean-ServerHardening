################################################
# Restrict system use to users that need it
################################################


################################################
## System Integrity Protection #################


# Boot Loader                                       (you don't want the boot configuration changed. so lock it)

chown root:root /etc/grub.conf
chmod og-rwx /etc/grub.conf

# Boot Configuration as Read only                  (you don't want the boot configuration changed. so lock it)

sudo nano /etc/fstab 
# Insert: Label=/boot /boot ext2 defaults,ro 1 2


# Disable USB Use                                   (For physical hardware rather to not boot from ext.)

nano /etc/modprobe.d/blacklist.conf
# böaclöost usb_storage
nano /etc/rc.local
# modprobe -r usb_storage
# exit 0



################################################
## Exploit and Intel Restrictions ##############


#Restrict Coredumps                                 (Disable the coredump. Sets size of core file to 0) https://www.thegeekdiary.com/understanding-etc-security-limits-conf-file-to-set-ulimit/

sudo nano /etc/security/limits.conf 
# Add hard core 0                                   
sudo nano /etc/sysctl.conf 
# Add fs.suid_dumpable = 0                          (DIsables SUIDs from being dumped)
sysctl -p

#Protect against Buffer Overflow Exploits   

sudo nano /etc/sysctl.conf 
# Add fs.suid_dumpable = 0                  (DIsables SUIDs from being dumped)
# Add kernel.exec-shield = 1                (Buffer Overflow Protection)    1 = Protects only if application allows, 2 = By default, 3 = Always no matter what
# Add kernel.randomize_va_space = 2         (Makes Exploits harder)
sysctl -p


#Network Parameters

sudo nano /etc/sysctl.conf
# net.ipv4.ip_forward 0
# net.ipv4.conf.all.send_redicrects 0
# net.ipv4.conf.default.send_redicrects 0
# net.ipv4.conf.all.accept_redicrects 0
# net.ipv4.conf.default.accept_redicrects 0
# net.ipv4.icmp_ignore_bogus_error_responses 1 
sysctl -p


################################################
## Make Root owner of key features #############

# Root Authentication for any SU attempt

sudo nano /etc/sysconfig/init
# SINGLE=/sbin/sulogin    ... Requires root auth to switch into SU


# Authenticiation Hardening                         (Priviledge escalations typically use this, so lock it to root)
chmod 644 /etc/passwd
chown root:root /etc/passwd
chmod 644 /etc/group
chown root:root /etc/group
chmod 644 /etc/shadow
chown root:root /etc/shadow
chmod 644 /etc/gshadow
chown root:root /etc/gshadow

# Key System Areas and Logs                         (Hackers might want to change these files quickly during the hack)
chmod 700 /root
chmod 700 /var/log/audit
chmod 740 /var/rc.d/init.d/iptables
chmod 740 /sbin/iptableschmod -R 700 /etc/skel
chmod 600 /etc/rsyslog.conf
chmod 649 /etc/security/access.conf
chmod 600 /etc/sysctl.conf 

# Control of Chron Jobs                             (Hackers likely will try to install jobs once on the system)
chown root:root /etc/anacrontab
chmod og-rwx /etc/anacrontab
chown root:root /etc/crontab
chmod og-rwx /etc/crontab
chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly
chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily
chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly
chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d
sudo nano /var/spool/cron
#chown root:root <crontabfile>
#chmod og-rwx <crontabfile>














