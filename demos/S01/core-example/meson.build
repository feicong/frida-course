# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)

host_os_family = host_machine.system()
frida_version = '16.5.9'
frida_devkit_url = 'https://github.com/frida/frida/releases/download/' + frida_version + '/frida-core-devkit-' + frida_version + '-linux-arm64.tar.xz'

if host_os_family == 'darwin'
    message('macOS detected, not compiling frida-core-example.')
else
    # 定义开发包目录（相对路径）
    frida_devkit_dir = 'frida-core-devkit'

    # 检查 frida-core-devkit 是否存在
    if run_command(['test', '-d', frida_devkit_dir], check: true).returncode() != 0
        message('frida-core-devkit 不存在，正在下载...')
        run_command('wget', frida_devkit_url, '-O', 'frida-core-devkit.tar.xz', check: true)
        run_command('mkdir', '-p', frida_devkit_dir, check: true)
        run_command('tar', '-xvf', 'frida-core-devkit.tar.xz', '-C', frida_devkit_dir, '--strip-components=1', check: true)
        run_command('rm', 'frida-core-devkit.tar.xz', check: true)
    else
        message('frida-core-devkit 已存在，跳过下载。')
    endif

    # 包含头文件路径（使用 include_directories）
    inc_dir = include_directories(frida_devkit_dir)

    # 设置 C 编译器和依赖
    cc = meson.get_compiler('c')
    prebuilt = cc.find_library('frida-core', dirs: meson.current_source_dir() + '/' + frida_devkit_dir)
    frida_dep = declare_dependency(
        include_directories: inc_dir,
        dependencies: [
            prebuilt,
            cc.find_library('dl'),
            cc.find_library('m'),
            cc.find_library('resolv'),
            cc.find_library('pthread'),
        ],
    )

    # 定义可执行文件
    executable(
        'frida-core-example',
        'frida-core-example.c',
        include_directories: inc_dir,
        cpp_args: ['-ffunction-sections', '-fdata-sections'],
        link_args: '-Wl,--export-dynamic',
        dependencies: [frida_dep],
    )
endif
