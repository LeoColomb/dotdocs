#import "@local/invoicing:1.0.3": template

#show: template.with(
  name: "Jean Dupond",
  address: [
    1, rue d'Ici\
    1234 Là-bas
  ],
  siret: [123 456 789 000],
  project: "Important",
  reference: "ABC-123",
  date: datetime.today(),
  recipient: [
    *Pierre Biscuit*\
    1, rue d'Ici\
    1234 Là-bas
  ],
  pricelist: (
    ("Tâche 1", 123),
    ("Tâche 2", 1000),
  ),
)
