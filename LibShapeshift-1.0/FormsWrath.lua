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

local _, _, _, interfaceVersion = GetBuildInfo()

if LibShapeshift == nil or interfaceVersion < 30400 or interfaceVersion >= 40000 then
	return
end

--- @type LibShapeshift-1.0.Forms
LibShapeshift:SetFormProvider({
	version = 1,
	forms = {
		WARRIOR = {
			{ 2457 }, -- Battle Stance
			{ 71 }, -- Defensive Stance
			{ 2458 } -- Berserker Stance
		},
		PALADIN = {
			{ 27149, 10293, 10292, 1032, 10291, 643, 10290, 465 }, -- Devotion Aura
			{ 27150, 10301, 10300, 10299, 10298, 7294 }, -- Retribution Aura
			{ 19746 }, -- Concentration Aura
			{ 27151, 19896, 19895, 19876 }, -- Shadow Resistance Aura
			{ 27152, 19898, 19897, 19888 }, -- Frost Resistance Aura
			{ 27153, 19900, 19899, 19891 }, -- Fire Resistance Aura
			{ 32223 }, -- Crusader Aura
		},
		ROGUE = {
			{ 1787, 1786, 1785, 1784 }, -- Stealth
		},
		PRIEST = {
			{ 15473 }, -- Shadowform
		},
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
	}
})
