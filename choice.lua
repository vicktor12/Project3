local class = require "libs.middleclass"
local colors = require "libs.ansicolors"

---@class Choice
local Choice = class("Choice")

---Constructor
function Choice:initialize(destination, description, condition, routine)
    self.description = description ---@type string
    self.destination = destination ---@type string
    self.condition = condition ---@type fun():boolean
    self.routine = routine ---@type function
end

---Verifica se existir condição para prosseguir
---@return boolean
function Choice:hasCondition()
    return self.condition ~= nil
end

---Executa a condição e retorna se deu certo
---@return boolean
function Choice:runCondition()
    if self.condition ~= nil and type(self.condition) == "function" then
        return self.condition
    end
    -- self.description
    return true
end

---@return boolean
function Choice:runRoutine()
    if self.routine ~= nil and type(self.routine) == "function" then
        return self.routine
    end
end

return Choice