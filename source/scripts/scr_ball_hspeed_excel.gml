///scr_ball_hspeed_excel(right)
var dir, temp_hspeed;

if(argument0)
    dir = hspeed_excel;
else
    dir = -hspeed_excel;

temp_hspeed = hspeed+dir

if(!place_meeting(x+temp_hspeed, y+vspeed, par_block))
{
    hspeed = median(temp_hspeed, hspeed_max, -hspeed_max)
    xscale = sign(dir)
}
