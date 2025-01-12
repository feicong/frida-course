# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)
#!/bin/env bash

valac hello.vala --pkg gobject-2.0
rm -f hello hello.c

valac -C hello.vala
cc -g hello.c $(pkg-config --cflags --libs gobject-2.0) -o hello
# rm -f hello

gcc -static hello.c $(pkg-config --cflags --libs --static gobject-2.0) -o hello_static
# rm -f hello_static

echo done.
