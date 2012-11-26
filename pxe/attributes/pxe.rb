default[:pxe][:dhcp][:dns_server] = "10.10.1.250"
default[:pxe][:dhcp][:next_server] = "10.10.1.251"
default[:pxe][:dhcp][:subnet] = "10.10.1.0"
default[:pxe][:dhcp][:subnet_mask] = "255.255.255.0"
default[:pxe][:dhcp][:host_range] = "10.10.1.150 10.10.1.200"
default[:pxe][:dhcp][:interfaces] = ['eth0']
