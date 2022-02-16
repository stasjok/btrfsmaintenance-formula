# btrfsmaintenance-formula

SaltStack formula for managing btrfsmaintenance configuration file.

## General notes

See the full [SaltStack Formulas installation and usage instructions](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

See `pillar.example` file for configuration examples.

## Special notes

This formula is tested on SUSE 15 hosts, but generally should work on any system, where
`btrfsmaintenance` package is available in repositories.

## Available states

### btrfsmaintenance

*Meta-state (This is a state that includes other states).*

This installs the `btrfsmaintenance` and manages its configuration.

### btrfsmaintenance.package

This state will install the `btrfsmaintenance` package.

### btrfsmaintenance.config

This state will configure the `btrfsmaintenance` and has a dependency on `btrfsmaintenance.install` via
include list.

### btrfsmaintenance.clean

*Meta-state (This is a state that includes other states).*

This state will undo everything performed in the `btrfsmaintenance` meta-state in reverse order.
