#### Installing SFTP server in raspberry pi

Installing ntfs support for ntfs formatted drives

```shell
sudo apt-get install ntfs-3g
```

Adding support for exfat formatted drives

```shell
sudo apt-get install exfat-utils exfat-fuse
```
Noew continuing with installing samba server

```shell
sudo apt-get install samba samba-common-bin
```

Now create a directory to mount the external drives.

```shell
sudo mkdir /PiFTPServer
```

Now change the access permission for newly created directory

```shell
sudo chmod 777 /PiFTPServer/
```

>NOTE: Granting the above permission will make the directory accessible for everyone

Now we will require to check our connected drives for mounting

```shell
lsblk
```

Or the following command can be executed to display all the necessary information regarding the connected drive
```shell
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
```

Run the following command to get the location of the external drive location

```shell
sudo blkid

OUTPUT:

/dev/sda1: LABEL="My Passport" UUID="F474B7AA74B76DCC" TYPE="ntfs" PARTUUID="989bf5a6-01"

```

>NOTE: The **UUID** and **TYPE** is required to be noted

Next, we need to modify the fstab file by running the command below.

```shell
sudo nano /etc/fstab
```

The lines that we add to this file will tell the operating system how to load in and handle our drives.

Add the following line to the bottom of the file, replacing [UUID] and [TYPE] with their required values.

```shell
UUID=[UUID] /mnt/usb1 [TYPE] defaults,auto,users,rw,nofail,noatime 0 0
```

for my case

```shell
UUID="F474B7AA74B76DCC" /PiFTPServer/ ntfs defaults,auto,users,rw,nofail,noatime 0 0
```

than save the file

Now unmount the external drive:

```shell
sudo umount /dev/sda1
```

Now mount the drive using the following command

```shell
sudo mount -a
```

Once the command is executed the external drive should be mounted using the changes made in **/etc/fstab**

Now to be sure that the drives mounts automatically reboot the PI

```shell
sudo reboot
```

To confirm run the following command

```shell
lsblk
```

### Now lets get on with configuring *samba*

Lets open the *samba* configuration file **samba.conf**

```shell
sudo nano /etc/samba/smb.conf
```

Than add the following line at the end of the file:

```shell

[Personal FTP Server]
comment = "FTP server to manage files @ home network"
path = /PiFTPServer
browseable = yes
read only = no
writeable= yes
create mask = 0777
directory mask = 0777
public = no
force user = root

valid users = dave
```

After adding the lines save the file.

### Now creating User to access our server

Now create a user. As we do not want everyone to access our files on the server, as there can be multiple user logged in.
```shell
sudo adduser aryan
# provide and confirm the password @u7...
# provide required informations
```
Now set a samba password for newly created user

```shell
sudo smbpasswd -a user_name
```

>NOTE: Username and password created using adduser is to access the pi ONLY!; to access samba use the password provided in the previous command.

>TIPS: Password can be same for both user, and samba.

Now restart samba server

```shell
 sudo /etc/init.d/smbd restart

 sudo /etc/init.d/nmbd restart
```

Now configuring a static IP address for our PI. Else the ip will keep changing. To do so execute the following command:

```shell
sudo nano /etc/dhcpcd.conf
```

Add the following lines at the end of the file

```shell
static ip_address = 192.168.0.23/24
static routers = 192.168.0.1
static domain_name_servers = 192.168.0.1
```

>NOTE: If the IP is statically set from pi throulsgh **/etc/dhcpcd.conf** it might be unbale to connect to the network if other device has connected to the network using the same IP which was provided in the config file while the PI tries to connect to the network after the mentioned IP has provided to another device or while the PI was off/rebooted. 



NAYATTU - tamil movie

asimgc HASH: $2y$10$86Vr4hfXqDfiGD3PV74.uOW/e2BbBdp2iSUYME/OF311lnl58qH56

$2y$12$2ZuxD9pSB/3NXpQ/ugCMa.GcjgUhW5UGYT7HyJfAoQWf1hRo09YDm 

