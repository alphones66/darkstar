-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Giant Guard
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,778,2);
end;