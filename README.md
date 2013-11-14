Hello Daemon - openwrt package
=====

How to install
------
1. git clone `https://github.com/taka-wang/hello-daemon.git` to OPENWRT_ROOT/package
2. cd ~/OPENWRT_ROOT
3. make defconfig
4. make menuconfig (Marked Utilities -> hello-daemon as M)
5. make package/hello-daemon/compile

License
------
MIT
