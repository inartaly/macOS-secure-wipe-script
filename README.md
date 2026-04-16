# macOS Secure Disk Wipe Utility

A safe, interactive macOS Terminal tool for **securely erasing rotating hard drives (HDDs)** using `diskutil secureErase`, with clear explanations, guardrails, and explicit confirmation before any destructive action is taken.

This project was created to address changes in macOS Tahoe (macOS 26), where secure erase options were removed from Disk Utility’s GUI and are now only available via Terminal.

---

## ⚠️ IMPORTANT WARNING

**This tool permanently destroys all data on the selected disk.**

- There is **NO undo**
- There is **NO recovery**
- Use **ONLY** on disks you fully intend to erase

If you are unsure, **do not proceed**.

---

## 🚫 About SSDs

This tool is **intended for spinning hard drives (HDDs)** only.

macOS does **not** reliably support secure overwrite operations on SSDs due to wear‑leveling. For SSDs, Apple recommends FileVault and standard erase, not multi‑pass overwrites.

Future versions of this project may enforce HDD‑only checks automatically.

---

## ✨ Features

- Interactive menu explaining all `diskutil secureErase` options
- Matches secure erase options documented for macOS Tahoe+
- Displays all available disks before prompting
- Requires *manual typing of confirmation* before starting
- Uses Apple‑supported system tools (no third‑party dependencies)
- Designed for IT, asset disposal, and lab environments

---

## 🔐 Secure Erase Options

When running the script, you can choose one of the following options:

| Option | Description |
|------:|-------------|
| `0` | Single‑pass erase (zero fill) – fastest |
| `1` | Single‑pass erase (random data) |
| `2` | Seven‑pass secure erase (very slow) |
| `3` | Gutmann 35‑pass erase (historical, extreme overkill) |
| `4` | Three‑pass secure erase (DoD‑style balance) |

⚠️ **Options 2–4 can take many hours or even days on large drives.**

---

## 🧰 Requirements

- macOS Tahoe (macOS 26) or later
- Administrator privileges
- Target disk must **not** be the current boot disk
- Intended for **external HDDs** or detached internal drives

---

## 🚀 Usage

1. Clone the repository

git clone https://github.com/your-username/macos-secure-disk-wipe.git
cd macos-secure-disk-wipe

2. Make the script executable
chmod +x secure-wipe.sh


3. Run the script
./secure-wipe.sh


