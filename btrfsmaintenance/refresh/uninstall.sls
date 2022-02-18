{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_refresh_watcher_dead = tplroot ~ '.refresh.watcher.dead' %}

include:
  - {{ sls_refresh_watcher_dead }}

btrfsmaintenance-refresh-uninstall-cmd-run:
  cmd.run:
    - name: {{ btrfsmaintenance.refresh.path }}
        {{ btrfsmaintenance.refresh.uninstall.args | sequence | join(' ') }}
    - onlyif:
      - test -x "{{ btrfsmaintenance.refresh.path }}"
    - require:
      # Stop file watching in order to avoid recreating of timers
      - sls: {{ sls_refresh_watcher_dead }}
