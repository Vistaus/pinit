icon_sizes = ['16', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data(
        'icons' / i / meson.project_name() + '.svg',
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i / 'apps'
    )
endforeach

install_data([
    # From elementary/icons, status/symbolic/*
    'icons' / 'symbolic' / 'process-completed-symbolic.svg',
    'icons' / 'symbolic' / 'process-error-symbolic.svg'],
    install_dir: get_option('datadir') / 'icons' / 'hicolor' / 'symbolic' / 'apps'
)

i18n.merge_file(
    input: 'pinit.desktop.in',
    output: meson.project_name() + '.desktop',
    po_dir: meson.project_source_root() / 'po' / 'extra',
    type: 'desktop',
    install: true,
    install_dir: get_option('datadir') / 'applications'
)

i18n.merge_file(
    input: 'pinit.appdata.xml.in',
    output: meson.project_name() + '.appdata.xml',
    po_dir: meson.project_source_root() / 'po' / 'extra',
    install: true,
    install_dir: get_option('datadir') / 'metainfo'
)

install_data(
    'pinit.gschema.xml',
    rename: meson.project_name() + '.gschema.xml',
    install_dir: get_option('datadir') / 'glib-2.0' / 'schemas'
)
