#import "@leocolomb/lettre-fr:1.0.0": template

#show: template.with(
  sender: [Jean Dupond],
  sender_address: [
    123, rue d'Ici\
    Terre
  ],
  recipient: [Jean Dupond],
  recipient_address: [
    Acme Corp. \
    123 Glennwood Ave \
    Quarto Creek, VA 22438
  ],
  location: [Terre],
  subject: [Objet~: Lettre],
  opening: [Madame, Monsieur,],
  closing: [Dans l'attente de votre retour, je vous prie d'agréer, Madame, Monsieur, l'expression de mes sentiments distingués.],
)

#lorem(99)
