# Windows openssl installer
[OpenSSL library](https://openssl-library.org/) compiled for Windows x86-64 with mingw64.
## Compilation
```
/usr/bin/perl ./Configure --prefix=$PWD/dist no-idea no-mdc2 no-rc5 shared mingw64
make build_sw
make install_sw
make install_ssldirs 
```
## Installation
Done with [Inno Setup](https://jrsoftware.org/isinfo.php)
## OpenSSL versions
release LTS versions preferably
[![OpenSSL release life cycle](https://openssl-library.org/images/release_life_cycle.svg)](https://openssl-library.org/roadmap/index.html)

