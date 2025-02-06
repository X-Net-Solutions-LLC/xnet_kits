lib.addCommand('kit', {
    help = 'Purchase a kit',
    params = {
        {
            name = 'kit',
            type = 'string',
            help = 'Kit type to purchase'
        }
    }
}, function(source, args)
    local QBX = exports.qbx_core:GetPlayer(source)
    local kit = args.kit

    if not Config.Kits[kit] then
        lib.notify(source, {
            title = 'Error',
            description = 'Invalid kit type',
            type = 'error'
        })
        return
    end

    local playerJob = QBX.PlayerData.job.name
    local validJobs = type(Config.Kits[kit].job) == 'table' and Config.Kits[kit].job or {Config.Kits[kit].job}

    local hasValidJob = false
    for i=1, #validJobs do
        if playerJob == validJobs[i] then
            hasValidJob = true
            break
        end
    end

    if not hasValidJob then
        lib.notify(source, {
            title = 'Error', 
            description = 'You do not have the required job',
            type = 'error'
        })
        return
    end

    local kitItems = Config.Kits[kit].items
    local kitPrice = Config.Kits[kit].price
    
    if QBX.Functions.GetMoney(Config.Currency) < kitPrice then
        lib.notify(source, {
            title = 'Error',
            description = 'Not enough money', 
            type = 'error'
        })

        return
    end

    QBX.Functions.RemoveMoney(Config.Currency, kitPrice)


    for item, amount in pairs(kitItems) do
        exports.ox_inventory:AddItem(source, item, amount)
    end

    lib.notify(source, {
        title = 'Success',
        description = 'Purchased ' .. Config.Kits[kit].name,
        type = 'success'
    })
end)

lib.addCommand('kits', {
    help = 'View all available kits',
}, function(source) 
    lib.callback.await('xnet_kits:client:openKitMenu', source)
end)

