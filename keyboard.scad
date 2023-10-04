use <kailhsocket.scad>

w = 80;
h = 30;
d = 25;

t = 8;

difference()
{
    color("green")
    {
        cube([ w + t, h, d ], center = true);
    }

    translate([ 0, 0, t / 2 ])
    {
        cube([ w, h - t, d ], center = true);
    }

    // middle
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

    // top
    for (i = [0:3])
    {
        rotate([ 180, -90, -90 ])
        {
            translate([ -5, i * 18 - 35, h / 2 - t / 2 ])
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
            translate([ -5, i * 18 - 35, h / 2 - t / 2 ])
            {
                kailh_choc_switch();
            }
        }
    }

    // left
    rotate([ 90, -90, 90 ])
    {
        translate([ -5, -d / 2 + 5, w / 2 ])
        {
            kailh_choc_switch();
        }
    }

    // right
    rotate([ -90, -90, 90 ])
    {
        translate([ -5, -d / 2 + 5, w / 2 ])
        {
            kailh_choc_switch();
        }
    }
}

gap = 10;
// base
// top
/*
translate([0,45,d/2-t/4])
cube([w,60,t/2], center = true);
translate([0,45,-d/2+t/4])
cube([w,60,t/2], center = true);
// bottom
translate([0,25,-d/2+t/4-10])
cube([w,100,t/2], center = true);
// inner support
translate([0,25,-5])
cube([w,t/2,d+t], center = true);
translate([0,73,-5])
cube([w,t/2,d+t], center = true);
*/
// case
union()
{
    // outer case
    translate([ 0, -h / 2 - gap, -gap / 2 ]) cube([ w, t / 2, d + gap ], center = true);
    translate([ 0, h / 2 + gap, -gap / 2 ]) cube([ w, t / 2, d + gap ], center = true);
    translate([ 0, 0, -d / 2 + t / 4 - gap ]) cube([ w, h + gap * 2 + t / 2, t / 2 ], center = true);

    // inner supports
    // top
    translate([ 0, -h / 2 - gap / 2, d / 2 - t / 4 ]) cube([ w, gap, t / 2 ], center = true);
    translate([ 0, h / 2 + gap / 2, d / 2 - t / 4 ]) cube([ w, gap, t / 2 ], center = true);
    // middle
    translate([ 0, -h / 2 - gap / 2, -d / 2 + t / 4 ]) cube([ w, gap, t / 2 ], center = true);
    translate([ 0, h / 2 + gap / 2, -d / 2 + t / 4 ]) cube([ w, gap, t / 2 ], center = true);
    // bottom
    translate([ 0, -h / 2 + t / 4, -d / 2 - gap / 2 ]) cube([ w, t / 2, gap ], center = true);
    translate([ 0, h / 2 - t / 4, -d / 2 - gap / 2 ]) cube([ w, t / 2, gap ], center = true);
}
