$fn=100;

base_width = 70.5;
pcb_width = 60.5;


pcb_height = 49.8;
pcb_radius = 10;

pcb_screw_dist = 10.16*6;
screw_from_side = 10.16*0.5;

flange_thickness = 4;
flange_screw_depth =  2.5;
holder_depth = 3;
flange_depth = holder_depth+8;


bat_bot_z = 13.5;
bat_dist = 23;

battery_d = 18.9-3;

mount_screw_d = 10.16*5;
mount_screw_z = 25;

M3_screw_diameter = 2.9;
M3_nut_diameter = 6.6;

text = 0;

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
    //translate([-base_width/2, 0, 0])
    //    cube([base_width, flange_thickness, flange_depth]);
}

    
    if(1) translate([0, 0, holder_depth-0.4]) hull(){
        translate([pcb_width/2-pcb_radius, pcb_height-pcb_radius, 0])
            cylinder(r = pcb_radius-2, h = holder_depth);

        translate([-1*(pcb_width/2-pcb_radius), pcb_height-pcb_radius, 0])
            cylinder(r = pcb_radius-2, h = holder_depth);
        
        translate([-pcb_width/2+2, 2, 0])
            cube([pcb_width-4, 1, holder_depth]);
    }
    
    for(x = [-pcb_screw_dist/2, pcb_screw_dist/2]) translate([x, flange_screw_depth, flange_depth-screw_from_side]) rotate([-90, 0, 0]){
              cylinder(d=M3_screw_diameter, h=20, $fn=20, center=true);
              cylinder(d = M3_nut_diameter, h = 10, $fn=6);
        }
    
    for(x=[-0.5, 0.5], y=[0, 1]) translate([bat_dist*x, bat_dist*y+bat_bot_z, holder_depth-2]) cylinder(d = battery_d, h = 2, $fn=60);
    
    
    for(x=[-1, 0, 1]) translate([x*22.75, 4, holder_depth]) hull(){
            cube([11, 3, 3], center=true);
            cube([13, 2, 2], center=true);
        }
    
    for(x=[-1, 1]) translate([x*32.2,0,0]) rotate([0, 60*x, 0]) cube([6, 7, 15], center=true);
    
    
    
    if(text){
        translate([0, 28, 0.2]) rotate([0, 180, 0]) linear_extrude(0.2) text("SOLARMINIBAT01", halign="center", size=4.5);
        translate([0, 20, 0.2]) rotate([0, 180, 0]) linear_extrude(0.2) text("www.MLAB.cz", halign="center", size=4.5);
    }
    
}

for(x=[-0.5, 0.5]) translate([mount_screw_d*x, mount_screw_z, 0]) cylinder(d = M3_screw_diameter, h = holder_depth+1.6+2, $fn=60);


}




battery_holder();