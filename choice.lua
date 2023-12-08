local class = require "libs.middleclass"
local colors = require "libs.ansicolors"

---@class Choice
local Choice = class("Choice")

---Constructor
function Choice:initialize()
    self.description = nil ---@type string
    self.destination = nil ---@type string
    self.condition = nil
end

---Verifica se existir condição para prosseguir
---@return boolean
function Choice:hasCondition()
    return self.condition ~= nil
end

---Executa a condição e retorna se deu certo
---@return boolean
function Choice:runCondition()
    -- self.description
    return true
end

return Choice