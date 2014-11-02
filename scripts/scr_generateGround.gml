/// Generate a new set of blocks
while (blockEndX < display_get_width() + blockMoveSpeed)
{
    var instance = instance_create(blockEndX, 608, obj_ground);
    if (roadCount > 0) {
        blockEndX += sprite_get_width(sp_ground);
        roadCount--;
    } else {
        instance.isPothole = true;
        blockEndX += sprite_get_width(sp_pothole);
        potHoleCount--;
        if (potHoleCount == 0) {
            roadCount = round(random_range(minBlocks, maxBlocks));
            potHoleCount = round(random_range(minGap, maxGap));
            if (blockMoveSpeed < maxBlockMoveSpeed) blockMoveSpeed++;
       }
    }
}
