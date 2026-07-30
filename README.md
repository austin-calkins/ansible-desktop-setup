# ansible-desktop-setup

This repository contains an Ansible playbook for provisioning a Linux desktop environment with the packages and applications I want available on most systems.

## What this project does

The playbook will:

- install a base set of packages
- add the Flathub remote and install common Flatpak applications
- install Docker support (using the appropriate package manager for the host OS)
- create an `ansible` system user and sudo configuration
- configure an `ansible-pull` cron job so the machine can pull updates from this repository automatically

## Supported operating systems

The playbook is designed to work on:

- Debian/Ubuntu-based systems
- Arch-based systems such as CachyOS

## Prerequisites

Before running the playbook, ensure the system has:

- Python 3
- Ansible
- sudo access

A bootstrap helper script is included at [files/ansible-install.sh](files/ansible-install.sh) to install Ansible and the required dependencies.

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/austin-calkins/ansible-desktop-setup.git
   cd ansible-desktop-setup
   ```

2. Run the bootstrap installer:
   ```bash
   ./files/ansible-install.sh
   ```

3. Run the playbook:
   ```bash
   ansible-playbook local.yml
   ```

## Notes

- On Debian/Ubuntu systems, the playbook uses Debian-style package names where needed.
- On Arch-based systems, package names and package manager behavior are adjusted for CachyOS and similar distributions.
- The playbook uses `community.general` modules, so the bootstrap script installs that collection automatically.
- The cron entry is written directly to the ansible user's cron spool for compatibility with systems that do not provide the `crontab` binary.

## Automated updates

The playbook creates a cron job that runs `ansible-pull` every 10 minutes. If changes are pushed to the main branch of this repository, the system will pull them down automatically.

