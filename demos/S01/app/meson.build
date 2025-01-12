# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)

hello_src = files('hello.vala')

dependencies = [
    dependency('glib-2.0', version: '>=2.38'),
    dependency('gobject-2.0'),
]

executable('hello', hello_src, dependencies: dependencies)

static_depends = [
    dependency('glib-2.0', version: '>=2.38', static:true),
    dependency('gobject-2.0', static:true),
]
host_os_family = host_machine.system()
if host_os_family == 'darwin'
else
    executable('hello_static', hello_src, dependencies: static_depends, link_args: ['-static'])
endif
