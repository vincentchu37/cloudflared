[DoH](https://en.wikipedia.org/wiki/DNS_over_HTTPS) server setup script using cloudflared
--
### Perfect for a pihole forwarder or anything really that needs a forwarder really.

**If you plan on using this on a machine *with pihole or something that listens on port 53 use the friendly script* which will play nice with the default :53 server on the host!**

Run script as root if you want DNS over HTTPS on a Ubuntu host. (Tested with Ubuntu 20.04). Results may vary with other OS's

Make sure you setup your firewall rules properly, this script won't do any of that. It could, but I don't want to break your stuff.

Default Settings for installcfd.sh:
* Listens on 0.0.0.0:53 (hince why you need root)

* Uses https://security.cloudflare-dns.com/dns-query as a primary to block malware and other bad sites. If you don't care about this change this to https://1.1.1.1/dns-query or whatever.
    
* Uses https://1.0.0.1/dns-query as a secondary in case the primary DNS server goes down.

Default Settings for installcfd-friendly.sh:
* Listens on 0.0.0.0:5353 (still need root to install packages)

* Everything else the same as the normal script


Updating
--
Run updatecfd.sh as root, applies to both scripts :)