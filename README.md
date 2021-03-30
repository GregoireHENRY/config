# config

[![version badge]][doc link]
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

Licensed under the [MIT license][license link].

[doc link]: https://github.com/GregoireHENRY/config
[license link]: https://github.com/GregoireHENRY/config/blob/main/LICENSE
[version badge]: https://img.shields.io/badge/version-0.2-blue
