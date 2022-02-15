# btrfsmaintenance-formula

SaltStack formula for managing btrfsmaintenance configuration file.

## General notes

See the full [SaltStack Formulas installation and usage instructions](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

See `pillar.example` file for configuration examples.

## Special notes

This formula is tested on SUSE 15 hosts, but generally should work on systems, where `btrfsmaintenance` package is available in repositories.

## Available states

### btrfsmaintenance

*Meta-state (This is a state that includes other states).*

This installs the btrfsmaintenance.

### btrfsmaintenance.clean

*Meta-state (This is a state that includes other states).*

This state will undo everything performed in the `btrfsmaintenance` meta-state in reverse order.

### btrfsmaintenance.package

This state will install the btrfsmaintenance package.

### btrfsmaintenance.package.clean

This state will remove the btrfsmaintenance package.
