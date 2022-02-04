## ULRS

ULRS is a Lisp REPL & Shell for all lisp dialects (as long as it support nREPL). It is powered by [prompt_toolkit](https://github.com/prompt-toolkit/python-prompt-toolkit), [fire](https://github.com/google/python-fire) and [nREPL](https://nrepl.org/).

It should work for any lisps or their dialects, as long as it support nREPL.

## Project status

Archived. I personally did not found this is useful, because the REPL integration inside of IDEs/Editors are so powerful. there's really no reason to use a standalone RPEL.

## RoadMap
- [x] Basic readline functions
- [x] Syntax highlight
- [ ] Completion
- [ ] User configuration
- [ ] Better UI
- [ ] History view, like the one in [ptpython](https://github.com/prompt-toolkit/ptpython)
- [ ] Parinfer mode
- [ ] Shell & Lisp Hybrid DSL

## How to use?
```shell
git clone https://github.com/glyh/ulrs.git
cd ulrs
pip install ./
ulrs
```
