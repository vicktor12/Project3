local GameData = require "gamedata"
local nodeLoader = require "node_loader"
local Engine = require "engine"
local utils = require "utils"

---@type GameData
local gameData = GameData:new()
_G.game = gameData

utils.enableUTF8()


nodeLoader.loadnodes()
game.activeNode = nodeLoader.getInitialNode()

if nodeLoader.hasErrors() then
    print("Foram encontrados erros! Execução irá ser cancelada")
    os.exit()
end

local engine = Engine:new() ---@type Engine
engine:runMainLoop()
