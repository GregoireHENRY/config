# config

[![version badge]][doc link]
[![license badge]][license link]
[![pre-commit badge]][pre-commit link]

> My dotfiles

---

[Usage](#usage) |
[License](#license)

---

## Usage

To install the configuration files:

```sh
./install.sh [OPTION]
```

OPTIONS:

+ `-s`, `--simple`: simple installation, ignore fancy plugins for neovim or tmux
+ `-c`, `--copy`: to copy and replace automatically your configurations files with
  those in the repository

A backup of your replaced configuration files is created in `/tmp/greg-config`.

## License

Licensed under the [Apache 2.0 license][license link].

[doc link]: https://github.com/GregoireHENRY/config
[version badge]: https://img.shields.io/badge/version-0.2.0-blue
[license link]: https://github.com/GregoireHENRY/config/blob/main/LICENSE
[license badge]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[pre-commit link]: https://pre-commit.com
[pre-commit badge]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
