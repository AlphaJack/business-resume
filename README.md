# Business Résumé

A simple [Typst](https://typst.app/) template for your résumé and cover letter, with a matching header, photo and signature.

<p align="center">
  <img src="https://raw.githubusercontent.com/AlphaJack/business-resume/master/example/resume-image.avif" width="30%"/>
  <img src="https://raw.githubusercontent.com/AlphaJack/business-resume/master/example/resume.avif" width="30%"/>
  <img src="https://raw.githubusercontent.com/AlphaJack/business-resume/master/example/letter.avif" width="30%"/>
</p>

See the [example](https://github.com/AlphaJack/business-resume/tree/master/example) folder for the PDFs.

## Usage

Create a new project from the template, either on [typst.app](https://typst.app/universe/package/business-resume) or locally:

```bash
typst init @preview/business-resume:2.1.0 my-resume
cd my-resume
typst watch resume.typ
```

The project contains `resume.typ`, `letter.typ`, a sample `photo.jpg` and a sample `signature.svg`: replace them with your own information, photo and signature.

To use the template in an existing project, import it at the top of your file:

```typ
#import "@preview/business-resume:2.1.0": *
#show: business_template.with(
  author: "Jane Doe",           // PDF metadata
  title: "Jane Doe Résumé",     // PDF metadata
  paper: "a4",                        // default
  font: ("Minion 3", "Libertinus Serif"), // default
  size: 11pt,                         // default
)
```

All arguments are optional.

### Header

```typ
#header(
  name: "Jane Doe",
  avatar: image("photo.jpg"),
  mobile: "(413) 464-4238",
  location: "Cambridge, MA 01242",
  email: "Jane.Doe@sloan.mit.edu",
  website: "https://linkedin.com/in/janedoe",
)
```

Every field is optional.
Set `small: true` for a compact header without photo and website, as used in the cover letter.
Change the photo size with `avatarSize: 30mm`.
Without a photo, also remove the `#v(-5mm)` after the header in `resume.typ`, which only makes up for the photo's height.

### Résumé entries

Separate sections with headings, such as `== Education`, and add an `#entry` for each position:

```typ
#entry(
  "Intel Corporation",           // organization
  "Physical Design Intern",      // role
  "Hudson, MA",                  // location
  "2010",                        // begin date
  "2011",                        // end date
  [
    - Modeled timing and power consumption for chip critical paths
    - Developed chip power plan after pooling input from cross-site team members
  ],
)
```

### Cover letter

Copy the `#header` from your résumé, set `small: true`, then write the letter with empty lines between paragraphs.
Close it with your name and optionally a signature: `#image("signature.svg", width: 40mm)`.

### Fonts

By default, the template uses Minion 3 when it is installed, and falls back to Libertinus Serif, which ships with Typst.
Pick another font with the `font` argument of `business_template`.

## Development

To compile the template files from this repository before a release, point Typst to a local package directory:

```bash
mkdir -p /tmp/packages/preview/business-resume
ln -s "$PWD" /tmp/packages/preview/business-resume/2.1.0
typst compile --package-path /tmp/packages template/resume.typ
```

## License

The files in the `template` folder, which are copied into your project, are licensed under [MIT-0](./LICENSE-MIT-0): you can use and share your résumé without attribution.
Everything else is licensed under [MIT](./LICENSE).
