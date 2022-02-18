{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as btrfsmaintenance with context %}
{%- set sls_refresh = tplroot ~ '.refresh' %}

include:
  - {{ sls_refresh }}

btrfsmaintenance-refresh-fix-oncalendar-file-replace:
  file.replace:
    - name: {{ btrfsmaintenance.refresh.path }}
    # If anything is found, backup is always created even if
    # there is no changes. To avoid replacing of backup file,
    # use regex that will match only if need to change something.
    - pattern: ^(?<!OnCalendar=\n)OnCalendar=\$PERIOD$
    - repl: |-
        OnCalendar=
        OnCalendar=$PERIOD
    - append_if_not_found: false
    - prepend_if_not_found: false
    - backup: .bak
    - onchanges_in:
      # TODO: Will not work if file watcher service is active
      - sls: {{ sls_refresh }}
