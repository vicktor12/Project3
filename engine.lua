local class = require "libs.middleclass"
local nodeLoader = require "node_loader"
local ansicolorsx = require "libs.ansicolors"
local utils = require "utils"

---@class Engine
local Engine = class("Engine")

function Engine:initialize()
    
end

local function print(...)
    _G.print(ansicolorsx(...))
end

local function iowrite(...)
    _G.io.write(ansicolorsx(...))
end

function Engine:runMainLoop()
    while not game.isOver do
        local node = game.activeNode
        utils.clearScreen()
        self:printNode(node)
        if node.gameOver then
            print()
            print("%{red}====== Fim de Jogo! ==========")
            os.exit()
        elseif node.gameWon then
            print()
            print("%{green}====== Você venceu! ==========")
            os.exit()
        end

        local validChoices = self:getValidChoices(node)
        if #validChoices == 0 then
            print("Nenhuma escolha válida para o node " .. node.id)
            os.exit()
        end

        self:showChoices(validChoices)
        local choiceIndex = self:askForInput(#validChoices)
        local choice = validChoices[choiceIndex]

        choice:runRoutine()

        local destinationId = choice.destination
        local destinationNode = nodeLoader.getNode(destinationId)
        game.activeNode = destinationNode
        -- game.isOver = true
    end
    
end

---@param title string/nil
---@return string
local function createSeparator(title)
    local size = 50
    local result = "%{red}-----"
    local length = 5
    if title then
        result = string.format("%s[%%{yellow}%s%%{white}]", result, title:upper())
        length = length + 2 + title:len()
    end
    for i = length, size, 1 do
        result = result .. "-"
    end
    return result
end

---@param node Node
function Engine:printNode(node)
    if node.header then
        print("%{blue}=====================================")
        print(node.header)
    end
    print(createSeparator(node.title))
    -- print("%{red}======================== ".. node.title .. " ========================")
    print("%{cyan}"..node.description)
    -- print("%{red}===================================================================")
    print(createSeparator())
end

---@param node Node
---@return Choice[]
function Engine:getValidChoices(node)
    local result = {}---@type Choice[]
    for _, choice in pairs(node.choices) do
        if (not choice:hasCondition()) or (choice:hasCondition() and choice:runCondition()) then
            table.insert(result, choice)
        end
    end
    return result
end

---@param choices Choice[]
function Engine:showChoices(choices)
    for i, choice in pairs(choices) do
        print(string.format("%d) %%{yellow}%s", i, choice.description))
    end
end

---@param amount number
---@return number
function Engine:askForInput(amount)
    while true do
        io.write("> ")
        local answerString = io.read() ---@type string
        local answer = tonumber(answerString) ---@type number
        local isAnswervalid = answer ~= nil and answer >= 1 and answer <= amount
        if isAnswervalid then
            return answer
        end
        print("%{red}Resposta inválida, tente novamente.\n")
    end
end

return Engine