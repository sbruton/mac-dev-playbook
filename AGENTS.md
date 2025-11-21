## Ansible Playbook Rules

- You are targeting macOS 26 (Tahoe) which has had substantial changes from prior versions of macOS; research macOS configurations and settings to ensure you are using the up-to-date methods
- Always run `yamllint` when making any changes to ensure that the playbook syntax is valid.
- Always run `ansible-lint` when making any changes to ensure that the playbook semantics is valid.
- Regenerate the table-of-contents any time you modify README.md by running `just generate-toc-readme`