# WhatsApp Formatting Syntax for KDE Kate

A small custom **KSyntaxHighlighting** definition for KDE Kate that highlights the formatting syntax supported by WhatsApp messages without treating the file as Markdown.

The goal is intentionally narrow: highlight only WhatsApp-style formatting and avoid unrelated Markdown, HTML, link, image, Mermaid, or embedded-language features.

## Supported syntax

| Syntax | Meaning |
|---|---|
| `*text*` | Bold |
| `_text_` | Italic |
| `~text~` | Strikethrough |
| `` `text` `` | Inline monospace |
| Triple backticks around text | Multiline / block monospace |
| `> text` | Quote |
| `* item` | Unordered list |
| `- item` | Unordered list |
| `1. item` | Ordered list |

Structural quote/list/enumeration handling is deliberately limited to one level.

## Triple-backtick behavior

Block monospace is intentionally more permissive than a traditional Markdown fenced code block. Opening and closing triple backticks may appear anywhere in the line.

All of the following are supported:

~~~text
``` text
```
~~~

~~~text
```text
```
~~~

~~~text
``` text```
~~~

~~~text
```
text```
~~~

~~~text
before ```monospace``` after
~~~

While the triple-backtick context is active, no other WhatsApp formatting is interpreted. This means bold, italic, strikethrough, quotes, lists, enumerations, and inline monospace are all ignored until the closing triple backticks are found.

Triple backticks also have priority over the single-backtick inline monospace rule.

## Not supported

This syntax definition intentionally does **not** add highlighting for:

- Markdown headings
- Markdown links
- Images
- HTML
- Mermaid
- Language identifiers after triple backticks
- Nested lists
- Nested quotes
- Quote/list/enumeration combinations
- Any other Markdown extension

## Installation

### Automatic installation

#### Via Make

Run:

```bash
make install
```

The syntax should be installed to:

```text
~/.local/share/org.kde.syntax-highlighting/syntax/whatsapp.xml
```

Then restart Kate


### Manual installation

Copy:

```text
syntax/whatsapp.xml
```

to:

```text
~/.local/share/org.kde.syntax-highlighting/syntax/whatsapp.xml
```

Then restart Kate


## Using it in Kate

After installation, the highlighter should appear as:

```text
Highlighting -> Markup -> WhatsApp
```

The exact translated menu names depend on your KDE locale.

To make Kate automatically select this highlighter for a custom file extension, use files ending in:

```text
.whatsapp
.wa
```


## Uninstallation

Run:

```bash
make uninstall
```

Then restart the application.


## License

MIT. See [`LICENSE`](LICENSE).
