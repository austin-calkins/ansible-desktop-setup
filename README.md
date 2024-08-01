# ansible-desktop-setup
this repository holds an ansible script to provision all needed ansible dependencies, and install the majority of applications I keep on every system

## polling updates
the ansible playbook will create a cronjob that polls this respository, any change made to setup, if pushed to main, will then be synced to all of my linux workstations
