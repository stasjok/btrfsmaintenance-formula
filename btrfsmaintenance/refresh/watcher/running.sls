{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_package_install = tplroot ~ '.package.install' %}

include:
  - {{ sls_package_install }}

btrfsmaintenance-refresh-watcher-service-running:
  service.running:
    - name: {{ btrfsmaintenance.refresh.watcher.name }}
    - enable: true
    - require:
      - sls: {{ sls_package_install }}
    # There is no such service on SLES 12
    - onlyif:
      - fun: service.available
        args:
          - name: {{ btrfsmaintenance.refresh.watcher.name }}
