local function UpdateActionButtonCooldown(button)
    local slot = ActionButton_GetPagedID(button);
    local start, duration, enable = GetActionCooldown(slot);
    local iconTexture = getglobal(button:GetName() .. "Icon");
    local isConsumable = IsConsumableAction(slot);
    local count = GetActionCount(slot);


    -- If the action is a consumable, then we want to check how many stacks it has.
    if isConsumable and count == 0 then
        -- If the action is a consumable and has no stacks, then we want to make the icon grey.
        iconTexture:SetVertexColor(0.4, 0.4, 0.4);
    elseif start and duration and enable and start > 0 and duration > 1.5 then
        -- If the action is on cooldown, then we want to make the icon grey.
        iconTexture:SetVertexColor(0.4, 0.4, 0.4);
    else
        -- If the action is not a consumable with 0 stacks or on cooldown, then we want to make the icon fully visible.
        iconTexture:SetVertexColor(1, 1, 1);
    end
end
local function OnUpdate(_, elapsed)
    -- Loop through all the action buttons and update their cooldowns.
    for i = 1, 12 do
        UpdateActionButtonCooldown(getglobal("ActionButton" .. i));
        UpdateActionButtonCooldown(getglobal("MultiBarBottomLeftButton" .. i));
        UpdateActionButtonCooldown(getglobal("MultiBarBottomRightButton" .. i));
        UpdateActionButtonCooldown(getglobal("MultiBarLeftButton" .. i));
        UpdateActionButtonCooldown(getglobal("MultiBarRightButton" .. i));
    end
end

local frame = CreateFrame("Frame");
frame:SetScript("OnUpdate", OnUpdate);
