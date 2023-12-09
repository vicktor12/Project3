local utils = {}

---@return utf8lib
function utils.enableUTF8()
    os.execute("chcp 65001 > NUL")
end

---@return boolean
function utils.isWindows()
    return type(package) == 'table' and type(package.config) == 'string' and package.config:sub(1,1) == '\\'
end

function utils.clearScreen()
    if utils.isWindows() then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

return utils