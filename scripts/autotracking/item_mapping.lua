-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type override. The third value is an optional increment multiplier for consumables. (feel free to expand the table with any other values you might need (i.e. special initial values, etc.)!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
BASE_ITEM_ID = 0
ITEM_MAPPING = {
	[BASE_ITEM_ID + 00002] = { { "dm" } },
	[BASE_ITEM_ID + 00003] = { { "mb", "toggle" } },
	[BASE_ITEM_ID + 00004] = { { "bc", "toggle" } },
	[BASE_ITEM_ID + 00005] = { { "k1" } },
	[BASE_ITEM_ID + 00006] = { { "bomb", "toggle" } },
	[BASE_ITEM_ID + 00007] = { { "high", "toggle" } },
	[BASE_ITEM_ID + 00008] = { { "speed", "toggle" } },
	[BASE_ITEM_ID + 00009] = { { "k2" } },
	[BASE_ITEM_ID + 00010] = { { "ms", "toggle" } },
	[BASE_ITEM_ID + 00011] = { { "varia", "toggle" } },
	[BASE_ITEM_ID + 00012] = { { "k3" } },
	[BASE_ITEM_ID + 00013] = { { "mi", "toggle" } },
	[BASE_ITEM_ID + 00014] = { { "bww", "toggle" } },
	[BASE_ITEM_ID + 00015] = { { "pb" } },
	[BASE_ITEM_ID + 00016] = { { "space", "toggle" } },
	[BASE_ITEM_ID + 00017] = { { "bp", "toggle" } },
	[BASE_ITEM_ID + 00018] = { { "gravity", "toggle" } },
	[BASE_ITEM_ID + 00019] = { { "k4" } },
	[BASE_ITEM_ID + 00020] = { { "md", "toggle" } },
	[BASE_ITEM_ID + 00021] = { { "bw", "toggle" } },
	[BASE_ITEM_ID + 00022] = { { "screw", "toggle" } },
	[BASE_ITEM_ID + 00023] = { { "bi", "toggle" } },
	[BASE_ITEM_ID + 00024] = { { "missile" } },
	[BASE_ITEM_ID + 00025] = { { "etank" } },
	[BASE_ITEM_ID + 00026] = { { "pbomb" } },
	[BASE_ITEM_ID + 00027] = { { "trap" } },
	[BASE_ITEM_ID + 00028] = { { "metroid" } },
}
