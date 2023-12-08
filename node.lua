local class = require "libs.middleclass"
local colors = require "libs.ansicolors"

---@class Node
local Node = class("Node")

---Constructor
function Node:initialize(id)
    self.id = id ---@type string
    self.title = nil ---@type string
    self.description = nil ---@type string
    self.header = nil ---@type string
    self.choices = {} ---@type Choice[]
end


return Node