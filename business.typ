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
  name: "Jane Doe",
  location: "",
  mobile: "",
  email: "",
  website: "",
  // an image, e.g. `image("photo.jpg")`, or none
  avatar: none,
  avatarSize: 25mm,
) = {
  // without a photo, use the compact header of the cover letter
  if small or avatar == none [
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
  ] else {
    // the name comes first in the text, so résumé parsers read it before the contacts;
    // the photo is placed beside it, as images do not affect the reading order
    let photo = box(
      clip: true,
      radius: avatarSize / 2,
      width: avatarSize,
      height: avatarSize,
    )[
      #set image(width: avatarSize, height: avatarSize, fit: "cover")
      #avatar
    ]
    let details = [
      #align(center, text(size: 20pt)[#name])
      #v(-8pt)
      #if location != "" [#location \ ]
      #if mobile != "" [#link("tel:" + mobile) \ ]
      #if email != "" [#link("mailto:" + email) \ ]
      #if website != "" [#link(website) \ ]
    ]
    context {
      let height = calc.max(measure(details).height, avatarSize)
      block(width: 100%, height: height, {
        place(top + right, photo)
        details
      })
    }
  }
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