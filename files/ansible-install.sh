#!/usr/bin/env bash
set -euo pipefail

export ANSIBLE_ROLES_PATH="$HOME/.ansible/roles"
export ANSIBLE_COLLECTIONS_PATH="$HOME/.ansible/collections"
mkdir -p "$ANSIBLE_ROLES_PATH" "$ANSIBLE_COLLECTIONS_PATH"

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -Syu --noconfirm ansible
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible
else
  echo "Unsupported package manager. Please install Ansible manually." >&2
  exit 1
fi

ansible-galaxy collection install --force --collections-path "$ANSIBLE_COLLECTIONS_PATH" community.general
ansible-galaxy install --force --roles-path "$ANSIBLE_ROLES_PATH" gantsign.visual-studio-code
ansible-galaxy install --force --roles-path "$ANSIBLE_ROLES_PATH" robertdebock.autofs