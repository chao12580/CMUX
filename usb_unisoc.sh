##############################################
# Filename: usb_sprd.sh
# date: 2019/12/26
# author: simon.tang
# email: simon.tang@unisoc.com
# Description: check usb of SPRD
# Note: need add usb rules to find ttyUSB*
##############################################
sudo /sbin/modprobe usbserial
sudo /bin/sh -c 'echo 1782 4038 > /sys/bus/usb-serial/drivers/generic/new_id'

lsusb
lsubs -t
cd /sys/bus/usb/devices/
cd 2-1.2:1.2

sleep 1
echo "usb_sprd start"
for i in $(ls /dev/ |grep sprd_*);do
  rm /dev/$i
done
echo "usb_sprd rm done"
for i in $(ls /sys/class/tty/ |grep ttyUSB);do
  cd $(readlink -f /sys/class/tty/$i/device)
  portn=$(pwd |rev |awk -F \/ '{print $2}' |cut -c 1-1)
  cd ../../
echo "usb_sprd find $i"
if [ ! -b "$(pwd)/idVendor" ];then
  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "402A"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	6)
	  cd /dev/
	  echo "$i $portn is acm"
	  ln -s $i sprd_acm
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi


  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "0925"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	6)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4030"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	6)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4031"x ];then
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4032"x ];then
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4033"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	5)
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4026"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	6)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4027"x ];then
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is diag"
	  ln -s $i sprd_diag
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4028"x ];then
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is log"
	  ln -s $i sprd_log
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	5)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi

  if [ $(cat idVendor)x = "1782"x ];then
    if [ $(cat idProduct)x = "4029"x ];then
      echo "$i is sprd_usb"
      case $portn in
	2)
	  cd /dev/
	  echo "$i $portn is at"
	  ln -s $i sprd_at
	  ;;
	3)
	  cd /dev/
	  echo "$i $portn is modem"
	  ln -s $i sprd_modem
	  ;;
	4)
	  cd /dev/
	  echo "$i $portn is adb"
	  ln -s $i sprd_adb
	  ;;
	5)
	  ;;
	6)
	  ;;
	7)
	  ;;
      esac
      continue
    fi
  fi
fi
done
	
