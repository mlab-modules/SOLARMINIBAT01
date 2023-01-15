$fn=100;

base_width = 70.5;
pcb_width = 60.5;


pcb_height = 49.8;
pcb_radius = 10;

pcb_screw_dist = 10.16*6;
screw_from_side = 10.16*0.5;

flange_thickness = 4;
flange_screw_depth =  2.5;
holder_depth = 10;
flange_depth = holder_depth+8;


bat_bot_z = 13.5;
bat_dist = 23;

battery_d = 18.9;

mount_screw_d = 10.16*5;
mount_screw_z = 25;

M3_screw_diameter = 3.3;
M3_nut_diameter = 6.6;

module battery_holder(){
difference(){
union(){
    hull(){
    translate([pcb_width/2-pcb_radius, pcb_height-pcb_radius, 0])
        cylinder(r = pcb_radius, h = holder_depth);

    translate([-1*(pcb_width/2-pcb_radius), pcb_height-pcb_radius, 0])
        cylinder(r = pcb_radius, h = holder_depth);
    
    translate([-pcb_width/2, 0, 0])
        cube([pcb_width, 1, holder_depth]);
}
    translate([-base_width/2, 0, 0])
        cube([base_width, flange_thickness, flange_depth]);
}
    
    for(x = [-pcb_screw_dist/2, pcb_screw_dist/2]) translate([x, flange_screw_depth, flange_depth-screw_from_side]) rotate([-90, 0, 0]){
              cylinder(d=M3_screw_diameter, h=20, $fn=20, center=true);
              cylinder(d = M3_nut_diameter, h = 10, $fn=6);
        }
    
    for(x=[-0.5, 0.5], y=[0, 1]) translate([bat_dist*x, bat_dist*y+bat_bot_z, -0.1]) cylinder(d = battery_d, h = flange_depth, $fn=60);

    for(x=[-0.5, 0.5]) translate([mount_screw_d*x, mount_screw_z, -0.1]) cylinder(d = M3_screw_diameter, h = flange_depth, $fn=60);

}
}


battery_holder();