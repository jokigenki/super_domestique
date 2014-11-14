/// Generate a new set of blocks

distanceTravelled += blockMoveSpeed;

if (distanceTravelled >= totalBlocksToGenerate * 64) {
    obj_car.shouldGenerate = false;
    if (blockMoveSpeed > 0.1) {
        blockMoveSpeed = blockMoveSpeed * 0.98;
        obj_player.shouldAnimate = false;
    } else {
        blockMoveSpeed = 0;
        exit;
    }
    // TODO: generate the end screen
}

// generate road tiles until we're off the screen, plus enough blocks to
// cover the next movement
while (blockEndX < display_get_width() + blockMoveSpeed)
{
    var instance = instance_create(blockEndX, groundHeight, obj_ground);
    
    // generate road if we are in a road section, or we do not have
    // enough room add a new section of road
    if (roadCount > 0 || totalBlocksGenerated >= totalBlocksToGenerate - maxBlocks) {
        speedBoostCount--;
        if (speedBoostCount == 0) {
            var height = round(random_range(100, 150));
             var speedBoost = instance_create(blockEndX, groundHeight - height, obj_speed_boost);
        }
        
        // create road
        instance.potholeIndex = 0;
        blockEndX += sprite_get_width(sp_ground_collision);
        roadCount--;
        totalBlocksGenerated++;
    } else {
        // create pothole
        instance.potholeIndex = potholes[potholeStartCount - 2, potholeStartCount - potholeCount];
        blockEndX += sprite_get_width(sp_pothole_collision);
        potholeCount--;
        // if we're out of pothole, start drawing road again,
        // and reset the speedboost count
        if (potholeCount == 0) {
            roadCount = round(random_range(minBlocks, maxBlocks));
            potholeCount = round(random_range(minGap, maxGap));
            potholeStartCount = potholeCount;
            speedBoostCount = roadCount - round(random(maxBlocks - minBlocks));
       }
       totalBlocksGenerated+=0.5; // potholes are 32px wide, not 64
    }
    
    with (instance) {
        script_execute(scr_setGroundSprites);
    }
}
