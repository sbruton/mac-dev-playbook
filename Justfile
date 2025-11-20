@_default:
    just --list

# Regenerate the README table of contents.
generate-toc-readme:
	bin/update-toc.sh README.md
