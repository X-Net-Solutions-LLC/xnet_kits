Config = {}

Config.Currency = 'bank' -- Currency to use for the kits (cash, bank, crypto)

Config.Kits = {
    ['police'] = { -- Kit Name
        name = 'Police Kit', -- Kit Display Name
        items = { -- Items in the kit
            weapon_pistol = 1, -- Item Name, Amount
            weapon_nightstick = 1,
            weapon_stungun = 1,
            weapon_flashlight = 1,
            bandage = 5,
            armor = 1,
            handcuffs = 2
        },
        price = 1000, -- Price of the kit
        job = {'sasp', 'lspd', 'saso'} -- Jobs that can purchase the kit can be a table or a string
    },
    ['ambulance'] = {
        name = 'Ambulance Kit', 
        items = {
            bandage = 10,
            firstaid = 5,
            painkillers = 5,
            stretcher = 1,
            defibrillator = 1,
            medkit = 2
        },
        price = 750,
        job = 'ambulance'
    },

    ['mechanic'] = {
        name = 'Mechanic Kit',
        items = {
            repairkit = 3,
            toolbox = 1,
            lockpick = 2,
            screwdriver = 1,
            wrench = 1
        },
        price = 500,
        job = 'mechanic'
    }
}
