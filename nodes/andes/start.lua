local ID = "andes.start"

local Node = require "node"
local Choice = require "choice"

local node = Node:new(ID) ---@type Node

node.title = "Floresta de Andes"
node.description = "Os raios de sol, só alcança os primeiros 50m dessa densa floresta, o que será que se esconde dentro dessa escuridão?"
node.header = [[%{green}
                                   /\
                              /\  //\\
                       /\    //\\///\\\        /\
                      //\\  ///\////\\\\  /\  //\\
         /\          /  ^ \/^ ^/^  ^  ^ \/^ \/  ^ \
        / ^\    /\  / ^   /  ^/ ^ ^ ^   ^\ ^/  ^^  \
       /^   \  / ^\/ ^ ^   ^ / ^  ^    ^  \/ ^   ^  \       *
      /  ^ ^ \/^  ^\ ^ ^ ^   ^  ^   ^   ____  ^   ^  \     /|\
     / ^ ^  ^ \ ^  _\___________________|  |_____^ ^  \   /||o\
    / ^^  ^ ^ ^\  /______________________________\ ^ ^ \ /|o|||\
   /  ^  ^^ ^ ^  /________________________________\  ^  /|||||o|\
  /^ ^  ^ ^^  ^    ||___|___||||||||||||___|__|||      /||o||||||\       |
 / ^   ^   ^    ^  ||___|___||||||||||||___|__|||          | |           |
/ ^ ^ ^  ^  ^  ^   ||||||||||||||||||||||||||||||oooooooooo| |ooooooo  |
ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
]]

-- table.insert(node.choices, Choice:new(
--     "wahalla.start",
--     "Para os campos verdes da vila de Wahalla"
-- ))
-- table.insert(node.choices, Choice:new(
--     "andes.start",
--     "Para a floresta misteriosas de Andes"
-- ))
table.insert(node.choices, Choice:new(
     "andes.surprise",
     "Explorar a densa floresta de Andes"
))


return node