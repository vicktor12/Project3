os.execute("chcp 65001 > NUL")

local GameData = require "gamedata"
local nodeLoader = require "node_loader"
local Engine = require "engine"

---@type GameData
local gameData = GameData:new()
_G.game = gameData


nodeLoader.loadnodes()
game.activeNode = nodeLoader.getInitialNode()

local engine = Engine:new() ---@type Engine
engine:runMainLoop()
