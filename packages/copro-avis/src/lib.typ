#import "@preview/showybox:2.0.4": showybox

#let template(
  v: 1,
  title: none,
  intent: none,
  details: none,
  font-size: 18pt,
  copyright: [CS-31-GOB/LUB/COL • © SDC 31 Avenue des Gobelins-13e],
  body
) = {
  set text(
    lang: "fr",
    font: "Montserrat",
    size: font-size,
  )
  set par(
    leading: 0.85em,
  )
  set page(
    "a4",
    header: context [= #title],
    header-ascent: -30%,
    margin: (top: 200pt),
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
            #copyright •  #datetime.today().display("[month]/[year]") • v#version(v)
          ]
        )
      ]
    ],
    footer-descent: 60%,
  )
  show heading.where(level: 1): it => text(
    size: font-size,
    weight: "black",
    upper(align(center + horizon, it.body)),
  )

  if intent != none {
    showybox(
      frame: (
        border-color: gray.darken(50%),
        title-color: gray.lighten(60%),
        body-color: gray.lighten(80%),
        inset: (x: 1em, y: 1.65em),
        radius: 3pt,
      ),
      title-style: (
        color: black,
        weight: "extrabold",
        align: center,
      ),
      body-style: (
        align: center,
      ),
      shadow: (
        offset: 2pt,
      ),
      spacing: 3em,
      title: intent,
      details
    )    
  }

  body

  align(right,
    block(
      spacing: 60pt,
      [
        Le Conseil syndical
      ]
    )
  )
}