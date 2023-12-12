local nodeLoader = {}

local nodeDictionary  = {} ---@type table<string,Node>
local initialNode = nil ---@type Node
local hasErrors = false

---@param path string
---@return Node
local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
        return require(path)   
    end)
    if not success then
        warn("falha ao carregar o node ".. path .. ". O arquivo não foi encontrado")
        hasErrors = true
        return nil
    end
    local node = nodeOrErr
    if nodeDictionary[node.id] ~= nil then
        warn("falha ao carregar o node ".. path .. ". O ID " .. node.id .. " já está registrado.")
        hasErrors = true
        return nil
    end
    nodeDictionary[node.id] = node
    return node
end


function nodeLoader.loadnodes()
    nodeDictionary = {}
    initialNode = require("nodes.start")
    nodeDictionary[initialNode] = initialNode

    nodeLoader.loadNodesFromChoices(initialNode)

    -- loadNode("nodes.andes.start")
    -- loadNode("nodes.andes.surprise")
    -- loadNode("nodes.wahalla.start")

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

---@param parentNode Node
function nodeLoader.loadNodesFromChoices(parentNode)
    for _, choice in pairs(parentNode.choices) do
        local destinationId = choice.destination
        if nodeDictionary[destinationId] then
            local childNode = loadNode("node."..destinationId)            
            if childNode then
                nodeLoader.loadNodesFromChoices(childNode)
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