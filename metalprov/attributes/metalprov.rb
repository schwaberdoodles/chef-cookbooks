#Razor
default[:metalprov][:razor][:dist] = "master.zip"
default[:metalprov][:razor][:path] = "https://github.com/puppetlabs/Razor/archive/master.zip"
default[:metalprov][:ipxe][:dist] = "ipxe"
default[:metalprov][:ipxe][:path] = "https://s3.amazonaws.com/velankanidownloads/ipxe.iso"
default[:metalprov][:ipxe][:dist_usb] = "ipxe"
default[:metalprov][:ipxe][:path_usb] = "https://s3.amazonaws.com/velankanidownloads/ipxe.usb"
default[:metalprov][:ipxe][:dist_misc] = "undionly"
default[:metalprov][:ipxe][:path_misc] = "https://s3.amazonaws.com/velankanidownloads/undionly.kpxe"


#DHCP
default[:metalprov][:dhcpd][:dns_server] = "192.168.73.2"
default[:metalprov][:dhcpd][:next_server] = "192.168.73.136"
default[:metalprov][:dhcpd][:subnet] = "192.168.73.0"
default[:metalprov][:dhcpd][:subnet_mask] = "255.255.255.0"
default[:metalprov][:dhcpd][:broadcast] = "192.168.73.255"
default[:metalprov][:dhcpd][:gateway] = "192.168.73.2"
default[:metalprov][:dhcpd][:host_range] = "192.168.73.150 192.168.73.200"
default[:metalprov][:dhcpd][:interfaces] = ['eth0']
default[:metalprov][:dhcpd][:filename] = "pxelinux.0"

