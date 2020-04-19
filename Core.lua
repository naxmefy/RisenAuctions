local addonName = ...

-- @class RisenAuctions
local RisenAuctions = LibStub("AceAddon-3.0"):NewAddon("RisenAuctions",
                                                       "AceConsole-3.0",
                                                       "AceEvent-3.0",
                                                       "AceHook-3.0")

RisenAuctions.Version = GetAddOnMetadata(addonName, 'Version')

function RisenAuctions:OnInitialize()
    -- self:InitDatabase()
    -- self:RegisterOptionWindow()

    self:RegisterEvent('AUCTION_HOUSE_SHOW')
    self:RegisterEvent('AUCTION_HOUSE_CLOSED')

    -- if not self.db.riAuctionsDb then self.db.riAuctionsDb = {} end
    RisenAuctions:Print("initialized")
end

function RisenAuctions:OnEnable()
    -- Called when the addon is enabled
    RisenAuctions:Print("enabled")
end

function RisenAuctions:OnDisable()
    -- Called when the addon is disabled
    RisenAuctions:Print("disabled")
end

function RisenAuctions:AUCTION_HOUSE_SHOW() end

function RisenAuctions:AUCTION_HOUSE_CLOSED() end
