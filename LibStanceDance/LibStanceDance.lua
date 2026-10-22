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

---@class LibStanceDance.Provider
---@field public version integer
---@field public forms table<integer, integer[][]>
---@field public aliases table<integer, integer>?

---@class LibStanceDance.Form
---@field public spellIds integer[]
---@field public spellId integer
---@field public icon integer
---@field public name string

if LibStub == nil then
	error("LibStanceDance requires LibStub")
end

---@class LibStanceDance
---@field private provider LibStanceDance.Provider?
local LibStanceDance = LibStub:NewLibrary("LibStanceDance", 2)
if LibStanceDance == nil then
	return
end

local cache = {
	--- @type table<integer, integer>
	numForms = {},

	--- @type table<integer, LibStanceDance.Form[]>
	forms = {},
}

local function ClearCache()
	wipe(cache.numForms)
	wipe(cache.forms)
end

---@param forms LibStanceDance.Provider
function LibStanceDance:SetProvider(forms)
	assert(type(forms) == "table", "bad argument #1: expected table, got " .. type(forms))

	if self.provider ~= nil and forms.version <= self.provider.version then
		return
	end

	self.provider = forms
	ClearCache()
end

---Get the number of shapeshift forms available for the given key.
---
---@param specId integer
---@return integer
function LibStanceDance:GetNumForms(specId)
	assert(self.provider ~= nil, "No provider registered, register one first using 'SetProvider'.")

	if cache.numForms[specId] ~= nil then
		return cache.numForms[specId]
	end

	local result = #self:GetFormsInternal(specId)

	cache.numForms[specId] = result
	return result
end

---Get all available shapeshift forms available for the given key.
---
---@param specId integer
---@return LibStanceDance.Form[]
function LibStanceDance:GetForms(specId)
	assert(self.provider ~= nil, "No provider registered, register one first using 'SetProvider'.")

	return CopyTable(self:GetFormsInternal(specId))
end

---@private
---@param specId integer
---@return LibStanceDance.Form[]
function LibStanceDance:GetFormsInternal(specId)
	assert(self.provider ~= nil, "No provider registered, register one first using 'SetProvider'.")

	if cache.forms[specId] ~= nil then
		return cache.forms[specId]
	end

	if self.provider.aliases ~= nil then
		specId = self.provider.aliases[specId] or specId
	end

	---@type integer[][]
	local forms = self.provider.forms[specId]
	if forms == nil then
		return {}
	end

	---@type LibStanceDance.Form[]
	local result = {}

	for i = 1, #forms do
		local spellId = forms[i][#forms[i]]
		local name = C_Spell.GetSpellName(spellId)
		local icon = C_Spell.GetSpellTexture(spellId)

		result[i] = {
			spellIds = forms[i],
			spellId = spellId,
			name = name,
			icon = icon,
		}
	end

	cache.forms[specId] = result
	return result
end
