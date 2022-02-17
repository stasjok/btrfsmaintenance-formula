{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}

include:
  {%- if btrfsmaintenance.refresh.watcher.running | to_bool %}
  - .running
  {%- else %}
  - .dead
  {%- endif %}
