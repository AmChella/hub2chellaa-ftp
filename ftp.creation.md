Install VSFTPD

sudo apt-get install vsftpd

Uncomment this to allow local users to log in. /etc/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
pam_service_name=ftp

mkdir /home/aravali/myftp

Create new user for FTP without shell
useradd -s /usr/sbin/nologin -d /home/aravali/myftp myftp

Set Password
passwd myftp

mkdir -p /home/aravali/myftp/SPS/IN /home/aravali/myftp/SPS/Signals /home/aravali/myftp/TNQ/IN /home/aravali/myftp/TNQ/Signals /home/aravali/myftp/PCDEVTEST/IN /home/aravali/myftp/PCDEVTEST/Signals /home/aravali/myftp/SPIN2/IN /home/aravali/myftp/SPIN2/Signals /home/aravali/myftp/MACM/IN /home/aravali/myftp/MACM/Signals /home/aravali/myftp/THOM/IN /home/aravali/myftp/THOM/Signals

usermod -d /home/aravali/myftp myftp
sudo chmod a-w /home/aravali/myftp

chown -R myftp:myftp /home/aravali/myftp
setfacl -Rm u:myftp:rwx /home/aravali/myftp

Set ACL permission for the user aravali to myftp folder
setfacl -Rm u:aravali:rwx /home/aravali/myftp


http://askubuntu.com/questions/413677/vsftpd-530-login-incorrect
