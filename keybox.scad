use <kailhsocket.scad>

w = 95;
h = 35;
d = 30;

t = 3;
!difference()
{
    cube([ w, h, d ], center = true);

    translate([ 0, 0, t ])
    {
        cube([ w - t * 2, h - t * 2, d ], center = true);
    }

    // middle
    for (i = [0:3])
    {
        translate([ i * 18.5 - 28, 0, -d / 2 + t ])
        {
            kailh_choc_socket();
        }
    }

    // top
    for (i = [0:3])
    {
        rotate([ 90, 0, 0 ])
        {
            translate([ i * 18.5 - 28, 4, -h / 2 + t ])
            {
                kailh_choc_socket();
            }
        }
    }

    // bottom
    for (i = [0:3])
    {
        rotate([ -90, 0, 0 ])
        {
            translate([ i * 18.5 - 28, -4, -h / 2 + t ])
            {
                kailh_choc_socket();
            }
        }
    }

    // left
    rotate([ 90, 0, 90 ])
    {
        translate([ 0, 4, -w / 2 + t ])
        {
            kailh_choc_socket();
        }
    }

    // right
    rotate([ -90, 180, 90 ])
    {
        translate([ 0, 4, -w / 2 + t ])
        {
            kailh_choc_socket();
        }
    }
}

// case
gap = 5;
union(){difference(){translate([ 0, 0, -gap / 2 - t / 2 ])
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

// lid
*difference()
{
    translate([ 0, 0, d / 2 + t / 2 ]) cube([ w + t * 2 + gap * 2, h + gap * 2 + t * 2, t * 2 ], center = true);

    union()
    {
        cube([ w, h, d ], center = true);

        translate([ 0, 0, t * 2 ])
        {
            cube([ w - t * 2, h - t * 2, d ], center = true);
        }
    }
    difference()
    {
        translate([ 0, 0, -gap / 2 - t / 2 ])
            cube([ w + t * 2 + gap * 2, h + gap * 2 + t * 2, d + gap + t ], center = true);
        cube([ w + gap * 2, h + gap * 2, d + gap * 2 ], center = true);
    }
}
