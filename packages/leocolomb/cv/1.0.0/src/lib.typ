#let primary_colour = rgb("#1F497D")

#let icon(
  name,
  shift: 1.2pt,
  margin: 2pt,
) = {
  box(
    baseline: shift,
    height: 9pt,
    image("assets/" + name + ".svg"),
  )
  h(margin)
}

#let services(services) = {
  set text(8pt)
  let icon = icon.with(shift: 1.5pt, margin: 3pt)

  services
    .map(service => {
        icon(service.name)

        if "link" in service.keys() {
          if "display" in service.keys() {
            link(service.link)[#{
                service.display
              }]
          } else {
            link(service.link)
          }
        } else {
          service.display
        }

      })
    .join(h(10pt))
  [

  ]
}

#let date(period) = {
  text(
    size: 8pt,
    weight: "light",
  )[#icon("calendar")#period]
}

#let term(
  period,
  location,
) = {
  text(
    size: 8pt,
    weight: "light",
  )[#date(period) #h(1em) #icon("location")#location]
}

// This function gets your whole document as its `body`
// and formats it as a CV.
#let template(
  // The name with wich the CV opens.
  name: none,

  // The links to self references/social networks.
  links: (),

  // The CV's tagline.
  tagline: none,

  // The applied position.
  position: [],

  // The applied company.
  company: [],

  // The CV's content.
  body
) = {
  // Configure page and text properties.
  set text(
    size: 9.9pt,
    font: "IBM Plex Sans",
  )
  set columns(gutter: 15pt)
  set page(
    columns: 2,
    margin: (
      x: 53pt,
      y: 50pt,
    ),
    header-ascent: 60%,
    header: rect(
      width: 100%,
      fill: primary_colour,
      inset: 0pt,
      outset: (
        x: 53pt,
        y: 15pt,
      ),
      [
        #set text(
          fill: primary_colour.lighten(90%),
          weight: "light",
          size: 8pt,
        )
        #set align(right)
        #upper[
          Application for
          #if position != [] [a #position] else [a]
          position
          #if company != [] [at #company]
        ]
      ],
    ),
    footer: context [
      #set text(
        fill: gray,
        size: 8pt,
      )
      #name
      #h(1fr)
      #counter(page).display(
        "1 / 1",
        both: true,
      )
    ],
  )

  // Configure headings properties.
  show heading.where(level: 2): it => text(
    fill: primary_colour,
    size: 11pt,
    upper(it.body),
  )
  show heading.where(level: 4): it => text(
    fill: primary_colour,
    size: 11pt,
    it.body,
  )

  place(
    top,
    scope: "parent",
    float: true,
    rect(
      width: 100%,
      stroke: none,
      fill: primary_colour,
      inset: (
        x: 0pt,
        top: 1pt,
        bottom: 30pt,
      ),
      outset: (
        x: 53pt,
        top: 23%,
      ),
      [
        #set text(fill: white)
        = #name
        #services(links)
        #if tagline != none {
          tagline
        }
      ],
    ),
  )

  body
}
