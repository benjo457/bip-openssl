# Windows openssl installer
using MSYS2 for windows compilation + INNO Setup for installer creation
## MSYS2 compilation
```
/usr/bin/perl ./Configure --prefix=$PWD/dist no-idea no-mdc2 no-rc5 shared mingw64
make build_sw
make install_sw
make install_ssldirs 
```
## INNO Setup installer
works in user mode for now
## OpenSSL versions
release LTS versions preferably
[![OpenSSL release life cycle](https://openssl-library.org/images/release_life_cycle.svg)](https://openssl-library.org/roadmap/index.html)

