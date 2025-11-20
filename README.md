# Ansible Playbook for Development on macOS

[![CI][badge-gh-actions]][link-gh-actions]

<!-- cspell:ignore nmap, lsusb, nvim, difft, fblog, procs, deadlinks, systemsetup, setremotelogin -->

This repository contains an Ansible playbook and supporting scripts to configure macOS for software and hardware development. It covers end-to-end product development–ideation, design, planning, software/hardware development, modeling, manufacturing, and testing.

The tooling included is quite opinionated based on technologies I am currently using personally and professionally. If you are into Rust-based software development, making things (electronics, 3D printing, machining), or cybersecurity then you may find this playbook useful as a starting point for your own Mac configuration.

<!-- toc:start -->
- [Playbook-Installed Software](#playbook-installed-software)
  - [Applications](#applications)
  - [Command-Line Tools](#command-line-tools)
  - [Rust Components](#rust-components)
  - [Miscellaneous Items](#miscellaneous-items)
- [Configuring a Remote Mac](#configuring-a-remote-mac)
- [Configuring a Local Mac](#configuring-a-local-mac)
- [License and Attribution](#license-and-attribution)
<!-- toc:end -->

## Playbook-Installed Software

### Applications

| Application Type | Application | Description |
| --- | --- | --- |
| CAD/CAM | [Autodesk Fusion] | 3D parametric modeling |
| CAD/CAM | [Blender] | 3D creation suite |
| CAD/CAM | [KiCad] | Electronics schematic capture and PCB design |
| CAD/CAM | [OmniGraffle] | Diagraming tool for flowcharts, floor plans, layouts, etc |
| CAD/CAM | [OpenSCAD] | Programmable 3D solid modeler |
| CAD/CAM | [OrcaSlicer] | 3D model gcode path generation for FDM/FFF printers |
| Communication | [Discord] | Community-based chat service |
| Communication | [Slack] | Group-based chat service |
| Communication | [Zoom] | Video conferencing |
| Development | [Postman] | HTTP API design, testing, and emulation |
| Development | [Visual Studio Code] | Extensible, language-agnostic IDE |
| Networking | [Proton VPN] | VPN service client |
| Secrets Management | [1Password] | GUI and CLI interfaces to 1Password |
| Terminal Emulator | [Alacritty] | Fast, modern hardware-accelerated terminal emulator |
| Virtualization | [Docker] | Container-based virtualization |
| Virtualization | [Tart] | Apple silicon virtualization |
| Web Browser | [Brave] | Privacy-first, security-aware, chromium-based browser |
| Web Browser | [Firefox Developer Edition] | Another browser with privacy and security focus |

### Command-Line Tools

This playbook includes an opinionated mix of modern and traditional Linux/Unix command line utilities for software development, general systems operation, and cybersecurity.

| Tool Type | Command | Description |
| --- | --- | --- |
| Cybersecurity | [`nmap`] | Network port scanner |
| Cybersecurity | [`openssl`] | Cryptographic functions |
| Development Util | [`gh`] | GitHub CLI |
| Development Util | [`git`] | Git Revision Control |
| Development Util | [`just`] | Command runner; modern `make` replacement |
| Development Util | [`md-toc`] | Markdown table-of-contents generator |
| Development Util | [`mdbook`] | Markdown-based static-book generator; typically used for docs |
| Development Util | [`twiggy`] | WASM binary size inspection |
| Device Management | [`lsusb`] | USB device information |
| Editor | [`nvim`] | Neovim `vim`-based editor |
| File Inspection | [`bat`] | Syntax-highlighting, git-integrated, code-friendly `cat` replacement |
| File Inspection | [`difft`] | Syntax-aware diff tool |
| File Inspection | [`fblog`] | JSON log file viewer |
| File Inspection | [`ripgrep`] | Regular expression parser; modern `grep` replacement |
| File System Util | [`dust`] | Disk usage information; modern `du` replacement |
| File System Util | [`eza`] | File listing; modern `ls` replacement |
| File System Util | [`fd`] | File finder; modern `find` replacement |
| File System Util | [`xz`] | File compression |
| File System Util | [`watchexec`] | Run commands when files change |
| Process Management | [`htop`] | Interactive process and resource monitor |
| Process Management | [`procs`] | Process information; modern `ps` replacement |
| Shell Util | [`asciinema`] | Terminal capture and playback |
| Shell Util | [`atuin`] | Shell history search and sync |
| Shell Util | [`tmux`] | Multi-terminal manager |

### Rust Components

| Component Type | Component | Description |
| --- | --- | --- |
| Binary Utility | [`cargo-bloat`] | Executable size inspection |
| Binary Utility | [`cargo-show-asm`] | Assembly and IR inspection |
| Code Inspection | [`cargo-expand`] | Rust macro expansion |
| Code Inspection | [`cargo-tarpaulin`] | Rust code coverage |
| Dependency Management | [`cargo-audit`] | Dependency vulnerability check |
| Dependency Management | [`cargo-auditable`] | Rust binary dependency audit |
| Dependency Management | [`cargo-clone`] | Cargo crate source code fetch |
| Dependency Management | [`cargo-deny`] | Cargo dependency rules |
| Documentation Utility | [`cargo-deadlinks`] | Rust documentation link checker |
| Package Management | [`cargo-deb`] | Debian package generator for Rust projects |
| Package Management | [`cargo-diet`] | Cargo crate cruft detection |
| Package Management | [`cargo-edit`] | CLI cargo dependency management |
| Package Management | [`cargo-generate`] | Rust project template generator |
| Package Management | [`cargo-next`] | CLI cargo crate version management |
| Package Management | [`cargo-rpm`] | RPM package generator for Rust projects |
| Package Management | [`cargo-update`] | Updates binaries installed via Cargo |
| Package Management | [`dioxus-cli`] | Dioxus application generation, runner, and bundler |
| Toolchain | [Rust] Stable | Latest stable Rust compiler, standard lib, and tools |
| Toolchain | [Rust] Nightly | Most recent Rust compiler, standard lib, and tools |

### Miscellaneous Items
| Item | Description |
| --- | --- |
| [JetBrains Mono Font] | Awesome coding font |

## Configuring a Remote Mac

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

1. **Run Playbook:** A convenience script is provided that will run the Ansible playbook to configure the remote Mac using the target device's hostname and username. You will be prompted for the user's password.
    ```sh
    ./bin/remote.sh <hostname> <username>
    ```

## Configuring a Local Mac

> [!NOTE]
> **TODO:** Add instructions on how to prepare a fresh macOS installation for running an Ansible playbook.

> [!NOTE]
> **TODO:** Add instructions on how to run the playbook against the local Mac.

## License and Attribution

This project is distributed under the terms of the MIT License. See [`LICENSE`] for the full text.

This playbook borrows from the work done by Jeff Geerling and others in [geerlingguy/mac-dev-playbook].

[badge-gh-actions]: https://github.com/sbruton/mac-dev-playbook/actions/workflows/ci.yml/badge.svg
[link-gh-actions]: https://github.com/sbruton/mac-dev-playbook/actions/workflows/ci.yml
[Rust]: https://rust-lang.org
[geerlingguy/mac-dev-playbook]: https://github.com/geerlingguy/mac-dev-playbook/
[Autodesk Fusion]: https://www.autodesk.com/products/fusion-360/
[Blender]: https://www.blender.org/
[KiCad]: https://www.kicad.org/
[OmniGraffle]: https://www.omnigroup.com/omnigraffle/
[OpenSCAD]: https://openscad.org/
[OrcaSlicer]: https://github.com/OrcaSlicer/OrcaSlicer/
[Discord]: https://discord.com/
[Slack]: https://slack.com/
[Zoom]: https://zoom.com/
[Postman]: https://www.postman.com/
[Visual Studio Code]: https://code.visualstudio.com/
[Proton VPN]: https://protonvpn.com/
[1Password]: https://1password.com/
[Alacritty]: https://github.com/alacritty/alacritty/
[Docker]: https://docker.com/
[Tart]: https://github.com/cirruslabs/tart/
[Brave]: https://brave.com/
[Firefox Developer Edition]: https://www.firefox.com/en-US/channel/desktop/developer/
[`nmap`]: https://nmap.org/
[`openssl`]: https://openssl.org/
[`gh`]: https://cli.github.com/
[`git`]: https://git-scm.com/
[`just`]: https://github.com/casey/just/
[`md-toc`]: https://github.com/pbzweihander/markdown-toc/
[`mdbook`]: https://github.com/rust-lang/mdBook/
[`twiggy`]: https://github.com/AlexEne/twiggy/
[`lsusb`]: https://github.com/jlhonora/lsusb/
[`nvim`]: https://neovim.io/
[`bat`]: https://github.com/sharkdp/bat/
[`difft`]: https://github.com/Wilfred/difftastic/
[`fblog`]: https://github.com/brocode/fblog/
[`ripgrep`]: https://github.com/BurntSushi/ripgrep/
[`htop`]: https://htop.dev/
[`dust`]: https://github.com/bootandy/dust/
[`eza`]: https://eza.rocks/
[`fd`]: https://github.com/sharkdp/fd/
[`xz`]: https://github.com/tukaani-project/xz/
[`watchexec`]: https://github.com/watchexec/watchexec/
[`procs`]: https://github.com/dalance/procs/
[`asciinema`]: https://asciinema.org/
[`atuin`]: https://atuin.sh/
[`tmux`]: https://github.com/tmux/tmux/
[`cargo-bloat`]: https://github.com/RazrFalcon/cargo-bloat/
[`cargo-show-asm`]: https://github.com/pacak/cargo-show-asm/
[`cargo-expand`]: https://github.com/dtolnay/cargo-expand/
[`cargo-tarpaulin`]: https://github.com/xd009642/tarpaulin/
[`rustc`]: https://rust-lang.org/
[`cargo-audit`]: https://github.com/rustsec/rustsec/
[`cargo-auditable`]: https://github.com/rust-secure-code/cargo-auditable/
[`cargo-clone`]: https://github.com/JanLikar/cargo-clone/
[`cargo-deny`]: https://github.com/EmbarkStudios/cargo-deny/
[`cargo-deadlinks`]: https://github.com/deadlinks/cargo-deadlinks/
[`cargo-deb`]: https://github.com/kornelski/cargo-deb/
[`cargo-diet`]: https://github.com/the-lean-crate/cargo-diet/
[`cargo-edit`]: https://github.com/killercup/cargo-edit/
[`cargo-generate`]: https://github.com/cargo-generate/cargo-generate/
[`cargo-next`]: https://github.com/conventional-commits-rs/cargo-next/
[`cargo-rpm`]: https://github.com/iqlusioninc/cargo-rpm/
[`cargo-update`]: https://github.com/nabijaczleweli/cargo-update/
[`dioxus-cli`]: https://dioxuslabs.com/
[JetBrains Mono Font]: https://www.jetbrains.com/lp/mono/
[`LICENSE`]: ./LICENSE
