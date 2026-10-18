-- LibShapeshift-1.0, a World of Warcraft library to provide shapeshift form information.
-- Copyright (C) 2026 Kevin Krol

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.

-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
-- USA

-- /run local a,b,c=table.concat,{},{};for d=1,GetNumShapeshiftForms() do local _,_,_,f=GetShapeshiftFormInfo(d);local e=C_Spell.GetSpellInfo(f).name;b[#b+1]=e;c[#c+1]=f;end print("{ "..a(c, ", ").." }, -- " ..a(b,", "))

if LibStub == nil then
	error("LibShapeshift-1.0 requires LibStub")
end

--- @class LibShapeshift-1.0
local LibShapeshift = LibStub:NewLibrary("LibShapeshift-1.0", 1)
if LibShapeshift == nil then
	return
end

--- @alias LibShapeshift-1.0.Forms { [string|integer]: integer[][] }

--- @param forms LibShapeshift-1.0.Forms
function LibShapeshift:SetForms(forms)
	assert(type(forms) == "table", "bad argument #1: expected table, got " .. type(forms))

	--- @private
	self.forms = forms
end

--- @param key integer|string
function LibShapeshift:IterateForms(key)
	return ipairs(self:GetFormsInternal(key))
end

--- Get the number of shapeshift forms available for the given key.
---
--- The key can either be a class ID, or specialization ID, depending on the game version. If specializations exist in the game version, the key should be the
--- specialization ID, otherwise, the key should be a class ID.
---
--- @param key integer|string
--- @return integer
function LibShapeshift:GetNumForms(key)
	return #self:GetFormsInternal(key)
end

--- Get all available shapeshift forms available for the given key.
---
--- The key can either be a class ID, or specialization ID, depending on the game version. If specializations exist in the game version, the key should be the
--- specialization ID, otherwise, the key should be a class ID.
---
--- @param key integer|string
--- @return integer[][]
function LibShapeshift:GetForms(key)
	return CopyTable(self:GetFormsInternal(key))
end

--- @private
--- @param specIdOrClassFileName integer|string
--- @return integer[][]
function LibShapeshift:GetFormsInternal(specIdOrClassFileName)
	assert(tContains({"number", "string"}, type(specIdOrClassFileName)), "bad argument #1: expected number or string, got " .. type(specIdOrClassFileName))

	if self.forms == nil then
		error("No forms registered, register them first using 'SetForms'.")
	end

	local forms = self.forms[specIdOrClassFileName]
	if forms == nil then
		return {}
	end

	return forms
end
