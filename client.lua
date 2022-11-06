local USER_DOCUMENTS = {}
local CURRENT_DOCUMENT = nil
local DOCUMENT_FORMS = nil


CreateThread(function()
    DOCUMENT_FORMS = Config.Documents[Config.Locale]
    GetAllUserForms()
    SetNuiFocus(false, false)
end)

function OpenMainMenu()
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = _U('documents')},
        {icon = "fas fa-scroll", title = _U('public_documents'), value = "public_docs"},
        {icon = "fas fa-scroll", title = _U('job_documents'), value = "job_docs"},
        {icon = "fas fa-scroll", title = _U('saved_documents'), value = "saved_docs"}
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "public_docs" then
            OpenNewPublicFormMenu()
        elseif element.value == "job_docs" then
            OpenNewJobFormMenu()
        elseif element.value == "saved_docs" then
            OpenMyDocumentsMenu()
        end
    end)
end

function CopyFormToPlayer(aPlayer)
    TriggerServerEvent('esx_documents:CopyToPlayer', aPlayer, CURRENT_DOCUMENT)
    CURRENT_DOCUMENT = nil;
    CloseMenu()
end

function ShowToNearestPlayers(aDocument,curDoc)
    local elements  = {
        {unselectable = true, icon = "fas fa-users", title = _U('nearest_players')}
    }

    local players_clean = GetNeareastPlayers()
    CURRENT_DOCUMENT = aDocument
    if #players_clean > 0 then
        for i=1, #players_clean, 1 do
            elements[#elements+1] = {
                icon = "fas fa-user",
                title = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                arg = players_clean[i].playerId
            }
        end
    end

    ESX.OpenContext("right", elements, function(menu,element)
        ShowDocument(element.arg)
    end)
end

function CopyToNearestPlayers(aDocument,curDoc)
    local elements  = {
        {unselectable = true, icon = "fas fa-users", title = _U('nearest_players')}
    }

    local players_clean = GetNeareastPlayers()
    CURRENT_DOCUMENT = aDocument
    if #players_clean > 0 then
        for i=1, #players_clean, 1 do
            elements[#elements+1] = {
                icon = "fas fa-user",
                title = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                arg = players_clean[i].playerId
            }
        end
    end

    ESX.OpenContext("right", elements, function(menu,element)
        CopyFormToPlayer(element.arg)
    end)
end

function OpenNewPublicFormMenu()
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = _U('public_documents')}
    }
    for i=1, #DOCUMENT_FORMS["public"], 1 do
        elements[#elements+1] = {
            icon = "fas fa-scroll",
            title = DOCUMENT_FORMS["public"][i].headerTitle,
            arg = DOCUMENT_FORMS["public"][i]
        }
    end

    elements[#elements+1] = {
        icon = "fas fa-arrow-left",
        title = _U("go_back"),
        value = "go_back"
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "go_back" then
            OpenMainMenu()
        else
            CreateNewForm(element.arg)
        end
    end)
end

function OpenNewJobFormMenu()
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = _U('job_documents')}
    }

    if DOCUMENT_FORMS[ESX.PlayerData.job.name] ~= nil then
        for i=1, #DOCUMENT_FORMS[ESX.PlayerData.job.name], 1 do
            elements[#elements+1] = {
                icon = "fas fa-scroll",
                title = DOCUMENT_FORMS[ESX.PlayerData.job.name][i].headerTitle,
                arg = DOCUMENT_FORMS[ESX.PlayerData.job.name][i]
            }
        end
    end

    elements[#elements+1] = {
        icon = "fas fa-arrow-left",
        title = _U("go_back"),
        value = "go_back"
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "go_back" then
            OpenMainMenu()
        else
            CreateNewForm(element.arg)
        end
    end)
end

function OpenMyDocumentsMenu()
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = _U('saved_documents')}
    }

    for i=#USER_DOCUMENTS, 1, -1 do
        local date_created = ""
        if USER_DOCUMENTS[i].data.headerDateCreated ~= nil then
            date_created = USER_DOCUMENTS[i].data.headerDateCreated .. " - "
        end

        elements[#elements+1] = {
            icon = "fas fa-scroll",
            title = date_created .. USER_DOCUMENTS[i].data.headerTitle,
            arg = USER_DOCUMENTS[i]
        }
    end

    elements[#elements+1] = {
        icon = "fas fa-arrow-left",
        title = _U("go_back"),
        value = "go_back"
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "go_back" then
            OpenMainMenu()
        else
            OpenFormPropertiesMenu(element.arg,element.title)
        end
    end)
end

function OpenFormPropertiesMenu(aDocument,title)
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = title},
        {icon = "fas fa-scroll",     title = _U('view_bt'),     value = "view_bt",   arg = aDocument.data},
        {icon = "fas fa-scroll",     title = _U('show_bt'),     value = "show_bt",   arg = aDocument.data},
        {icon = "fas fa-scroll",     title = _U('give_copy'),   value = "give_copy", arg = aDocument.data},
        {icon = "fas fa-scroll",     title = _U('delete_bt'),   value = "delete_bt", arg = aDocument},
        {icon = "fas fa-arrow-left", title = _U('go_back'),     value = "go_back"},
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "view_bt" then
            ViewDocument(element.arg)
        elseif element.value == "show_bt" then
            ShowToNearestPlayers(element.arg, title)
        elseif element.value == "give_copy" then
            CopyToNearestPlayers(element.arg, title)
        elseif element.value == "delete_bt" then
            OpenDeleteFormMenu(element.arg, title)
        elseif element.value == "go_back" then
            OpenMyDocumentsMenu()
        end
    end)
end

function OpenDeleteFormMenu(aDocument,curDoc)
    local elements = {
        {unselectable = true, icon = "fas fa-scroll", title = curDoc},
        {icon = "fas fa-scroll", title = _U('yes_delete'), value = "confirm", arg = aDocument},
        {icon = "fas fa-arrow-left", title = _U('go_back'), value = "go_back", arg = aDocument, docTitle = curDoc}
    }

    ESX.OpenContext("right", elements, function(menu,element)
        if element.value == "confirm" then
            DeleteDocument(element.arg)
        elseif element.value == "go_back" then
            OpenFormPropertiesMenu(element.arg,element.docTitle)
        end
    end)
end

function CloseMenu()
    ESX.CloseContext()
end

function DeleteDocument(aDocument)
    local key_to_remove = nil

    ESX.TriggerServerCallback('esx_documents:deleteDocument', function (cb)
        if cb == true then
            for i=1, #USER_DOCUMENTS, 1 do
                if USER_DOCUMENTS[i].id == aDocument.id then
                    key_to_remove = i
                end
            end

            if key_to_remove ~= nil then
                table.remove(USER_DOCUMENTS, key_to_remove)
            end
            OpenMyDocumentsMenu()
        end
    end, aDocument.id)
end

function CreateNewForm(aDocument)
    ESX.TriggerServerCallback('esx_documents:getPlayerDetails', function (cb_player_details)
        if cb_player_details ~= nil then
            SetNuiFocus(true, true)
            aDocument.headerFirstName = cb_player_details.firstname
            aDocument.headerLastName = cb_player_details.lastname
            aDocument.headerDateOfBirth = cb_player_details.dateofbirth
            aDocument.headerJobLabel = ESX.PlayerData.job.label
            aDocument.headerJobGrade = ESX.PlayerData.job.grade_label
            aDocument.locale = Config.Locale

            SendNUIMessage({
                type = "createNewForm",
                data = aDocument
            })
        end
    end, data)
end

function ShowDocument(aPlayer)
    TriggerServerEvent('esx_documents:ShowToPlayer', aPlayer, CURRENT_DOCUMENT)
    CURRENT_DOCUMENT = nil
    CloseMenu()
end

RegisterNetEvent('esx_documents:viewDocument')
AddEventHandler('esx_documents:viewDocument', function( data )
    ViewDocument(data)
end)

function ViewDocument(aDocument)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ShowDocument",
        data = aDocument
    })
end

RegisterNetEvent('esx_documents:copyForm')
AddEventHandler('esx_documents:copyForm', function( data )
    table.insert(USER_DOCUMENTS, data)
end)

function GetAllUserForms()
    ESX.TriggerServerCallback('esx_documents:getPlayerDocuments', function (cb_forms)
        if cb_forms ~= nil then
            USER_DOCUMENTS = cb_forms
        end
    end, data)
end

RegisterNUICallback('form_close', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('form_submit', function(data, cb)
    CloseMenu()
    ESX.TriggerServerCallback('esx_documents:submitDocument', function (cb_form)
        if cb_form ~= nil then
            table.insert(USER_DOCUMENTS, cb_form)
        end
    end, data)
    SetNuiFocus(false, false)
end)


function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end

-- Command/Open menu
RegisterCommand("openDocuments", function()
    OpenMainMenu()
end)
RegisterKeyMapping("openDocuments", "Open Documents", "keyboard", "F10")
TriggerEvent('chat:removeSuggestion', '/openDocuments')
