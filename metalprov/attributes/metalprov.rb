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
default[:metalprov][:dhcpd][:dns_server] = "172.16.10.2"
default[:metalprov][:dhcpd][:next_server] = "172.16.10.136"
default[:metalprov][:dhcpd][:subnet] = "172.16.10.0"
default[:metalprov][:dhcpd][:subnet_mask] = "255.255.255.0"
default[:metalprov][:dhcpd][:broadcast] = "172.16.10.255"
default[:metalprov][:dhcpd][:gateway] = "172.16.10.2"
default[:metalprov][:dhcpd][:host_range] = "172.16.10.150 172.16.10.200"
default[:metalprov][:dhcpd][:interfaces] = ['eth1']
default[:metalprov][:dhcpd][:filename] = "pxelinux.0"

