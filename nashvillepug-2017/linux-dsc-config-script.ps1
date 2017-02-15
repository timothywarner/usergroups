break
# #############################################################################
# Linux and DSC
# AUTHOR:  Tim Warner
# EMAIL: timothy-warner@pluralsight.com
# TWITTER: @TechTrainerTim
# #############################################################################
 
# Press CTRL+M to expand/collapse regions

#region Install Linux Prereqs

su -c 'yum update'

yum groupinstall 'Development Tools'
yum install pam-devel
yum install openssl-devel
yum install wget
yum install python
yum install python-devel

#endregion

#region Install OMI on Linux

# the easy way
Start-Process -FilePath https://github.com/Microsoft/omi/releases

openssl version

wget https://github.com/Microsoft/omi/releases/download/v1.1.0-0/omi-1.1.0.ssl_100.x64.rpm

# rpm resolves dependencies. U = upgrade (install if not present)  v = verbose output h = hash progress marks
sudo rpm -Uvh ./omi-1.1.0.ssl_100.x64.rpm

# the hard way
mkdir /root/downloads
cd /root/downloads
wget https://collaboration.opengroup.org/omi/documents/30532/omi-1.0.8.tar.gz
tar -xvf omi-1.0.8.tar.gz

cd omi-1.0.8/
./configure
make
sudo make install

#endregion

#region Configure OMI

# daemon: omid

# service control script
/opt/omi/bin/service_control

# restart OMI
sudo /opt/omi/bin/service_control restart/stop/start

# test OMI (enumerates instances of the OMI_Identity class in the root/omi CIM namespace)
sudo /opt/omi/bin/omicli ei root/omi OMI_Identify

# config file
/etc/opt/omi/conf/omiserver.conf

#endregion

#region Install DSC on Linux

Start-Process -FilePath https://github.com/Microsoft/PowerShell-DSC-for-Linux/releases/

wget https://github.com/Microsoft/PowerShell-DSC-for-Linux/releases/download/v1.1.1-294/dsc-1.1.1-294.ssl_100.x64.rpm

sudo rpm -Uvh ./dsc-1.1.1-294.ssl_100.x64.rpm

#endregion

#region Local LCM configuration

cd /opt/microsoft/dsc/Scripts
ls -1 *.py

# get local DSC config
sudo ./GetDscConfiguration.py

# get LCM metadata
sudo ./GetDscLocalConfigurationManager.py

# kick off a local config
sudo ./StartDscLocalConfigurationManager.py �configurationmof /tmp/localhost.mof

# applies a meta MOF to the computer
sudo ./SetDscLocalConfigurationManager.py �configurationmof /tmp/localhost.meta.mof

#endregion

#region PowerShell on Linux

Start-Process -FilePath https://github.com/PowerShell/PowerShell/releases/

wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.11/powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm

sudo yum install -y ./powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm

powershell

$PSVersionTable

Get-Command | Measure-Object | Select-Object -Property Count

New-Item -Type File -Path ./hellolinux.txt

Set-Content hellolinux.txt -Value "Glad to be here!"

Get-Process -Name powershell

Get-Process | Get-Member

Get-Alias

Get-Command

Get-Help -Name Clear-Host

exit

#endregion






