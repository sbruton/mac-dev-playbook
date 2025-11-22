#!/usr/bin/env bash

# cspell:ignore getline, gsub, IGNORECASE, tocfile

set -euo pipefail

FILE="${1:-README.md}"
START_MARKER="<!-- toc:start -->"
END_MARKER="<!-- toc:end -->"

if ! command -v md-toc >/dev/null 2>&1; then
    echo "error: md-toc is not on PATH; install it with 'cargo install markdown-toc'" >&2
    exit 1
fi

TMP_TOC="$(mktemp)"
TMP_CLEAN="$(mktemp)"
TMP_OUTPUT="$(mktemp)"
cleanup() {
    rm -f "$TMP_TOC" "$TMP_CLEAN" "$TMP_OUTPUT"
}
trap cleanup EXIT

md-toc "$FILE" --header "" --bullet "-" --indent 2 --min-depth 1 --max-depth 3 > "$TMP_TOC"

awk '
    BEGIN { IGNORECASE = 1 }
    {
        trimmed = $0
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", trimmed)
        if (trimmed == "") next
        if (index(trimmed, "(#table-of-contents)")) next
        print $0
    }
' "$TMP_TOC" > "$TMP_CLEAN"

awk -v start="$START_MARKER" -v end="$END_MARKER" -v tocfile="$TMP_CLEAN" '
    BEGIN {
        while ((getline line < tocfile) > 0) {
            toc[++toc_len] = line
        }
        close(tocfile)
        if (toc_len == 0) {
            print "error: toc generator produced no entries" > "/dev/stderr"
            exit 1
        }
    }
    {
        if (!saw_start) {
            print $0
            if (index($0, start)) {
                for (i = 1; i <= toc_len; ++i) print toc[i]
                saw_start = 1
            }
            next
        }

        if (saw_start && !saw_end) {
            if (index($0, end)) {
                print $0
                saw_end = 1
            }
            next
        }

        print $0
    }
    END {
        if (!saw_start) {
            print "error: missing toc start marker" > "/dev/stderr"
            exit 1
        }
        if (!saw_end) {
            print "error: missing toc end marker" > "/dev/stderr"
            exit 1
        }
    }
' "$FILE" > "$TMP_OUTPUT"

mv "$TMP_OUTPUT" "$FILE"
