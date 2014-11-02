/// Create initial ground
var gap = argument0;
var currentX = 0;
while (currentX < display_get_width()) {
    var inst = instance_create(currentX, 608, obj_ground);
    currentX += sprite_get_width(sp_ground);
}

for (var i = 0; i < gap; i++) {
show_debug_message("make pothole");
    var pothole = instance_create(currentX, 613, obj_ground);
    pothole.isPothole= true;
    currentX += sprite_get_width(sp_pothole);
}

var alarmTime = round((32 / blockMoveSpeed) * gap);
return alarmTime;
