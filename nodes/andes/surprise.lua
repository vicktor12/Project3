local ID = "andes.surprise"

local Node = require "node"
local Choice = require "choice"

local node = Node:new(ID) ---@type Node
node.title = "Sem reação!"
node.gameOver = true
node.description = "%{cyan}Por conta da escuridão da floresta, você não percebeu a serpente gigante que se aproximava e devido a tamanha surpresa você congelou de medo e foi comido!"

return node