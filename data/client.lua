local QBCore = exports['qb-core']:GetCoreObject()

RegisterKeyMapping('+changejob', 'Toggle MultiJob Menu', 'keyboard', Config.OpenKey)

RegisterCommand('+changejob', function()
    TriggerEvent('710-multiJob:Client:OpenMenu')
end)
if Config.usingQBmenu then 
    RegisterNetEvent('710-multiJob:Client:OpenMenu', function()
        local Player = QBCore.Functions.GetPlayerData()
        local citizenid = Player.citizenid
        local Menu = {
            {
                header = "Job Changer",
                isMenuHeader = true,
                icon = "fas fa-circle-info"
            },
            {
                header = "Current Job",
                isMenuHeader = true,
                txt = "Job: "..Player.job.label.."<br>".."Grade: "..Player.job.grade.name..".",
                icon = "fas fa-person-circle-check",
            },
            {
                header = "Change Jobs",
                txt = "Change to your second job.",
                icon = "fas fa-briefcase",
                params = {
                    isServer = true,
                    event = "710-multiJob:Server:ChangeJob",
                    args = {
                        citizenid = citizenid
                    }
                }
            },
        }
        exports['qb-menu']:openMenu(Menu)
    end)
end

if Config.usingRenzuContext then 
    RegisterNetEvent('710-multiJob:Client:OpenMenu', function()
        local Player = QBCore.Functions.GetPlayerData()
        local citizenid = Player.citizenid
        local multimenu = {}
    firstmenu = {
    ['ChangeJob'] = {
        ['title'] = 'Change Jobs',
        ['fa'] = '<i class="fad fa-hood-cloak"></i>',
        ['type'] = 'event', 
        ['content'] = '710-multiJob:Server:ChangeJob',
        ['variables'] = {server = true, send_entity = false, onclickcloseui = true, custom_arg = {args = citizenid}, arg_unpack = false},
    },
    ['CheckJob'] = {
        ['title'] = 'Your Current job is '..Player.job.label..".", 
        ['fa'] = '<i class="fad fa-question-square"></i>',
        ['type'] = 'event', 
        ['content'] = '710-multiJob:Server:ChangeJob', -- Doesnt matter what one they click they will still change jobs
        ['variables'] = {server = true, send_entity = false, onclickcloseui = true, custom_arg = {args = citizenid}, arg_unpack = false},
    },
    }
    multimenu['Change Jobs'] = firstmenu 
        TriggerEvent('renzu_contextmenu:insertmulti',multimenu,"Switch Job", false,"<left><img src=https://i.imgur.com/0SqHk1a.png width=35vh></center></i> Change Jobs<br>")
        TriggerEvent('renzu_contextmenu:show')
    end)
end
