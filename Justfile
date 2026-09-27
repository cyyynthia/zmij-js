# SPDX-FileCopyrightText: Cynthia Rey <cynthia@cynthia.dev>
# SPDX-License-Identifier: 0BSD

# Borrowed from ungoogled-chromium which borrowed them from Debian
# Much more sane than the defaults, and generates cleaner patches
export QUILT_PUSH_ARGS    := "--color=auto"
export QUILT_DIFF_OPTS    := "--show-c-function"
export QUILT_PATCH_OPTS   := "--unified --reject-format=unified"
export QUILT_DIFF_ARGS    := "-p ab --no-timestamps --no-index --color=auto"
export QUILT_REFRESH_ARGS := "-p ab --no-timestamps --no-index --strip-trailing-whitespace"
export QUILT_COLORS       := "diff_hdr=1;32:diff_add=1;34:diff_rem=1;31:diff_hunk=1;33:diff_ctx=35:diff_cctx=33"
export QUILT_SERIES_ARGS  := "--color=auto"
export QUILT_PATCHES_ARGS := "--color=auto"

[doc("Alias to `quilt`, with the project's settings pre-applied to generate clean diffs.")]
quilt *args:
	quilt --quiltrc - {{args}}

copy-src:
	cp -r zmij zmij-js
	rm zmij-js/.git

apply-patches:
	quilt push

clean:
	git clean -xdff

make-crate: clean copy-src apply-patches

headers:
	#!/usr/bin/env bash
	lines=$(wc -l < patches/.header)
	for f in "patches/"*; do
		if diff -q <(head -n "$lines" "$f") patches/.header >/dev/null; then continue; fi
		cat patches/.header "$f" > "$f.tmp"
		mv "$f.tmp" "$f"
	done
