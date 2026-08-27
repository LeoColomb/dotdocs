# .docs

> 📄 Paper documents templates

## Usage

See [Typst](https://typst.app/)

## Getting Started

### Files

```console
scripts/packages @local
scripts/fonts
```

### Container

```console
docker run --rm \
  -v "${PWD}/src:/opt/data/src" \
  -v "${PWD}/dist:/opt/data/dist" \
  ghcr.io/leocolomb/dotdocs:latest \
  compile \
    "/opt/data/src/main.typ" \
    "/opt/data/dist/main.pdf"
```

## Acknowledgments

### Fonts

* [The Bold Font](https://www.dafont.com/the-bold-font.font)
* [Source Sans](https://adobe-fonts.github.io/source-sans/)
* [IBM Plex Sans](https://www.ibm.com/plex/)
* [Inter](https://rsms.me/inter/)
* [Montserrat](https://github.com/JulietaUla/Montserrat)

## License

MIT © [Léo Colombaro](https://colombaro.fr)
