# Sketch Ball

A GameMaker: Studio game where a ball bounces its way between blocks that look drawn in pencil. Holding the left or right side of the screen rolls the ball that way, and it bounces up on its own when it touches a wall or crate. Wooden crates, arrows, clouds, bombs, and traps each react differently.

<p>
  <img src="docs/screenshots/screenshot-1.png" width="480" alt="Gameplay">
</p>


## How to play

Download from Releases, extract, and run it. It is played with the left mouse button or touch.

| Input | Action |
|---|---|
| Hold the right half of the screen | Accelerate right |
| Hold the left half of the screen | Accelerate left |
| Let go | Slow to a stop |

| Block | When the ball touches it |
|---|---|
| Wall | Bounces the ball back the other way vertically |
| Wooden crate | Bounces like a wall, and breaks if the ball landed on it from above |
| Arrow | Moves the ball onto the arrow and launches it fast in the arrow's direction. Gravity is off until the screen is pressed or another block is touched |
| Cloud | Landing on it from above bounces the ball, and the cloud fades so it can be passed through for a while. Hitting it from below sends the ball higher |
| Bomb, trap | The ball bursts |


## How it works

**Collisions look ahead one step and branch on the block type.** The ball moves with `hspeed`, `vspeed`, and `gravity` rather than the GameMaker physics engine. Every step, `instance_place` checks whether a block sits where the current speed will take the ball next, and the speed changes according to the `object_index` of that block. Each bounce also reverses the direction the ball spins.

```gml
var ins = instance_place(x+hspeed, y+vspeed, par_block);
if(ins!=noone)
{
    angle_plus *= -1
    switch(ins.object_index)
    {
        case obj_wall:
            hspeed = 0
            vspeed = -vspeed_jump*sign(vspeed)
            scr_ball_gravity_use(true)
            scr_particle_collision()
            break
        ...
    }
}
```

The purple trail behind the ball is drawn by storing past positions in a `ds_grid` and drawing a narrowing triangle strip (`pr_trianglestrip`) along those points.


## Files

| Path | Content |
|---|---|
| `source/SketchBall.project.gmx` | GameMaker: Studio project file |
| `source/objects/` | Ball, block, game manager, and music objects |
| `source/scripts/` | Acceleration, gravity, particle, and trail scripts |
| `source/rooms/room_game.room.gmx` | Game room |
| `source/sprites/`, `source/sound/` | Graphics and music |
| `source/extensions/Draw Trail/` | Draw Trail extension |
| `docs/screenshots/` | Screenshots |
| Releases | Executable and runtime |


## Credits

The trail scripts (`source/scripts/trail_*.gml`, `draw_trail_ext.gml`) are modified from the Draw Trail extension made by Allan Gustavo Miranda Espinoa.


## License

CC BY-NC-ND 4.0. Unmodified copies may be shared for noncommercial purposes with attribution. Modified versions and commercial use are not allowed. Bundled libraries, graphics, sounds, and maps made by other people keep their own rights. See [LICENSE](LICENSE).
