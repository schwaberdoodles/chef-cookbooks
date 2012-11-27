default[:pxe][:dhcpd][:dns_server] = "10.10.1.250"
default[:pxe][:dhcpd][:next_server] = "10.10.1.251"
default[:pxe][:dhcpd][:subnet] = "10.10.1.0"
default[:pxe][:dhcpd][:subnet_mask] = "255.255.255.0"
default[:pxe][:dhcpd][:host_range] = "10.10.1.150 10.10.1.200"
default[:pxe][:dhcpd][:interfaces] = ['eth0']
default[:pxe][:dhcpd][:filename] = "pxelinux.0"

default[:pxe][:dhcpd][:hosts] = ['esxi1', 'esxi2']