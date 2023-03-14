function Recipe.OnGiveXP.tAEDoWork(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity)
end

function Recipe.OnCreate.DismantleRadioHAM(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioTransmitter");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.LightBulbGreen");
    end
    DismantleRadio_OnCreate(items, result, player, selectedItem);
end

function Recipe.OnCreate.DismantleRadio(items, result, player, selectedItem)           --TODO adding return items/chance based on selectedItem value
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    for i=1,ZombRand(1,4) do
        local r = ZombRand(1,4);
        if r==1 then
            player:getInventory():AddItem("Base.ElectronicsScrap");
        elseif r==2 then
            player:getInventory():AddItem("Radio.ElectricWire");
        elseif r==3 then
            player:getInventory():AddItem("Base.Aluminum");
        end
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.Amplifier");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.LightBulb");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
    --if selectedItem then
        --print("Main item "..selectedItem:getName());
    --end
    for i=1,items:size() do
        local item = items:get(i-1)
        if instanceof(item, "Radio") then
            item:getDeviceData():getBattery(player:getInventory())
            item:getDeviceData():getHeadphones(player:getInventory())
            break
        end
    end
end