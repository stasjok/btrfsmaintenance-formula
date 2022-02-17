# btrfsmaintenance-formula

SaltStack formula for managing btrfsmaintenance configuration file.

## General notes

See the full [SaltStack Formulas installation and usage instructions](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

See `pillar.example` file for configuration examples.

## Special notes

This formula is tested on SLES 12, SLES 15, openSUSE 15 hosts, but generally should work on any
system, where `btrfsmaintenance` package is available.

## Available states

### btrfsmaintenance

*Meta-state (This is a state that includes other states).*

This installs the `btrfsmaintenance`, manages its configuration and file watcher service.

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

You can safely disable it, if you're managing configuration with `btrfsmaintenance.config` state.

### btrfsmaintenance.clean

*Meta-state (This is a state that includes other states).*

This state will undo everything performed in the `btrfsmaintenance` meta-state in reverse order.
