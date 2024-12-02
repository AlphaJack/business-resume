<!--
// ┌───────────────────────────────────────────────────────────────┐
// │ Contents of README.md                                         │
// ├───────────────────────────────────────────────────────────────┘
// │
// ├──┐Business Class
// │  ├── Screenshots
// │  ├── Requirements
// │  └── Usage
// │
// └───────────────────────────────────────────────────────────────
-->

# Business Résumé

A simple and easy to use [Typst](https://typst.app/) template for your résumé and cover letter

## Screenshots

See the [example](./example/) folder for PDFs generated with this template.

<p style="text-align: center;">
  <img style="vertical-align: top;" src="/example/resume-image.avif" width="28%"/>
  <img style="vertical-align: top;" src="/example/resume.avif" width="28%"/>
  <img style="vertical-align: top;"c src="/example/letter.avif" width="28%"/>
</p>

## Requirements

You just need to install [Typst](https://typst.app/) and then you are ready to go.

## Usage

The template, résumé and cover letter are plain text files, so you can use your favorite text editor to modify them.

To generate the PDF files, open a terminal in the current directory and run `typst compile FILE.typ`.

You can also run `typst watch FILE.typ` to re-generate the PDF at every change.

### Résumé

Open the [resume.typ](./resume.typ) file and edit the `#header` with your information.
You can omit some entries if you don't want to show them.
If you don't want the image to appear, set `small: false` in the header.

You can separate different sections with two equal signs: `== Education`.

Inside each section, add some `#entry` specifying:

1. organization, 
2. title,
3. location,
4. begin date,
5. end date,
6. list of achievements

### Cover letter

Open the [resume.typ](./resume.typ) file and copy the same `#header` from your résumé.
Set `small: false` to not make the image appear.

Write the letter separating paragraphs with empty lines between them.

Close the letter with your name and optionally a signature image.

### Template

Refer to the [Typst Documentation](https://typst.app/docs/) to customize the template file [business.typ](./business.typ).

