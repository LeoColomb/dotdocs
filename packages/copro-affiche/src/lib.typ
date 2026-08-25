#let template(
  v: 1,
  title: none,
  footer: none,
  font-size: 40pt,
  copyright: [CS-31-GOB/LUB/COL • © SDC 31 Avenue des Gobelins-13e],
  body,
) = {
  set text(
    lang: "fr",
    font: "Montserrat",
    size: 35pt,
  )
  set align(center + horizon)
  set page(
    "a4",
    flipped: true,
    margin: (top: 5cm),
    header: context [= #title],
    footer: context [
      #set align(right)
      #set text(
        size: 6pt,
        fill: gray,
      )
      #rotate(-90deg)[
        #place(
          left,
          dy: 40pt,
          upper[
            #copyright • #datetime.today().display("[month]/[year]") • v#version(v)
          ],
        )
      ]
    ],
  )
  show heading.where(level: 1): it => text(
    size: 35pt,
    weight: "black",
    upper(it.body),
  )

  text(font-size, body)

  if footer != none {
    line(length: 10%)
    footer
  }
}
