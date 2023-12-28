dir1=/data/data/com.termux/files/usr/bin
dir2=/data/data/com.termux/files/home
SP=/storage/emulated/0/ShellEncrypter

function cl() {
clear
}

function pr() {
echo "$1"
}

function inpt() {
read -p "$1" $2
}

function sl() {
sleep $1 
}

function install_pkg() {
pkg update -y ; pkg upgrade -y ; pkg install libpolly -y ; pkg install shc -y ; pkg install binutils -y
}

function end() {
exit 0
}

function abort() {
exit 1
} 
