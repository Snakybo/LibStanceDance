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

if LibShapeshift == nil or interfaceVersion < 120000 or interfaceVersion >= 130000 then
	return
end

--- @type LibShapeshift-1.0.Forms
LibShapeshift:SetForms({
	-- Holy Paladin
	[65] = {
		{ 32223 }, -- Crusader Aura
		{ 465 }, -- Devotion Aura
		{ 317920 }, -- Concentration Aura
	},
	-- Protection Paladin
	[66] = {
		{ 32223 }, -- Crusader Aura
		{ 465 }, -- Devotion Aura
		{ 317920 }, -- Concentration Aura
	},
	-- Retribution Paladin
	[70] = {
		{ 32223 }, -- Crusader Aura
		{ 465 }, -- Devotion Aura
		{ 317920 }, -- Concentration Aura
	},
	-- Initial Paladin
	[1451] = {
		{ 32223 }, -- Crusader Aura
		{ 465 }, -- Devotion Aura
		{ 317920 }, -- Concentration Aura
	},

	-- Arms Warrior
	[71] = {
		{ 386208 }, -- Defensive Stance
		{ 386164 }, -- Battle Stance
	},
	-- Fury Warrior
	[72] = {
		{ 386208 }, -- Defensive Stance
		{ 386196 }, -- Berserker Stance
	},
	-- Protection Warrior
	[73] = {
		{ 386208 }, -- Defensive Stance
		{ 386164 }, -- Battle Stance
	},

	-- Balance Druid
	[102] = {
		{ 5487 }, -- Bear Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form
		{ 114282 }, -- Treant Form
		{ 210053 }, -- Mount Form
	},
	-- Feral Druid
	[103] = {
		{ 5487 }, -- Bear Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form
		{ 114282 }, -- Treant Form
		{ 210053 }, -- Mount Form
	},
	-- Guardian Druid
	[104] = {
		{ 5487 }, -- Bear Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form
		{ 114282 }, -- Treant Form
		{ 210053 }, -- Mount Form
	},
	-- Restoration Druid
	[105] = {
		{ 5487 }, -- Bear Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form
		{ 114282 }, -- Treant Form
		{ 210053 }, -- Mount Form
	},
	-- Initial Druid
	[1447] = {
		{ 5487 }, -- Bear Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 114282 }, -- Treant Form
		{ 210053 }, -- Mount Form
	},

	-- Shadow Priest
	[258] = {
		{ 232698 }, -- Shadowform
	},

	-- Assassination Rogue
	[259] = {
		{ 1784 }, -- Stealth
	},
	-- Outlaw Rogue
	[260] = {
		{ 1784 }, -- Stealth
	},
	-- Subtlety Rogue
	[261] = {
		{ 1784 }, -- Stealth
		{ 185422 }, -- Shadow Dance
	},
	-- Initial Rogue
	[1453] = {
		{ 1784 }, -- Stealth
	},
})
