///draw_trail_ext(width, color, sprite, slim, alpha)
var AlphaT, Texture, Dir, Lenght, Len, XX, YY, i;

if(argument2>=0)
    Texture = sprite_get_texture(argument2, 0);
else
    Texture = -1;

texture_set_repeat(true)
draw_primitive_begin_texture(pr_trianglestrip, Texture)

AlphaT = 1
Dir = 0
Lenght = ds_grid_width(GridTrail)-1
for(i=0; i<Lenght; i++)
{
    if(GridTrail[# i, 0]!=GridTrail[# i+1, 0] or GridTrail[# i, 1]!=GridTrail[# i+1, 1])
        Dir = point_direction(GridTrail[# i, 0], GridTrail[# i, 1], GridTrail[# i+1, 0], GridTrail[# i+1, 1]);
    Len = argument0/2 - ((i+1)/Lenght*argument0/2) * argument3
    XX = lengthdir_x(Len, Dir+90)
    YY = lengthdir_y(Len, Dir+90)
    AlphaT = (Lenght-i) / (Lenght/2) * argument4
    draw_vertex_texture_colour(GridTrail[# i, 0]+XX, GridTrail[# i, 1]+YY, GridTrail[# i, 2]/argument0, 0, argument1, AlphaT)
    draw_vertex_texture_colour(GridTrail[# i, 0]-XX, GridTrail[# i, 1]-YY, GridTrail[# i, 2]/argument0, 1, argument1, AlphaT)
}

draw_primitive_end()
texture_set_repeat(false)
