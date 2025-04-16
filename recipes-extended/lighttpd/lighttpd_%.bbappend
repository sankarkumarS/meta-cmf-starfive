FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://lighttpd.conf"

# Replace the default lighttpd.conf with our custom version
do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}/lighttpd/lighttpd.conf
}

SYSTEMD_SERVICE_${PN} += "lighttpd.service"

RDEPENDS_${PN}_append = " \
    lighttpd-module-fastcgi \
    lighttpd-module-proxy \
"
