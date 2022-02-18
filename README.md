# btrfsmaintenance-formula

SaltStack formula for managing btrfsmaintenance.

## General notes

See the full [SaltStack Formulas installation and usage instructions](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

See `pillar.example` file for configuration examples.

## Special notes

This formula is tested on SUSE 12/15, Debian 10/11 and Ubuntu 20.04 hosts, but generally should work on any
system, where `btrfsmaintenance` package is available.

## Available states

### btrfsmaintenance

*Meta-state (This is a state that includes other states).*

This installs the `btrfsmaintenance`, manages its configuration, file watcher service and optionally
(depending on a `btrfsmaintenance.refresh.fix_oncalendar` value) fixes a bug which causes every job to
run 1st of month a 00:00 in addition to configured period.

### btrfsmaintenance.package

This state will install the `btrfsmaintenance` package.

### btrfsmaintenance.config

This state will configure the `btrfsmaintenance` and has a dependency on `btrfsmaintenance.install` via
include list. It will refresh systemd timers even if file watcher is disabled.

By default configuration options match defaults except that `btrfsmaintenance` will scrub/balance
not only `/` but all mounted btrfs filesystems (special word/mountpoint `auto`).

### btrfsmaintenance.refresh.watcher

This state will start or stop configuration file watcher depending on a value
`btrfsmaintenance.refresh.watcher.running`.

### btrfsmaintenance.refresh.fix.oncalendar

There is a bug in btrfsmaintenance <= 0.5 which causes every job to run 1st of month at 0:00 in
addition to configured period. This state will patch `btrfsmaintenance-refresh-cron.sh` script to fix
that. Note that the script will be restored back after every package upgrade. It is recommended to
disable file watcher service if you are using this fix.

### btrfsmaintenance.refresh.fix.clean

This state will restore original `btrfsmaintenance-refresh-cron.sh` script (only if backup is
available).

### btrfsmaintenance.clean

*Meta-state (This is a state that includes other states).*

This state will undo everything performed in the `btrfsmaintenance` meta-state in reverse order.
