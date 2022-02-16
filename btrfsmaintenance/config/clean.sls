{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}

btrfsmaintenance-config-clean-file-absent:
  file.absent:
    - name: {{ btrfsmaintenance.config.path }}
