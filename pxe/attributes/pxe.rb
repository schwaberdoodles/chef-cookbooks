default[:pxe][:dhcpd][:dns_server] = "10.10.1.250"
default[:pxe][:dhcpd][:next_server] = "10.10.1.251"
default[:pxe][:dhcpd][:subnet] = "10.10.1.0"
default[:pxe][:dhcpd][:subnet_mask] = "255.255.255.0"
default[:pxe][:dhcpd][:broadcast] = "10.10.1.255"
default[:pxe][:dhcpd][:gateway] = "10.10.1.1"
default[:pxe][:dhcpd][:host_range] = "10.10.1.150 10.10.1.200"
default[:pxe][:dhcpd][:interfaces] = ['eth0']
default[:pxe][:dhcpd][:filename] = "pxelinux.0"
default[:pxe][:dhcpd][:databag] = "dhcpd"


default[:pxe][:ucs][:ip] = '192.168.73.131'
default[:pxe][:ucs][:username] = 'admin'
default[:pxe][:ucs][:password] = 'admin'


default[:pxe][:releases] = [
    { :dist => "ubuntu-12.04", :path => "http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-amd64/current/images/netboot/netboot.tar.gz" },
    { :dist => "debian-6.0.5", :path => "http://ftp.debian.org/debian/dists/squeeze/main/installer-amd64/current/images/netboot/netboot.tar.gz" }
]

# add list(s) for your target node(s)
default[:pxe][:servers] = [
  { :mac => "00:d0:59:cb:71:f3", :release => "ubuntu-12.04", :ip => "192.168.1.191", :hostname => "foo" },
  { :mac => "00:1c:25:74:ef:79", :release => "debian-6.0.5", :ip => "192.168.1.190", :hostname => "watto" }
]