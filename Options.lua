-- @type RisenAuctions
local RisenAuctions = unpack(select(2, ...))

-- l10n
local L = LibStub('AceLocale-3.0'):GetdLocale('RisenAuctions');

-- defaults
RisenAuctions.defaults = {
    enabled = true,
    enableToolTips = true,

    auctions = {duration = 3}
};

function RisenAuctions:InitDatabase()
    if not RisenAuctionsDb or type(RisenAuctionsDb) ~= 'table' or
        RisenAuctionsDb.global then RisenAuctionsDb = self.defaults end

    self.db = RisenAuctionsDb

    -- migrations
end

function RisenAuctions:RegisterOptionWindow()
    if self.optionsFrame then return end
end
