source /sdcard/ShellUtility/.lib/libenc.sh
cd $dir2
pr
pr "[*] Installing Packages..."
pr
install_pkg
pr
pr "[*] Make output directory"
mkdir $SP/output
pr "[*] Building Script.."
if [[ -e "${dir2}/.build_date" ]]; then
rm ${dir2}/.build_date
else
echo "$(date)" >> ${dir2}/.build_date
shc -r -f ${SP}/raw -o ${SP}/enc
cp ${SP}/enc ${dir1} 
chmod 777 ${dir1}/enc
cp ${SP}/dec ${dir1} 
chmod 777 ${dir1}/dec
fi
pr "[*] Cleaning Up"
rm ${SP}/setup.sh ; rm ${SP}/raw ; rm ${SP}/raw.x.c ; rm ${SP}/enc ; rm ${SP}/dec
pr "[*] Setup Done!."
end