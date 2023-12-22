#!/bin/bash
yum update -y
yum install mc acl -y

useradd -m -s /bin/bash -p '$1$EUoxXEPS$AstMdS07JIDw//Jk9GGB7.' adminuser  
usermod -aG sudo adminuser 

useradd -m -s /bin/bash poweruser  
passwd -d poweruser 

echo "poweruser ALL=(ALL) /sbin/iptables" >> /etc/sudoers

usermod -aG adminuser poweruser

# -u poweruser ln -s /etc/mtab /home/poweruser/mtab
cd /home/poweruser 
ln -s /etc/mtab softlink