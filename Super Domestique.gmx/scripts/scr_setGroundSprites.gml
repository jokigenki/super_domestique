// display a pothole or road sprite
if (potholeIndex > 0) {
    collisionSprite = sp_pothole_collision;
    switch (potholeIndex) {
        case 1:
            drawSprite = sp_pothole_left;
            break;
        case 2:
            drawSprite = sp_pothole_left_mid;
            break;
        case 3:
            drawSprite = sp_pothole_right_mid;
            break;
        case 4:
            drawSprite = sp_pothole_right;
            break;
    }
    draw_sprite(sp_pothole_collision, 0, x, y);
} else {
    collisionSprite = sp_ground_collision;
    drawSprite = sp_road;
}
//mask_index = collisionSprite;
