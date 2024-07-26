#import "@local/mypkg:1.0.0": * primary_colour, logo
#let rule(margin: 1.2em) = {
  v(margin)
  line(
    length: 100%,
    stroke: 0.5pt + gray
  )
  v(margin)
}

// This function gets your whole document as its `body`
// and formats it as a corporate.
#let template(
  type: "Facture",

  // The name with wich the CV opens.
  name: none,

  // The links to self references/social networks.
  address: none,

  // The CV's tagline.
  tagline: none,

  // The applied position.
  siret: [],

  project: none,
  reference: none,
  date: none,

  // The applied company.
  recipient: [],

  pricelist: (),

  // The CV's content.
  body
) = {
  // Configure page and text properties.
  set text(
    lang: "fr",
    size: 9.9pt,
    font: "IBM Plex Sans"
  )
  set page(
    header: text(
      font: "The Bold Font"
    )[
      #grid(
        columns: (auto, auto),
        gutter: 5pt,
        text(size: 27pt)[o],
        par(leading: 0.4em)[Léo\ Colombaro]
      )
    ],
    footer: [
      #set text(
        fill: gray,
        size: 5pt
      )
      #name\
      #address\
      Siret~: #siret
      #h(1fr)
      #counter(page).display(
        "1 / 1",
        both: true,
      )
    ]
  )

  v(1em)

  columns(2)[
    #text(size: 7pt)[#upper("Exécutant")]\
    *#name*\
    #address\
    #text(size: 7pt)[Siret : #siret] 
    
    #colbreak()

    #set align(right)
    #text(size: 7pt)[#upper("Commanditaire")]\
    #recipient
  ]

  rule()

  [
    Projet *#project*\
    #type n° *#reference* du *#date* à Paris
  ]
  
  rule()

  [
    === Récapitulatif de mission

    #body
  ]
  
  rule()

  let total = pricelist.fold(0, (init, el) => init + el.at(-1))
  pricelist = pricelist.map(el => {
    el.at(-1) = [#el.at(-1) €]
    return el
  })

  table(
    columns: (1fr, auto),
    inset: 10pt,
    stroke: none, //0.5pt + gray,
    align: (x, y) => (left, right).at(x),
    fill: (_, row) => if calc.even(row) { luma(240) } else { white },
    [*Désignation*], [*Prix HT*],
    ..pricelist.flatten(),
    align(right)[*Total*],
    [*#total €*]
  )
  align(right)[
    #set text(size: 8pt)
    TVA non applicable, art. 293B du CGI
  ]
  
  v(2em)

  if type == "Facture" {[
    *Facture à payer avant 30 jours à compter de la date de facturation*\
    Passée la date d'échéance, tout paiement différé entraîne l'application d'une pénalité calculée à un taux égal à 3 fois le taux d'intérêt légal en vigueur à la date de facturation (loi 2008‑776 du 04/08/2008) ainsi qu'une indemnité forfaitaire pour frais de recouvrement de 40 euros (décret 2012‑115 du 02/10/2012).
    
    *Aucun escompte pour règlement anticipé*
  ]

  rule()

  [
    Paiement par *virement bancaire*

    #columns(2)[
      / Titulaire: #name
      / IBAN:
      #colbreak()
      / RIB:
      / BIC:
    ]
  ]}
}
