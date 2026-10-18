-- MIT License
--
-- Copyright (c) 2026 Kevin Krol
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local LibShapeshift = LibStub and LibStub("LibShapeshift-1.0", true)

local interfaceVersion = select(4, GetBuildInfo())

if LibShapeshift == nil or interfaceVersion < 40400 or interfaceVersion >= 50000 then
	return
end

--- @type LibShapeshift-1.0.Forms
LibShapeshift:SetForms({
	WARRIOR = {
		{ 2457 }, -- Battle Stance
		{ 71 }, -- Defensive Stance
		{ 2458 }, -- Berserker Stance
	},
	PALADIN = {
		{ 465 }, -- Devotion Aura
		{ 7294 }, -- Retribution Aura
		{ 19746 }, -- Concentration Aura
		{ 32223 }, -- Crusader Aura
	},
	HUNTER = {},
	ROGUE = {
		{ 1784 }, -- Stealth
	},
	PRIEST = {
		{ 15473 }, -- Shadowform
	},
	SHAMAN = {},
	MAGE = {},
	WARLOCK = {},
	DRUID = {
		{ 9634, 5487 }, -- Dire Bear Form, Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form,
		{ 33891 }, -- Tree of Life
		{ 40120, 33943 }, -- Swift Flight Form, Flight Form
	},
	DEATHKNIGHT = {
		{ 48266 }, -- Blood Presence
		{ 48263 }, -- Frost Presence
		{ 48265 }, -- Unholy Presence
	}
})
