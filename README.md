DoH server setup script using cloudflared
--
Run this script as root if you want DNS over HTTPS on a Ubuntu host. (Tested with Ubuntu 20.04). Results may vary with other OS's

Make sure you setup your firewall rules properly, this script won't do any of that.

Default Settings:
Listens on 0.0.0.0:53 (hince why you need root)

Uses https://security.cloudflare-dns.com/dns-query as a primary to block malware and other bad sites.
-- If you don't care about this change this to https://1.1.1.1/dns-query or whatever.

Uses https://1.0.0.1/dns-query as a secondary.

Updating
--
Run updatecfd.sh as root :)