# [**Diamond Hard LAMP**](https://cybergladius.com/diamond-hard-lamp/)

## Version 1.0 Beta
The bulk of the main code has been completed. The script can build a secure server and add web hosting accounts with all the needed security features. The script installs and configures the following services and security tools.

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
