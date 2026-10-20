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

local LibStanceDance = LibStub and LibStub("LibStanceDance", true)

local _, _, _, interfaceVersion = GetBuildInfo()

if LibStanceDance == nil or interfaceVersion < 11300 or interfaceVersion >= 16000 then
	return
end

---@type LibStanceDance.Provider
LibStanceDance:SetFormProvider({
	version = 1,
	forms = {
		WARRIOR = {
			{ 2457 }, -- Battle Stance
			{ 71 }, -- Defensive Stance
			{ 2458 } -- Berserker Stance
		},
		PALADIN = {
			{ 10293, 10292, 1032, 10291, 643, 10290, 465 }, -- Devotion Aura
			{ 10301, 10300, 10299, 10298, 7294 }, -- Retribution Aura
			{ 19746 }, -- Concentration Aura
			{ 19896, 19895, 19876 }, -- Shadow Resistance Aura
			{ 19898, 19897, 19888 }, -- Frost Resistance Aura
			{ 19900, 19899, 19891 }, -- Fire Resistance Aura
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
			{ 24858 }, -- Moonkin Form
		}
	}
})
