# [**Diamond Hard LAMP**](https://cybergladius.com/diamond-hard-lamp/)

<div align="center">
    <div style="display: flex; align-items: flex-start;">
        <img align=top src="https://cybergladius.com/wp-content/uploads/2021/11/DHL_logo_2-600x518.png" />
    </div>
</div>

# 
# What is Diamond Hard LAMP
Diamond Hard LAMP(DHL) builds a Linux, Apache, MariaDB, PHP(LAMP) webhosting server with the maximum security-hardened services; diamond-hard. DHL incorporates all the security configurations, tools, and methodologies to form a suite of services working in concert together. The end result is a LAMP stack with very high security and automated management. If you host 

### Jump Menu
- [Website Management Design](#website-management-design)
- [Hardening Features, Tools, and Configurations](#hardening-features-tools-and-configurations)
- [DHL Installation Process](#dhl-installation-process)
- [DHL Help Menu](#dhl-help-menu)
- [Planned Features](#planned-features)

# Website Management Design

DHL deploys websites in a way you would expect a shared-hosting system would. Each Website has its own user account, access rights, logins, and segmented directories. Below is a list of the services a user has access to so they can manage their own website.

 - SFTP - To upload and download files
 - Access to Apache logs for their website only. Allows the User to troubleshoot there own issues.
 - User can add .htaccess file to any web directory to quickly add another layer of security to a directory.
 - Access to PhpMyAdmin to fully manager their own database.

### User and Site Segmentation
The core guiding principle behind the user site configuration is segmentation. I wanted to make sure one poorly coded website could not affect others on the same server. So to the furthest extent possible, sites share nothing between them. This is done in the following ways.

 - AppArmor sandboxes the user account and the website.
 - Each website runs in Apache with its own user account.
 - Each website has its own ".secret/.htpasswd" file for passwords.
 - One site, One database, with permissions to nothing else.
 - No shared logging.
 - Strict adherence to principle of least privilege

# 

# Hardening Features, Tools, and Configurations
### Services & Security Tools Include 
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
- ModSecurity configured to most up-to-date with Core Rule Set.
- ModSecurity rules are update nightly.
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
- Updates are done automatically. If an upgrade requires a reboot, the Admin is emailed about it.
- Configure the firewall only to allow ports 22, 80, and 443 from any destination. All other incoming traffic is dropped.
- Check and configure hostname correctly.

# 

# DHL Installation Process
**Steps to install DHL Overview**

1. Build a new Vitual Machine
2. Clone DHL GitHub codebase
3. Configure Your Unique Server Settings
4. Run DHL installer
5. Add your first webhosting account

### DHL Build Out - Step 1
DHL is built for the most recent Long Terms Support(LTS) version of Ubuntu; 20.04 LTS. I recommend the following as the minimum settings for your VM.
- 4x CPU cores
- 8 GB RAM
- 8 GB Swap space(This needs to match your RAM amount)
- 32 GB Disk Space, This really depends on how much data you want to store.
- 1x WAN(Internet) IPv4 Address

Note: AppArmor cannot run appropriately inside a container. Additionally, containers are considered less secure than the segmentation VMs provide. For these reasons, DHL requires a VM and not a container.

###  DHL Build Out - Step 2
Run the below command to install DHL.
```bash
# On a fresh install you will need the git package before you get going. 
sudo apt update && sudo apt -y install git

# Clone the DHL repo
git clone https://github.com/Brets0150/DiamondHardLAMP.git

cd  ./DiamondHardLAMP
chmod +x DiamondWebServerManager.sh
```

###  DHL Build Out - Step 3
There are a few settings that must be configured so DHL can alert you correctly about events. Open up the “./settings.sh” file and filling the required settings. Make sure to review the LetsEncrypt option if you plan on using it.

```bash
# Update the settings file with the variable and systems settings. This MUST be updated!
nano ./settings.sh
```
![DiamondHardLAMP Server Config](https://cybergladius.com/wp-content/uploads/2021/11/dhl_settings-1024x207.png)

###  DHL Build Out - Step 4
Now that we have the DHL GitHub codebase on the server, we can start the server setup. The “–install” command will install and configure all the security tools and features of DHL. The installer will take time to complete. The Diffie-Hellman Key generation, alone, can take up to an hour.

```bash
# Install and build a full DHL LAMP stack. 
./DiamondWebServerManager.sh --install
```

After the installation of all tools and services is complete you will be provided the administrative credentials. Copy these details to a secure location; you will never see this data again.

![DiamondHardLAMP Admin Details](https://cybergladius.com/wp-content/uploads/2021/11/dhl_install_complete.png)

Note: The “PhpMyAdmin .htaccess” user name is actually “admin_2919” in the above image. The Admin account username is randomized every time the installer runs. This randomized username means there are now 9999 different possible usernames that may be applied. No one is brute-forcing this login with 9999 different possible usernames and a random 16 character password; good luck!

###  DHL Build Out - Step 5
To add a new Webhosting User use the below command.

```bash
# Run DHL's Add Web User Command. 
./DiamondWebServerManager.sh --addwebuse
```

Running the command will prompt you for details about the new user account. 

![DiamondHardLAMP Admin Details](https://cybergladius.com/wp-content/uploads/2021/12/dhl_addwebuser.png)

Copy these details to a secure location; you will never see this data again. 

# 

# DHL Help Menu

<div align="center">
    <div style="display: flex; align-items: flex-start;">
        <img align=top src="https://cybergladius.com/wp-content/uploads/2021/12/dhl_assci_log.png" />
    </div>
</div>

<div align="center">
    <div style="display: flex; align-items: flex-start;">
        <img align=top src="https://cybergladius.com/wp-content/uploads/2021/12/dhl_help-menu.png" />
    </div>
</div>

# 

# Planned Features
- Individual site content, database, config backups, run nightly or on-demand.
- Individual site Disk Quota limits and management.
- Advanced Malicious PHP Code detection
- On-Access Scanning malware detection.

# 
