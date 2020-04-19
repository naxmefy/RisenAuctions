-- @type RisenAuctions
local RisenAuctions = unpack(select(2, ...));

-- @type RisenAuctionsAuctionHouseUI
local AuctionHouseUI = RisenAuctions:GetModule('RisenAuctionsAuctionHouseUI');

-- locales
local L = LibStub('AceLocale-3.0'):GetLocale('RisenAuctions');

-- constants
local DisplayMode = {'RisenAuctionsUITabSpeedSellDisplayMode'}

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

function Mod:UIAddAuctionHouseTab()
    if self.tabAdded then return; end

    AuctionHouseFrameDisplayMode.RisenAuctionsUITabSpeedSellDisplayMode =
        DisplayMode;
    self.tab = AuctionHouseUI:AddAuctionHouseTab(L['Speed Sell'],
                                                 L['RisenAuctions - Speed Sell'],
                                                 self, DisplayMode);

    self.tab:SetScript('OnShow', function() Mod:OnShow(); end);

    self.tab:SetScript('OnHide', function() Mod:OnHide(); end);

    self.tabAdded = true;

    self:UIDrawItemsMasterFrame();
    self:UIDrawItemsDetailFrame();
    self:UIToggleTabControls(false);
end

function Mod:UIDrawItemsMasterFrame() end

function Mod:UIDrawItemsDetailFrame() end

function Mod:UIToggleTabControls(state) end
