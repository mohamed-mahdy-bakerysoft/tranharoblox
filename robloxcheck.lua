
local Vk = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local homdo = ddd:InvokeServer("getInventory")
    for i, v in pairs(homdo) do
        if v.Rarity == 3 and v.Type == "Wear" and v.Name == "Valkyrie Helm" then
            return "VK"
        end
    end
    return ""
end)
local leopardd = (function()
    local ddd =  game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local fr = {}
    local homdo = ddd:InvokeServer("getInventory")
    if homdo then
        for i, v in pairs(homdo) do
            if v.Type == "Blox Fruit" then
                if v.Rarity == 4 and v.Name == "Leopard-Leopard" then
                    return "leopard"
                end
            end
        end
    end
    return ""
end)
local leopardd1 = (function()
    local ddd =  game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    if ddd == "Leopard-Leopard" then
		return "LEOPARD"
    end
    return ""
end)
local dough = (function()
    local ddd =  game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local fr = {}
    local homdo = ddd:InvokeServer("getInventory")
    if homdo then
        for i, v in pairs(homdo) do
            if v.Type == "Blox Fruit" then
                if v.Rarity == 4 and v.Name == "Dough-Dough" then
                    return "mochi"
                end
            end
        end
    end
    return ""
end)
local dough1 = (function()
    local ddd =  game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
    if ddd == "Dough-Dough" then
		return "MOCHI"
    end
    return ""
end)
local MF = (function()
    local ddd = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local sw = {}
    local homdo = ddd:InvokeServer("getInventory")
    for i, v in pairs(homdo) do
        if v.Rarity == 4 and v.Type == "Material" and v.Name == "Mirror Fractal"  then
            return "MF"
        end
    end
    return ""
end)
    function CheckItem(Item)
        have = false

        for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
            if v.Name == Item then
                have = true

                for i2, v2 in pairs(v) do
                    print(i2, v2)

                    if type(v2) == "table" then
                        for i3, v3 in pairs(v2) do
                            print(i2, v2)
                        end
                    end
                end
            end
        end

        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name == Item then
                have = true
            end
        end

        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == Item then
                have = true
            end
        end

        return have
    end

    function checkCDK()
        textreturn = ""

        if CheckItem("Cursed Dual Katana") == true then
            textreturn = "CDK"
        end

        return textreturn
    end

    function checkSG()
        textreturn = ""

        if CheckItem("Soul Guitar") == true then
            textreturn = "SG"
        end

        return textreturn
    end

    function checkMeleeGod()
    local meleeCount = 0
    local textReturn = ""
    local meleeTypes = {"Superhuman", "ElectricClaw", "DragonTalon", "SharkmanKarate", "DeathStep", "Godhuman"}
    
    for _, meleeType in ipairs(meleeTypes) do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. meleeType, true) == 1 then
            meleeCount = meleeCount + 1
        end
    end

    if meleeCount >= 3 and meleeCount <= 5 then
        textReturn = "Melee"
    elseif meleeCount == 6 then
        textReturn = "God"
    end

    return textReturn
end
	
    function checkLeopard()
        local hasLeopard = false
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
            if v.Price >= 5000000 then  
                hasLeopard = true
            end
        end

        if hasLeopard then
            return "Leopard"
        else
            return ""
        end
    end


    while wait() do
        writefile("info.txt", tostring(game.Players.LocalPlayer.Character) .. "\n" .. game.Players.LocalPlayer.Data.Level.Value .. "\n" .. game.Players.LocalPlayer.Data.Beli.Value .. "\n" .. game.Players.LocalPlayer.Data.Fragments.Value .. "\n" .. checkMeleeGod() .. "\n" .. checkCDK() .. "\n" .. checkSG() .. "\n" .. dough() .. "\n" .. dough1() .. "\n" .. Vk() .. "\n" .. MF() .. "\n" .. leopardd() .. "\n" .. leopardd1() .. "\n")
        writefile("info1.txt", tostring(game.Players.LocalPlayer.Character) .. "\n" .. game.Players.LocalPlayer.Data.Level.Value .. "\n" .. game.Players.LocalPlayer.Data.Beli.Value .. "\n" .. game.Players.LocalPlayer.Data.Fragments.Value .. "\n" .. checkMeleeGod() .. "\n" .. checkCDK() .. "\n" .. checkSG() .. "\n" .. dough() .. "\n" .. dough1() .. "\n" .. Vk() .. "\n" .. MF() .. "\n" .. leopardd() .. "\n" .. leopardd1() .. "\n")
	wait(60)
    end
