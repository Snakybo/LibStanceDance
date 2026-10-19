# LibShapeshift-1.0

There are two functions available, `GetForms(key)` and `IterateForms(key)`, both return all available forms for the given key. The key an either be a
specialization ID, or a class file name, depending on the game version.

Game version | Key type
------------ | --------
Classic | Class file name
TBC | Class file name
WotLK | Class file name
Cata | Class file name
Mists | Specialization ID
Retail | Specialization ID

## Data

Teh data returned by each function is somewhat complicated, it returns a 2D array of spell IDs, which is required in order to support spell ranks in Classic game
versions.

For example,

```lua
PALADIN = {
	{ 10293, 10292, 1032, 10291, 643, 10290, 465 }, -- Devotion Aura
	{ 10301, 10300, 10299, 10298, 7294 }, -- Retribution Aura
	...
}
```

Retrieving shapeshift forms for `PALADIN`, will thus return

```lua
{
	{ 10293, 10292, 1032, 10291, 643, 10290, 465 },
	{ 10301, 10300, 10299, 10298, 7294 }
}
```

Each top-level entry represents a button in the UI, there will never be two buttons for Devotion Aura, but the actual version being cast or activated depends
on the rank unlocked by the player.

The order of the inner array is high rank -> low rank, so Devotion Aura (rank 7) is the first entry in the array, and Devotion Aura (rank 1) is the last.

In order to check exactly which version the player has unlocked, you can use `IsSpellKnown`:

```lua
for _, spellIds in LibShapeshift:IterateForms("PALADIN") do
	-- Default to the rank 1 spell
	local targetSpellId = spellIds[#spellIds]

	for _, spellId in ipairs(spellIds) do
		if IsSpellKnown(spellId) then
			targetSpellId = spellId
			break
		end
	end
end
```
