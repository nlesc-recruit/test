[![cudawrappers](https://github.com/nlesc-recruit/usage-example-git-submodules/actions/workflows/latest.yml/badge.svg)](https://github.com/nlesc-recruit/usage-example-git-submodules/actions/workflows/latest.yml)

Example program using cudawrappers
==================================

This is an example project that uses the cudawrappers library as a dependency
by having it included as a git submodule.

To run the example, install the vector_add_example program from this repository:
```bash
git clone --recurse-submodules https://github.com/nlesc-recruit/usage-example-git-submodules
cd usage-example-git-submodules
cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local -S . -B build
make -C build
make -C build install
```
the `-DCMAKE_INSTALL_PREFIX=$HOME/.local` tells the computer to install the
program in `~/.local`. This is useful if you do not have root access
to the computer you are working on.

The example can be run with:
```bash
vector_add_example
```
or, if `~/.local/bin` is not in your `$PATH`,
```bash
~/.local/bin/vector_add_example
```

The expected behaviour is that
```
hurray! 2
```
is printed to the terminal.
