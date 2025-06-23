#import "@leocolomb/cv:1.0.0": template, term, date

#show: template.with(
  name: [John Doe],
  links: (
    (name: "home", display: "Earth, ALL"),
    (name: "email", link: "mailto:johndoe@example.com"),
    (name: "phone", link: "tel:+AB 123 456 789"),
    (name: "website", link: "https://example.com/", display: "example.com"),
  ),
  tagline: [Oh boy, here we go again],
  position: [The Best Title],
  company: [The Best Company],
)

== Experience

=== Last Company

==== Last Position\
#term[since 1970][Earth, ALL]

- Passion and arts #date[2023]
