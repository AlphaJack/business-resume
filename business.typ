#let business_template(
  doc,
  // PDF metadata
  author: none,
  title: none,
  paper: "a4",
  // Libertinus Serif ships with Typst, so the template works without Minion 3
  font: ("Minion 3", "Libertinus Serif"),
  size: 11pt,
) = {
  set document(
    author: if author == none { () } else { author },
    title: title,
  )

  set page(
    paper: paper,
    margin: (x: 18mm, y: 10mm),
  )

  set text(
    font: font,
    size: size,
  )

  set heading(numbering: none)

  set par(justify: true)

  show heading: smallcaps
  show heading: this => [
    #set text(weight: "regular", size: size + 3pt)
    #smallcaps(this.body)
    #v(-4mm)
    #line(length: 100%)
    #v(-1mm)
  ]
  //show link: underline

  // actual content
  doc
}

#let header(
  small: false,
  name: "John Doe",
  location: "",
  mobile: "",
  email: "",
  website: "",
  // an image, e.g. `image("photo.jpg")`, or none
  avatar: none,
  avatarSize: 25mm,
) = {
  if small [
    #align(center, [#text(size: 20pt)[#name] #v(-15pt)])
    #grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[
        #if mobile != "" [#link("tel:" + mobile) \ ]
      ],
      align(center)[
        #if email != "" [#link("mailto:" + email) \ ]
      ],
      align(right)[
        #if location != "" [#location \ ]
      ],
    )
  ] else [
    #place(
      top + center,
      align(center, [#text(size: 20pt)[#name]]),
    )
    #grid(
      columns: (1fr, avatarSize),
      align(left)[
        #if location != "" [#location \ ]
        #if mobile != "" [#link("tel:" + mobile) \ ]
        #if email != "" [#link("mailto:" + email) \ ]
        #if website != "" [#link(website) \ ]
      ],
      align(right)[
        #if avatar != none [
          #box(
            clip: true,
            radius: avatarSize / 2,
            width: avatarSize,
            height: avatarSize,
          )[
            #set image(width: avatarSize, height: avatarSize, fit: "cover")
            #avatar
          ]
        ]
      ],
    )
  ]
}


#let entry(
  organization,
  role,
  location,
  dateBegin,
  dateEnd,
  achievements,
) = {
  text(weight: "bold")[#organization #h(1fr) #location \ ]
  text(style: "italic")[#role #h(1fr) #dateBegin -- #dateEnd \ ]
  v(-2mm)
  block(achievements)
}