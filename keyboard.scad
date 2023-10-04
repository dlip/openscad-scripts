

use <kailhsocket.scad>

w = 80;
h = 30;
d = 30;

t = 8;

difference()
{
    color("red")
    {
        cube([ w, h, d ], center = true);
    }

    translate([ 0, 0, t / 2 ])
    {
        cube([ w + .1, h - t, d ], center = true);
    }

    for (i = [0:3])
    {
        rotate([ 180, 0, 90 ])
        {
            translate([ -7.5, i * 18 - 35, d / 2 - t / 2 ])
            {
                kailh_choc_switch();
            }
        }
    }

    for (i = [0:3])
    {
        rotate([ 180, 90, 90 ])
        {
            translate([ -9.5, i * 18 - 35, h / 2 - t / 2 ])
            {
                kailh_choc_switch();
            }
        }
    }

    for (i = [0:3])
    {
        rotate([ 180, -90, 90 ])
        {
            translate([ -7.5, i * 18 - 35, h / 2 - t / 2 ])
            {
                kailh_choc_switch();
            }
        }
    }
}
