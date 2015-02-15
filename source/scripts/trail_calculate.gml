///trail_calculate(length)
var Width, Min, i;
Width = ds_grid_width(GridTrail)
Min = min(Width, argument0)

if(Min==Width)
    ds_grid_resize(GridTrail, Width+1, 3);

for(i=Min; i>0; i--)
{
    GridTrail[# i, 0] = GridTrail[# i-1, 0]
    GridTrail[# i, 1] = GridTrail[# i-1, 1]
    GridTrail[# i, 2] = GridTrail[# i-1, 2]
}
GridTrail[# 0, 0] = x
GridTrail[# 0, 1] = y

if(Width>1)
    GridTrail[# 0, 2] = point_distance(GridTrail[# 0, 0], GridTrail[# 0, 1], GridTrail[# 1, 0], GridTrail[# 1, 1]) + GridTrail[# 1, 2];
else
    GridTrail[# 0, 2] = 0;
