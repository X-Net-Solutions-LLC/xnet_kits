function OpenKitMenu()
    local menu = {
        id = 'xnet_kits_menu',
        title = 'Kits',
        options = {}
    }
    
    local player = QBX.PlayerData
    
    for kit, data in pairs(Config.Kits) do
        local validJobs = type(data.job) == 'table' and data.job or {data.job}
        local hasValidJob = false
        
        for _, jobName in ipairs(validJobs) do
            if player.job.name == jobName then
                hasValidJob = true
                break
            end
        end

        local jobLabel
        if type(data.job) == 'table' then
            jobLabel = ''
            for i = 1, #data.job do
                if i == #data.job then
                    jobLabel = jobLabel .. data.job[i]
                else
                    jobLabel = jobLabel .. data.job[i] .. ', '
                end
            end
        else
            jobLabel = data.job
        end
        
        local itemsMenuId = 'kit_items_' .. kit
        local itemsMenu = {
            id = itemsMenuId,
            title = data.name .. ' Items',
            menu = 'xnet_kits_menu',
            options = {}
        }

        for item, amount in pairs(data.items) do
            itemsMenu.options[#itemsMenu.options + 1] = {
                title = item,
                description = 'Amount: ' .. amount,
                disabled = true
            }
        end
        itemsMenu.options[#itemsMenu.options + 1] = {
            title = 'Purchase',
            description = 'Purchase this kit',
            disabled = not hasValidJob,
            onSelect = function()
                ExecuteCommand('kit ' .. kit)
            end
        }

        lib.registerContext(itemsMenu)

        -- Main menu option
        menu.options[#menu.options + 1] = {
            title = data.name,
            description = ('%s\nPrice: $%s\nRequired Job: %s'):format(data.description, data.price, jobLabel),
            menu = itemsMenuId,
            disabled = not hasValidJob,
        }
    end

    lib.registerContext(menu)
    lib.showContext(menu.id)
end

lib.callback.register('xnet_kits:client:openKitMenu', OpenKitMenu)
