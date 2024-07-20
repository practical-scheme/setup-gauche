# setup-gauche

This action downloads and installs [Gauche](https://practical-scheme.net/gauche/),
so that your subsequent workflow can use it.

Currently it works on Linux (Debian, Ubuntu) and OSX platforms.
GDBM library is also installed, so that `dbm.gdbm` is available.

# Usage

```yaml
- uses: shirok/setup-gauche@v6
  with:
    # If true, install pre-built Gauche binary instead of building from
    # the source.  Currently it is available on ubuntu-latest and
    # macos-latest platforms, and the latest Gauche release.
    # When this is true, other input variables shouldn't be given.
    prebuilt-binary: false

    # The version of Gauche to install.  Can be 'latest' for the latest
    # release, or 'snapshot' for the latest snapshot.  The default is
    # 'latest'.
    gauche-version: 'latest'

    # Whether the integrity test is performed for the installed Gauche
    # Typically you don't need this, unless you want to use unstable snapshot.
    test-gauche: false

    # If you want to pass extra configure arguments to build Gauche,
    # give them here.  Example: '--with-slib=/opt/slib --with-tls=mbedtls-internal'
    # Note that prefix is determined by get-gauche.sh so you can't give it
    # here.
    configure-options: ''

```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
