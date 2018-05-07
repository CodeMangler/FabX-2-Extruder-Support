upper_plate_radius = 19.75;
screw_distance_from_center = 16.5;
screw_hole_diameter = 6; // M3 head is usually 5.5mm
ptfe_hole_diameter = 4.5;
height = 12;
hotend_ptfe_diameter = 6.5;
hotend_ptfe_protrusion = 3.7;
HOLE_BUFFER_HEIGHT = 1;

extruder_support();

module extruder_support() {
    union() {
        // Additional support to hold hotend ptfe protrusion
        extruder_support_with_ptfe_hole(
            hotend_ptfe_protrusion,
            upper_plate_radius,
            screw_distance_from_center,
            screw_hole_diameter,
            hotend_ptfe_diameter
        );

        translate([0, 0, hotend_ptfe_protrusion])
            extruder_support_with_ptfe_hole(
                height,
                upper_plate_radius,
                screw_distance_from_center,
                screw_hole_diameter,
                ptfe_hole_diameter
            );
    }
}

module extruder_support_with_ptfe_hole(height, uper_plate_radius, screw_distance_from_center, screw_hole_diameter, ptfe_hole_diameter) {
    height_with_hole_buffer = height + (HOLE_BUFFER_HEIGHT * 2);

    intersection(){
        difference(){
            cylinder(r = upper_plate_radius, h = height);
            
            // Screw Holes
            for(angle=[0:120:359]){
                polar_translate(screw_distance_from_center, angle, -HOLE_BUFFER_HEIGHT)
                    cylinder(d = screw_hole_diameter, h = height_with_hole_buffer, $fn = 60);
            }
            
            // PTFE Tube/Filament Hole
            translate([0, 0, -HOLE_BUFFER_HEIGHT])
                cylinder(d = ptfe_hole_diameter, h = height_with_hole_buffer, $fn = 60);
        }
        // Trianguar Cut
        translate([0, 0, -HOLE_BUFFER_HEIGHT])
            polar_equilateral(screw_distance_from_center + 3, height_with_hole_buffer);
    }
}

function polar_to_cartesian(distance_from_center, angle) =
    [distance_from_center * cos(angle), distance_from_center * sin(angle)];

module polar_translate(distance_from_center, angle, z=0) {
    xy = polar_to_cartesian(distance_from_center, angle);
    translate([xy[0], xy[1], z]) children();
}

module polar_equilateral(distance_from_center, height){
    linear_extrude(height = height){
        triangle_points = [
            polar_to_cartesian(distance_from_center, 0),
            polar_to_cartesian(distance_from_center, 120),
            polar_to_cartesian(distance_from_center, 240)
        ];
        polygon(triangle_points);
    };
}
