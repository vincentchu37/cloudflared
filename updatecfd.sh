if (( EUID != 0 )); then
    echo "Run as root please." 1>&2
    exit 100
fi

wget -P /tmp  https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb &&
sudo apt install /tmp/cloudflared-stable-linux-amd64.deb
rm /tmp/cloudflared-stable-linux-amd64.deb