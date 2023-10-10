use <kailhsocket.scad>

w = 20;
h = 40;
d = 30;

t = 3;

module column(left_side = false, right_side = false, extend_base = 0, extend_top = 0)
{
    difference()
    {
        translate([0,0,-extend_base / 2 + extend_top / 2]) cube([ w, h, d + extend_base + extend_top ], center = true);

        translate([ 0, 0, t + extend_top / 2 ])
        {
            cube([ w, h - t * 2, d + extend_top ], center = true);
        }

        translate([ 0, 0, -d / 2 + t ])
        {
            kailh_choc_socket();
        }

        rotate([ 90, 0, 0 ])
        {
            translate([ 0, 4, -h / 2 + t ])
            {
                kailh_choc_socket();
            }
        }

        rotate([ -90, 0, 0 ])
        {
            translate([ 0, -4, -h / 2 + t ])
            {
                kailh_choc_socket();
            }
        }
    }
    side_offset = 7;
    if (left_side)
    {
        difference()
        {
            translate([ -w / 2 - t / 2 - side_offset / 2, 0, -extend_base / 2 + extend_top / 2]) cube([ t + side_offset, h, d + extend_base + extend_top ], center = true);
            translate([ -w / 2 - side_offset / 2, 0, t  + extend_top / 2 ]) cube([ side_offset, h - t * 2, d + extend_top ], center = true);
            rotate([ 90, 0, 90 ])
            {
                translate([ 0, 4, -w / 2 - side_offset ])
                {
                    kailh_choc_socket();
                }
            }
        }
    }
    if (right_side)
    {
        difference()
        {
            translate([ w / 2 + t / 2 + side_offset / 2, 0, -extend_base/2 ]) cube([ t + side_offset, h, d + extend_base ], center = true);
            translate([ w / 2 + side_offset / 2, 0, t  ]) cube([ side_offset, h - t * 2, d ], center = true);
            #rotate([ -90, 180, 90 ])
            {
                translate([ 0, 4, -w / 2 - side_offset ])
                {
                    kailh_choc_socket();
                }
            }
        }
    }
}

!union()
{
    column(left_side = true, extend_base=5, extend_top=5);
    translate([ w, 0, -5 ]) column(extend_top=10);
    translate([ w * 2, 0, 0 ]) column(extend_base=5, extend_top=5);
    translate([ w * 3, 0, 5 ]) column(right_side = true, extend_base=10);
}

difference()
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
