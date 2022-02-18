{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- set sls_refresh_uninstall = tplroot ~ '.refresh.uninstall' %}
{%- set sls_refresh_fix_clean = tplroot ~ '.refresh.fix.clean' %}

include:
  - {{ sls_config_clean }}
  - {{ sls_refresh_uninstall }}
  - {{ sls_refresh_fix_clean }}

btrfsmaintenance-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ btrfsmaintenance.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
      - sls: {{ sls_refresh_uninstall }}
      # Ensure we are removing backup file
      - sls: {{ sls_refresh_fix_clean }}
