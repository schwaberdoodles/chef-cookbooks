default[:pxe][:dhcpd][:dns_server] = "192.168.73.250"
default[:pxe][:dhcpd][:next_server] = "192.168.73.136"
default[:pxe][:dhcpd][:subnet] = "192.168.73.0"
default[:pxe][:dhcpd][:subnet_mask] = "255.255.255.0"
default[:pxe][:dhcpd][:broadcast] = "192.168.73.255"
default[:pxe][:dhcpd][:gateway] = "192.168.73.1"
default[:pxe][:dhcpd][:host_range] = "192.168.73.150 192.168.73.200"
default[:pxe][:dhcpd][:interfaces] = ['eth0']
default[:pxe][:dhcpd][:filename] = "pxelinux.0"
default[:pxe][:dhcpd][:databag] = "dhcpd"


default[:pxe][:ucs][:ip] = '192.168.73.131'
default[:pxe][:ucs][:username] = 'admin'
default[:pxe][:ucs][:password] = 'admin'


default[:pxe][:linux][:releases] = [
    { :dist => "ubuntu-12.04", :path => "http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-amd64/current/images/netboot/netboot.tar.gz" },
    { :dist => "debian-6.0.5", :path => "http://ftp.debian.org/debian/dists/squeeze/main/installer-amd64/current/images/netboot/netboot.tar.gz" }
]

default[:pxe][:preseed][:username] = "chef"
default[:pxe][:preseed][:password] = "chef101"

# # add list(s) for your target node(s)
# default[:pxe][:servers] = [
#   { :mac => "00:50:56:3A:76:F0", :release => "ubuntu-12.04", :ip => "192.168.73.198", :hostname => "node1" },
#   { :mac => "00:1c:25:74:ef:79", :release => "debian-6.0.5", :ip => "192.168.73.190", :hostname => "node2" }
# ]

# add list(s) for your target node(s)
default[:pxe][:servers] = [
  { :release => "ubuntu-12.04"},
  { :release => "debian-6.0.5"}
]