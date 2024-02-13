dir1=/data/data/com.termux/files/usr/bin
dir2=/data/data/com.termux/files/home
SP=/storage/emulated/0/ShellUtility

cl() { clear; }
pr() { echo "$1"; }
inpt() { read -p "$1" "$2"; }
sl() { sleep $1; }
install_pkg() {
pkg update -y ; pkg upgrade -y ; pkg install shc -y ; pkg install binutils -y ; pkg install nano -y; pkg install git -y; pkg install libandroid-wordexp -y; pkg install busybox; busybox --install $PREFIX/bin
# detect if libpolly installed
if [[ $(pkg list-installed) == *libpolly* ]]; then
pkg clean ; pkg uninstall libpolly -y
fi
}

end() { exit 0; }
abort() { exit 1; }
open_telegram() { am start -a android.intent.action.VIEW -d https://t.me/gacorpkjrt; }
update_packages() {
    clear
    sleep 2s
    echo
    echo "[*] Please wait..."
    echo
    pkg update -y ; pkg upgrade -y ; pkg install shc -y ; pkg install binutils -y ; pkg install nano -y; pkg install git -y; pkg install libandroid-wordexp -y; pkg install busybox -y; busybox --install $PREFIX/bin
    echo 
    echo "[*] Done"
    sleep 3s
    menu
}
uninstall_script() {
cl
sl 2s
pr "[*] Uninstalling script..."
sl 3s
rm -f ${dir1}/enc
rm -f ${dir1}/dec
rm -f ${dir2}/.build_date
rm -rf ${SP}
$HOME/.ssc/uninstall.sh
pr "[*] Done!, See you:)"
end
}
edit_decrypter_script() { 
nano ${dir1}/dec; menu
}