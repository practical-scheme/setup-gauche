# setup-gauche v1

This action downloads and installs [Gauche](https://practical-scheme.net/gauche/),
so that your subsequent workflow can use it.

Currently it only works on Linux (Debian, Ubuntu) and OSX platforms.
GDBM library is also installed, so that `dbm.gdbm` is available.

# Usage

```yaml
- uses: shirok/setup-gauche@v1
  with:
    # The version of Gauche to install.  Can be 'latest' for the latest
    # release, or 'snapshot' for the latest snapshot.  The default is
    # 'latest'.
    gauche-version: 'latest'

    # Whether the integrity test is performed for the installed Gauche
    # Typically you don't need this, unless you want to use unstable snapshot.
    test-gauche: false
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
