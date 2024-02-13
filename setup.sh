source /sdcard/ShellUtility/.lib/libenc.sh
cd $dir2
pr
pr "[*] Installing Packages..."
pr
install_pkg
pr
pr "[*] Cloning SSC Repository..."
if [[ -d "$HOME/.ssc" ]]; then
$HOME/.ssc/uninstall.sh > /dev/null
fi
git clone --depth=1 https://github.com/eraselk/ssc-android ssc
rm -rf $HOME/ssc/examples
chmod 777 $HOME/ssc/*; $HOME/ssc/inject.sh > /dev/null
pr
pr "Q: Are you a root user? [y/n]"
inpt ": " akar
pr ""
if [[ $akar == "y" ]]; then
   pkg install tsu -y > /dev/null
   rm -f ${SP}/rawnon ${SP}/decnon
   mv -f ${SP}/rawroot ${SP}/enc
   mv -f ${SP}/decroot ${SP}/dec
elif [[ $akar == "n" ]]; then
    rm -f ${SP}/rawroot ${SP}/decroot
    mv -f ${SP}/rawnon ${SP}/enc
    mv -f ${SP}/decnon ${SP}/dec
else
  pr "Blud, use your brain."
  exit 1
fi  
pr "[*] Make output directory"
mkdir $SP/output
pr "[*] Building Script.."
if [[ -e "${dir2}/.build_date" ]]; then
rm -f ${dir2}/.build_date
fi
if [[ -e "${dir1}/enc" ]]; then 
rm -f ${dir1}/enc
fi
if [[ -e "${dir1}/dec" ]]; then
rm -f ${dir1}/dec
fi
echo "$(date)" > ${dir2}/.build_date
mv -f ${SP}/enc ${dir1}; chmod 777 ${dir1}/enc
mv -f ${SP}/dec ${dir1}; chmod 777 ${dir1}/dec
pr "[*] Cleaning Up"
rm -f ${SP}/setup.sh; rm -f ${SP}/raw; rm -f ${SP}/raw.x.c
pr "[*] Setup Done!."
end