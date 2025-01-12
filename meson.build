# Copyright (c) 2024-2025 fei_cong(https://github.com/feicong/frida-course)
project(
	'vala app',
	'vala',
	'c',
	'cpp',
	default_options: ['warning_level=1', 'cpp_std=c++14'],
)

# 关闭编译时警告
add_project_arguments('--disable-warnings', language: 'vala')
add_project_arguments('-w', language: 'c')
add_project_arguments('-w', language: 'cpp')

vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

subdir('demos/S01')
subproject('options')