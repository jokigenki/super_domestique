/// Generate a new set of blocks

// generate road tiles until we're off the speed plus enough blocks to
// cover the next movement
while (blockEndX < display_get_width() + blockMoveSpeed)
{
    var instance = instance_create(blockEndX, groundHeight, obj_ground);
    
    if (roadCount > 0) {
        speedBoostCount--;
        if (speedBoostCount == 0) {
            var height = round(random_range(100, 150));
             var speedBoost = instance_create(blockEndX, groundHeight - height, obj_speed_boost);
        }
        
        // create road
        instance.potholeIndex = 0;
        blockEndX += sprite_get_width(sp_ground_collision);
        roadCount--;
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
    }
    
    with (instance) {
        script_execute(scr_setGroundSprites);
    }
}
