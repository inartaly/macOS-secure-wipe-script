#!/bin/bash

# Secure Disk Wipe Script for macOS (Tahoe+)
# Uses diskutil secureErase
# Inspired by Jeff Geerling's macOS Tahoe article

echo "================================================="
echo " macOS Secure Disk Wipe Utility"
echo "================================================="
echo
echo "This tool will PERMANENTLY erase a disk."
echo "Use ONLY on old spinning hard drives (HDDs)."
echo
echo "Secure erase options:"
echo
echo " 0 - Single-pass zero fill"
echo "     Writes zeros to the entire disk."
echo "     Fastest option."
echo
echo " 1 - Single-pass random fill"
echo "     Writes random data once."
echo "     Slightly more secure than option 0."
echo
echo " 2 - Seven-pass erase"
echo "     Writes data seven times."
echo "     EXTREMELY slow on large drives."
echo
echo " 3 - Gutmann 35-pass erase"
echo "     Historic 35-pass method."
echo "     Overkill for modern drives."
echo
echo " 4 - Three-pass erase (DoD-style)"
echo "     Good balance of security and time."
echo

read -p "Enter the erase option number (0–4): " ERASE_OPTION

case "$ERASE_OPTION" in
  0|1|2|3|4)
    ;;
  *)
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac

echo
echo "Available disks:"
echo "-------------------------------------------------"
diskutil list
echo "-------------------------------------------------"
echo
echo "Example disk identifier: /dev/disk9"
echo

read -p "Enter the disk identifier to erase: " DISK_ID

if [[ ! "$DISK_ID" =~ ^/dev/disk[0-9]+$ ]]; then
  echo "Invalid disk identifier format."
  exit 1
fi

echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo " FINAL CONFIRMATION"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo
echo "You are about to run:"
echo
echo "  diskutil secureErase $ERASE_OPTION $DISK_ID"
echo
echo "ALL DATA ON $DISK_ID WILL BE LOST FOREVER."
echo

read -p "Type ERASE to proceed (anything else cancels): " CONFIRM

if [[ "$CONFIRM" != "ERASE" ]]; then
  echo "Operation cancelled."
  exit 0
fi

echo
echo "Starting secure erase..."
echo "This may take a VERY long time."
echo

sudo diskutil secureErase "$ERASE_OPTION" "$DISK_ID"
``
