{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{#- Determine whether to use new style for calling module.run #}
{%- set is_module_run_new_style =
  salt['grains.get']('saltversioninfo')[0] >= 3005
  or 'module.run' in salt['config.get']('use_superseded', []) %}

btrfsmaintenance-refresh-service-start:
  module.run:
{%- if is_module_run_new_style %}
    - service.start:
        - name: {{ btrfsmaintenance.refresh.service.name }}
{%- else %}
    - name: service.start
    - m_name: {{ btrfsmaintenance.refresh.service.name }}
{%- endif %}
    - unless:
      - fun: service.status
        args:
          - {{ btrfsmaintenance.refresh.watcher.name }}
