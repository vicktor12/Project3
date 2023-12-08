local nodeLoader = {}

local nodeDictionary  = {} ---@type table<string,Node>
local initialNode = nil ---@type Node

local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
        return require(path)   
    end)
    if not success then
        warn("falha ao carregar o node ".. path .. ". O arquivo não foi encontrado")
        return
    end
    local node = nodeOrErr
    if nodeDictionary[node.id] ~= nil then
        warn("falha ao carregar o node ".. path .. ". O ID " .. node.id .. " já está registrado.")
        return
    end
    nodeDictionary[node.id] = node
end

function nodeLoader.loadnodes()
    nodeDictionary = {}
    initialNode = require("nodes.start")
    nodeDictionary[initialNode] = initialNode

    loadNode("nodes.andes.start")
    loadNode("nodes.wahalla.start")
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

return nodeLoader