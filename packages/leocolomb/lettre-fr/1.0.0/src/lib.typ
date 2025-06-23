// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let template(
  // The letter's sender, which is display at the top of the page.
  sender: none,
  sender_address: none,
  // The letter's recipient, which is displayed close to the top.
  recipient: none,
  recipient_address: none,
  // The location, displayed to the right.
  location: none,
  // The date, displayed to the right.
  date: datetime.today(),
  // The subject line.
  subject: none,
  // The reference line.
  reference: none,
  opening: none,
  closing: none,
  // The letter's content.
  body,
) = {
  // Configure page and text properties.
  set page(paper: "a4", margin: (x: 2cm, y: 3.81cm))
  set text(
    font: "PT Sans",
    lang: "fr",
  )

  columns(2, gutter: 1cm)[
    // Display sender.
    #strong(sender)\
    #sender_address

    #colbreak()

    // Display recipient.
    #v(2cm)
    #strong(recipient)\
    #recipient_address
  ]

  v(2em)

  // Display date. If there's no date add some hidden
  // text to keep the same spacing.
  if date != none {
    pad(
      left: 9cm,
      emph()[
        #location, #date.display("[weekday] [day padding:none] [month repr:long] [year]")
      ],
    )
  }
  v(2em)

  // Add the reference/subject line, if any.
  if reference != none {
    pad(right: 10%, strong(reference))
  }
  if subject != none {
    pad(right: 10%, strong(subject))
  }

  v(3em)

  h(1cm)
  opening
  v(1em)

  // Add body and name.
  par()[#body]

  v(1em)
  closing

  v(2em)
  pad(left: 9cm, sender)
}
