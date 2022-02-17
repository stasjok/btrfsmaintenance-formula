{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_refresh_watcher_dead = tplroot ~ '.refresh.watcher.dead' %}

include:
  - {{ sls_refresh_watcher_dead }}

btrfsmaintenance-refresh-uninstall-cmd-run:
  cmd.run:
    - name: {{ btrfsmaintenance.refresh.uninstall.cmd }}
    - onlyif:
      - test -f "{{ btrfsmaintenance.refresh.uninstall.cmd.split()[0] }}"
    - require:
      # Stop file watching in order to avoid recreating of timers
      - sls: {{ sls_refresh_watcher_dead }}
