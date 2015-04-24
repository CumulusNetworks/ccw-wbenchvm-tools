#!/bin/sh
UID=$(id -u)
INSTALL_SH=$(readlink -f $0)
INSTALL_DIR=$(dirname $INSTALL_SH)
DEST="/usr/local/bin"
BINARIES="cw-clearconsole cw-info cw-mux cw-mux-helper cw-pxehelper cw-swpower"

if [ $UID -ne 0 ]
then
  echo "You must run this script as root" >&2
  exit 1
fi

if [ ! -e $DEST ]
then
  mkdir -p $DEST
  chmod 0755 $DEST
fi

for BIN in $BINARIES
do
  ln -sf $INSTALL_DIR/$BIN $DEST/$BIN
  chmod 0755 $DEST/$BIN
done

exit 0
