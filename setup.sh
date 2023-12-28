source /sdcard/ShellEncrypter/.lib/libenc.sh
cd $dir2
pr
pr "[*] Installing Packages..."
pr
install_pkg
pr
pr "[*] Make output directory"
mkdir $SP/output
pr "[*] Building Script.."
if [[ -e "/data/local/tmp/build_date" ]]; then
rm /data/local/tmp/build_date
else
echo "$(date)" >> ${dir2}/.build_date
shc -r -f ${SP}/raw -o ${SP}/enc
cp ${SP}/enc ${dir1} 
chmod +x ${dir1}/enc
fi
pr "[*] Cleaning Up"
rm ${SP}/setup.sh ; rm ${SP}/raw ; rm ${SP}/raw.x.c ; rm ${SP}/enc
pr "[*] Setup Done!."
end