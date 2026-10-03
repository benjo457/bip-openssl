# bip-openssl

Windows openssl installer in user mode

## MSYS2 compilation
```
/usr/bin/perl ./Configure --prefix=$PWD/dist no-idea no-mdc2 no-rc5 shared mingw64
make build_sw
make install_sw
make install_ssldirs 
```

## INNO Setup installer
see ISS file
