# LibStanceDance API

```lua
local LibStanceDance = LibStub("LibStanceDance")
```

* All functions are called with `:` syntax.
* Returned tables are copies, so they are safe to modify.
* Form names are localized to the client's locale.

## Contents

* [Data availability](#data-availability)
* [Types](#types)
* [Forms](#forms)
* [Providers](#providers)

## Data availability

| Game version                    | Warrior | Paladin | Hunter | Rogue | Priest | Death Knight | Warlock | Monk | Druid |
| ------------------------------- | :-----: | :-----: | :----: | :---: | :----: | :----------: | :-----: | :--: | :---: |
| Retail                          | Yes     | Yes     |        | Yes   | Yes    |              |         |      | Yes   |
| Mists of Pandaria Classic       | Yes     | Yes     | Yes    | Yes   | Yes    | Yes          | Yes     | Yes  | Yes   |
| The Burning Crusade Anniversary | Yes     | Yes     |        | Yes   | Yes    |              |         |      | Yes   |
| Forever                         | Yes     | Yes     |        | Yes   | Yes    |              |         |      | Yes   |
| Classic Era                     | Yes     | Yes     |        | Yes   | Yes    |              |         |      | Yes   |

Forms are looked up by specialization ID. On Retail and Mists of Pandaria Classic, the initial specialization of a class is supported as well. On The Burning
Crusade Anniversary, Forever, and Classic Era, all specializations of a class share the same forms.

Specializations that have no shapeshift forms, such as Holy Priest, return no forms.

## Types

### LibStanceDance.Form

| Field      | Type        | Description                                                                         |
| ---------- | ----------- | ----------------------------------------------------------------------------------- |
| `spellIds` | `integer[]` | All spell IDs associated with this form, ordered from the highest to lowest rank.   |
| `spellId`  | `integer`   | The spell ID of this form, this is the last entry of `spellIds` (the rank 1 spell). |
| `icon`     | `integer`   | The icon associated with this form.                                                 |
| `name`     | `string`    | The localized name of this form.                                                    |

Each form represents a single button on the stance bar. On game versions that have spell ranks, a form can have multiple spell IDs, one for each rank. The spell
that is actually cast depends on the highest rank known by the player. To find it, check each entry of `spellIds` in order:

```lua
local function GetKnownSpellId(form)
	for _, spellId in ipairs(form.spellIds) do
		if C_SpellBook.IsSpellKnown(spellId) then
			return spellId
		end
	end

	return form.spellId
end
```

## Forms

> [!NOTE]
> These functions raise an error if no [provider](#providers) has been registered. The bundled providers register themselves automatically on supported game
> versions.

### GetNumForms

```lua
LibStanceDance:GetNumForms(specId: integer): integer
```

Get the number of shapeshift forms available for the given specialization. Returns `0` if the specialization has no forms.

#### Example

```lua
local LibStanceDance = LibStub("LibStanceDance")
local numForms = LibStanceDance:GetNumForms(71)
```

### GetForms

```lua
LibStanceDance:GetForms(specId: integer): LibStanceDance.Form[]
```

Get all shapeshift forms available for the given specialization, in the order they appear on the stance bar. Returns an empty table if the specialization has no
forms.

#### Example

```lua
local LibStanceDance = LibStub("LibStanceDance")
for _, form in ipairs(LibStanceDance:GetForms(71)) do
	print(form.spellId, form.name)
end
```

## Providers

The data for each game version is supplied by a provider. The bundled providers register themselves automatically, so you generally don't need to use this.

### SetProvider

```lua
LibStanceDance:SetProvider(provider: LibStanceDance.Provider)
```

Set the data provider for the library, generally only used internally by the bundled providers.

The provider is only replaced if `provider.version` is greater than the version of the current provider. Replacing the provider clears all cached data.

#### Example

```lua
local LibStanceDance = LibStub("LibStanceDance")
LibStanceDance:SetProvider({
	-- Must be higher than the version of the currently registered provider, or this call is ignored.
	version = 2,
	forms = {
		[161] = {
			{ 2457 }, -- Battle Stance
			{ 71 }, -- Defensive Stance
			{ 2458 }, -- Berserker Stance
		},
	},
	aliases = {
		[163] = 161,
		[164] = 161,
	},
})
```

### LibStanceDance.Provider

| Field     | Type                          | Description                                                                                                |
| --------- | ----------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `version` | `integer`                     | The data version. A provider with a higher version replaces one with a lower version.                      |
| `forms`   | `table<integer, integer[][]>` | Specialization ID to forms. Each form is a list of spell IDs, ordered from the highest to lowest rank.     |
| `aliases` | `table<integer, integer>?`    | Specialization ID to another specialization ID in `forms`, used when multiple specializations share forms. |
