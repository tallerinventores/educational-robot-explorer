/* {{{ %%SECTION_HEADER%%
 * * * *
 * This header information is automatically generated by KodeUtils.
 *
 * File 'educational-robot-explorer.scad' edited by kwendenarmo,
 * last modified: 2015-06-06.
 * This file is part of 'educational-robot-explorer' package, please see
 * the readme files for more information about this file and this package.
 *
 * Copyright (C) 2015 by kwendenarmo <kwendenarmo@akornsys-rdi.net>
 * Released under the GNU GPLv3
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * * * *
 * %%EOS_HEADER%% }}}
 */

$fn=360;

assemble = true;
debug = false;
show_acc = true;

if (debug == true) {
    %translate([0,-20,68]) cube([1,110,1]); //floor
    %translate([0,25.5,68]) cube([1,19,2]); //line -- electrical tape
}

if ((debug == false) && (assemble == true)) {
    rotate([180,0,0]) union() {
        body();
        translate([30,35,0]) rotate([180,0,90]) porta_arduino();
        translate([2.5,10,15]) porta_sensor();
        if (show_acc == true) {
            translate([0,35,21.25]) rotate([-90,0,90]) sharp2y0a21();
            translate([6,20,10]) rotate([0,-90,0]) led_5mm();
            translate([6,27.5,10]) rotate([0,-90,0]) led_5mm();
            translate([6,35,10]) rotate([0,-90,0]) led_5mm();
            translate([6,42.5,10]) rotate([0,-90,0]) led_5mm();
            translate([6,50,10]) rotate([0,-90,0]) led_5mm();
            translate([2,60,8.5]) rotate([-65,0,90]) ldr();
            translate([2,10,8.5]) rotate([-65,0,90]) ldr();
            translate([0,26,53.4]) rotate([180,0,-90]) vishaytcrt5000();
            translate([-14.3,44,53.4]) rotate([180,0,90]) vishaytcrt5000();
            translate([35,-11.5,31]) rotate([90,180,0]) servo9g(0);
            translate([35,81.5,31]) rotate([-90,180,0]) servo9g(0);
            translate([10,20,5]) battery_pack();
        }
        translate([35,-12.5,31]) rotate([90,180,0]) bigwheel();
        translate([35,82.5,31]) rotate([-90,180,0]) bigwheel();
        translate([80,20,5]) rotate([90,0,0]) fork();
        mirror([0,1,0]) translate([80,-50,5]) rotate([90,0,0]) fork();
        translate([110,54.25,30]) rotate([90,0,0]) shaft();
        translate([110,35,30]) rotate([90,0,0]) omniwheel();
    }
}

if ((debug == false) && (assemble == false)) {
    //body();
    //porta_sensor();
    //porta_arduino();
    //fork();
    //mirror([0,0,1]) fork();
    //shaft();
    //clip();
    //omniwheel();
    //bigwheel();
    //wheel();
}

module body() {
    difference() {
        union() {
            cube([100,70,5]);
            translate([0,0,5]) cube([5,70,10]); //led + ldr
            translate([0,10,5]) cube([2.5,12.5,20]); //torre sharp dch
            translate([0,47.5,5]) cube([2.5,12.5,20]); //torre sharp izq
            translate([21.75,0,5]) cube([7,7.5,32]); //torre motor dch
            translate([52.5,0,5]) cube([7,7.5,32]); //torre motor dch
            translate([21.75,62.5,5]) cube([7,7.5,32]); //torre motor izq
            translate([52.5,62.5,5]) cube([7,7.5,32]); //torre motor izq
        }
        union() {
            //arduino
            translate([30,5,-1]) cylinder(r=1.25, h=7);
            translate([30,65,-1]) cylinder(r=1.25, h=7);
            //led
            for (i=[20:7.5:50]) {
                translate([-1,i,10]) rotate([0,95,0]) cylinder(r=2.75,h=7);
            }
            //ldr
            for (i=[10:50:60]) {
                translate([-2,i,10]) rotate([0,115,0]) cylinder(r=3.65,h=4);
                translate([-1,i+2.54,8.5]) rotate([0,90,0]) cylinder(r=1,h=7);
                translate([-1,i-2.54,8.5]) rotate([0,90,0]) cylinder(r=1,h=7);
            }
            //sharp
            translate([-1,53.475,21.25]) rotate([0,90,0]) cylinder(r=1.75,h=7);
            translate([-1,16.525,21.25]) rotate([0,90,0]) cylinder(r=1.75,h=7);
            //motores
            translate([26.65,-1,31]) rotate([-90,0,0]) cylinder(r=1, h=9);
            translate([54.75,-1,31]) rotate([-90,0,0]) cylinder(r=1, h=9);
            translate([26.65,62,31]) rotate([-90,0,0]) cylinder(r=1, h=9);
            translate([54.75,62,31]) rotate([-90,0,0]) cylinder(r=1, h=9);
            //porta baterias
            translate([11,20,3.5]) cube([58,30,3]);
            hull() {
                translate([17,25,0]) rotate([-90,0,0]) cylinder(r=2,h=20);
                translate([17,25,-1]) rotate([-90,0,0]) cylinder(r=2,h=20);
            }
            hull() {
                translate([32,25,0]) rotate([-90,0,0]) cylinder(r=2,h=20);
                translate([32,25,-1]) rotate([-90,0,0]) cylinder(r=2,h=20);
            }
            hull() {
                translate([47,25,0]) rotate([-90,0,0]) cylinder(r=2,h=20);
                translate([47,25,-1]) rotate([-90,0,0]) cylinder(r=2,h=20);
            }
            //fork
            translate([73.625,16.75,-1]) cube([12.75,4.25,7]);
            translate([73.625,48.25,-1]) cube([12.75,4.25,7]);
            translate([80,70,2.5]) rotate([90,0,0]) cylinder(r=1.25, h=70);
            //omniwheel
            translate([0,0,-1]) hull() {
                translate([73.5,22.5,0]) cylinder(r=2.5, h=7);
                translate([73.5,47.5,0]) cylinder(r=2.5, h=7);
                translate([105,22.5,0]) cylinder(r=2.5, h=7);
                translate([105,47.5,0]) cylinder(r=2.5, h=7);
            }
            //huecos
            translate([0,0,-1]) hull() {
                translate([10,10,0]) cylinder(r=2.5, h=7);
                translate([25,10,0]) cylinder(r=2.5, h=7);
                translate([10,25,0]) cylinder(r=2.5, h=7);
                translate([50,25,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([10,60,0]) cylinder(r=2.5, h=7);
                translate([25,60,0]) cylinder(r=2.5, h=7);
                translate([10,45,0]) cylinder(r=2.5, h=7);
                translate([50,45,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([35,67.4,0]) cylinder(r=2.5, h=7);
                translate([52.35,57.5,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([35,70,0]) cylinder(r=2.5, h=7);
                translate([35,67.4,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([35,2.6,0]) cylinder(r=2.5, h=7);
                translate([52.35,12.5,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([35,0,0]) cylinder(r=2.5, h=7);
                translate([35,2.6,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([57.5,-5,0]) cylinder(r=2.5, h=7);
                translate([75,5,0]) cylinder(r=2.5, h=7);
                translate([100,5,0]) cylinder(r=2.5, h=7);
                translate([100,-5,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([57.5,75,0]) cylinder(r=2.5, h=7);
                translate([75,65,0]) cylinder(r=2.5, h=7);
                translate([100,65,0]) cylinder(r=2.5, h=7);
                translate([100,75,0]) cylinder(r=2.5, h=7);
            }
            translate([0,0,-1]) hull() {
                translate([55,35,0]) cylinder(r=2.5, h=7);
                translate([60,30,0]) cylinder(r=2.5, h=7);
                translate([60,40,0]) cylinder(r=2.5, h=7);
            }
        }
    }
}

module porta_sensor() {
    difference() {
        union() {
            cube([3,50,40]);
            translate([-2.5,13,0]) cube([2.5,2,10]);
            translate([-2.5,35,0]) cube([2.5,2,10]);
            translate([-13.4,-11.65,38.5]) cube([16.4,7.5,3]);
            translate([-13.4,54.15,38.5]) cube([16.4,7.5,3]);
            translate([0,-11.65,38.5]) cube([3,73.3,3]);
        }
        union() {
            translate([-1,6.525,6.25]) rotate([0,90,0]) cylinder(r=1.25, h=5);
            translate([-1,43.475,6.25]) rotate([0,90,0]) cylinder(r=1.25, h=5);
            translate([-1,25,25]) rotate([0,90,0]) cylinder(r=5, h=5);
            translate([-1,20,15]) rotate([0,90,0]) cylinder(r=2, h=5);
            translate([-1,30,15]) rotate([0,90,0]) cylinder(r=2, h=5);
            translate([-7,-7.9,37.5]) cylinder(r=1.25, h=5);
            translate([-7,57.9,37.5]) cylinder(r=1.25, h=5);
        }
    }
}

module porta_arduino() {
    base_lenght = 70;
    base_width = 60;
    base_height = 3.5;
    ardu_lenght_mil = 2700;
    ardu_width_mil = 2100;
    ardu_height_mil = 40;
    ardu_hole1_x_mil = 550;
    ardu_hole1_y_mil = 100;
    ardu_hole2_x_mil = 600;
    ardu_hole2_y_mil = 2000;
    ardu_hole3_x_mil = 2600;
    ardu_hole3_y_mil = 300;
    ardu_hole4_x_mil = 2600;
    ardu_hole4_y_mil = 1400;
    outline = true;
    outline_width_mil = 30;
    outline_height_mil = 200;

    translate([-mil_to_mm(ardu_lenght_mil)/2,-mil_to_mm(ardu_width_mil)/2,0]) difference() {
        union() {
            cube([mil_to_mm(ardu_lenght_mil),mil_to_mm(ardu_width_mil),mil_to_mm(ardu_height_mil)]); //arduino
            translate([-(base_lenght-mil_to_mm(ardu_lenght_mil))/2,-(base_width-mil_to_mm(ardu_width_mil))/2,0]) cube([base_lenght,base_width,base_height]); //cuerpo
            if (outline == true) { //contorno
                translate([0,0,base_height]) linear_extrude(height = mil_to_mm(outline_height_mil), convexity = 10, twist = 0)
                polygon(points=[ [mil_to_mm(0),mil_to_mm(0)],
                [mil_to_mm(0),mil_to_mm(0+ardu_width_mil)],
                [mil_to_mm(0+ardu_lenght_mil),mil_to_mm(0+ardu_width_mil)],
                [mil_to_mm(0+ardu_lenght_mil),mil_to_mm(0)],
                [mil_to_mm(0+outline_width_mil),mil_to_mm(0+outline_width_mil)],
                [mil_to_mm(0+outline_width_mil),mil_to_mm(0+ardu_width_mil-outline_width_mil)],
                [mil_to_mm(0+ardu_lenght_mil-outline_width_mil),mil_to_mm(0+ardu_width_mil-outline_width_mil)],
                [mil_to_mm(0+ardu_lenght_mil-outline_width_mil),mil_to_mm(0+outline_width_mil)]
                ], paths=[ [3,2,1,0],[4,5,6,7] ]);
            }
        }
        union() {
            for (i= [ [mil_to_mm(ardu_hole1_x_mil),mil_to_mm(ardu_hole1_y_mil),-1], 
            [mil_to_mm(ardu_hole2_x_mil),mil_to_mm(ardu_hole2_y_mil),-1], 
            [mil_to_mm(ardu_hole3_x_mil),mil_to_mm(ardu_hole3_y_mil),-1], 
            [mil_to_mm(ardu_hole4_x_mil),mil_to_mm(ardu_hole4_y_mil),-1] ]) {
                translate(i) cylinder(r=1.75, h=base_height+2);
                translate(i) translate([0,0,0.75]) rotate([0,0,90]) cylinder(r=3.33, h=2.50, $fn=6);
            }
            //tornillos montaje
            translate([(5-((base_lenght-mil_to_mm(ardu_lenght_mil))/2)),(base_width/2-(base_width-mil_to_mm(ardu_width_mil))/2),-1]) cylinder(r=1.75, h=base_height+2);
            translate([(5-((base_lenght-mil_to_mm(ardu_lenght_mil))/2)),(base_width/2-(base_width-mil_to_mm(ardu_width_mil))/2),1]) cylinder(r=3.5, h=base_height+2);
            translate([((5-((base_lenght-mil_to_mm(ardu_lenght_mil))/2))+(base_lenght-10)),(base_width/2-(base_width-mil_to_mm(ardu_width_mil))/2),-1]) cylinder(r=1.75, h=base_height+2);
            translate([((5-((base_lenght-mil_to_mm(ardu_lenght_mil))/2))+(base_lenght-10)),(base_width/2-(base_width-mil_to_mm(ardu_width_mil))/2),1]) cylinder(r=3.5, h=base_height+2);
            translate([base_lenght/2-(base_lenght-mil_to_mm(ardu_lenght_mil))/2-9,mil_to_mm(ardu_width_mil),-1]) cube([18,(base_width-mil_to_mm(ardu_width_mil))/2+1,base_height+2]);
        }
    }
}

function mil_to_mm(mil) = mil * 0.0254;

module fork() {
    difference() {
        union() {
            hull() {
                cylinder(r=6, h=3);
                translate([0,15,0]) cylinder(r=6, h=3);
            }
            hull() {
                translate([0,15,0]) cylinder(r=6, h=3);
                translate([30,25,0]) cylinder(r=6, h=3);
            }
            translate([30,25,-12]) cylinder(r=6, h=12);
        }
        union() {
            translate([30,25,-13]) cylinder(r=4, h=17);
            translate([-7,-8,-1]) cube([14,3,5]);
            translate([0,-2.5,-1]) cylinder(r=1.75, h=5);
            translate([0,-2.5,-1]) cylinder(r=3.5, h=2.5);
        }
    }
}

module shaft() {
    if (assemble == true) {
        translate([0,0,38]) clip();
    }
    difference() {
        union() {
            cylinder(r=3.7, h=40);
            cylinder(r=6, h=1);
        }
        union() {
            translate([0,0,38]) rotate_extrude(convexity = 10) translate([3.8, 0, 0]) circle(r = 1, $fn = 20);
        }
    }
}

module clip() {
    difference() {
        union() {
            translate([0,0,-0.5]) cylinder(r=5.5, h=1);
        }
        union() {
            translate([0,0,-1]) cylinder(r=2.9, h=3);
            translate([0,0,-1]) cube([10,10,3]);
            translate([0,0,-1]) rotate([0,0,20]) cube([10,10,3]);
        }
    }
}

module bigwheel() {
    union() {
        //spoke & hub
        difference() {
            union() {
                translate([0,0,0]) cylinder(r=6, h=3);
                for (i=[0:120:359]) {
                    rotate([0,0,i]) hull() {
                        cylinder(r=5, h=3);
                        translate([25,0,0]) cylinder(r=2, h=3);
                    }
                }
            }
            translate([0,0,1.5]) hull() {
                cylinder(r=3.8, h=2.6);
                translate([14.6,0,0]) cylinder(r=2.1, h=2.6);
            }
            translate([0,0,-1]) cylinder(r=3.8, h=5);
        }
        //ring
        difference() {
            cylinder(r=35,h=3);
            union() {
                translate([0,0,-1]) cylinder(r=25,h=5);
                for (i= [0:60:359]) {
                    rotate([0,0,i]) translate([0,30,-1]) cylinder(r=1.5, h=5);
                }
            }
        }
    }
}

module omniwheel() {
    union() {
        half_omni();
        if (assemble == true) {
            mirror([0,0,1]) half_omni();
            //wheels
            for (i= [0:36:359]) {
                rotate([i,90,0]) translate([0,25,0]) wheel();
            }
        }
    }
}

module half_omni() {
    difference() {
        cylinder(r=30,h=2.5);
        union() {
            for (i= [0:36:359]) {
                rotate([0,0,i]) translate([-3,14,-3]) cube([6,22,6]);
                rotate([0,0,i]) translate([-2,12,-3]) cube([4,22,6]);
                rotate([0,90,i]) translate([0,25,-5.5]) cylinder(r=1.75, h=11);
                rotate([0,0,i+18]) translate([0,21,-5.5]) cylinder(r=1.5, h=11);
            }
            translate([0,0,-1]) cylinder(r=4,h=5);
        }
    }
}

module wheel() {
    half_wheel();
    mirror([0,0,1]) half_wheel();
    if (assemble == true) {
        if (show_acc == true) {
            rotate_extrude(convexity = 10) translate([10.75,0,0]) circle(r=1.25);
        }
    }
}

module half_wheel() {
    difference() {
        cylinder(r1=9.5, r2=10.5, h=2.5);
        translate([0,0,-1]) cylinder(r=1.5, h=5);
    }
}

module servo_horn() {
    difference() {
        union() {
            translate([0,0,2.7]) hull() {
                cylinder(r=3, h=1.6);
                translate([14.15,0,0]) cylinder(r=1.9, h=1.6);
            }
            cylinder(r=3.65, h=4.3);
        }
        union() {
            translate([0,0,-1]) cylinder(r=2.2, h=3.7);
            translate([0,0,3.45]) cylinder(r=2.4, h=2);
            translate([0,0,-1]) cylinder(r=1.25, h=7);
            translate([4.5,0,1]) cylinder(r=0.45, h=4);
            translate([6.6,0,1]) cylinder(r=0.45, h=4);
            translate([8.7,0,1]) cylinder(r=0.45, h=4);
            translate([10.8,0,1]) cylinder(r=0.45, h=4);
            translate([12.9,0,1]) cylinder(r=0.45, h=4);
            translate([15,0,1]) cylinder(r=0.45, h=4);
        }
    }
}

module servo9g(angle) {
    //TowerPro SG90 9g servo
    rotate([0,0,angle]) servo_horn();
    translate([-17.2,-6.325,-27]) union() {
        //cuerpo motor
        translate([0,0,0]) cube([23,12.65,22.8]);
        translate([-4.75,0,15.85]) difference() {
            cube([32.5,12.65,2.3]);
            union() {
                translate([2.2,6.325,-1]) cylinder(r=1, h=4);
                translate([-1,5.675,-1]) cube([3,1.3,4]);
                translate([30.3,6.325,-1]) cylinder(r=1, h=4);
                translate([30.3,5.675,-1]) cube([3,1.3,4]);
            }
        }
        translate([17.2,6.325,22.8]) cylinder(r=5.8, h=4.2);
        translate([10.35,6.325,22.8]) cylinder(r=2.75, h=4.2);
        translate([10.35,3.575,22.8]) cube([3,5.5,4.2]);
        //eje motor
        translate([17.2,6.325,27]) difference() {
            cylinder(r=2.325, h=2.7);
            translate([0,0,-1] )cylinder(r=0.9, h=5);
        }
        //cables
        translate([23,6.325,5.1]) union() {
            rotate([0,90,0]) color("red") cylinder(r=0.6, h=4.75);
            translate([0,-1.1,0]) rotate([0,90,0]) color("black") cylinder(r=0.6, h=4.75); //was brown
            *translate([0,1.1,0]) rotate([0,90,0]) color("orange") cylinder(r=0.6, h=4.75);
        }
    }
}

module sharp2y0a21() {
    union(){
        //pcb
        translate([-13.825,-5.3,3.4]) cube([27.65,10.6,1.25]);
        translate([-5.125,-12.75,3.4]) cube([10.25,8,1.25]);
        //conn
        translate([-3.9,-13.15,4.65]) difference() {
            union() {
                cube([7.8,6.25,5.35]);
                hull() {
                    translate() cube([7.8,7.5,2.35]);
                    translate() cube([7.8,6.25,3.4]);
                }
            }
            union() {
                translate([0.5,-1,0.85]) cube([6.8,5.85,3.55]);
            }
        }
        //sensor
        difference() {
            difference() {
                union() {
                    translate([-14.7,-6.5,0]) cube([29.4,13,7]);
                    hull() {
                        translate([18.475,0,0]) cylinder(r=3.825, h=1.5);
                        translate([-18.475,0,0]) cylinder(r=3.825, h=1.5);
                    }
                    hull() {
                        translate([-17.175,-3.825,0]) cube([34.35,7.65,3.15]);
                        translate([-14.7,-3.825,0]) cube([29.4,7.65,5.6]);
                    }
                    translate([-14.7,-3.95,7]) cube([29.4,8.5,4.35]);
                    translate([-13.8,-3.45,11.35]) cube([7.6,7.2,1.75]);
                    translate([-2.45,-3.45,11.35]) cube([16.3,7.25,2]);
                }
                union() {
                    translate([-5.125,-10.2,-1]) cube([10.25,6.25,10]);
                    translate([-14.1,-5.775,-1]) cube([28.2,11.55,5]);
                }
            }
            union() {
                translate([18.475,0,-1]) cylinder(r=1.575, h=6);
                translate([18.475,0,1.5]) cylinder(r=3.825, h=6);
                translate([-18.475,0,-1]) cylinder(r=1.575, h=6);
                translate([-18.475,0,1.5]) cylinder(r=3.825, h=6);
                translate([-10.2,0.15,10.5]) difference() {
                    cylinder(r1=2.5, r2=3.175, h=2.7);
                    sphere(2.5);
                }
                translate([-2.45,-3.45,11.65]) difference() {
                    union() {
                        translate([0,0,1.75]) cube([16.3,7.25,2]);
                        translate([0.65,0.575,0]) cube([15,6.1,1.75]);
                        translate([12.2,3.625,-2.65]) cylinder(r1=3, r2=5, h=2.7);
                    }
                    union() {
                        translate([12.2,3.625,-2.7]) sphere(2.5);
                        translate([-1.85,-1.375,-3]) difference() {
                            cube([20,10,5]);
                            translate([2.5,1.95,-1]) cube([15,6.1,7]);
                        }
                    }
                }
            }
        }
    }
}

module vishaytcrt5000() {
    difference() {
        union() {
            cube([32.2,14.3,1.6]);
            translate([5.9,2,-3]) rotate([0,180,0]) union() { //sensor
                cube([5.6,10.3,3.7]);
                translate([1.15,4.85,3.7]) cube([3.3,0.6,2]);
                translate([2.8,3.275,2.2]) cylinder(r=1.5, h=2);
                translate([2.8,3.275,4.2]) sphere(1.5);
                translate([2.8,7.025,2.2]) cylinder(r=1.5, h=2);
                translate([2.8,7.025,4.2]) sphere(1.5);
                translate([0,4.675,-3]) cube([0.7,0.95,3]);
                translate([4.9,4.675,-3]) cube([0.7,0.95,3]);
                translate([0.45,9.85,-1.5]) cylinder(r=0.45, h=1.5);
            }
            translate([28.85,2.07,1.6]) union() { //conn
                translate([0,0.23,0]) cube([2,9.7,2.6]);
                translate([1,-1.27,0]) for (i=[1:4]) {
                    translate([0,i*2.54,0]) translate([-1.2,-1,0]) cube([2.4,2,2.6]);
                    translate([0,i*2.54,0]) translate([-0.325,-0.325,2.6]) cube([0.65,0.65,1.85]);
                    translate([0,i*2.54,0]) translate([-0.325,-0.325,3.8]) cube([7.65,0.65,0.65]);
                }
            }
        }
        union() {
            translate([23.9,7.15,-1]) cylinder(r=1.5, h=3);
        }
    }
}

module led_5mm() {
    difference() {
        union() {
            cylinder(r=3, h=1);
            cylinder(r=2.5, h=6.1);
            translate([0,0,6.1]) sphere(2.5);
            translate([-0.3,1.02,-4.25]) cube([0.6,0.5,4.25]);
            translate([-0.3,-1.52,-5]) cube([0.6,0.5,5]);
        }
        translate([-2.5,2.5,-1]) cube([5,2,3]);
    }
}

module ldr() {
    difference() {
        union() {
            cylinder(r=3.4, h=2.15);
            translate([2.54,0,-4.25]) cylinder(r=0.25, h=6.7);
            translate([-2.54,0,-4.25]) cylinder(r=0.25, h=6.7);
        }
        union() {
            translate([-2.5,2.825,-1]) cube([5,2,4]);
            translate([-2.5,-4.825,-1]) cube([5,2,4]);
        }
    }
}

module battery_pack() {
    cube([58,30,47]);
}

