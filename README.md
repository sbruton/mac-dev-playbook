# Ansible Playbook for Rust-Focused Development on macOS

[![CI][badge-gh-actions]][link-gh-actions]

This repository contains an Ansible playbook and supporting scripts to configure macOS for software development. It is weighted towards [Rust] development targeting standard operating systems, WASM-based web development, mobile and embedded devices. This playbook borrows from the work done by Jeff Geerling and others in [geerlingguy/mac-dev-playbook].

## Configuring Remote Mac

Upon a fresh install of macOS, complete the post-install wizard to setup your initial user and optionally connect the Mac to iCloud. Once the Mac is connected to the network, you can proceed with the remote playbook execution.

1. **Pre-Configuration on Remote Mac:** Remote login (SSH) support must be enabled on the Mac to be configured with Ansible. Run the following commands to enable SSH and display the user and hostname information necessary to target the device from the Ansible host.
    
    ```sh
    # Enable Remote Login
    sudo systemsetup -setremotelogin on

    # Show Username
    whoami

    # Show Hostname
    hostname
    ```

1. **Run Playbook:** A convienence script is provided that will run the Ansible playbook to configure the remote Mac using the target device's hostname and username. You will be prompted for the user's password.
    ```sh
    ./bin/remote.sh <hostname> <username>
    ```

## Configuring Local Mac

> [!NOTE] TODO
> Add instructions on how to prepare a fresh macOS installation for running an Ansible playbook.

> [!NOTE]
> **TODO:** Add instructions on how to run the playbook against the local Mac.

[badge-gh-actions]: https://github.com/sbruton/mac-dev-playbook/actions/workflows/ci.yml/badge.svg
[link-gh-actions]: https://github.com/sbruton/mac-dev-playbook/actions/workflows/ci.yml
[Rust]: https://rust-lang.org
[geerlingguy/mac-dev-playbook]: https://github.com/geerlingguy/mac-dev-playbook/