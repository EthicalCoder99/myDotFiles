sudo apt install grub-efi grub2-common grub-customizer
sudo grub-install
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

# In the grub-customizer
# Go to File -> Change Environment
# In OUTPUT_FILE : /boot/efi/EFI/pop/grub.cfg
# Click on `Save this configuration`
# Click Save button