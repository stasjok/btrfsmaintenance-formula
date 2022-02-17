{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}
{%- set sls_package_install = tplroot ~ '.package.install' %}

include:
  - {{ sls_package_install }}

btrfsmaintenance-config-file-managed:
  file.managed:
    - name: {{ btrfsmaintenance.config.path }}
    - source: {{
        files_switch(
          ['/etc/sysconfig/btrfsmaintenance'],
          lookup='btrfsmaintenance_config',
          default_files_switch=["id", "osfinger", "os_family"],
        )
      }}
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - context:
        btrfsmaintenance: {{ btrfsmaintenance | yaml }}
    - require:
      - sls: {{ sls_package_install }}
