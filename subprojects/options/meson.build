project('options', 'vala', 'c')

src = files('main.vala')

vala_flags = []

if get_option('enable_feature_a')
    vala_flags += ['--define=HAVE_A']
    message('Feature A is enabled.')
endif

if get_option('enable_feature_b')
    vala_flags += ['--define=HAVE_B']
    message('Feature B is enabled.')
endif

add_project_arguments(vala_flags, language: 'vala')

executable('options', src, dependencies : [dependency('glib-2.0')])
