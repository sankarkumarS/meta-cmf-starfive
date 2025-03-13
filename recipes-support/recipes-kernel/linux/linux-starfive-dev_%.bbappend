COMPATIBLE_MACHINE_starfive-visionfive2-rdk-broadband = "starfive-visionfive2-rdk-broadband"
PREFERRED_PROVIDER_virtual/kernel = "linux-starfive-dev"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://proc-event.cfg"

SRC_URI += "file://0001-add-support-for-port-triggering.patch"
SRC_URI_append_dunfell = " file://RPI-resolving-port-triggering-errors.patch"
#SRC_URI_append_kirkstone = " file://kirkstone_resolving-port-triggering-errors.patch"

SRC_URI_append_broadband = " \
                             file://remove_unused_modules.cfg \
                             file://rdkb.cfg \
                             file://rdkb-acm.cfg \
                             file://netfilter.cfg  \
"
SRC_URI_append_extender = " file://remove_unused_modules.cfg"
SRC_URI_append_extender = " \
                            file://rdkb.cfg \
                            file://rdkb-ext.cfg \
                            file://regdb.patch \
"
SRC_URI_append_extender_dunfell = " \
                            file://added_mtk_wed_header.patch \
                            file://mt76_compilation_errors_fix_5_10.patch \
"
SRC_URI_append_kirkstone = "  file://added_mtk_wed_header.patch "

SRC_URI_remove = " file://0001-add-support-for-http-host-headers-cookie-url-netfilt.patch "
SRC_URI_remove_broadband =  " ${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "file://vc4graphics.cfg", "", d)}"

#DEPENDS += "virtual/kernel"
CFLAGS += "-I${STAGING_DIR}/usr/include"
EXTRA_OEMAKE += "KERNEL_INCLUDE_PATH=${STAGING_DIR}/usr/include"


