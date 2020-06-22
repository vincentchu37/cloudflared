#check if root
if (( EUID != 0 )); then
    echo "Run as root please." 1>&2
    exit 100
fi

# install cloudflared
curl -L https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb --output /tmp/cloudflared.deb
apt-get install -y /tmp/cloudflared.deb
#change system resolver to localhost
cp /dev/null /etc/resolv.conf
echo "nameserver 127.0.0.1" > /etc/resolv.conf
mkdir /etc/cloudflared/
# write default cloudflared config
echo "
proxy-dns: true
proxy-dns-port: 53
proxy-dns-address: 0.0.0.0
proxy-dns-upstream:
- https://security.cloudflare-dns.com/dns-query
- https://1.0.0.1/dns-query
" > /etc/cloudflared/config.yml
# install the cloudflared service
cloudflared service install
# disable systemd-resolved from startup
systemctl disable systemd-resolved
# stop systemd-resolved service
systemctl stop systemd-resolved
# enable cloudflared on system start
systemctl enable cloudflared
# start cloudflared
systemctl start cloudflared
rm /tmp/cloudflared.deb
