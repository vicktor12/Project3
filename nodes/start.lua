
local ID = "start"

local Node = require "node"
local Choice = require "choice"

local node = Node:new(ID) ---@type Node

node.title = "Uma nova aventura"
node.description = "Em um belo dia de sol, você decidir se ajeitar e embarcar em uma nova aventura. Porém qual será o destino desse novo desafio?"
node.header = [[
    
   _____       .___                    __                           _________.__              .__          __                
   /  _  \    __| _/__  __ ____   _____/  |_ __ _________   ____    /   _____/|__| _____  __ __|  | _____ _/  |_  ___________ 
  /  /_\  \  / __ |\  \/ // __ \ /    \   __\  |  \_  __ \_/ __ \   \_____  \ |  |/     \|  |  \  | \__  \\   __\/  _ \_  __ \
 /    |    \/ /_/ | \   /\  ___/|   |  \  | |  |  /|  | \/\  ___/   /        \|  |  Y Y  \  |  /  |__/ __ \|  | (  <_> )  | \/
 \____|__  /\____ |  \_/  \___  >___|  /__| |____/ |__|    \___  > /_______  /|__|__|_|  /____/|____(____  /__|  \____/|__|   
         \/      \/           \/     \/                        \/          \/          \/                \/                   
 
]]

table.insert(node.choices, Choice:new(
    "wahalla.start",
    "Para os campos verdes da vila de Wahalla"
))
table.insert(node.choices, Choice:new(
    "andes.start",
    "Para a floresta misteriosa de Andes"
))


return node