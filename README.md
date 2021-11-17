# Diamond Hard LAMP

![DiamondHardLAMP Logo](https://cybergladius.com/wp-content/uploads/2021/11/logo_2_small.png)
# 
### What is Diamond Hard LAMP
Building a Linux Apache MySQL PHP(LAMP) web hosting server is easy, anyone can build one with a 5-minute tutorial. Securing a LAMP web hosting server, on the other hand, is very hard and time-consuming. There are many details and packages you need to know about, and that knowledge only comes with experience. Diamond Hard LAMP aims to cover any experience shortfalls for you!

Over the years I have built scripts to automate my roles as a Linux System Administrator. Diamond Hard LAMP(DHL) is the combination of those scripts and knowledge. DHL builds a LAMP web hosting server with the maximum security-hardened services; diamond-hard security. DHL incorporates all the security configurations, tools, and methodologies to form a suite of services working in concert together. The end result is a LAMP stack with very high security and automated management.

# 

## DHL Build Out Process

1. Build a new Vitual Machine
2. Clone DHL GitHub codebase
3. Configure Your Unique Server Settings
4. Run DHL installer
5. Add your first webhosting account

## Hardening Tools and Configurations

### Security Tools include 
 - Apache latest
 - MariaDB latest
 - PHP 7.x latest
 - PhpMyAdmin
 - AppArmor
 - ModSecurity
 - Fail2Ban
 - OSSec
 - UnattendedUpgrades
 - LetsEncrypt CertBot
 - ClamAV

  ### Security Configuration  
- Each Apache Website runs in its own sandbox via AppArmor.
- Each Apache Website runs under its own user account; mpm-itk module.
- Apache configured to not leak any data about itself.
- Apache Module mod_headers installed. Allows ModSecurity modify HTTP request and response headers, stops threats.
- ModSecurity configured to most up-to-date and best free rules sets.
- MariaDB has all the baseline security configured. 
- ".htaccess" protects the PhpMyAdmin web UI, adding another layer of protection.
- All ".htaccess" passwords are stored with the highest BCrypt hashing. Brute-Force cracking is not practical.
- SSL settings are set to industry best standards; TLS 1.2 & 1.3 are only accepted coupled with strong ciphers. 
- SSL configured with unique Diffie-Hellman Key; even if SSL key leaks, data cannot be decrypted.
- LetsEncrypt set up to auto-renew certs as needed.
- Direct IP access to port 443, or 80, redirects to 'google.com'. If you don't know the site hosted here, then you are not allowed.
- Users are forced to use strong passwords with pam_pwquality & pam_unix.so. Weak passwords are rejected.
- ClamAV is configured to run a daily scan on the system.
- Fail2Ban is configured to review logs on the system and works with ModSecurity to block attackers automatically.
- OSSec is set up to monitor integrity across the systems and alert Admin when needed. 
- Updates are done automatically. If an upgrade requires a reboot, the Admin is emailed to it.
- Configure the firewall only to allow ports 22, 80, and 443 from any destination. All incoming traffic is dropped.
- Check and configure hostname correctly.
