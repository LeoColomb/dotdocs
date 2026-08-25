// Primary color
#let primary_colour = rgb("#000")

// Logotype
#let logo() = {
  text(font: "The Bold Font")[
    #grid(
      columns: (auto, auto),
      gutter: 5pt,
      text(size: 27pt)[o], par(leading: 0.4em)[Léo\ Colombaro],
    )
  ]
}
