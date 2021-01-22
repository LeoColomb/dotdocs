# .docs

> Documents template

## Getting Started

### Assets

* `assets/logo.pdf`: Corporate logo
* `assets/fonts`: Fonts

### Run

```shell
docker run --rm -v "${PWD}:/data" ghcr.io/LeoColomb/.docs "/data/[file].md" \
  --output "/data/[file].pdf" \
  --variable title="[type]" \
  --variable id="[id of type]" \
  --template="/opt/template.tex" \
  --pdf-engine=xelatex
```

## Usage

### Softs

* [Pandoc](https://pandoc.org/)
* [LaTeX](https://www.latex-project.org/)

### Fonts

* The Bold Font: https://www.dafont.com/the-bold-font.font
* Source Sans Pro: https://github.com/adobe-fonts/source-sans-pro/releases

## License

MIT © [Léo Colombaro](https://colombaro.fr)
