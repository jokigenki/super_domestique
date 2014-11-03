/// Generate a new set of blocks

while (blockEndX < display_get_width() + blockMoveSpeed)
{
    var instance = instance_create(blockEndX, groundHeight, obj_ground);
    if (roadCount > 0) {
        instance.potholeIndex = 0;
        blockEndX += sprite_get_width(sp_ground_collision);
        roadCount--;
    } else {
        instance.potholeIndex = potholes[potholeStartCount - 2, potholeStartCount - potholeCount];
        blockEndX += sprite_get_width(sp_pothole_collision);
        potholeCount--;
        if (potholeCount == 0) {
            roadCount = round(random_range(minBlocks, maxBlocks));
            potholeCount = round(random_range(minGap, maxGap));
            potholeStartCount = potholeCount;
            if (blockMoveSpeed < maxBlockMoveSpeed) blockMoveSpeed++;
       }
    }
    
    with (instance) {
        script_execute(scr_setGroundSprites);
    }
}
