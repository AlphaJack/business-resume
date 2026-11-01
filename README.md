# Business Résumé

A simple [Typst](https://typst.app/) template for your résumé and cover letter, with a matching header, photo and signature.

<p align="center">
  <img src="https://raw.githubusercontent.com/AlphaJack/business-resume/master/example/resume.avif" width="45%"/>
  <img src="https://raw.githubusercontent.com/AlphaJack/business-resume/master/example/letter.avif" width="45%"/>
</p>

See the [example](https://github.com/AlphaJack/business-resume/tree/master/example) folder for the PDFs.

## Usage

Create a new project from the template, either on [typst.app](https://typst.app/universe/package/business-resume) or locally:

```bash
typst init @preview/business-resume:2.1.0 my-resume
cd my-resume
typst watch resume.typ
```

The project contains `resume.typ`, `letter.typ`, a placeholder `avatar.svg` and a placeholder `signature.svg`: replace them with your own information, photo and signature.

To use the template in an existing project, import it at the top of your file:

```typ
#import "@preview/business-resume:2.1.0": *
#show: business_template
```

### Header

```typ
#header(
  name: "Jordan Rivera",
  avatar: image("photo.jpg"),
  mobile: "+1 555 0100",
  location: "Springfield, OR 97477",
  email: "jordan.rivera@example.com",
  website: "https://example.com/jordan-rivera",
)
```

Every field is optional.
Set `small: true` for a compact header without photo and website, as used in the cover letter.
Change the photo size with `avatarSize: 30mm`.

### Résumé entries

Separate sections with headings, such as `== Education`, and add an `#entry` for each position:

```typ
#entry(
  "Halden Robotics",  // organization
  "Product Manager",  // role
  "Portland, OR",     // location
  "2024",             // begin date
  "Present",          // end date
  [
    - Own the roadmap of a warehouse picking robot used at 40 customer sites
    - Run quarterly pricing reviews with sales and finance
  ],
)
```

### Cover letter

Copy the `#header` from your résumé, set `small: true`, then write the letter with empty lines between paragraphs.
Close it with your name and optionally a signature: `#image("signature.svg", width: 40mm)`.

### Fonts

The template uses Minion 3 when it is installed, and falls back to Libertinus Serif, which ships with Typst.

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
