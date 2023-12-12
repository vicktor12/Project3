local nodeLoader = {}

local nodeDictionary  = {} ---@type table<string,Node>
local initialNode = nil ---@type Node
local hasErrors = false

local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
        return require(path)   
    end)
    if not success then
        warn("falha ao carregar o node ".. path .. ". O arquivo não foi encontrado")
        hasErrors = true
        return
    end
    local node = nodeOrErr
    if nodeDictionary[node.id] ~= nil then
        warn("falha ao carregar o node ".. path .. ". O ID " .. node.id .. " já está registrado.")
        hasErrors = true
        return
    end
    nodeDictionary[node.id] = node
end

function nodeLoader.loadnodes()
    nodeDictionary = {}
    initialNode = require("nodes.start")
    nodeDictionary[initialNode] = initialNode

    loadNode("nodes.andes.start")
    loadNode("nodes.andes.surprise")
    loadNode("nodes.wahalla.start")

    for id, node in pairs(nodeDictionary) do
        for _, choice in pairs(node.choices) do
            local destinationId = choice.destination
            local destinationNode = nodeDictionary[destinationId]
            if destinationNode == nil then
                warn("Uma das escolhas do "..node.id..", tem como destino um node que não existe. "..destinationId)
            end
        end
    end
end

---@return table<string,Node>
function nodeLoader.getNodes()
    return nodeDictionary
end

---@param nodeId string
---@return Node
function nodeLoader.getNode(nodeId)
    return nodeDictionary[nodeId]
end

---@return Node
function nodeLoader.getInitialNode()
    return initialNode
end

---@return boolean
function nodeLoader.hasErrors()
    return hasErrors
end

return nodeLoader