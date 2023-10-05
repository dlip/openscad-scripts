use <kailhsocket.scad>

w = 85;
h = 30;
d = 25;

t = 4;
difference()
{
    color("green")
    {
        cube([ w, h, d ], center = true);
    }

    translate([ 0, 0, t ])
    {
        cube([ w - t * 2, h - t * 2, d ], center = true);
    }

    // middle
    for (i = [0:3])
    {
        rotate([ 180, 0, 90 ])
        {
            translate([ -7.5, i * 18 - 35, d / 2 - t ])
            {
                kailh_choc_switch();
            }
        }
    }

    // top
    for (i = [0:3])
    {
        rotate([ 180, -90, -90 ])
        {
            translate([ -5, i * 18 - 35, h / 2 - t ])
            {
                kailh_choc_switch();
            }
        }
    }

    // bottom
    for (i = [0:3])
    {
        rotate([ 180, -90, 90 ])
        {
            translate([ -5, i * 18 - 35, h / 2 - t ])
            {
                kailh_choc_switch();
            }
        }
    }

    // left
    rotate([ 90, -90, 90 ])
    {
        translate([ -5, -d / 2 + 5, w / 2 - t ])
        {
            kailh_choc_switch();
        }
    }

    // right
    rotate([ -90, -90, 90 ])
    {
        translate([ -5, -d / 2 + 5, w / 2 - t ])
        {
            kailh_choc_switch();
        }
    }
}

// case
gap = 5;

union()
{
    difference()
    {
        translate([ 0, 0, -gap / 2 - t / 2 ])
            cube([ w + t * 2 + gap * 2, h + gap * 2 + t * 2, d + gap + t ], center = true);
        cube([ w + gap * 2, h + gap * 2, d + gap * 2 ], center = true);
    }

    difference()
    {
        union()
        {
            translate([ w / 2, h / 2, -d / 2 ]) cube(gap * 2, center = true);
            translate([ w / 2, -h / 2, -d / 2 ]) cube(gap * 2, center = true);
            translate([ -w / 2, -h / 2, -d / 2 ]) cube(gap * 2, center = true);
            translate([ -w / 2, h / 2, -d / 2 ]) cube(gap * 2, center = true);
        }
        cube([ w, h, d ], center = true);
    }
}
