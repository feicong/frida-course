# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)
frida_version = '16.6.6'
frida_devkit_url = ''

if host_machine.system() == 'darwin'
    message('macOS detected.')
    arch = host_machine.cpu_family() == 'aarch64' ? 'macos-arm64' : 'macos-x86_64'
elif host_machine.system() == 'windows'
    message('Windows detected.')
    arch = host_machine.cpu_family() == 'aarch64' ? 'windows-arm64' : 'windows-x86_64'
elif host_machine.system() == 'linux'
    message('Linux detected.')
    arch = host_machine.cpu_family() == 'aarch64' ? 'linux-arm64' : 'linux-x86_64'
elif host_machine.system() == 'android'
    message('Android detected.')
    arch = host_machine.cpu_family() == 'aarch64' ? 'android-arm64' : 'android-x86_64'
endif

frida_devkit_url = 'https://github.com/frida/frida/releases/download/' + frida_version + '/frida-core-devkit-' + frida_version + '-' + arch + '.tar.xz'
frida_devkit_dir = 'frida-core-devkit'

if run_command(['test', '-d', frida_devkit_dir]).returncode() != 0
    message('frida-core-devkit不存在，正在下载...')
    run_command('wget', frida_devkit_url, '-O', 'frida-core-devkit.tar.xz', check: true)
    run_command('mkdir', '-p', frida_devkit_dir, check: true)
    run_command('tar', '-xvf', 'frida-core-devkit.tar.xz', '-C', frida_devkit_dir, '--strip-components=1', check: true)
else
    message('frida-core-devkit已存在，跳过下载。')
endif

inc_dir = include_directories(frida_devkit_dir)
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

executable(
    'frida-core-example',
    'frida-core-devkit/frida-core-example.c',
    include_directories: inc_dir,
    cpp_args: ['-ffunction-sections', '-fdata-sections'],
    link_args: '-Wl,--export-dynamic',
    dependencies: [frida_dep],
)
