# sort-markdown-table

Sorts markdown tables

## Markdown

To sort markdown, a comment must be added before the table (it can be anywhere in file before the table). The comment is:

`<!-- sorted -->`

## Example

```
<!-- sorted -->
| Italian   | English | Emoji |
| --------- | ------- | --- |
| Mela      | Apple   | 🍎 |
| Arancia   | Orange  | 🍊 |
| Aglio     | Garlic  | 🧄 |
| Cane      | Dog     | 🐶 |
| Gatto     | Cat     | 🐱 |
| Piatto    | Plate   | 🍽 |
| Bicchiere | Glass   | 🥛 |
| Burro     | Butter  | 🧈 |
| Pane      | Bread   | 🍞 |
```

results in:

| Italian | English | Emoji |
| ------- |-------- | ----- |
| Aglio | Garlic | 🧄 |
| Arancia | Orange | 🍊 |
| Bicchiere | Glass | 🥛 |
| Burro | Butter | 🧈 |
| Cane | Dog | 🐶 |
| Gatto | Cat | 🐱 |
| Mela | Apple | 🍎 |
| Pane | Bread | 🍞 |
| Piatto | Plate | 🍽 |

## Command Line Usage

Sort tables marked with `<!-- sorted -->` and send output to stdout.

`gawk -f sort-markdown-table.awk [input-file]`
