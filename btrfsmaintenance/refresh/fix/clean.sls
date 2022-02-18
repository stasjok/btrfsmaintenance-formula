{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}

# Try to restore original file from backup
btrfsmaintenance-refresh-fix-oncalendar-clean-file-rename:
  file.rename:
    - name: {{ btrfsmaintenance.refresh.path }}
    - source: {{ btrfsmaintenance.refresh.path }}.bak
    - force: true
