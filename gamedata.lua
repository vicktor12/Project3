local class = require "libs.middleclass"
local colors = require "libs.ansicolors"

---@class GameData
local GameData = class("GameData")

---Constructor
function GameData:initialize()
    self.activeNode = nil ---@type Node
    self.isOver = false ---@type boolean
end


return GameData