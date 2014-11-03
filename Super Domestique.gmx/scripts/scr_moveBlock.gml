// Move the block, and destroy if off screen
x -= obj_generator.blockMoveSpeed;
var w = sprite_get_width(collisionSprite);
if (x <= -(w + 10)) {
    instance_destroy();
}
