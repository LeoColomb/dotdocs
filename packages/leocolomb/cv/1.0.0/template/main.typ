#import "@local/cv:1.0.3": date, template, term

#show: template.with(
  name: "John Doe",
  links: (
    (name: "home", display: "Earth, ALL"),
    (name: "email", link: "mailto:johndoe@example.com"),
    (name: "phone", link: "tel:+AB 123 456 789"),
    (name: "website", link: "https://example.com/", display: "example.com"),
  ),
  tagline: [Oh boy, here we go again],
  position: [],
  company: [],
)

== Experience

=== Last Company

==== Last Position\
#term[since 1970][Earth, ALL]

- Passion and arts #date[2023]

#colbreak()

== Education

=== Last Company

#term[since 1970][Earth, ALL]

- Passion and arts #date[2023]
