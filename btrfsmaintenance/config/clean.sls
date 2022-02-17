{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_refresh_uninstall = tplroot ~ '.refresh.uninstall' %}

include:
  - {{ sls_refresh_uninstall }}

btrfsmaintenance-config-clean-file-absent:
  file.absent:
    - name: {{ btrfsmaintenance.config.path }}
    - require:
      - sls: {{ sls_refresh_uninstall }}
