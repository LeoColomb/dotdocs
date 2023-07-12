#import "/opt/templates/invoices.typ": template

#show: template.with(
  type: "Fixture",
  name: [Continuous Integration],
  address: [
    In Your Shell\
    101 Internet
  ],
  siret: [10142],
  project: [Template Validation],
  reference: [2084-07-B],
  date: datetime.today().display("[day]/[month]/[year]"),
  recipient: [
    *Test Actor*
  ],
  pricelist: ()
)

Body fixture.
