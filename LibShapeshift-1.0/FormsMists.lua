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
	-- Holy Paladin
	[65] = {
		{ 31801 }, -- Seal of Truth
		{ 20154 }, -- Seal of Righteousness
		{ 20165 }, -- Seal of Insight
	},
	-- Protection Paladin
	[66] = {
		{ 31801 }, -- Seal of Truth
		{ 20154 }, -- Seal of Righteousness
		{ 20165 }, -- Seal of Insight
	},
	-- Retribution Paladin
	[70] = {
		{ 31801 }, -- Seal of Truth
		{ 20154 }, -- Seal of Righteousness
		{ 20164 }, -- Seal of Justice
		{ 20165 }, -- Seal of Insight
	},
	-- Initial Paladin
	[1451] = {
		{ 31801 }, -- Seal of Truth
		{ 20154 }, -- Seal of Righteousness
		{ 20165 }, -- Seal of Insight
	},

	-- Arms Warrior
	[71] = {
		{ 2457 }, -- Battle Stance
		{ 71 }, -- Defensive Stance
		{ 2458 }, -- Berserker Stance
	},
	-- Fury Warrior
	[72] = {
		{ 2457 }, -- Battle Stance
		{ 71 }, -- Defensive Stance
		{ 2458 }, -- Berserker Stance
	},
	-- Protection Warrior
	[73] = {
		{ 2457 }, -- Battle Stance
		{ 71 }, -- Defensive Stance
		{ 2458 }, -- Berserker Stance
	},
	-- Initial Warrior
	[1446] = {
		{ 2457 }, -- Battle Stance
		{ 71 }, -- Defensive Stance
		{ 2458 }, -- Berserker Stance
	},

	-- Balance Druid
	[102] = {
		{ 5487 }, -- Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 24858 }, -- Moonkin Form
		{ 40120 }, -- Swift Flight Form
	},
	-- Feral Druid
	[103] = {
		{ 5487 }, -- Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 40120 }, -- Swift Flight Form
	},
	-- Guardian Druid
	[104] = {
		{ 5487 }, -- Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 40120 }, -- Swift Flight Form
	},
	-- Restoration Druid
	[105] = {
		{ 5487 }, -- Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 40120 }, -- Swift Flight Form
	},
	-- Initial Druid
	[1447] = {
		{ 5487 }, -- Bear Form
		{ 1066 }, -- Aquatic Form
		{ 768 }, -- Cat Form
		{ 783 }, -- Travel Form
		{ 40120 }, -- Swift Flight Form
	},

	-- Beast Mastery Hunter
	[253] = {
		{ 13165 }, -- Aspect of the Hawk
		{ 5118 }, -- Aspect of the Cheetah
		{ 13159 }, -- Aspect of the Pack
	},
	-- Marksmanship Hunter
	[254] = {
		{ 13165 }, -- Aspect of the Hawk
		{ 5118 }, -- Aspect of the Cheetah
		{ 13159 }, -- Aspect of the Pack
	},
	-- Survival Hunter
	[255] = {
		{ 13165 }, -- Aspect of the Hawk
		{ 5118 }, -- Aspect of the Cheetah
		{ 13159 }, -- Aspect of the Pack
	},
	-- Initial Hunter
	[1448] = {
		{ 13165 }, -- Aspect of the Hawk
		{ 5118 }, -- Aspect of the Cheetah
		{ 13159 }, -- Aspect of the Pack
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
		{ 51713 }, -- Shadow Dance
	},
	-- Initial Rogue
	[1453] = {
		{ 1784 }, -- Stealth
	},

	-- Shadow Priest
	[258] = {
		{ 15473 }, -- Shadowform
	},

	-- Demonology Warlock
	[266] = {
		{ 103958 }, -- Metamorphosis
	},

	-- Blood Death Knight
	[250] = {
		{ 48263 }, -- Blood Presence
		{ 48266 }, -- Frost Presence
		{ 48265 }, -- Unholy Presence
	},
	-- Frost Death Knight
	[251] = {
		{ 48263 }, -- Blood Presence
		{ 48266 }, -- Frost Presence
		{ 48265 }, -- Unholy Presence
	},
	-- Unholy Death Knight
	[252] = {
		{ 48263 }, -- Blood Presence
		{ 48266 }, -- Frost Presence
		{ 48265 }, -- Unholy Presence
	},
	-- Initial Death Knight
	[1455] = {
		{ 48263 }, -- Blood Presence
		{ 48266 }, -- Frost Presence
		{ 48265 }, -- Unholy Presence
	},

	-- Brewmaster Monk
	[268] = {
		{ 115069 }, -- Stance of the Sturdy Ox
		{ 103985 }, -- Stance of the Fierce Tiger
	},
	-- Windwalker Monk
	[269] = {
		{ 103985 }, -- Stance of the Fierce Tiger
	},
	-- Mistweaver Monk
	[270] = {
		{ 115070 }, -- Stance of the Wise Serpent
		{ 103985 }, -- Stance of the Fierce Tiger
	},
	-- Initial Monk
	[1450] = {
		{ 103985 }, -- Stance of the Fierce Tiger
	},
})
