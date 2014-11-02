x -= obj_generator.blockMoveSpeed;
var w = sprite_get_width(sprite);
if (x <= -(w + 10)) {
    instance_destroy();
}
