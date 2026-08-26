# Bunnytask

Bunnytask is a simple TODO.TXT manager, written in [Hare](https://harelang.org/).

View release changes in the [CHANGELOG](CHANGELOG.md).

## Configuration

The config file should be located at `${XDG_CONFIG_HOME}/bunnytask/config.ini` & is required to run. The following configuration options are available:

* `todo_path` *(required)*: the location of the TODO.TXT file(s). Supports multiple entries *(for multiple to-do files)* & `~`.

## Building

Bunnytask only requires [Hare](https://harelang.org/) to build. The standard set of Make options are available _(such as clean & install)_, and two flags are available:

- `DEBUG=1` enables address sanitisation.
- `RELEASE=1` builds Bunnytask using Hare's release mode, which strips runtime debugging tools.

## Contributing

Patches & bug reports are welcome! Simply raise [an issue](https://github.com/jamie6king/bunnytask/issues/new) or email the patch to [bugs+bunnytask@jamiedanielk.ing](mailto:bugs+bunnytask@jamiedanielk.ing) and I will take a look.
