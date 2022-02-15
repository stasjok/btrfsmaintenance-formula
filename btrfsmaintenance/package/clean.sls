{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}

btrfsmaintenance-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ btrfsmaintenance.pkg.name }}
