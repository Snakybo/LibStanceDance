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

-- /run local a,b,c=table.concat,{},{};for d=1,GetNumShapeshiftForms() do local _,_,_,f=GetShapeshiftFormInfo(d);local e=C_Spell.GetSpellInfo(f).name;b[#b+1]=e;c[#c+1]=f;end print("{ "..a(c, ", ").." }, -- " ..a(b,", "))

if LibStub == nil then
	error("LibShapeshift-1.0 requires LibStub")
end

--- @class LibShapeshift-1.0
--- @field private provider LibShapeshift-1.0.Forms
local LibShapeshift = LibStub:NewLibrary("LibShapeshift-1.0", 1)
if LibShapeshift == nil then
	return
end

--- @class LibShapeshift-1.0.Forms
--- @field public version integer
--- @field public forms { [string|integer]: integer[][] }

--- @param forms LibShapeshift-1.0.Forms
function LibShapeshift:SetFormProvider(forms)
	assert(type(forms) == "table", "bad argument #1: expected table, got " .. type(forms))

	if self.provider == nil or forms.version > self.provider.version then
		self.provider = forms
	end
end

--- Iterate through the available shapshift forms for the given key.
---
--- The key can either be a class file name, or specialization ID, depending on the game version. If specializations exist in the game version, the key should
--- be the specialization ID, otherwise, the key should be a class file name.

--- @param key integer|string
function LibShapeshift:IterateForms(key)
	return ipairs(CopyTable(self:GetFormsInternal(key)))
end

--- Get the number of shapeshift forms available for the given key.
---
--- The key can either be a class file name, or specialization ID, depending on the game version. If specializations exist in the game version, the key should
--- be the specialization ID, otherwise, the key should be a class file name.
---
--- @param key integer|string
--- @return integer
function LibShapeshift:GetNumForms(key)
	return #self:GetFormsInternal(key)
end

--- Get all available shapeshift forms available for the given key.
---
--- The key can either be a class file name, or specialization ID, depending on the game version. If specializations exist in the game version, the key should
--- be the specialization ID, otherwise, the key should be a class file name.
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
	local t = type(specIdOrClassFileName)
	assert(t == "number" or t == "string", "bad argument #1: expected number or string, got " .. t)

	if self.provider == nil then
		return {}
	end

	local forms = self.provider.forms[specIdOrClassFileName]
	if forms == nil then
		return {}
	end

	return forms
end
