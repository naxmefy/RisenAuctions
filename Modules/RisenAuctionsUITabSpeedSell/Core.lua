-- @type RisenAuctions
local RisenAuctions = unpack(select(2, ...));

-- @class RisenAuctionsUITabSpeedSell
local Mod = RisenAuctions:NewModule('RisenAuctionsUITabSpeedSell',
                                    'AceEvent-3.0', 'AceTimer-3.0');

-- Events
function Mod:Enable()
    self:AddAuctionHouseTab();
    self:RegisterEvent('AUCTION_HOUSE_CLOSED');
    self:RegisterEvent('AUCTION_HOUSE_SHOW');
end

function Mod:Disable()
    self:OnHide();
    self:UnregisterEvent('AUCTION_HOUSE_CLOSED');
    self:UnregisterEvent('AUCTION_HOUSE_SHOW');
end

function Mod:OnShow()
    self:RegisterEvent('COMMODITY_SEARCH_RESULTS_UPDATED');
    self:RegisterEvent('ITEM_SEARCH_RESULTS_UPDATED');

    self:RegisterMessage('AFTER_INVENTORY_SCAN');
    -- RisenAuctionsInventory:ScanInventory()
end

function Mod:OnHide()
    self:UnregisterEvent('COMMODITY_SEARCH_RESULTS_UPDATED');
    self:UnregisterEvent('ITEM_SEARCH_RESULTS_UPDATED');
end
