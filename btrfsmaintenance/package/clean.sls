{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- set sls_refresh_uninstall = tplroot ~ '.refresh.uninstall' %}

include:
  - {{ sls_config_clean }}
  - {{ sls_refresh_uninstall }}

btrfsmaintenance-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ btrfsmaintenance.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
      - sls: {{ sls_refresh_uninstall }}
