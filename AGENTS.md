## Ansible Playbook Rules

- You are targeting macOS 26 (Tahoe)
- Always run `yamllint` when making any changes to ensure that the playbook syntax is valid.
- Always run `ansible-lint` when making any changes to ensure that the playbook semantics is valid.
- Regenerate the table-of-contents any time you modify README.md by running `just generate-toc-readme`