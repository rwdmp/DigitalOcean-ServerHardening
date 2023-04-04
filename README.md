# Digital Ocean Server Hardening Basics

- Problem

Easy to set up a few servers without security when having 100k+ credits on a cloud provider. So I thought I share some basics on how to harden your servers.

- Basic Hardening using Firewalls

* Set-up UFW (Firewall)
* Automatically ban IPs that fail to log in with Fail2Ban
* Active standard hardening features with SE Linux /Security Enhanced Linux
* Optional: You can install FireHol which connects to a network that gives you typically bad IP addresses

- Securing the Identities

* Change the name of your root user
* Move from password auth to SSH Key Auth
* Turn on 2FA / 2 Factor Auth using either an authenticator app or SMS

- Setting proper perimeters on the system

Another key aspect is to not allow any process and user to walk around on the system. And to disable configuraitons that can hurt the system

* Turn of Buffer Overflow protection
* Turning off memory / core dumps
* Restricting network acccess for certain processes
* Ensure root owns the critical components ahd CHMODs and the users don't
* Set up and disable services you need or do not need

- Maintenance tasls

* Set up chrons to make the system update automatically (not recommended if there are complex dependencies on older libraries)
