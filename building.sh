# ! /bin/bash

#MESSAGE impotnatseriouslfrfr
echo "the script uses sudo priveleges for some actions!!!!!"

# adding ezrepo to /opt
sudo cp -r opt/ezrepo/ /opt/

# create symlink and shii
mkdir -p releng/airootfs/etc/systemd/system/network-online.target.wants
ln -sf /usr/lib/systemd/system/NetworkManager-wait-online.service releng/airootfs/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service
ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service releng/airootfs/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
ln -sf /usr/lib/systemd/system/NetworkManager.service releng/airootfs/etc/systemd/system/multi-user.target.wants/NetworkManager.service
ln -sf /usr/lib/systemd/system/gdm.service releng/airootfs/etc/systemd/system/display-manager.service
ln -sf /usr/lib/systemd/system/systemd-resolved.service releng/airootfs/etc/systemd/system/dbus-org.freedesktop.resolve1.service
ln -sf /usr/lib/systemd/system/systemd-timesyncd.service releng/airootfs/etc/systemd/system/dbus-org.freedesktop.timesync1.service
ln -sf /usr/lib/systemd/system/ModemManager.service releng/airootfs/etc/systemd/system/dbus-org.freedesktop.ModemManager1.service

# clean work directory
if [ -d "output" ]; then
   echo "found output deleting"
   sudo rm -rf output
fi

# building the iso
sudo mkarchiso -v -w output/ -o output/ releng/

# removing ezrepo
sudo rm -rf /opt/ezrepo/

# finish message owo
echo "build finished! enjoy femboylinux!!!"
