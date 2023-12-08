local ID = "wahalla.start"

local Node = require "node"
local Choice = require "choice"

local node = Node:new(ID) ---@type Node

node.title = "Campos verdes de Wahalla"
node.description = "Os campos verdes de Wahalla são conhecidos por sua calmaria e poder regenerativo. Ninguém sabe ao certo a força que emana desse campo."
node.header = [[

__      __        .__           .__  .__          
/  \    /  \_____  |  |__ _____  |  | |  | _____   
\   \/\/   /\__  \ |  |  \\__  \ |  | |  | \__  \  
 \        /  / __ \|   Y  \/ __ \|  |_|  |__/ __ \_
  \__/\  /  (____  /___|  (____  /____/____(____  /
       \/        \/     \/     \/               \/ 

]]

-- table.insert(node.choices, Choice:new(
--     "wahalla.start",
--     "Para os campos verdes da vila de Wahalla"
-- ))
-- table.insert(node.choices, Choice:new(
--     "andes.start",
--     "Para a floresta misteriosas de Andes"
-- ))


return node