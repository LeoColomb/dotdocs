#import "@local/logotype:1.0.2": logo
#import "@preview/zero:0.7.0": num, set-num, zi
#import "@preview/datify:1.3.0": display-date

#let euro = zi.declare(sym.euro, alt: "euro")
#set-num(decimal-separator: ",", group: (threshold: 1))

#let rule(margin: 1.2em) = {
  v(margin)
  line(
    length: 100%,
    stroke: 0.5pt + gray,
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
  // The content.
  body,
) = {
  // Configure page and text properties.
  set text(
    lang: "fr",
    region: "fr",
    size: 9.9pt,
    font: "SourceSans3VF",
  )
  set page(
    header: logo(),
    footer: context [
      #set text(
        fill: gray,
        size: 5pt,
      )
      #name\
      #address\
      Siret~: #siret
      #h(1fr)
      #counter(page).display(
        "1 / 1",
        both: true,
      )
    ],
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
    #type n° *#reference* du *#display-date(date)* à Paris
  ]

  rule()

  [
    === Récapitulatif de mission

    #body
  ]

  rule()

  let total = pricelist.fold(0, (init, el) => init + el.at(-1))
  pricelist = pricelist.map(el => {
    el.at(-1) = euro[#el.at(-1)]
    return el
  })

  table(
    columns: (1fr, auto),
    inset: 10pt,
    stroke: none,
    //0.5pt + gray,
    align: (x, y) => (left, right).at(x),
    fill: (_, row) => if calc.even(row) { luma(240) } else { white },
    [*Désignation*], [*Prix HT*],
    ..pricelist.flatten(),
    align(right)[*Total*],
    [*#euro[#total]*],
  )
  align(right)[
    #set text(size: 8pt)
    TVA non applicable, art. 293B du CGI
  ]

  v(2em)

  if type == "Facture" {
    [
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
    ]
  }
}
