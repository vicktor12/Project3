local ID = "andes.start"

local Node = require "node"
local Choice = require "choice"

local node = Node:new(ID) ---@type Node

node.title = "Floresta de Andes"
node.description = "Os raios de sol, só alcança os primeiros 50m dessa densa floresta, o que será que se esconde dentro dessa escuridão?"
node.header = [[

_____              .___              ___________                            __   
/  _  \   ____    __| _/____   ______ \_   _____/__________   ____   _______/  |_ 
/  /_\  \ /    \  / __ |/ __ \ /  ___/  |    __)/  _ \_  __ \_/ __ \ /  ___/\   __\
/    |    \   |  \/ /_/ \  ___/ \___ \   |     \(  <_> )  | \/\  ___/ \___ \  |  |  
\____|__  /___|  /\____ |\___  >____  >  \___  / \____/|__|    \___  >____  > |__|  
      \/     \/      \/    \/     \/       \/                    \/     \/        

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