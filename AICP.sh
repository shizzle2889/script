cd /home/shizzle2889/android/AICP # Set Base Directory
wget -O .repo/local_manifests/roomservice.xml https://raw.githubusercontent.com/triplr-dev/local_manifests/aicp-p9.0/master.xml # Pull roomservice.xml
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags # Sync Repository
. build/envsetup.sh # Set build
lunch aicp_tblte-userdebug && make bacon -j$(nproc --all) # Make TBLTE
mv /ssd_home/OUT_DIR/AICP/target/product/tblte/aicp_tblte_p-14*.zip /home/shizzle2889/OUT/AICP/TBLTE/ # Move for Upload
lunch aicp_trlte-userdebug && make bacon -j$(nproc --all) # Make TRLTE
mv /ssd_home/OUT_DIR/AICP/target/product/trlte/aicp_trlte_p-14*.zip /home/shizzle2889/OUT/AICP/TRLTE/ # Move for Upload
lunch aicp_trlteduos-userdebug && make bacon -j$(nproc --all) # Make TRLTEDuos
mv /ssd_home/OUT_DIR/AICP/target/product/trlteduos/aicp_trlteduos_p-14*.zip /home/shizzle2889/OUT/AICP/TRLTEDuos/ # Move for Upload
cd /home/shizzle2889/OUT/AICP/TBLTE/ # Change to OUT directory and Upload
for i in $(seq 1 50); do [ $i -gt 1 ] ; gdrive upload --parent 1F3x_inxEuiZn5X_FD4dUaV79xjtiJDGy * && s=0 && break || s=$?; done; (exit $s) # Upload TBLTE
mv /home/shizzle2889/OUT/AICP/TBLTE/* /home/shizzle2889/builds/aicp_tblte.zip # Move build out of OUT directory
cd /home/shizzle2889/OUT/AICP/TRLTE/ # Change to OUT directory and Upload
for i in $(seq 1 50); do [ $i -gt 1 ] ; gdrive upload --parent 1pVxrwCbj_ife-LUhqoICVOaeoVZOJZkG * && s=0 && break || s=$?; done; (exit $s) # Upload TRLTE
mv /home/shizzle2889/OUT/AICP/TRLTE/* /home/shizzle2889/builds/aicp_trlte.zip # Move build out of OUT directory
cd /home/shizzle2889/OUT/AICP/TRLTEDuos/ # Change to OUT directory and Upload
for i in $(seq 1 50); do [ $i -gt 1 ] ; gdrive upload --parent 1HEOMlxXJ-VqURvFs-8bm4PuLX7Zq_CTA * && s=0 && break || s=$?; done; (exit $s) # Upload TRLTEDuos
mv /home/shizzle2889/OUT/AICP/TRLTEDuos/* /home/shizzle2889/builds/aicp_trlteduos.zip # Move build out of OUT directory
cd /home/shizzle2889/android/AICP && make clean # Clean OUT_DIR