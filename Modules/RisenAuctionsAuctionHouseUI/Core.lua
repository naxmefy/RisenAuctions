-- @type RisenAuctions
local RisenAuctions = unpack(select(2, ...))

---@class RisenAuctionsAuctionHouseUI
local Mod = RisenAuctions:NewModule('RisenAuctionsAuctionHouseUI')

Mod.auctionTabs = {};
function Mod:AddAuctionHouseTab(buttonText, title, module, displayMode)
    local n = #AuctionHouseFrame.Tabs + 1;

    local auctionTab = StdUi:PanelWithTitle(AuctionHouseFrame, nil, nil, title,
                                            160);
    auctionTab.titlePanel:SetBackdrop(nil);
    auctionTab:Hide();
    auctionTab:SetAllPoints();
    auctionTab.tabId = n;

    local tabButton = CreateFrame('Button', 'AuctionFrameTab' .. n,
                                  AuctionHouseFrame,
                                  'AuctionHouseFrameDisplayModeTabTemplate');
    tabButton.displayMode = displayMode;
    StdUi:StripTextures(tabButton);
    tabButton.backdrop = StdUi:Panel(tabButton);
    tabButton.backdrop:SetFrameLevel(tabButton:GetFrameLevel() - 1);
    StdUi:GlueAcross(tabButton.backdrop, tabButton, 10, -3, -10, 3);

    tabButton:Hide();
    tabButton:SetID(n);
    tabButton:SetText(buttonText);
    tabButton:SetNormalFontObject(GameFontHighlightSmall);
    tabButton:SetPoint('LEFT', AuctionHouseFrame.Tabs[n - 1], 'RIGHT', -15, 0);
    tabButton:Show();
    -- reference the actual tab
    tabButton.tab = auctionTab;
    tabButton.tab.module = module;

    auctionTab.tabButton = tabButton;

    PanelTemplates_SetNumTabs(AuctionHouseFrame, n);
    tinsert(self.auctionTabs, auctionTab);
    tinsert(AuctionHouseFrame.Tabs, tabButton);

    AuctionHouseFrame.tabsForDisplayMode[displayMode] = n;
    AuctionHouseFrame[displayMode[1]] = auctionTab;

    return auctionTab;
end
