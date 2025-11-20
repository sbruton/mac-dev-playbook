# Contributing

## Maintaining Documentation

The README includes an auto-generated table of contents between `<!-- toc:start -->` and `<!-- toc:end -->`. After adding, removing, or renaming headings, regenerate that section:

```sh
just generate-toc-readme
```

The `generate-toc-readme` recipe calls `bin/update-toc.sh`, which wraps the Rust-based [`md-toc`](https://github.com/pbzweihander/markdown-toc) CLI. Install the small dependency stack once per machine:

```sh
cargo install markdown-toc just
# or use Homebrew
brew install markdown-toc just
```

Before sending a pull request, rerun `just generate-toc-readme` and ensure `git status` remains clean. This prevents merge conflicts and keeps the README navigation accurate for everyone.
