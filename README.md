# LibStanceDance

LibStanceDance is a library for World of Warcraft that provides a simple interface to access information about shapeshift forms and stances.

## Supported versions

* Retail
* Mists of Pandaria Classic
* The Burning Crusade Anniversary
* Forever
* Classic Era

## Getting started

### Dependencies

* [LibStub](https://www.wowace.com/projects/libstub)

### Embedding

```yaml
externals:
  Libs/LibStub: https://repos.curseforge.com/wow/libstub/trunk
  Libs/LibStanceDance:
    url: https://github.com/Snakybo/LibStanceDance

move-folders:
  <ADDON>/Libs/LibStanceDance/LibStanceDance: <ADDON>/Libs/LibChroMacro
```

Replace `<ADDON>` for your addon name, and simply add the libraries to your TOC file.

### Usage

```lua
for _, form in LibStanceDance:GetForms(65) do
	print(form.spellId, form.name, form.icon)
end
```

See [API.md](API.md) for additional documentation.
