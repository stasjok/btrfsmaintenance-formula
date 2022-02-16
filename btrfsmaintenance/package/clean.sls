{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}

include:
  - {{ sls_config_clean }}

btrfsmaintenance-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ btrfsmaintenance.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
