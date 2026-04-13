-- use this file to map the AP location ids to your locations
-- first value is the code of the target location/item and the second is the item type override (feel free to expand the table with any other values you might need (i.e. special initial values, increments, etc.)!)
-- to reference a location in Pop use @ in the beginning and then path to the section (more info: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#locations)
-- to reference an item use it's code
-- here are the SM locations as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/location_mapping.lua

LOCATIONS = {
	{"@Main Deck Hub/Cubby Hole/"},
	{"@Main Deck Hub/Genesis Speedway/"},
	{"@Main Deck Hub/Quarantine Bay/"},
	{"@Main Deck Hub/Station Entrance/"},
	{"@Main Deck Hub/Sub-Zero Containment/"},
	{"@Ventilation Zone/Operations Ventilation/"},
	{"@Ventilation Zone/Operations Ventilation Storage/"},
	{"@Arachnus Zone Upper/Arachnus Arena - Upper Item/"},
	{"@Arachnus Zone Upper/Attic/"},
	{"@Arachnus Zone Lower/Arachnus Arena - Core X/"},
	{"@Operation Deck/Data Room/"},
	{"@Habitation Deck/Animals/"},
	{"@Habitation Deck/Lower Item/"},
	{"@Main Deck West Elevator/Main Elevator Cache/"},
	{"@Reactor Zone/Silo Catwalk/"},
	{"@Reactor Zone/Silo Scaffolding/"},
	{"@Yakuza Zone/Yakuza Arena/"},
	{"@Auxiliary Reactor/Auxiliary Power Station/"},
	{"@Nexus Storage/Nexus Storage/"},
	{"@Sector 1 To Sector 2/Antechamber/"},
	{"@Sector 1 First Stabilizer Zone/Atmospheric Stabilizer Northeast/"},
	{"@Sector 1 First Stabilizer Zone/Hornoad Hole/"},
	{"@Sector 1 First Stabilizer Zone/Wall Jump Tutorial/"},
	{"@Sector 1 Second Stabilizer Zone/Lava Lake - Lower Item/"},
	{"@Sector 1 Second Stabilizer Zone/Lava Lake - Upper Left Item/"},
	{"@Sector 1 Second Stabilizer Zone/Lava Lake - Upper Right Item/"},
	{"@Sector 1 Third Stabilizer Zone/Stabilizer Storage/"},
	{"@Sector 1 Charge Core Zone/Charge Core Arena - Core X/"},
	{"@Sector 1 Charge Core Zone/Charge Core Arena - Upper Item/"},
	{"@Sector 1 Charge Core Zone/Watering Hole/"},
	{"@Sector 1 After Charge Core Zone/Crab Rave/"},
	{"@Sector 1 Tourian Hub/Animorphs Cache/"},
	{"@Sector 1 Tourian Hub/Ridley Arena/"},
	{"@Sector 1 Tourian Hub/Ripper Maze/"},
	{"@Sector 2 Hub/Crumble City - Lower Item/"},
	{"@Sector 2 Hub/Crumble City - Upper Item/"},
	{"@Sector 2 Hub/Data Courtyard/"},
	{"@Sector 2 Hub/Data Room/"},
	{"@Sector 2 Hub/Kago Room/"},
	{"@Sector 2 Hub/Level 1 Security Room/"},
	{"@Sector 2 Hub/Lobby Cache/"},
	{"@Sector 2 Left Side/Zoro Zig-Zag/"},
	{"@Sector 2 Zazabi Zone/Cultivation Station/"},
	{"@Sector 2 Zazabi Zone/Oasis/"},
	{"@Sector 2 Zazabi Zone/Oasis Storage/"},
	{"@Sector 2 Zazabi Zone/Ripper Tower - Lower Item/"},
	{"@Sector 2 Zazabi Zone/Ripper Tower - Upper Item/"},
	{"@Sector 2 Zazabi Zone/Zazabi Arena/"},
	{"@Sector 2 Zazabi Zone/Zazabi Arena Access/"},
	{"@Sector 2 Zazabi Zone/Zazabi Speedway - Lower Item/"},
	{"@Sector 2 Zazabi Zone/Zazabi Speedway - Upper Item/"},
	{"@Sector 2 Zazabi Zone Upper/Dessgeega Dorm/"},
	{"@Sector 2 Nettori Zone/Nettori Arena/"},
	{"@Sector 2 Nettori Zone/Overgrown Cache/"},
	{"@Sector 2 Nettori Zone/Puyo Palace/"},
	{"@Sector 3 to Sector 5/Glass Tube to Sector 5 (ARC)/"},
	{"@Sector 3 Fiery Storage Right/Fiery Storage - Lower Item/"},
	{"@Sector 3 Fiery Storage Left/Fiery Storage - Upper Item/"},
	{"@Sector 3 Security Zone/Level 2 Security Room/"},
	{"@Sector 3 Security Zone/Security Access/"},
	{"@Sector 3 Main Shaft/Namihe's Lair/"},
	{"@Sector 3 Main Shaft/Processing Access/"},
	{"@Sector 3 Boiler Zone/Lava Maze/"},
	{"@Sector 3 Boiler Zone/Boiler Room Control - Boiler/"},
	{"@Sector 3 Boiler Zone/Boiler Room Control - Core X/"},
	{"@Sector 3 Bob Zone/Bob's Abode/"},
	{"@Sector 3 BOX Zone/Data Room/"},
	{"@Sector 3 BOX Zone/Geron's Treasure/"},
	{"@Sector 3 Lower Attic/Alcove - Lower Item/"},
	{"@Sector 3 Lower Attic/Alcove - Upper Item/"},
	{"@Sector 3 Upper Attic/Deserted Runway/"},
	{"@Sector 3 Sova Processing/Sova Processing - Left Item/"},
	{"@Sector 3 Sova Processing/Sova Processing - Right Item/"},
	{"@Sector 3 Sova Processing/Garbage Chute - Lower Item/"},
	{"@Sector 3 Sova Processing/Garbage Chute - Upper Item/"},
	{"@Sector 4 Hub/Drain Pipe/"},
	{"@Sector 4 Hub/Reservoir East/"},
	{"@Sector 4 Upper Zone/Broken Bridge/"},
	{"@Sector 4 Upper Zone/Waterway/"},
	{"@Sector 4 Upper Zone/Reservoir Vault - Lower Item/"},
	{"@Sector 4 Upper Zone/Reservoir Vault - Upper Item/"},
	{"@Sector 4 Upper Zone/C-Cache/"},
	{"@Sector 4 Serris Zone/Serris Arena/"},
	{"@Sector 4 Pump Control/Pump Control Unit/"},
	{"@Sector 4 Upper Water Zone/Cargo Hold to Sector 5 (ARC)/"},
	{"@Sector 4 Upper Water Zone/Aquarium Pirate Tank/"},
	{"@Sector 4 Security Zone/Cheddar Bay/"},
	{"@Sector 4 Security Zone/Yard Firing Range/"},
	{"@Sector 4 Lower Security Zone/Sanctuary Cache/"},
	{"@Sector 4 Security Room/Level 4 Security Room/"},
	{"@Sector 4 Right Water Zone/Aquarium Kago Storage - Left Item/"},
	{"@Sector 4 Right Water Zone/Aquarium Kago Storage - Right Item/"},
	{"@Sector 4 Data Zone/Data Room/"},
	{"@Sector 5 Hub/Gerubus Gully/"},
	{"@Sector 5 Magic Box Room/Magic Box/"},
	{"@Sector 5 Top Left Big Room/Training - Left Item/"},
	{"@Sector 5 Top Left Big Room/Training - Right Item/"},
	{"@Sector 5 Frozen Hub/Ripper Road/"},
	{"@Sector 5 Security Zone/E-Tank Mimic Den/"},
	{"@Sector 5 Security Zone/Level 3 Security Room/"},
	{"@Sector 5 Security Zone/Ripper's Treasure/"},
	{"@Sector 5 Security Zone/Security Shaft East/"},
	{"@Sector 5 Security Zone/Transmutation Trial/"},
	{"@Sector 5 Data Room/Data Room/"},
	{"@Sector 5 Before Nightmare Hub/Crow's Nest/"},
	{"@Sector 5 Nightmare Hub/Flooded Airlock to Sector 4 (AQU)/"},
	{"@Sector 5 Nightmare Hub/Mini-Fridge/"},
	{"@Sector 5 Nightmare Hub/Nightmare Hub/"},
	{"@Sector 5 Nightmare Hub/Ruined Break Room/"},
	{"@Sector 5 Nightmare Zone Upper/Nightmare Nook/"},
	{"@Sector 5 Nightmare Zone Arena/Nightmare Arena/"},
	{"@Sector 6 Hub/Entrance Lobby/"},
	{"@Sector 6 Crossroads/Missile Mimic Lodge/"},
	{"@Sector 6 Crossroads/Pillar Highway/"},
	{"@Sector 6 Crossroads/Vault/"},
	{"@Sector 6 Crossroads/Catacombs/"},
	{"@Sector 6 Before BOX Zone/Speedbooster Alley - Lower Item/"},
	{"@Sector 6 Before BOX Zone/Speedbooster Alley - Upper Item/"},
	{"@Sector 6 XBOX Zone/X-B.O.X. Arena/"},
	{"@Sector 6 After XBOX Zone/X-B.O.X. Garage - Lower Item/"},
	{"@Sector 6 After XBOX Zone/X-B.O.X. Garage - Upper Item/"},
	{"@Sector 6 Restricted Zone/Restricted Airlock/"},
	{"@Sector 6 Before Varia Core X Zone/Zororo Wine Cellar/"},
	{"@Sector 6 Varia Core X Zone/Varia Core-X Arena/"},
	{"@Sector 6 After Varia Core X Zone/Twin Caverns West - Lower Item/"},
	{"@Sector 6 After Varia Core X Zone/Twin Caverns West - Upper Item/"},
}

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

LOCATION_MAPPING = {
}
for n, item in ipairs(LOCATIONS) do
    LOCATION_MAPPING[n] = {item}
	print(n, dump_table(item))
end