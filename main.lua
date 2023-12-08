local GameData = require "gamedata"
local nodeLoader = require "node_loader"

---@type GameData
local gameData = GameData:new()
_G.game = gameData


nodeLoader.loadnodes()
for id, node in pairs(nodeLoader.getNodes()) do
    print(id .. ": " .. node.title)
end

local initialNode = nodeLoader.getInitialNode()
print(initialNode.id .. ": " .. initialNode.description)