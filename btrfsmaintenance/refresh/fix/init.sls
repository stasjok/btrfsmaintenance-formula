{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}

{%- if btrfsmaintenance.refresh.fix_oncalendar | to_bool %}
include:
  - .oncalendar
{%- endif %}
