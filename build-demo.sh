#!/usr/bin/env bash
# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)

set -euo pipefail
trap 'echo "Error: in $0 on line $LINENO"' ERR

rm -rf builddir
meson setup builddir -Doptions:enable_feature_a=true -Doptions:enable_feature_b=false

meson compile -C builddir

echo "done."
