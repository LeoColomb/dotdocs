# .docs

> 📄 .docs paper template

## Getting Started

### Files

* `assets/fonts`: Fonts (`TYPST_FONT_PATHS`)
* `packages/**`: Packages (https://github.com/typst/packages)

## Usage

### Direct

```console
typst compile src/main.typ dist/main.pdf
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

### Software

* [Typst](https://typst.app/)

### Fonts

* [The Bold Font](https://www.dafont.com/the-bold-font.font)
* [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro)

## License

MIT © [Léo Colombaro](https://colombaro.fr)
