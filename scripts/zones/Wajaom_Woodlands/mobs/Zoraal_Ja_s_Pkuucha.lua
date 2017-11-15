-----------------------------------
-- Area: Wajaom Woodlands
-- Mob:  Zoraal Ja's Pkuucha
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/MobIDs");

function onMobSpawn(mob)
    mob:setLocalVar("whenToPopZoraal", math.random(20,50));
    mob:setLocalVar("hasPoppedZoraal",0);
end;

function onMobDisengage(mob)
    mob:setLocalVar("hasPoppedZoraal", 0);
    if(GetMobByID(PERCIPIENT_ZORAAL_JA):isSpawned()) then
        DespawnMob(PERCIPIENT_ZORAAL_JA);
    end
end;

function onMobRoam(mob)
    mob:setLocalVar("hasPoppedZoraal",0);
    if(GetMobByID(PERCIPIENT_ZORAAL_JA):isSpawned()) then
        DespawnMob(PERCIPIENT_ZORAAL_JA);
    end
end;

function onMobFight(mob, target)
    if (
        mob:getHPP() <= mob:getLocalVar("whenToPopZoraal") and
        not GetMobByID(PERCIPIENT_ZORAAL_JA):isSpawned() and
        mob:getLocalVar("hasPoppedZoraal") == 0
    ) then
        GetMobByID(PERCIPIENT_ZORAAL_JA):setSpawn(mob:getXPos()+math.random(-2,2), mob:getYPos(), mob:getZPos()+math.random(-2,2));
        SpawnMob(PERCIPIENT_ZORAAL_JA):updateEnmity(target);
        mob:setHP(mob:getMaxHP());
        mob:setUnkillable(true);
        mob:setLocalVar("hasPoppedZoraal", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
