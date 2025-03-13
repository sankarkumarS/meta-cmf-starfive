SYSTEMD_SERVICE_${PN} = ""

FILES_${PN}_append = " /lib/systemd/system/dnsmasq.service"

SYSTEMD_SERVICE_${PN} = "dnsmasq.service"

do_install_append_broadband(){
        sed -i '/Restart=always/s/^/#/' ${D}${systemd_unitdir}/system/dnsmasq.service
        sed -i '/#Restart=always/a RemainAfterExit=yes' ${D}${systemd_unitdir}/system/dnsmasq.service

        #  sed -i 's/\"XB3\" ]/& || [ \"$BOX_TYPE\" = \"rpi\" ]/' ${D}${base_libdir}/rdk/dnsmasqLauncher.sh
        sed -i 's|/etc/dnsmasq_vendor.conf|/etc/dnsmasq.conf|' ${D}${base_libdir}/rdk/dnsmasqLauncher.sh
        
	echo "interface=brlan0" >> ${D}${sysconfdir}/dnsmasq.conf
	echo "dhcp-range=10.0.0.2,10.0.0.254,255.255.255.0,24h" >>  ${D}${sysconfdir}/dnsmasq.conf
	echo "dhcp-option=3,10.0.0.1" >> ${D}${sysconfdir}/dnsmasq.conf
	echo "dhcp-option=6,10.0.0.1" >>  ${D}${sysconfdir}/dnsmasq.conf
}
