//POVRay-File created by 3d41.ulp v20110101
//C:/Users/LED/Documents/Documents/Projects/EAGLE/HVProg/programmer/HWProgUSB.brd
//2015-09-11 21:17:54

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 255;
#local cam_z = -120;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 30;
#local lgt1_pos_y = 45;
#local lgt1_pos_z = 27;
#local lgt1_intense = 0.759850;
#local lgt2_pos_x = -30;
#local lgt2_pos_y = 45;
#local lgt2_pos_z = 27;
#local lgt2_intense = 0.759850;
#local lgt3_pos_x = 30;
#local lgt3_pos_y = 45;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.759850;
#local lgt4_pos_x = -30;
#local lgt4_pos_y = 45;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.759850;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 79.990000;
#declare pcb_y_size = 52.375000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(732);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-39.995000,0,-26.187500>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro HWPROGUSB(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.655000,0.635000><80.645000,0.635000>
<80.645000,0.635000><80.645000,53.010000>
<80.645000,53.010000><0.655000,53.010000>
<0.655000,53.010000><0.655000,0.635000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbruche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.687500,0.000000,21.272500>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C1 100n C0805
#ifndef(pack_ZC2) #declare global_pack_ZC2=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<14.763750,0.000000,5.715000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C2 100n C0805
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<56.356250,0.000000,37.306250>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C4 33p C0805
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<56.673750,0.000000,33.655000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C5 33p C0805
#ifndef(pack_ZC8) #declare global_pack_ZC8=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<9.525000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C8 100n C0805
#ifndef(pack_ZC9) #declare global_pack_ZC9=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<11.430000,0.000000,30.480000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 1C9 100n C0805
#ifndef(pack_ZD1) #declare global_pack_ZD1=yes; object {QFP_TQFP_44_080MM("MEGA8535-A","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.687500,0.000000,34.290000>translate<0,0.035000,0> }#end		//TQFP-44 1D1 MEGA8535-A TQFP44
#ifndef(pack_ZD2) #declare global_pack_ZD2=yes; object {IC_SMD_SO16("74HC165D","PHILIPS",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.827500,0.000000,34.607500>translate<0,0.035000,0> }#end		//SMD IC SO16 Package 1D2 74HC165D SO16
#ifndef(pack_ZHL1) #declare global_pack_ZHL1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<36.830000,-1.500000,24.765000>}#end		//Diskrete 5MM LED 1HL1 red LED5MM
#ifndef(pack_ZHL2) #declare global_pack_ZHL2=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<30.480000,-1.500000,24.765000>}#end		//Diskrete 5MM LED 1HL2 green LED5MM
#ifndef(pack_ZHL3) #declare global_pack_ZHL3=yes; object {DIODE_DIS_LED_5MM(Yellow,0.500000,0.000000,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<24.130000,-1.500000,24.765000>}#end		//Diskrete 5MM LED 1HL3 yellow LED5MM
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<3.492500,0.000000,20.002500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R1 10k M0805
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_SMD_CHIP_0805("152",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<34.290000,0.000000,22.542500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R2 1k5 M0805
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("152",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.480000,0.000000,20.478750>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R3 1k5 M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("363",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<27.940000,0.000000,31.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R4 36k M0805
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_1206("154",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.162500,0.000000,32.067500>translate<0,0.035000,0> }#end		//SMD Resistor 1206 1R5 150k R1206
#ifndef(pack_ZR6) #declare global_pack_ZR6=yes; object {RES_SMD_CHIP_1206("223",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<14.605000,0.000000,21.590000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 1R6 22k M1206
#ifndef(pack_ZR8) #declare global_pack_ZR8=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<10.795000,0.000000,36.830000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R8 10k M0805
#ifndef(pack_ZR9) #declare global_pack_ZR9=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<15.240000,0.000000,27.622500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R9 10k M0805
#ifndef(pack_ZR10) #declare global_pack_ZR10=yes; object {RES_SMD_CHIP_0805("473",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,24.447500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R10 47k M0805
#ifndef(pack_ZR16) #declare global_pack_ZR16=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<12.700000,-1.500000,38.100000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R16 10k R0805
#ifndef(pack_ZR17) #declare global_pack_ZR17=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.272500,0.000000,14.922500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R17 10k M0805
#ifndef(pack_ZR18) #declare global_pack_ZR18=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,15.875000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R18 10k M0805
#ifndef(pack_ZR19) #declare global_pack_ZR19=yes; object {RES_SMD_CHIP_0805("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<17.145000,-1.500000,34.448750>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R19 1k M0805
#ifndef(pack_ZR20) #declare global_pack_ZR20=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.732500,0.000000,14.922500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R20 10k M0805
#ifndef(pack_ZVD1) #declare global_pack_ZVD1=yes; object {DIODE_SMD_SMB()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<11.747500,-1.500000,31.908750>translate<0,-0.035000,0> }#end		//DO214 AA 1VD1 SS12 SMB
#ifndef(pack_ZVD2) #declare global_pack_ZVD2=yes; object {DIODE_SMD_SMB()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<22.542500,-1.500000,16.827500>translate<0,-0.035000,0> }#end		//DO214 AA 1VD2 SB130 SMB
#ifndef(pack_ZVT1) #declare global_pack_ZVT1=yes; object {IC_SMD_SOT23("BC847","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.685000,0.000000,11.588750>translate<0,0.035000,0> }#end		//SOT23 1VT1 BC847 SOT23
#ifndef(pack_ZVT2) #declare global_pack_ZVT2=yes; object {IC_SMD_SOT23("BC857","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.447500,0.000000,20.161250>translate<0,0.035000,0> }#end		//SOT23 1VT2 BC857 SOT23-BEC
#ifndef(pack_ZVT3) #declare global_pack_ZVT3=yes; object {IC_SMD_SOT23("BC847","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<15.557500,-1.500000,37.782500>translate<0,-0.035000,0> }#end		//SOT23 1VT3 BC847 SOT23
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<68.580000,0.000000,49.530000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 2C1 20 C0805
#ifndef(pack_ZC2) #declare global_pack_ZC2=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<71.120000,0.000000,48.260000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 2C2 20 C0805
#ifndef(pack_ZC3) #declare global_pack_ZC3=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<76.517500,0.000000,49.688750>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 2C3 100n C0805
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_SMD_CHIP_1210()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<76.835000,0.000000,45.402500>translate<0,0.035000,0> }#end		//SMD Capacitor 1210 2C4 10mf C1210
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<69.850000,0.000000,26.035000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 2C5 1mf C0805
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0603("224",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<68.580000,0.000000,43.497500>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R1 220k R0603
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0603("101",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<74.295000,0.000000,16.192500>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R3 100 R0603
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0603("101",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<74.295000,0.000000,14.605000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R4 100 R0603
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_0603("152",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<74.295000,0.000000,13.017500>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R5 1.5k R0603
#ifndef(pack_ZR7) #declare global_pack_ZR7=yes; object {RES_SMD_CHIP_0603("224",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<73.342500,0.000000,25.241250>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R7 220k R0603
#ifndef(pack_ZR8) #declare global_pack_ZR8=yes; object {RES_SMD_CHIP_0603("224",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<75.565000,0.000000,26.035000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R8 220k R0603
#ifndef(pack_ZR9) #declare global_pack_ZR9=yes; object {RES_SMD_CHIP_0603("224",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<74.136250,0.000000,30.162500>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R9 220k R0603
#ifndef(pack_ZR10) #declare global_pack_ZR10=yes; object {RES_SMD_CHIP_0603("224",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<75.723750,0.000000,29.845000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 2R10 220k R0603
#ifndef(pack_ZZ1) #declare global_pack_ZZ1=yes; object {SPC_XTAL_5MM("12MHz",3,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<70.802500,-1.500000,47.307500>}#end		//Quarz 4,9MM 2Z1 12MHz HC49/S
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_DIS_CERAMIC_25MM_44MM("100n",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<58.102500,-1.500000,17.938750>}#end		//ceramic disc capacitator 3C1 100n C025-024X044
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_DIS_CERAMIC_25MM_50MM("1n",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<44.132500,-1.500000,7.937500>}#end		//ceramic disc capacitator 3C4 1n C025-025X050
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_DIS_CERAMIC_25MM_50MM("100n",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<29.845000,-1.500000,8.255000>}#end		//ceramic disc capacitator 3C5 100n C025-025X050
#ifndef(pack_ZD1) #declare global_pack_ZD1=yes; object {IC_SMD_SO8("MC34063AD","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.530000,0.000000,7.620000>translate<0,0.035000,0> }#end		//SMD IC SO8 Package 3D1 MC34063AD SOIC8
#ifndef(pack_ZL1) #declare global_pack_ZL1=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<49.212500,-1.500000,13.652500>}#end		//Discrete Resistor 0,3W 10MM Grid 3L1 100uh 0207/10
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_DIS_0204_075MM(texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{T_Silver_5E finish{reflection 0.1 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<59.690000,-1.500000,4.762500>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R1 0.5-1 0204/7
#ifndef(pack_ZR1A) #declare global_pack_ZR1A=yes; object {RES_DIS_0204_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<59.690000,-1.500000,2.381250>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R1A  0204/7
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_DIS_0204_075MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<52.228750,-1.500000,7.302500>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R2 220 0204/7
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<47.942500,0.000000,3.810000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 3R3 2k2 M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("203",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.180000,0.000000,3.810000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 3R4 20k M0805
#ifndef(pack_ZVD1) #declare global_pack_ZVD1=yes; object {DIODE_SMD_SMB()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.957500,0.000000,9.842500>translate<0,0.035000,0> }#end		//DO214 AA 3VD1 SS12 SMB
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_1206()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<28.892500,-1.500000,33.496250>translate<0,-0.035000,0> }#end		//SMD Capacitor 1206 4C1 10n C1206
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0805("222",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-305.000000,0> rotate<0,0,180> translate<43.656250,-1.500000,39.528750>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 4R1 2k2 M0805
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_SMD_CHIP_1206("222",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<31.432500,-1.500000,33.496250>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 4R2 2k2 M1206
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<33.655000,-1.500000,35.877500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 4R3 10k M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("152",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<29.051250,-1.500000,38.100000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 4R4 1.5k M0805
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_0805("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<31.273750,-1.500000,42.227500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 4R5 1k M0805
#ifndef(pack_ZVT1) #declare global_pack_ZVT1=yes; object {IC_SMD_SOT23("BC847","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<36.830000,-1.500000,36.195000>translate<0,-0.035000,0> }#end		//SOT23 4VT1 BC847 SOT23
#ifndef(pack_ZVT3) #declare global_pack_ZVT3=yes; object {IC_SMD_SOT23("IRML2502","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<34.607500,-1.500000,40.957500>translate<0,-0.035000,0> }#end		//SOT23 4VT3 IRML2502 SOT23
#ifndef(pack_ISP6) #declare global_pack_ISP6=yes; object {CON_PH_2X3()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<5.715000,-1.500000,36.195000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) ISP6  MA03-2
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper J1 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper J2 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JI 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JO 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JR 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JS 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JV 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JX 
#ifndef(pack_RJ1) #declare global_pack_RJ1=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<63.500000,0.000000,32.702500>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ1 0 R1206
#ifndef(pack_RJ2) #declare global_pack_RJ2=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<42.227500,-1.500000,26.193750>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ2 0 R1206
#ifndef(pack_RJ3) #declare global_pack_RJ3=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-135.000000,0> rotate<0,0,180> translate<20.796250,-1.500000,34.766250>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ3 0 R1206
#ifndef(pack_RJ4) #declare global_pack_RJ4=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-148.000000,0> rotate<0,0,180> translate<21.907500,-1.500000,40.163750>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ4 0 R1206
#ifndef(pack_RJ5) #declare global_pack_RJ5=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-55.000000,0> rotate<0,0,0> translate<63.500000,0.000000,43.815000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ5 0 R1206
#ifndef(pack_RJ6) #declare global_pack_RJ6=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<17.145000,0.000000,8.890000>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ6 0 R1206
#ifndef(pack_RJ7) #declare global_pack_RJ7=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<15.240000,-1.500000,43.497500>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ7 0 R1206
#ifndef(pack_RJ8) #declare global_pack_RJ8=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<63.817500,0.000000,10.477500>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ8 0 R1206
#ifndef(pack_RJ9) #declare global_pack_RJ9=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.747500,0.000000,16.192500>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ9 0 R1206
#ifndef(pack_S1) #declare global_pack_S1=yes; object {SWITCH_B3F_10XX1()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<9.525000,-1.500000,10.160000>}#end		//Tactile Switch-Omron S1  B3F-10XX
#ifndef(pack_S2) #declare global_pack_S2=yes; object {SWITCH_B3F_10XX1()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<9.525000,-1.500000,22.225000>}#end		//Tactile Switch-Omron S2  B3F-10XX
#ifndef(pack_Z1) #declare global_pack_Z1=yes; object {SPC_XTAL_5MM("7,3728MHz",3,)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<53.530500,-1.500000,36.195000>}#end		//Quarz 4,9MM Z1 7,3728MHz HC49U-V
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.637500,0.000000,21.272500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.737500,0.000000,21.272500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.813750,0.000000,5.715000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.713750,0.000000,5.715000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.306250,0.000000,37.306250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.406250,0.000000,37.306250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.623750,0.000000,33.655000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.723750,0.000000,33.655000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.475000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.575000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.430000,0.000000,29.530000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.430000,0.000000,31.430000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,30.290000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,31.090000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,31.890000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,32.690000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,33.490000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,35.090000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,35.890000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,36.690000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,37.490000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.487500,0.000000,38.290000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.687500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.887500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.087500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.287500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.487500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.687500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.887500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.087500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.287500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.487500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.687500,0.000000,40.090000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,38.290000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,37.490000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,36.690000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,35.890000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,35.090000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,33.490000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,32.690000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,31.890000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,31.090000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.887500,0.000000,30.290000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.687500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.487500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.287500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.087500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.887500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.687500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.487500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.287500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.087500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.887500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.687500,0.000000,28.490000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,30.162500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,31.432500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,32.702500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,33.972500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,35.242500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,36.512500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,37.782500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.900900,0.000000,39.052500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,39.052500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,37.782500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,36.512500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,35.242500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,33.972500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,32.702500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,31.432500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.754100,0.000000,30.162500>}
#ifndef(global_pack_ZHL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_ZHL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,26.035000> texture{col_thl}}
#ifndef(global_pack_ZHL2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_ZHL2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,26.035000> texture{col_thl}}
#ifndef(global_pack_ZHL3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_ZHL3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,26.035000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<2.542500,0.000000,20.002500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<4.442500,0.000000,20.002500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,0.000000,23.492500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,0.000000,21.592500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.480000,0.000000,21.428750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.480000,0.000000,19.528750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.940000,0.000000,30.800000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.940000,0.000000,32.700000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.162500,0.000000,33.489500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.162500,0.000000,30.645500>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.205000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.005000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.795000,0.000000,37.780000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.795000,0.000000,35.880000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.290000,0.000000,27.622500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.190000,0.000000,27.622500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.445000,0.000000,23.497500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.445000,0.000000,25.397500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.700000,-1.537000,39.050000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.700000,-1.537000,37.150000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.272500,0.000000,13.972500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<21.272500,0.000000,15.872500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.180000,0.000000,15.875000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.080000,0.000000,15.875000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.145000,-1.537000,35.398750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.145000,-1.537000,33.498750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.732500,0.000000,13.972500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.732500,0.000000,15.872500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.463750,0.000000,24.359000>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.463750,0.000000,21.361000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.947500,-1.537000,31.908750>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.547500,-1.537000,31.908750>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.742500,-1.537000,16.827500>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.342500,-1.537000,16.827500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.585000,0.000000,12.538750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.585000,0.000000,10.638750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.785000,0.000000,11.588750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.497500,0.000000,19.061250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.447500,0.000000,21.261250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.397500,0.000000,19.061250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.457500,-1.537000,36.832500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.457500,-1.537000,38.732500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.657500,-1.537000,37.782500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<69.430000,0.000000,49.530000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.730000,0.000000,49.530000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<71.120000,0.000000,49.110000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<71.120000,0.000000,47.410000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.517500,0.000000,50.538750>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.517500,0.000000,48.838750>}
object{TOOLS_PCB_SMD(1.600000,2.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.835000,0.000000,46.802500>}
object{TOOLS_PCB_SMD(1.600000,2.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<76.835000,0.000000,44.002500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<68.900000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.800000,0.000000,26.035000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<66.577500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.227500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.877500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<68.527500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.177500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.827500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.477500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.127500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.777500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.427500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.077500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.727500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.377500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<75.027500,0.000000,32.856500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<75.027500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.377500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.727500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.077500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.427500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.777500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<71.127500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.477500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.827500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.177500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<68.527500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.877500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.227500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<66.577500,0.000000,40.168500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.730000,0.000000,43.497500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<69.430000,0.000000,43.497500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<74.206500,0.000000,43.815000>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<71.208500,0.000000,43.815000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.445000,0.000000,16.192500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<75.145000,0.000000,16.192500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.445000,0.000000,14.605000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<75.145000,0.000000,14.605000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<75.145000,0.000000,13.017500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<73.445000,0.000000,13.017500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<67.398500,0.000000,23.971250>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.396500,0.000000,23.971250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<74.192500,0.000000,25.241250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<72.492500,0.000000,25.241250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.565000,0.000000,25.185000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.565000,0.000000,26.885000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.136250,0.000000,29.312500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<74.136250,0.000000,31.012500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.723750,0.000000,28.995000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<75.723750,0.000000,30.695000>}
#ifndef(global_pack_ZZ1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<73.215500,0,47.307500> texture{col_thl}}
#ifndef(global_pack_ZZ1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<68.389500,0,47.307500> texture{col_thl}}
#ifndef(global_pack_ZC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<59.372500,0,17.938750> texture{col_thl}}
#ifndef(global_pack_ZC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<56.832500,0,17.938750> texture{col_thl}}
#ifndef(global_pack_ZC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.213750,0,9.017000> texture{col_thl}}
#ifndef(global_pack_ZC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<59.213750,0,12.573000> texture{col_thl}}
#ifndef(global_pack_ZC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<35.877500,0,9.017000> texture{col_thl}}
#ifndef(global_pack_ZC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.877500,0,12.573000> texture{col_thl}}
#ifndef(global_pack_ZC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.132500,0,6.667500> texture{col_thl}}
#ifndef(global_pack_ZC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.132500,0,9.207500> texture{col_thl}}
#ifndef(global_pack_ZC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.845000,0,9.525000> texture{col_thl}}
#ifndef(global_pack_ZC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.845000,0,6.985000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.930000,0.000000,9.525000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.930000,0.000000,8.255000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.930000,0.000000,6.985000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.930000,0.000000,5.715000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.130000,0.000000,5.715000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.130000,0.000000,6.985000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.130000,0.000000,8.255000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.130000,0.000000,9.525000>}
#ifndef(global_pack_ZL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.292500,0,13.652500> texture{col_thl}}
#ifndef(global_pack_ZL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.132500,0,13.652500> texture{col_thl}}
#ifndef(global_pack_ZR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,4.762500> texture{col_thl}}
#ifndef(global_pack_ZR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<55.880000,0,4.762500> texture{col_thl}}
#ifndef(global_pack_ZR1A) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<63.500000,0,2.381250> texture{col_thl}}
#ifndef(global_pack_ZR1A) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<55.880000,0,2.381250> texture{col_thl}}
#ifndef(global_pack_ZR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.228750,0,11.112500> texture{col_thl}}
#ifndef(global_pack_ZR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<52.228750,0,3.492500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.992500,0.000000,3.810000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<48.892500,0.000000,3.810000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.130000,0.000000,3.810000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.230000,0.000000,3.810000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.957500,0.000000,12.042500>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.957500,0.000000,7.642500>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.892500,-1.537000,34.896250>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.892500,-1.537000,32.096250>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-235.000000,0> texture{col_pds} translate<44.201150,-1.537000,40.306944>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-235.000000,0> texture{col_pds} translate<43.111353,-1.537000,38.750553>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.432500,-1.537000,32.096250>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.432500,-1.537000,34.896250>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.655000,-1.537000,36.827500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.655000,-1.537000,34.927500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<28.101250,-1.537000,38.100000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.001250,-1.537000,38.100000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.323750,-1.537000,42.227500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.223750,-1.537000,42.227500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.730000,-1.537000,35.245000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.730000,-1.537000,37.145000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.930000,-1.537000,36.195000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.842500,-1.537000,39.857500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.942500,-1.537000,39.857500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.892500,-1.537000,42.057500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.657500,-1.537000,42.057500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.557500,-1.537000,42.057500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<34.607500,-1.537000,39.857500>}
#ifndef(global_pack_HW) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<18.573750,0,24.606250> texture{col_thl}}
#ifndef(global_pack_HW) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<18.573750,0,22.066250> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<4.445000,0,33.655000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.985000,0,33.655000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<4.445000,0,36.195000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.985000,0,36.195000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<4.445000,0,38.735000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.985000,0,38.735000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.499500,0.000000,44.767500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.975500,0.000000,44.767500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<59.499500,0.000000,42.545000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.975500,0.000000,42.545000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.484500,0.000000,27.940000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.960500,0.000000,27.940000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<58.864500,0.000000,40.322500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.340500,0.000000,40.322500>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<3.175000,0,43.497500> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<5.715000,0,43.497500> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.255000,0,43.497500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<60.960000,0.000000,40.449500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<60.960000,0.000000,38.925500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.437000,0.000000,30.162500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.913000,0.000000,30.162500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.035000,-1.537000,40.195500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.035000,-1.537000,41.719500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.306250,-1.537000,40.513000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.306250,-1.537000,42.037000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.415000,0.000000,46.831250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.715000,0.000000,46.831250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<4.015000,0.000000,46.831250>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<63.500000,0.000000,34.124500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<63.500000,0.000000,31.280500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.805500,-1.537000,26.193750>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.649500,-1.537000,26.193750>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<19.790747,-1.537000,33.760744>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<21.801756,-1.537000,35.771753>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-32.000000,0> texture{col_pds} translate<20.701578,-1.537000,39.410203>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-32.000000,0> texture{col_pds} translate<23.113425,-1.537000,40.917294>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-55.000000,0> texture{col_pds} translate<62.684372,0.000000,42.650166>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-55.000000,0> texture{col_pds} translate<64.315625,0.000000,44.979831>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.723000,0.000000,8.890000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.567000,0.000000,8.890000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.240000,-1.537000,42.075500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.240000,-1.537000,44.919500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<65.239500,0.000000,10.477500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.395500,0.000000,10.477500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.747500,0.000000,17.614500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.747500,0.000000,14.770500>}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<7.264400,0,13.411200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<7.264400,0,6.908800> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<11.785600,0,13.411200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<11.785600,0,6.908800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<11.785600,0,18.973800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<11.785600,0,25.476200> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<7.264400,0,18.973800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<7.264400,0,25.476200> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<12.065000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<6.985000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<12.065000,0,22.225000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<6.985000,0,22.225000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<64.981250,0,13.196250> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<64.981250,0,15.855000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<67.616250,0,15.855000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<67.616250,0,13.196250> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,1.500000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<70.167500,0,20.625000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(6.000000,1.500000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<70.167500,0,8.585000> texture{col_thl}}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.162500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.862500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<63.182500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.642500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.102500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<55.562500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.022500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.482500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.942500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.402500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.192500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.112500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.242500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(4.572000,53.848000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<37.147500,0.000000,50.165000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.542500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.782500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.652500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<18.732500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.702500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.622500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.082500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.322500,-1.537000,49.530000>}
#ifndef(global_pack_Z1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.530500,0,38.608000> texture{col_thl}}
#ifndef(global_pack_Z1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.530500,0,33.782000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<26.035000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<74.295000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<74.295000,0,5.715000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<27.622500,0,16.827500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<21.272500,0,2.063750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<21.272500,0,8.255000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<62.547500,0,22.225000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<62.547500,0,25.082500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<59.690000,0,25.082500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<54.927500,0,26.352500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<52.070000,0,26.352500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<23.177500,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<26.035000,0,35.242500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<60.960000,0,31.432500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<45.878750,0,27.781250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<11.112500,0,45.720000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<49.212500,0,28.892500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<48.895000,0,26.035000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<54.133750,0,42.703750> texture{col_thl}}
object{TOOLS_PCB_VIA(5.000000,0.800000,1,16,1,0) translate<77.787500,0,8.572500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<1.746250,0,1.746250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<79.533750,0,1.746250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<79.533750,0,51.911250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<1.746250,0,51.911250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<23.495000,0,32.226250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<47.307500,0,40.163750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<21.272500,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<43.815000,0,44.767500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<18.097500,0,41.275000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<11.430000,0,42.545000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<45.720000,0,42.545000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<40.005000,0,42.354500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<40.957500,0,44.767500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<37.147500,0,44.450000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<34.607500,0,44.450000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<32.067500,0,44.450000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<29.527500,0,44.450000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<26.987500,0,44.450000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<24.447500,0,44.608750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<21.748750,0,44.926250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<60.642500,0,36.195000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<40.957500,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<49.212500,0,31.750000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.428750,-1.535000,38.893750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.428750,-1.535000,33.020000>}
box{<0,0,-0.203200><5.873750,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.428750,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,31.908750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,13.970000>}
box{<0,0,-0.203200><17.938750,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.905000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,0.000000,31.432500>}
box{<0,0,-0.203200><7.937500,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.905000,0.000000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.428750,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,31.908750>}
box{<0,0,-0.203200><1.209004,0.035000,0.203200> rotate<0,66.797001,0> translate<1.428750,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,13.493750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,3.810000>}
box{<0,0,-0.203200><9.683750,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.381250,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,13.493750>}
box{<0,0,-0.203200><0.673519,0.035000,0.203200> rotate<0,44.997030,0> translate<1.905000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,0.000000,30.480000>}
box{<0,0,-0.203200><1.144763,0.035000,0.203200> rotate<0,56.306216,0> translate<1.905000,0.000000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,33.020000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.540000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.542500,0.000000,20.002500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.542500,0.000000,15.910600>}
box{<0,0,-0.203200><4.091900,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.542500,0.000000,15.910600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.542500,0.000000,20.002500>}
box{<0,0,-0.203200><10.477500,0.035000,0.203200> rotate<0,89.980390,0> translate<2.540000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.016250,-1.535000,32.226250>}
box{<0,0,-0.203200><0.925664,0.035000,0.203200> rotate<0,59.032347,0> translate<2.540000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.016250,-1.535000,14.922500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.016250,-1.535000,32.226250>}
box{<0,0,-0.203200><17.303750,0.035000,0.203200> rotate<0,90.000000,0> translate<3.016250,-1.535000,32.226250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.428750,-1.535000,38.893750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,-1.535000,40.640000>}
box{<0,0,-0.203200><2.469570,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.428750,-1.535000,38.893750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,0.000000,43.497500>}
box{<0,0,-0.203200><4.318467,0.035000,0.203200> rotate<0,-72.892460,0> translate<1.905000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.016250,-1.535000,14.922500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.651250,-1.535000,14.287500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<3.016250,-1.535000,14.922500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.651250,-1.535000,4.603750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.651250,-1.535000,14.287500>}
box{<0,0,-0.203200><9.683750,0.035000,0.203200> rotate<0,90.000000,0> translate<3.651250,-1.535000,14.287500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.175000,0.000000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.015000,0.000000,46.831250>}
box{<0,0,-0.304800><3.437948,0.035000,0.304800> rotate<0,-75.852647,0> translate<3.175000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,15.716250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,31.432500>}
box{<0,0,-0.203200><15.716250,0.035000,0.203200> rotate<0,90.000000,0> translate<4.127500,-1.535000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.442500,0.000000,20.002500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.442500,0.000000,17.147500>}
box{<0,0,-0.406400><2.855000,0.035000,0.406400> rotate<0,-90.000000,0> translate<4.442500,0.000000,17.147500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<4.442500,0.000000,20.002500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<4.445000,0.000000,23.497500>}
box{<0,0,-0.508000><3.495001,0.035000,0.508000> rotate<0,-89.953079,0> translate<4.442500,0.000000,20.002500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.445000,-1.535000,33.655000>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,-81.864495,0> translate<4.127500,-1.535000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.445000,-1.535000,36.195000>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,-18.433732,0> translate<2.540000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,1.270000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<2.381250,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,15.716250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,14.922500>}
box{<0,0,-0.203200><1.122532,0.035000,0.203200> rotate<0,44.997030,0> translate<4.127500,-1.535000,15.716250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,14.922500>}
box{<0,0,-0.203200><9.525000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.921250,-1.535000,14.922500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397500,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397500,-1.535000,16.827500>}
box{<0,0,-0.203200><11.112500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.397500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.651250,-1.535000,4.603750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.715000,-1.535000,2.540000>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,44.997030,0> translate<3.651250,-1.535000,4.603750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.445000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.715000,0.000000,43.497500>}
box{<0,0,-0.406400><4.928925,0.035000,0.406400> rotate<0,-75.063629,0> translate<4.445000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.715000,0.000000,46.831250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.715000,0.000000,43.497500>}
box{<0,0,-0.304800><3.333750,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.715000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.442500,0.000000,17.147500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.032500,0.000000,16.192500>}
box{<0,0,-0.406400><1.854757,0.035000,0.406400> rotate<0,30.988200,0> translate<4.442500,0.000000,17.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.032500,-1.535000,16.192500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<5.397500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.397500,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,28.892500>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.397500,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.508750,-1.535000,3.810000>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,44.997030,0> translate<4.921250,-1.535000,5.397500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.985000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.264400,0.000000,6.908800>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<6.985000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.542500,0.000000,15.910600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.264400,0.000000,13.411200>}
box{<0,0,-0.203200><5.342597,0.035000,0.203200> rotate<0,27.891360,0> translate<2.542500,0.000000,15.910600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.985000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.264400,0.000000,13.411200>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<6.985000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.985000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.264400,0.000000,18.973800>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<6.985000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<4.445000,0.000000,25.397500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.264400,0.000000,25.476200>}
box{<0,0,-0.508000><2.820498,0.035000,0.508000> rotate<0,-1.598819,0> translate<4.445000,0.000000,25.397500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.985000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.264400,0.000000,25.476200>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<6.985000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.255000,-1.535000,40.640000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.175000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.415000,0.000000,46.831250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.255000,0.000000,43.497500>}
box{<0,0,-0.304800><3.437948,0.035000,0.304800> rotate<0,75.852647,0> translate<7.415000,0.000000,46.831250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.264400,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.575000,0.000000,13.970000>}
box{<0,0,-0.203200><1.424756,0.035000,0.203200> rotate<0,-23.090402,0> translate<7.264400,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.048750,0.000000,28.733750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.048750,0.000000,32.065000>}
box{<0,0,-0.304800><3.331250,0.035000,0.304800> rotate<0,90.000000,0> translate<9.048750,0.000000,32.065000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<6.985000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.048750,0.000000,37.782500>}
box{<0,0,-0.508000><2.272954,0.035000,0.508000> rotate<0,24.773506,0> translate<6.985000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.048750,0.000000,32.065000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.048750,0.000000,37.782500>}
box{<0,0,-0.304800><5.717500,0.035000,0.304800> rotate<0,90.000000,0> translate<9.048750,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.985000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.207500,-1.535000,38.100000>}
box{<0,0,-0.203200><2.927205,0.035000,0.203200> rotate<0,-40.598615,0> translate<6.985000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.255000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.207500,-1.535000,39.370000>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,53.126596,0> translate<8.255000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.207500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.207500,-1.535000,39.370000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.207500,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.264400,-1.535000,25.476200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.283700,-1.535000,27.190700>}
box{<0,0,-0.304800><2.648978,0.035000,0.304800> rotate<0,-40.330480,0> translate<7.264400,-1.535000,25.476200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.525000,-1.535000,28.892500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.350000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.985000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.547500,-1.535000,31.908750>}
box{<0,0,-0.635000><3.100935,0.035000,0.635000> rotate<0,34.270737,0> translate<6.985000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.264400,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.045700,0.000000,4.127500>}
box{<0,0,-0.203200><3.933352,0.035000,0.203200> rotate<0,44.997030,0> translate<7.264400,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.048750,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<10.475000,0.000000,37.782500>}
box{<0,0,-0.508000><1.426250,0.035000,0.508000> rotate<0,0.000000,0> translate<9.048750,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.636250,-1.535000,39.846250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.636250,-1.535000,36.036250>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.636250,-1.535000,36.036250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.255000,-1.535000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.636250,-1.535000,39.846250>}
box{<0,0,-0.203200><4.359126,0.035000,0.203200> rotate<0,56.884904,0> translate<8.255000,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475000,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.795000,0.000000,37.780000>}
box{<0,0,-0.203200><0.320010,0.035000,0.203200> rotate<0,0.447585,0> translate<10.475000,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.795000,0.000000,35.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.110000,0.000000,35.882500>}
box{<0,0,-0.203200><0.315010,0.035000,0.203200> rotate<0,-0.454689,0> translate<10.795000,0.000000,35.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.110000,0.000000,34.451250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.110000,0.000000,35.882500>}
box{<0,0,-0.203200><1.431250,0.035000,0.203200> rotate<0,90.000000,0> translate<11.110000,0.000000,35.882500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,0.000000,45.720000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,-90.000000,0> translate<11.112500,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.477500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.112500,-1.535000,48.895000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<10.477500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,-1.535000,48.895000>}
box{<0,0,-0.635000><3.175000,0.035000,0.635000> rotate<0,90.000000,0> translate<11.112500,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.112500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.112500,-1.535000,48.895000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.112500,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.636250,-1.535000,36.036250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.271250,-1.535000,35.401250>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<10.636250,-1.535000,36.036250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.283700,-1.535000,27.190700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.398250,-1.535000,28.575000>}
box{<0,0,-0.304800><2.527372,0.035000,0.304800> rotate<0,-33.208758,0> translate<9.283700,-1.535000,27.190700> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.048750,0.000000,32.065000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,0.000000,31.430000>}
box{<0,0,-0.406400><2.464463,0.035000,0.406400> rotate<0,14.930432,0> translate<9.048750,0.000000,32.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.110000,0.000000,34.451250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.747500,0.000000,33.972500>}
box{<0,0,-0.203200><0.797250,0.035000,0.203200> rotate<0,36.903395,0> translate<11.110000,0.000000,34.451250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.785600,0.000000,13.411200>}
box{<0,0,-0.203200><1.424756,0.035000,0.203200> rotate<0,23.090402,0> translate<10.475000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.747500,0.000000,14.770500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.785600,0.000000,13.411200>}
box{<0,0,-0.203200><1.359834,0.035000,0.203200> rotate<0,88.388636,0> translate<11.747500,0.000000,14.770500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.747500,0.000000,17.614500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.785600,0.000000,18.973800>}
box{<0,0,-0.203200><1.359834,0.035000,0.203200> rotate<0,-88.388636,0> translate<11.747500,0.000000,17.614500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.048750,0.000000,28.733750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.785600,0.000000,25.476200>}
box{<0,0,-0.304800><4.254642,0.035000,0.304800> rotate<0,49.961205,0> translate<9.048750,0.000000,28.733750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.525000,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.906250,-1.535000,30.480000>}
box{<0,0,-0.203200><2.861906,0.035000,0.203200> rotate<0,-33.687844,0> translate<9.525000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.906250,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.906250,-1.535000,33.498750>}
box{<0,0,-0.203200><3.018750,0.035000,0.203200> rotate<0,90.000000,0> translate<11.906250,-1.535000,33.498750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.795000,0.000000,35.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.062500,0.000000,36.512500>}
box{<0,0,-0.203200><1.416550,0.035000,0.203200> rotate<0,-26.518079,0> translate<10.795000,0.000000,35.880000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.785600,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.065000,0.000000,10.160000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<11.785600,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.785600,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.065000,0.000000,10.160000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<11.785600,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.785600,0.000000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.065000,0.000000,22.225000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<11.785600,0.000000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.785600,0.000000,25.476200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.065000,0.000000,22.225000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<11.785600,0.000000,25.476200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.906250,-1.535000,33.498750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.221250,-1.535000,33.813750>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.906250,-1.535000,33.498750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.785600,0.000000,18.973800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.496800,0.000000,19.050000>}
box{<0,0,-0.203200><0.715270,0.035000,0.203200> rotate<0,-6.115100,0> translate<11.785600,0.000000,18.973800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.508750,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,3.810000>}
box{<0,0,-0.203200><6.191250,0.035000,0.203200> rotate<0,0.000000,0> translate<6.508750,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,39.050000>}
box{<0,0,-0.304800><3.718592,0.035000,0.304800> rotate<0,70.025436,0> translate<11.430000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<6.032500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.017500,0.000000,16.192500>}
box{<0,0,-0.250000><6.985000,0.035000,0.250000> rotate<0,0.000000,0> translate<6.032500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.065000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.205000,0.000000,21.590000>}
box{<0,0,-0.152400><1.304923,0.035000,0.152400> rotate<0,29.116652,0> translate<12.065000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.715000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,2.540000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.715000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,41.125000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,43.497500>}
box{<0,0,-0.304800><2.372500,0.035000,0.304800> rotate<0,90.000000,0> translate<13.335000,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.112500,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,44.450000>}
box{<0,0,-0.304800><2.559767,0.035000,0.304800> rotate<0,29.742918,0> translate<11.112500,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,44.450000>}
box{<0,0,-0.304800><0.952500,0.035000,0.304800> rotate<0,90.000000,0> translate<13.335000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.496800,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.652500,0.000000,18.097500>}
box{<0,0,-0.508000><1.497631,0.035000,0.508000> rotate<0,39.491916,0> translate<12.496800,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.652500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.652500,-1.535000,46.824500>}
box{<0,0,-0.203200><2.705500,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.652500,-1.535000,46.824500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,29.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.754100,0.000000,30.162500>}
box{<0,0,-0.304800><2.408630,0.035000,0.304800> rotate<0,-15.223236,0> translate<11.430000,0.000000,29.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,31.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.754100,0.000000,31.432500>}
box{<0,0,-0.304800><2.324101,0.035000,0.304800> rotate<0,-0.061628,0> translate<11.430000,0.000000,31.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,33.972500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,32.702500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.754100,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.747500,0.000000,33.972500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,33.972500>}
box{<0,0,-0.203200><2.006600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.747500,0.000000,33.972500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.062500,0.000000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,36.512500>}
box{<0,0,-0.203200><1.691600,0.035000,0.203200> rotate<0,0.000000,0> translate<12.062500,0.000000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,37.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.754100,0.000000,37.782500>}
box{<0,0,-0.304800><2.959101,0.035000,0.304800> rotate<0,-0.048403,0> translate<10.795000,0.000000,37.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.785600,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.813750,0.000000,5.715000>}
box{<0,0,-0.203200><2.353413,0.035000,0.203200> rotate<0,30.479704,0> translate<11.785600,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,1.270000>}
box{<0,0,-0.203200><9.048750,0.035000,0.203200> rotate<0,0.000000,0> translate<4.921250,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,11.747500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,8.093750>}
box{<0,0,-0.203200><3.653750,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.970000,0.000000,8.093750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,14.922500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,11.747500>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.970000,0.000000,11.747500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.017500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,0.000000,14.922500>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,53.126596,0> translate<13.017500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,41.125000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.287500,-1.535000,40.322500>}
box{<0,0,-0.304800><1.245497,0.035000,0.304800> rotate<0,40.112150,0> translate<13.335000,-1.535000,41.125000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290000,0.000000,30.162500>}
box{<0,0,-0.203200><0.535900,0.035000,0.203200> rotate<0,0.000000,0> translate<13.754100,0.000000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.290000,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.290000,0.000000,30.162500>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<14.290000,0.000000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,37.150000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.457500,-1.535000,36.832500>}
box{<0,0,-0.203200><1.785949,0.035000,0.203200> rotate<0,10.239608,0> translate<12.700000,-1.535000,37.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.287500,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.457500,-1.535000,38.732500>}
box{<0,0,-0.304800><1.599062,0.035000,0.304800> rotate<0,83.891683,0> translate<14.287500,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,25.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,20.320000>}
box{<0,0,-0.304800><5.395000,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.605000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.290000,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,25.715000>}
box{<0,0,-0.304800><1.933334,0.035000,0.304800> rotate<0,80.617619,0> translate<14.290000,0.000000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.605000,0.000000,46.672500>}
box{<0,0,-0.203200><5.207387,0.035000,0.203200> rotate<0,-52.427948,0> translate<11.430000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,6.032500>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.700000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,6.032500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,9.525000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,90.000000,0> translate<14.922500,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.398250,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.922500,-1.535000,29.686250>}
box{<0,0,-0.304800><3.695296,0.035000,0.304800> rotate<0,-17.499706,0> translate<11.398250,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652500,-1.535000,46.824500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,44.919500>}
box{<0,0,-0.304800><2.479754,0.035000,0.304800> rotate<0,50.191116,0> translate<13.652500,-1.535000,46.824500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.221250,-1.535000,33.813750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.398750,-1.535000,33.813750>}
box{<0,0,-0.203200><3.177500,0.035000,0.203200> rotate<0,0.000000,0> translate<12.221250,-1.535000,33.813750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.032500,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.557500,-1.535000,16.192500>}
box{<0,0,-0.203200><9.525000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.032500,-1.535000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.271250,-1.535000,35.401250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.557500,-1.535000,35.401250>}
box{<0,0,-0.203200><4.286250,0.035000,0.203200> rotate<0,0.000000,0> translate<11.271250,-1.535000,35.401250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,8.093750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.713750,0.000000,5.715000>}
box{<0,0,-0.203200><2.949426,0.035000,0.203200> rotate<0,53.753058,0> translate<13.970000,0.000000,8.093750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.557500,-1.535000,35.401250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.718750,-1.535000,35.398750>}
box{<0,0,-0.203200><0.161269,0.035000,0.203200> rotate<0,0.888177,0> translate<15.557500,-1.535000,35.401250> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.652500,0.000000,18.097500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<15.723000,0.000000,15.709500>}
box{<0,0,-0.508000><3.160619,0.035000,0.508000> rotate<0,49.070049,0> translate<13.652500,0.000000,18.097500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.723000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.723000,0.000000,15.709500>}
box{<0,0,-0.406400><6.819500,0.035000,0.406400> rotate<0,90.000000,0> translate<15.723000,0.000000,15.709500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.398750,-1.535000,33.813750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.872500,-1.535000,33.498750>}
box{<0,0,-0.203200><0.568915,0.035000,0.203200> rotate<0,33.618018,0> translate<15.398750,-1.535000,33.813750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,-1.535000,5.397500>}
box{<0,0,-0.203200><4.041115,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.335000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,-1.535000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,-1.535000,8.413750>}
box{<0,0,-0.203200><3.016250,0.035000,0.203200> rotate<0,90.000000,0> translate<16.192500,-1.535000,8.413750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190000,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,28.413750>}
box{<0,0,-0.203200><0.791254,0.035000,0.203200> rotate<0,-89.813044,0> translate<16.190000,0.000000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,28.413750>}
box{<0,0,-0.203200><0.796250,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.192500,0.000000,28.413750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190000,0.000000,30.165000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,29.210000>}
box{<0,0,-0.203200><0.955003,0.035000,0.203200> rotate<0,89.844082,0> translate<16.190000,0.000000,30.165000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190000,0.000000,30.165000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,31.115000>}
box{<0,0,-0.203200><0.950003,0.035000,0.203200> rotate<0,-89.843292,0> translate<16.190000,0.000000,30.165000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,32.226250>}
box{<0,0,-0.203200><1.111250,0.035000,0.203200> rotate<0,90.000000,0> translate<16.192500,0.000000,32.226250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,39.052500>}
box{<0,0,-0.203200><2.438400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.754100,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.657500,-1.535000,39.229250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.657500,-1.535000,37.782500>}
box{<0,0,-0.304800><1.446750,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.657500,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,42.075500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.657500,-1.535000,39.229250>}
box{<0,0,-0.304800><3.179693,0.035000,0.304800> rotate<0,63.521414,0> translate<15.240000,-1.535000,42.075500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.557500,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.827500,-1.535000,16.827500>}
box{<0,0,-0.203200><1.419903,0.035000,0.203200> rotate<0,-26.563298,0> translate<15.557500,-1.535000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.827500,0.000000,37.782500>}
box{<0,0,-0.203200><3.073400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.754100,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.713750,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.145000,0.000000,5.715000>}
box{<0,0,-0.406400><1.431250,0.035000,0.406400> rotate<0,0.000000,0> translate<15.713750,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,0.000000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,0.000000,5.715000>}
box{<0,0,-0.203200><11.112500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.145000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.145000,0.000000,16.827500>}
box{<0,0,-0.304800><4.318467,0.035000,0.304800> rotate<0,53.969065,0> translate<14.605000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.872500,-1.535000,33.498750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,-1.535000,33.498750>}
box{<0,0,-0.203200><1.272500,0.035000,0.203200> rotate<0,0.000000,0> translate<15.872500,-1.535000,33.498750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.718750,-1.535000,35.398750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,-1.535000,35.398750>}
box{<0,0,-0.203200><1.426250,0.035000,0.203200> rotate<0,0.000000,0> translate<15.718750,-1.535000,35.398750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.657500,-1.535000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,-1.535000,35.398750>}
box{<0,0,-0.203200><2.433089,0.035000,0.203200> rotate<0,78.436659,0> translate<16.657500,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.462500,-1.535000,43.497500>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<13.335000,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.462500,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.462500,-1.535000,43.497500>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.462500,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.192500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.462500,-1.535000,44.767500>}
box{<0,0,-0.304800><4.928925,0.035000,0.304800> rotate<0,75.063629,0> translate<16.192500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,5.080000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.970000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,7.620000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.780000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,29.527500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780000,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,32.226250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,0.000000,32.702500>}
box{<0,0,-0.203200><1.963629,0.035000,0.203200> rotate<0,-14.035317,0> translate<16.192500,0.000000,32.226250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,0.000000,41.275000>}
box{<0,0,-0.203200><2.927205,0.035000,0.203200> rotate<0,-49.395445,0> translate<16.192500,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.005000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.415000,0.000000,19.050000>}
box{<0,0,-0.304800><3.501385,0.035000,0.304800> rotate<0,46.501323,0> translate<16.005000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,0.000000,31.432500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.780000,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,36.988750>}
box{<0,0,-0.203200><4.297993,0.035000,0.203200> rotate<0,85.757945,0> translate<18.097500,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.827500,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,0.000000,39.052500>}
box{<0,0,-0.203200><2.032992,0.035000,0.203200> rotate<0,-38.657257,0> translate<16.827500,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.947500,-1.535000,31.908750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.415003,-1.535000,31.908750>}
box{<0,0,-0.406400><4.467503,0.035000,0.406400> rotate<0,0.000000,0> translate<13.947500,-1.535000,31.908750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.005000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.573750,0.000000,22.066250>}
box{<0,0,-0.304800><2.612526,0.035000,0.304800> rotate<0,-10.502764,0> translate<16.005000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.567000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.585000,0.000000,10.638750>}
box{<0,0,-0.406400><1.748843,0.035000,0.406400> rotate<0,-89.404371,0> translate<18.567000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.585000,0.000000,12.538750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.732500,0.000000,13.972500>}
box{<0,0,-0.406400><1.441317,0.035000,0.406400> rotate<0,-84.120690,0> translate<18.585000,0.000000,12.538750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.732500,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.732500,0.000000,15.872500>}
box{<0,0,-0.203200><1.272500,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.732500,0.000000,15.872500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.732500,0.000000,17.145000>}
box{<0,0,-0.203200><1.931277,0.035000,0.203200> rotate<0,80.532363,0> translate<18.415000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,-1.535000,13.970000>}
box{<0,0,-0.203200><6.286179,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.922500,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,0.000000,27.940000>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,44.997030,0> translate<17.780000,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.415003,-1.535000,31.908750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.790747,-1.535000,33.760744>}
box{<0,0,-0.406400><2.307066,0.035000,0.406400> rotate<0,-53.389861,0> translate<18.415003,-1.535000,31.908750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.462500,-1.535000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.843750,-1.535000,42.703750>}
box{<0,0,-0.304800><2.510058,0.035000,0.304800> rotate<0,18.433732,0> translate<17.462500,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.732500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.843750,-1.535000,43.973750>}
box{<0,0,-0.304800><5.666285,0.035000,0.304800> rotate<0,78.684874,0> translate<18.732500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,31.432500>}
box{<0,0,-0.203200><1.485900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.415000,0.000000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,32.702500>}
box{<0,0,-0.203200><1.803400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.097500,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,33.972500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.900900,0.000000,33.972500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754100,0.000000,35.242500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,35.242500>}
box{<0,0,-0.203200><6.146800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.754100,0.000000,35.242500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,33.972500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,35.242500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.900900,0.000000,35.242500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,39.052500>}
box{<0,0,-0.203200><1.485900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.415000,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,-1.535000,8.413750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,12.541250>}
box{<0,0,-0.203200><5.837166,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.192500,-1.535000,8.413750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.827500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.342500,-1.535000,16.827500>}
box{<0,0,-0.203200><3.515000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.827500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.922500,-1.535000,29.686250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.637500,-1.535000,29.686250>}
box{<0,0,-0.304800><5.715000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.922500,-1.535000,29.686250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.637500,0.000000,30.162500>}
box{<0,0,-0.203200><0.736600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.900900,0.000000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,0.000000,36.512500>}
box{<0,0,-0.203200><1.054100,0.035000,0.203200> rotate<0,0.000000,0> translate<19.900900,0.000000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.272500,-1.535000,2.063750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.272500,-1.535000,8.255000>}
box{<0,0,-0.508000><6.191250,0.035000,0.508000> rotate<0,90.000000,0> translate<21.272500,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.272500,-1.535000,8.413750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.272500,-1.535000,8.255000>}
box{<0,0,-0.508000><0.158750,0.035000,0.508000> rotate<0,-90.000000,0> translate<21.272500,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,-1.535000,11.112500>}
box{<0,0,-0.203200><4.939141,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.780000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.785000,0.000000,11.588750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.272500,0.000000,13.972500>}
box{<0,0,-0.406400><2.433089,0.035000,0.406400> rotate<0,-78.436659,0> translate<20.785000,0.000000,11.588750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.342500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,-1.535000,20.320000>}
box{<0,0,-0.203200><3.614202,0.035000,0.203200> rotate<0,-75.084051,0> translate<20.342500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.900900,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,0.000000,31.432500>}
box{<0,0,-0.203200><1.371600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.900900,0.000000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.843750,-1.535000,42.703750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.272500,-1.535000,41.275000>}
box{<0,0,-0.304800><2.020558,0.035000,0.304800> rotate<0,44.997030,0> translate<19.843750,-1.535000,42.703750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,36.988750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.431250,-1.535000,34.131250>}
box{<0,0,-0.203200><4.154885,0.035000,0.203200> rotate<0,43.448975,0> translate<18.415000,-1.535000,36.988750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.637500,0.000000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,29.210000>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,44.997030,0> translate<20.637500,0.000000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.900900,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,0.000000,39.052500>}
box{<0,0,-0.304800><1.689100,0.035000,0.304800> rotate<0,0.000000,0> translate<19.900900,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.843750,-1.535000,43.973750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748750,-1.535000,42.703750>}
box{<0,0,-0.203200><2.289525,0.035000,0.203200> rotate<0,33.687844,0> translate<19.843750,-1.535000,43.973750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.701578,-1.535000,39.410203>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.801756,-1.535000,35.771753>}
box{<0,0,-0.304800><3.801146,0.035000,0.304800> rotate<0,73.171140,0> translate<20.701578,-1.535000,39.410203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,30.480000>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,44.997030,0> translate<21.272500,0.000000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.145000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.383750,0.000000,5.715000>}
box{<0,0,-0.406400><5.238750,0.035000,0.406400> rotate<0,0.000000,0> translate<17.145000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383750,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.542500,0.000000,5.715000>}
box{<0,0,-0.203200><0.158750,0.035000,0.203200> rotate<0,0.000000,0> translate<22.383750,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,0.000000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.542500,0.000000,34.925000>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,44.997030,0> translate<20.955000,0.000000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.748750,-1.535000,44.926250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.542500,-1.535000,49.530000>}
box{<0,0,-0.406400><4.671676,0.035000,0.406400> rotate<0,-80.212299,0> translate<21.748750,-1.535000,44.926250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.748750,0.000000,44.926250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,43.497500>}
box{<0,0,-0.203200><1.810028,0.035000,0.203200> rotate<0,52.121576,0> translate<21.748750,0.000000,44.926250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.748750,-1.535000,42.703750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.113425,-1.535000,40.917294>}
box{<0,0,-0.304800><2.248058,0.035000,0.304800> rotate<0,52.620296,0> translate<21.748750,-1.535000,42.703750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.177500,-1.535000,38.100000>}
box{<0,0,-0.203200><3.702654,0.035000,0.203200> rotate<0,59.032347,0> translate<21.272500,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.177500,0.000000,38.100000>}
box{<0,0,-0.304800><1.851327,0.035000,0.304800> rotate<0,30.961713,0> translate<21.590000,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.272500,0.000000,15.872500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.180000,0.000000,15.875000>}
box{<0,0,-0.406400><1.907502,0.035000,0.406400> rotate<0,-0.075088,0> translate<21.272500,0.000000,15.872500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.177500,0.000000,15.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.180000,0.000000,15.875000>}
box{<0,0,-0.203200><0.003536,0.035000,0.203200> rotate<0,44.997030,0> translate<23.177500,0.000000,15.877500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.045700,0.000000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,0.000000,4.127500>}
box{<0,0,-0.203200><13.449300,0.035000,0.203200> rotate<0,0.000000,0> translate<10.045700,0.000000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.637500,-1.535000,29.686250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.495000,-1.535000,32.226250>}
box{<0,0,-0.304800><3.823206,0.035000,0.304800> rotate<0,-41.630792,0> translate<20.637500,-1.535000,29.686250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.542500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,0.000000,32.226250>}
box{<0,0,-0.203200><2.861906,0.035000,0.203200> rotate<0,70.555308,0> translate<22.542500,0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.177500,0.000000,15.877500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.497500,0.000000,19.061250>}
box{<0,0,-0.406400><3.199791,0.035000,0.406400> rotate<0,-84.254893,0> translate<23.177500,0.000000,15.877500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.573750,-1.535000,24.606250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.653750,-1.535000,29.051250>}
box{<0,0,-0.304800><6.750143,0.035000,0.304800> rotate<0,-41.183207,0> translate<18.573750,-1.535000,24.606250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.542500,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,0.000000,7.302500>}
box{<0,0,-0.406400><2.245064,0.035000,0.406400> rotate<0,-44.997030,0> translate<22.542500,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.177500,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<24.130000,-1.535000,36.512500>}
box{<0,0,-0.508000><1.851327,0.035000,0.508000> rotate<0,59.032347,0> translate<23.177500,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.812500,0.000000,34.766250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,0.000000,36.512500>}
box{<0,0,-0.406400><1.774879,0.035000,0.406400> rotate<0,-79.689894,0> translate<23.812500,0.000000,34.766250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.431250,-1.535000,34.131250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.288750,-1.535000,34.131250>}
box{<0,0,-0.203200><2.857500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.431250,-1.535000,34.131250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.272500,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.445000,0.000000,13.808750>}
box{<0,0,-0.406400><6.396006,0.035000,0.406400> rotate<0,-60.259475,0> translate<21.272500,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.272500,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.447500,0.000000,21.261250>}
box{<0,0,-0.304800><3.311582,0.035000,0.304800> rotate<0,-16.511720,0> translate<21.272500,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.447500,0.000000,21.261250>}
box{<0,0,-0.304800><2.256202,0.035000,0.304800> rotate<0,81.904895,0> translate<24.130000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,0.000000,27.940000>}
box{<0,0,-0.203200><5.397500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.367500,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.445000,0.000000,13.808750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.080000,0.000000,15.875000>}
box{<0,0,-0.406400><2.161623,0.035000,0.406400> rotate<0,-72.911946,0> translate<24.445000,0.000000,13.808750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,0.000000,29.210000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.590000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.288750,-1.535000,34.131250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,-1.535000,33.337500>}
box{<0,0,-0.203200><1.122532,0.035000,0.203200> rotate<0,44.997030,0> translate<24.288750,-1.535000,34.131250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.447500,0.000000,44.608750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,0.000000,43.180000>}
box{<0,0,-0.203200><1.563506,0.035000,0.203200> rotate<0,66.033153,0> translate<24.447500,0.000000,44.608750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.447500,-1.535000,44.608750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.082500,-1.535000,49.530000>}
box{<0,0,-0.406400><4.962049,0.035000,0.406400> rotate<0,-82.642166,0> translate<24.447500,-1.535000,44.608750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.080000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.397500,0.000000,19.061250>}
box{<0,0,-0.406400><3.202030,0.035000,0.406400> rotate<0,-84.303873,0> translate<25.080000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,30.480000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,0.000000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.717500,0.000000,6.350000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.495000,0.000000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.812500,0.000000,34.766250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.717500,0.000000,32.702500>}
box{<0,0,-0.304800><2.808574,0.035000,0.304800> rotate<0,47.287489,0> translate<23.812500,0.000000,34.766250> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<24.130000,-1.535000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,35.242500>}
box{<0,0,-0.508000><2.289525,0.035000,0.508000> rotate<0,33.687844,0> translate<24.130000,-1.535000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,0.000000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.035000,0.000000,38.100000>}
box{<0,0,-0.406400><2.479754,0.035000,0.406400> rotate<0,-39.802944,0> translate<24.130000,0.000000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.113425,-1.535000,40.917294>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,-1.535000,41.719500>}
box{<0,0,-0.304800><3.029709,0.035000,0.304800> rotate<0,-15.352867,0> translate<23.113425,-1.535000,40.917294> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.272500,0.000000,2.063750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.193750,0.000000,2.063750>}
box{<0,0,-0.508000><4.921250,0.035000,0.508000> rotate<0,0.000000,0> translate<21.272500,0.000000,2.063750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,41.719500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.373000,-1.535000,42.057500>}
box{<0,0,-0.203200><0.478004,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.035000,-1.535000,41.719500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,33.337500>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.082500,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.828750,0.000000,27.940000>}
box{<0,0,-0.203200><2.159233,0.035000,0.203200> rotate<0,36.024996,0> translate<25.082500,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.717500,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,11.112500>}
box{<0,0,-0.203200><5.020116,0.035000,0.203200> rotate<0,-71.560328,0> translate<25.717500,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,26.035000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,36.867464,0> translate<24.765000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,28.892500>}
box{<0,0,-0.203200><2.479754,0.035000,0.203200> rotate<0,39.802944,0> translate<25.400000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.463750,0.000000,24.359000>}
box{<0,0,-0.304800><3.731336,0.035000,0.304800> rotate<0,26.688614,0> translate<24.130000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<26.035000,-1.535000,40.195500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<27.604500,-1.535000,40.195500>}
box{<0,0,-0.350000><1.569500,0.035000,0.350000> rotate<0,0.000000,0> translate<26.035000,-1.535000,40.195500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,0.000000,7.302500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.622500,0.000000,16.827500>}
box{<0,0,-0.304800><10.145106,0.035000,0.304800> rotate<0,-69.859086,0> translate<24.130000,0.000000,7.302500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<24.742500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.622500,-1.535000,16.827500>}
box{<0,0,-0.508000><2.880000,0.035000,0.508000> rotate<0,0.000000,0> translate<24.742500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.463750,0.000000,21.361000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.622500,0.000000,16.827500>}
box{<0,0,-0.304800><4.536279,0.035000,0.304800> rotate<0,87.988680,0> translate<27.463750,0.000000,21.361000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,33.496250>}
box{<0,0,-0.203200><0.965639,0.035000,0.203200> rotate<0,-9.461698,0> translate<26.670000,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.987500,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,0.000000,42.545000>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,71.560328,0> translate<26.987500,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.987500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.622500,-1.535000,49.530000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,-82.869514,0> translate<26.987500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.717500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.937500,0.000000,32.702500>}
box{<0,0,-0.406400><2.220000,0.035000,0.406400> rotate<0,0.000000,0> translate<25.717500,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,13.970000>}
box{<0,0,-0.203200><8.572500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.367500,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.937500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,32.700000>}
box{<0,0,-0.203200><0.003536,0.035000,0.203200> rotate<0,44.997030,0> translate<27.937500,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.604500,-1.535000,40.195500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.942500,-1.535000,39.857500>}
box{<0,0,-0.203200><0.478004,0.035000,0.203200> rotate<0,44.997030,0> translate<27.604500,-1.535000,40.195500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,30.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.094500,0.000000,30.645500>}
box{<0,0,-0.203200><0.218496,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,0.000000,30.800000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.101250,-1.535000,38.100000>}
box{<0,0,-0.508000><2.066250,0.035000,0.508000> rotate<0,0.000000,0> translate<26.035000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.942500,-1.535000,39.857500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.101250,-1.535000,38.100000>}
box{<0,0,-0.508000><1.764655,0.035000,0.508000> rotate<0,84.833042,0> translate<27.942500,-1.535000,39.857500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,32.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.255000,0.000000,32.385000>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,0.000000,32.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,12.541250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.257500,-1.535000,12.541250>}
box{<0,0,-0.203200><7.937500,0.035000,0.203200> rotate<0,0.000000,0> translate<20.320000,-1.535000,12.541250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.272500,-1.535000,11.112500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,11.112500>}
box{<0,0,-0.203200><7.302500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.272500,-1.535000,11.112500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.255000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,32.385000>}
box{<0,0,-0.203200><0.320000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.255000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,0.000000,35.242500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.733750,0.000000,34.131250>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,22.378658,0> translate<26.035000,0.000000,35.242500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.035000,-1.535000,35.242500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<28.762500,-1.535000,34.925000>}
box{<0,0,-0.508000><2.745917,0.035000,0.508000> rotate<0,6.639306,0> translate<26.035000,-1.535000,35.242500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,0.000000,32.067500>}
box{<0,0,-0.203200><0.449013,0.035000,0.203200> rotate<0,44.997030,0> translate<28.575000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.762500,-1.535000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,34.896250>}
box{<0,0,-0.203200><0.133141,0.035000,0.203200> rotate<0,12.469639,0> translate<28.762500,-1.535000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.373000,-1.535000,42.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,42.057500>}
box{<0,0,-0.203200><2.519500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.373000,-1.535000,42.057500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.035000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.521250,0.000000,35.090000>}
box{<0,0,-0.406400><4.605870,0.035000,0.406400> rotate<0,40.804367,0> translate<26.035000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.733750,0.000000,34.131250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.679500,0.000000,33.972500>}
box{<0,0,-0.203200><0.958981,0.035000,0.203200> rotate<0,9.527994,0> translate<28.733750,0.000000,34.131250> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<26.193750,0.000000,2.063750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,0.000000,6.985000>}
box{<0,0,-0.508000><6.127832,0.035000,0.508000> rotate<0,-53.423443,0> translate<26.193750,0.000000,2.063750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.842500,-1.535000,39.857500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.001250,-1.535000,38.100000>}
box{<0,0,-0.203200><1.764655,0.035000,0.203200> rotate<0,84.833042,0> translate<29.842500,-1.535000,39.857500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,34.896250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.003750,-1.535000,36.512500>}
box{<0,0,-0.203200><1.961413,0.035000,0.203200> rotate<0,-55.485934,0> translate<28.892500,-1.535000,34.896250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.094500,0.000000,30.645500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,30.645500>}
box{<0,0,-0.203200><2.068000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.094500,0.000000,30.645500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.679500,0.000000,33.972500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,33.489500>}
box{<0,0,-0.203200><0.683065,0.035000,0.203200> rotate<0,44.997030,0> translate<29.679500,0.000000,33.972500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.527500,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,43.180000>}
box{<0,0,-0.203200><1.419903,0.035000,0.203200> rotate<0,63.430762,0> translate<29.527500,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.527500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.162500,-1.535000,49.530000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,-82.869514,0> translate<29.527500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,30.645500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.314500,0.000000,30.797500>}
box{<0,0,-0.203200><0.214960,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.162500,0.000000,30.645500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.892500,-1.535000,42.057500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.323750,-1.535000,42.227500>}
box{<0,0,-0.304800><1.441311,0.035000,0.304800> rotate<0,-6.773255,0> translate<28.892500,-1.535000,42.057500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.622500,0.000000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,19.528750>}
box{<0,0,-0.304800><3.932182,0.035000,0.304800> rotate<0,-43.387043,0> translate<27.622500,0.000000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.480000,0.000000,21.428750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.480000,0.000000,23.495000>}
box{<0,0,-0.406400><2.066250,0.035000,0.406400> rotate<0,90.000000,0> translate<30.480000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,26.035000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.305000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.785000,0.000000,35.890000>}
box{<0,0,-0.203200><10.985430,0.035000,0.203200> rotate<0,43.826087,0> translate<22.860000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,0.000000,28.892500>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<27.305000,0.000000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.314500,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,0.000000,30.797500>}
box{<0,0,-0.203200><1.118000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.314500,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,0.000000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,0.000000,32.067500>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892500,0.000000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,32.096250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,32.096250>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892500,-1.535000,32.096250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877500,0.000000,39.877500>}
box{<0,0,-0.203200><3.721254,0.035000,0.203200> rotate<0,62.552859,0> translate<30.162500,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.082500,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,36.690000>}
box{<0,0,-0.203200><9.405432,0.035000,0.203200> rotate<0,43.629348,0> translate<25.082500,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,33.489500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.915500,0.000000,34.290000>}
box{<0,0,-0.203200><1.927125,0.035000,0.203200> rotate<0,-24.541988,0> translate<30.162500,0.000000,33.489500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.001250,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,38.100000>}
box{<0,0,-0.203200><2.383750,0.035000,0.203200> rotate<0,0.000000,0> translate<30.001250,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.525000,0.000000,31.890000>}
box{<0,0,-0.203200><1.545028,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.432500,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.537500,0.000000,33.490000>}
box{<0,0,-0.304800><1.801258,0.035000,0.304800> rotate<0,-52.156447,0> translate<31.432500,0.000000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.677500,0.000000,37.490000>}
box{<0,0,-0.203200><7.148850,0.035000,0.203200> rotate<0,44.997030,0> translate<27.622500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.067500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.702500,-1.535000,49.530000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,-82.869514,0> translate<32.067500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,0.000000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.995000,0.000000,31.090000>}
box{<0,0,-0.203200><2.696370,0.035000,0.203200> rotate<0,-54.582228,0> translate<31.432500,0.000000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.525000,0.000000,31.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,31.890000>}
box{<0,0,-0.203200><0.495000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.525000,0.000000,31.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,32.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,31.890000>}
box{<0,0,-0.203200><0.800000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,0.000000,31.890000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.210500,0.000000,6.985000>}
box{<0,0,-0.508000><3.365500,0.035000,0.508000> rotate<0,0.000000,0> translate<29.845000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.003750,-1.535000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.340000,-1.535000,36.512500>}
box{<0,0,-0.203200><3.336250,0.035000,0.203200> rotate<0,0.000000,0> translate<30.003750,-1.535000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877500,0.000000,39.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.465000,0.000000,38.290000>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,44.997030,0> translate<31.877500,0.000000,39.877500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.432500,-1.535000,34.896250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.655000,-1.535000,34.927500>}
box{<0,0,-0.406400><2.222720,0.035000,0.406400> rotate<0,-0.805515,0> translate<31.432500,-1.535000,34.896250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.340000,-1.535000,36.512500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,36.827500>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.340000,-1.535000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.223750,-1.535000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.657500,-1.535000,42.057500>}
box{<0,0,-0.304800><1.443793,0.035000,0.304800> rotate<0,6.761554,0> translate<32.223750,-1.535000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,11.112500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.813750,0.000000,15.240000>}
box{<0,0,-0.203200><7.707145,0.035000,0.203200> rotate<0,-32.378541,0> translate<27.305000,0.000000,11.112500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.828750,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,27.940000>}
box{<0,0,-0.203200><7.058750,0.035000,0.203200> rotate<0,0.000000,0> translate<26.828750,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,27.390000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,27.940000>}
box{<0,0,-0.203200><0.550000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.887500,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,30.290000>}
box{<0,0,-0.203200><2.350000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.887500,0.000000,30.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.995000,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,31.090000>}
box{<0,0,-0.203200><0.892500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.995000,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,31.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,31.890000>}
box{<0,0,-0.203200><0.867500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,31.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,32.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,32.690000>}
box{<0,0,-0.203200><0.867500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020000,0.000000,32.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.537500,0.000000,33.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,33.490000>}
box{<0,0,-0.203200><1.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.537500,0.000000,33.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.915500,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,34.290000>}
box{<0,0,-0.203200><1.972000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.915500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.521250,0.000000,35.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,35.090000>}
box{<0,0,-0.203200><4.366250,0.035000,0.203200> rotate<0,0.000000,0> translate<29.521250,0.000000,35.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.785000,0.000000,35.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,35.890000>}
box{<0,0,-0.203200><3.102500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.785000,0.000000,35.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.890000,0.000000,36.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,36.690000>}
box{<0,0,-0.203200><1.997500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.890000,0.000000,36.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.677500,0.000000,37.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,37.490000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.677500,0.000000,37.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.465000,0.000000,38.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,38.290000>}
box{<0,0,-0.203200><0.422500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.465000,0.000000,38.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131250,-1.535000,38.417500>}
box{<0,0,-0.203200><1.774879,0.035000,0.203200> rotate<0,-10.304166,0> translate<32.385000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.257500,-1.535000,12.541250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,17.303750>}
box{<0,0,-0.203200><7.685861,0.035000,0.203200> rotate<0,-38.287636,0> translate<28.257500,-1.535000,12.541250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,21.272500>}
box{<0,0,-0.203200><9.677242,0.035000,0.203200> rotate<0,-48.987680,0> translate<27.940000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,19.528750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,0.000000,21.592500>}
box{<0,0,-0.304800><4.333032,0.035000,0.304800> rotate<0,-28.441052,0> translate<30.480000,0.000000,19.528750> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<29.845000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.798000,0.000000,12.573000>}
box{<0,0,-0.508000><5.815713,0.035000,0.508000> rotate<0,-31.605416,0> translate<29.845000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,27.390000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.242500,0.000000,26.035000>}
box{<0,0,-0.203200><1.916259,0.035000,0.203200> rotate<0,44.997030,0> translate<33.887500,0.000000,27.390000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.607500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.242500,-1.535000,49.530000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,-82.869514,0> translate<34.607500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.607500,-1.535000,39.857500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.539500,-1.535000,39.857500>}
box{<0,0,-0.203200><0.932000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.607500,-1.535000,39.857500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,11.112500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,15.875000>}
box{<0,0,-0.203200><8.454090,0.035000,0.203200> rotate<0,-34.284614,0> translate<28.575000,-1.535000,11.112500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,34.290000>}
box{<0,0,-0.203200><1.672500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.887500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.687500,0.000000,40.830000>}
box{<0,0,-0.203200><5.119453,0.035000,0.203200> rotate<0,44.997030,0> translate<32.067500,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.687500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.687500,0.000000,40.830000>}
box{<0,0,-0.203200><0.740000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.687500,0.000000,40.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,34.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.730000,-1.535000,35.245000>}
box{<0,0,-0.203200><2.099150,0.035000,0.203200> rotate<0,-8.698897,0> translate<33.655000,-1.535000,34.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,36.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.730000,-1.535000,37.145000>}
box{<0,0,-0.203200><2.099150,0.035000,0.203200> rotate<0,-8.698897,0> translate<33.655000,-1.535000,36.827500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<33.210500,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.877500,0.000000,9.017000>}
box{<0,0,-0.508000><3.352896,0.035000,0.508000> rotate<0,-37.301486,0> translate<33.210500,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<34.798000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<35.877500,0.000000,12.573000>}
box{<0,0,-0.508000><1.079500,0.035000,0.508000> rotate<0,0.000000,0> translate<34.798000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.607500,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.487500,0.000000,41.935000>}
box{<0,0,-0.203200><3.140004,0.035000,0.203200> rotate<0,53.217825,0> translate<34.607500,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.487500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.487500,0.000000,41.935000>}
box{<0,0,-0.203200><1.845000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.487500,0.000000,41.935000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.887500,0.000000,33.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.512500,0.000000,33.496250>}
box{<0,0,-0.203200><2.625007,0.035000,0.203200> rotate<0,-0.136409,0> translate<33.887500,0.000000,33.490000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.290000,0.000000,23.492500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,0.000000,23.495000>}
box{<0,0,-0.406400><2.540001,0.035000,0.406400> rotate<0,-0.056390,0> translate<34.290000,0.000000,23.492500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.242500,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,26.035000>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.242500,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.112500,0.000000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.147500,0.000000,50.165000>}
box{<0,0,-0.203200><26.035000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.112500,0.000000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.147500,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.287500,0.000000,42.685000>}
box{<0,0,-0.203200><1.770544,0.035000,0.203200> rotate<0,85.459147,0> translate<37.147500,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.287500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.287500,0.000000,42.685000>}
box{<0,0,-0.203200><2.595000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.287500,0.000000,42.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.813750,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.306250,0.000000,15.240000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.813750,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.539500,-1.535000,39.857500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.306250,-1.535000,40.513000>}
box{<0,0,-0.203200><1.884432,0.035000,0.203200> rotate<0,-20.354529,0> translate<35.539500,-1.535000,39.857500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,17.303750>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131250,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,38.417500>}
box{<0,0,-0.203200><3.333750,0.035000,0.203200> rotate<0,0.000000,0> translate<34.131250,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.557500,-1.535000,42.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,42.057500>}
box{<0,0,-0.203200><2.225000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.557500,-1.535000,42.057500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.306250,-1.535000,42.037000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,42.057500>}
box{<0,0,-0.203200><0.476691,0.035000,0.203200> rotate<0,-2.464591,0> translate<37.306250,-1.535000,42.037000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.147500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.782500,-1.535000,49.530000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,-82.869514,0> translate<37.147500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.930000,-1.535000,37.952500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.930000,-1.535000,36.195000>}
box{<0,0,-0.203200><1.757500,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.930000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.930000,-1.535000,37.952500>}
box{<0,0,-0.203200><0.657609,0.035000,0.203200> rotate<0,44.997030,0> translate<37.465000,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.087500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.087500,0.000000,42.532500>}
box{<0,0,-0.203200><2.442500,0.035000,0.203200> rotate<0,90.000000,0> translate<38.087500,0.000000,42.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.258750,-1.535000,33.496250>}
box{<0,0,-0.203200><10.636250,0.035000,0.203200> rotate<0,0.000000,0> translate<27.622500,-1.535000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,21.272500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.576250,-1.535000,21.272500>}
box{<0,0,-0.203200><4.286250,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.306250,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.639750,-1.535000,40.513000>}
box{<0,0,-0.203200><1.333500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.306250,-1.535000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,15.875000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,0.000000,21.592500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.737500,0.000000,21.272500>}
box{<0,0,-0.203200><4.458997,0.035000,0.203200> rotate<0,4.115099,0> translate<34.290000,0.000000,21.592500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.735000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.737500,0.000000,21.272500>}
box{<0,0,-0.304800><1.587502,0.035000,0.304800> rotate<0,-89.903837,0> translate<38.735000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.737500,0.000000,21.272500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,23.647500>}
box{<0,0,-0.203200><2.379732,0.035000,0.203200> rotate<0,-86.380418,0> translate<38.737500,0.000000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,28.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,23.647500>}
box{<0,0,-0.203200><4.842500,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.887500,0.000000,23.647500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.512500,0.000000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,31.121250>}
box{<0,0,-0.203200><3.358757,0.035000,0.203200> rotate<0,44.997030,0> translate<36.512500,0.000000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,28.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,31.121250>}
box{<0,0,-0.203200><2.631250,0.035000,0.203200> rotate<0,90.000000,0> translate<38.887500,0.000000,31.121250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,37.617500>}
box{<0,0,-0.203200><4.705796,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.560000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,37.617500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.887500,0.000000,40.090000>}
box{<0,0,-0.203200><2.472500,0.035000,0.203200> rotate<0,90.000000,0> translate<38.887500,0.000000,40.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,32.096250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.922500,-1.535000,32.096250>}
box{<0,0,-0.203200><7.490000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.432500,-1.535000,32.096250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.877500,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.052500,0.000000,9.842500>}
box{<0,0,-0.406400><4.187631,0.035000,0.406400> rotate<0,40.692845,0> translate<35.877500,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.087500,0.000000,42.532500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,0.000000,44.132500>}
box{<0,0,-0.203200><1.868482,0.035000,0.203200> rotate<0,-58.900884,0> translate<38.087500,0.000000,42.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,42.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,-1.535000,44.280000>}
box{<0,0,-0.203200><2.559767,0.035000,0.203200> rotate<0,-60.251142,0> translate<37.782500,-1.535000,42.057500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.653750,-1.535000,29.051250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,29.051250>}
box{<0,0,-0.304800><15.716250,0.035000,0.304800> rotate<0,0.000000,0> translate<23.653750,-1.535000,29.051250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,28.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,23.812500>}
box{<0,0,-0.203200><4.677500,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.687500,0.000000,23.812500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,28.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,29.845000>}
box{<0,0,-0.203200><1.355000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.687500,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.512500,0.000000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,36.671250>}
box{<0,0,-0.203200><4.490128,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.512500,0.000000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,36.671250>}
box{<0,0,-0.203200><3.418750,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.687500,0.000000,36.671250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.639750,-1.535000,40.513000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,42.354500>}
box{<0,0,-0.203200><2.292385,0.035000,0.203200> rotate<0,-53.444000,0> translate<38.639750,-1.535000,40.513000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,-1.535000,44.280000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,48.958500>}
box{<0,0,-0.203200><4.774476,0.035000,0.203200> rotate<0,-78.487195,0> translate<39.052500,-1.535000,44.280000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,-1.535000,49.085500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,48.958500>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<39.878000,-1.535000,49.085500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,-1.535000,49.085500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.322500,-1.535000,49.530000>}
box{<0,0,-0.203200><0.628618,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.878000,-1.535000,49.085500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,24.123750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,28.490000>}
box{<0,0,-0.203200><4.366250,0.035000,0.203200> rotate<0,90.000000,0> translate<40.487500,0.000000,28.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,0.000000,42.354500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,41.122500>}
box{<0,0,-0.203200><1.323114,0.035000,0.203200> rotate<0,68.608193,0> translate<40.005000,0.000000,42.354500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,41.122500>}
box{<0,0,-0.203200><1.032500,0.035000,0.203200> rotate<0,90.000000,0> translate<40.487500,0.000000,41.122500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,23.812500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.637500,0.000000,21.272500>}
box{<0,0,-0.203200><2.711844,0.035000,0.203200> rotate<0,69.488825,0> translate<39.687500,0.000000,23.812500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.576250,-1.535000,21.272500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.805500,-1.535000,23.501750>}
box{<0,0,-0.203200><3.152636,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.576250,-1.535000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.805500,-1.535000,23.501750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.805500,-1.535000,26.193750>}
box{<0,0,-0.203200><2.692000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.805500,-1.535000,26.193750> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<35.877500,0.000000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.957500,0.000000,7.642500>}
box{<0,0,-0.635000><5.262666,0.035000,0.635000> rotate<0,15.139057,0> translate<35.877500,0.000000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.306250,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.957500,0.000000,15.240000>}
box{<0,0,-0.304800><3.651250,0.035000,0.304800> rotate<0,0.000000,0> translate<37.306250,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,0.000000,31.115000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.687500,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,0.000000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,0.000000,44.767500>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,-18.433732,0> translate<39.052500,0.000000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.258750,-1.535000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275000,-1.535000,38.576250>}
box{<0,0,-0.203200><5.907975,0.035000,0.203200> rotate<0,-59.296364,0> translate<38.258750,-1.535000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275000,-1.535000,38.576250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275000,-1.535000,41.275000>}
box{<0,0,-0.203200><2.698750,0.035000,0.203200> rotate<0,90.000000,0> translate<41.275000,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,24.911250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,28.490000>}
box{<0,0,-0.203200><3.578750,0.035000,0.203200> rotate<0,90.000000,0> translate<41.287500,0.000000,28.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,41.386188>}
box{<0,0,-0.203200><1.296188,0.035000,0.203200> rotate<0,90.000000,0> translate<41.287500,0.000000,41.386188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.637500,0.000000,21.272500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,0.000000,21.272500>}
box{<0,0,-0.203200><0.955000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.637500,0.000000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,41.386188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.819484,0.000000,42.076922>}
box{<0,0,-0.203200><0.871849,0.035000,0.203200> rotate<0,-52.394079,0> translate<41.287500,0.000000,41.386188> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.735000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.068750,0.000000,17.303750>}
box{<0,0,-0.304800><4.096857,0.035000,0.304800> rotate<0,35.535332,0> translate<38.735000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,25.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,28.490000>}
box{<0,0,-0.203200><2.950000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.087500,0.000000,28.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,41.135000>}
box{<0,0,-0.203200><1.045000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.087500,0.000000,41.135000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.227500,-1.535000,22.066250>}
box{<0,0,-0.203200><6.735192,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.465000,-1.535000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.227500,-1.535000,22.066250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.227500,-1.535000,29.845000>}
box{<0,0,-0.203200><7.778750,0.035000,0.203200> rotate<0,90.000000,0> translate<42.227500,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<40.957500,0.000000,7.642500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<42.230000,0.000000,3.810000>}
box{<0,0,-0.635000><4.038231,0.035000,0.635000> rotate<0,71.627625,0> translate<40.957500,0.000000,7.642500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,28.465000>}
box{<0,0,-0.203200><1.795000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.862500,0.000000,28.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,31.115000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.957500,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.957500,-1.535000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.862500,-1.535000,46.672500>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.957500,-1.535000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,-1.535000,49.530000>}
box{<0,0,-0.203200><2.857500,0.035000,0.203200> rotate<0,90.000000,0> translate<42.862500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,0.000000,36.671250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.868750,0.000000,33.490000>}
box{<0,0,-0.203200><4.498967,0.035000,0.203200> rotate<0,44.997030,0> translate<39.687500,0.000000,36.671250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,28.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.887500,0.000000,28.490000>}
box{<0,0,-0.203200><0.035355,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.862500,0.000000,28.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.922500,-1.535000,32.096250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.111353,-1.535000,38.750553>}
box{<0,0,-0.203200><7.862966,0.035000,0.203200> rotate<0,-57.805959,0> translate<38.922500,-1.535000,32.096250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.052500,0.000000,9.842500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,0.000000,9.842500>}
box{<0,0,-0.406400><4.127500,0.035000,0.406400> rotate<0,0.000000,0> translate<39.052500,0.000000,9.842500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,0.000000,21.272500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,19.050000>}
box{<0,0,-0.203200><2.731238,0.035000,0.203200> rotate<0,54.458728,0> translate<41.592500,0.000000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,41.135000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.497500,0.000000,42.545000>}
box{<0,0,-0.203200><1.994041,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.087500,0.000000,41.135000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.649500,-1.535000,26.193750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.649500,-1.535000,28.885750>}
box{<0,0,-0.304800><2.692000,0.035000,0.304800> rotate<0,90.000000,0> translate<43.649500,-1.535000,28.885750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687500,0.000000,28.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687500,0.000000,27.378750>}
box{<0,0,-0.203200><1.111250,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.687500,0.000000,27.378750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687500,0.000000,27.378750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.761250,0.000000,27.305000>}
box{<0,0,-0.203200><0.104298,0.035000,0.203200> rotate<0,44.997030,0> translate<43.687500,0.000000,27.378750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275000,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.815000,-1.535000,44.767500>}
box{<0,0,-0.203200><4.318467,0.035000,0.203200> rotate<0,-53.969065,0> translate<41.275000,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.819484,0.000000,42.076922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.815000,0.000000,44.767500>}
box{<0,0,-0.203200><3.349820,0.035000,0.203200> rotate<0,-53.433329,0> translate<41.819484,0.000000,42.076922> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.130000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,0.000000,3.807500>}
box{<0,0,-0.304800><0.003536,0.035000,0.304800> rotate<0,44.997030,0> translate<44.130000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,0.000000,3.807500>}
box{<0,0,-0.304800><1.267500,0.035000,0.304800> rotate<0,90.000000,0> translate<44.132500,0.000000,3.807500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,0.000000,9.842500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.132500,0.000000,9.207500>}
box{<0,0,-0.406400><1.144763,0.035000,0.406400> rotate<0,33.687844,0> translate<43.180000,0.000000,9.842500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.957500,0.000000,12.042500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.132500,0.000000,13.652500>}
box{<0,0,-0.406400><3.559877,0.035000,0.406400> rotate<0,-26.887181,0> translate<40.957500,0.000000,12.042500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.227500,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,-1.535000,31.750000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.227500,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.068750,0.000000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.291250,0.000000,15.875000>}
box{<0,0,-0.304800><2.642127,0.035000,0.304800> rotate<0,32.733066,0> translate<42.068750,0.000000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.085000,0.000000,1.587500>}
box{<0,0,-0.304800><1.347038,0.035000,0.304800> rotate<0,44.997030,0> translate<44.132500,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,0.000000,28.892500>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<42.862500,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.649500,-1.535000,28.885750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.085000,-1.535000,30.321250>}
box{<0,0,-0.304800><2.030104,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.649500,-1.535000,28.885750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.402500,0.000000,17.462500>}
box{<0,0,-0.406400><2.731238,0.035000,0.406400> rotate<0,35.535332,0> translate<43.180000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.868750,0.000000,33.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,33.490000>}
box{<0,0,-0.203200><2.618750,0.035000,0.203200> rotate<0,0.000000,0> translate<42.868750,0.000000,33.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.512500,0.000000,31.115000>}
box{<0,0,-0.203200><0.035355,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.487500,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,35.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.525500,0.000000,35.052000>}
box{<0,0,-0.203200><0.053740,0.035000,0.203200> rotate<0,44.997030,0> translate<45.487500,0.000000,35.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.402500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.618159,-1.535000,48.775188>}
box{<0,0,-0.203200><0.785016,0.035000,0.203200> rotate<0,74.049811,0> translate<45.402500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.618159,-1.535000,47.091841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.618159,-1.535000,48.775188>}
box{<0,0,-0.203200><1.683347,0.035000,0.203200> rotate<0,90.000000,0> translate<45.618159,-1.535000,48.775188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.132500,0.000000,9.207500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,8.255000>}
box{<0,0,-0.203200><1.851327,0.035000,0.203200> rotate<0,30.961713,0> translate<44.132500,0.000000,9.207500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.487500,0.000000,24.123750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,19.050000>}
box{<0,0,-0.203200><7.288484,0.035000,0.203200> rotate<0,44.114616,0> translate<40.487500,0.000000,24.123750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.497500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,42.545000>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.497500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.201150,-1.535000,40.306944>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,42.545000>}
box{<0,0,-0.406400><2.704774,0.035000,0.406400> rotate<0,-55.833659,0> translate<44.201150,-1.535000,40.306944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,0.000000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.878750,0.000000,27.781250>}
box{<0,0,-0.203200><1.365619,0.035000,0.203200> rotate<0,54.458728,0> translate<45.085000,0.000000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.287500,0.000000,24.911250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.037500,0.000000,20.320000>}
box{<0,0,-0.203200><6.606215,0.035000,0.203200> rotate<0,44.023474,0> translate<41.287500,0.000000,24.911250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.618159,-1.535000,48.775188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.037500,-1.535000,47.307500>}
box{<0,0,-0.203200><1.526418,0.035000,0.203200> rotate<0,74.049668,0> translate<45.618159,-1.535000,48.775188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.605000,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,46.672500>}
box{<0,0,-0.203200><31.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.605000,0.000000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.087500,0.000000,25.540000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.513750,0.000000,21.590000>}
box{<0,0,-0.203200><5.932469,0.035000,0.203200> rotate<0,41.743072,0> translate<42.087500,0.000000,25.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,31.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.532500,0.000000,31.890000>}
box{<0,0,-0.203200><1.045000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,31.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.697500,0.000000,31.090000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,30.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.916250,0.000000,29.442500>}
box{<0,0,-0.203200><1.661199,0.035000,0.203200> rotate<0,30.673370,0> translate<45.487500,0.000000,30.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.132500,0.000000,6.667500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.930000,0.000000,6.985000>}
box{<0,0,-0.203200><2.815460,0.035000,0.203200> rotate<0,-6.474604,0> translate<44.132500,0.000000,6.667500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.930000,0.000000,8.255000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.720000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,0.000000,13.652500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.930000,0.000000,9.525000>}
box{<0,0,-0.304800><4.986207,0.035000,0.304800> rotate<0,55.868030,0> translate<44.132500,0.000000,13.652500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,0.000000,22.860000>}
box{<0,0,-0.203200><5.617148,0.035000,0.203200> rotate<0,42.706571,0> translate<42.862500,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.930000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.992500,0.000000,3.810000>}
box{<0,0,-0.304800><1.906025,0.035000,0.304800> rotate<0,88.115076,0> translate<46.930000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,32.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.295000,0.000000,32.690000>}
box{<0,0,-0.203200><1.807500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,32.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.930000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.307500,0.000000,5.715000>}
box{<0,0,-0.203200><0.377500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.930000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.930000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.307500,0.000000,8.255000>}
box{<0,0,-0.203200><0.377500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.930000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,29.051250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.307500,-1.535000,40.163750>}
box{<0,0,-0.304800><13.656191,0.035000,0.304800> rotate<0,-54.458728,0> translate<39.370000,-1.535000,29.051250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687500,0.000000,40.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.307500,0.000000,40.163750>}
box{<0,0,-0.203200><3.620751,0.035000,0.203200> rotate<0,-1.167044,0> translate<43.687500,0.000000,40.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.761250,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.466250,0.000000,24.130000>}
box{<0,0,-0.203200><4.879308,0.035000,0.203200> rotate<0,40.592247,0> translate<43.761250,0.000000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.085000,-1.535000,30.321250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.466250,-1.535000,30.321250>}
box{<0,0,-0.304800><2.381250,0.035000,0.304800> rotate<0,0.000000,0> translate<45.085000,-1.535000,30.321250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.085000,0.000000,1.587500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.625000,0.000000,1.587500>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.085000,0.000000,1.587500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.295000,0.000000,32.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,33.528000>}
box{<0,0,-0.203200><1.278072,0.035000,0.203200> rotate<0,-40.968142,0> translate<47.295000,0.000000,32.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.625000,0.000000,1.587500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.575000,0.000000,2.537500>}
box{<0,0,-0.304800><1.343503,0.035000,0.304800> rotate<0,-44.997030,0> translate<47.625000,0.000000,1.587500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.942500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.577500,-1.535000,48.895000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<47.942500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.577500,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.577500,-1.535000,48.895000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.577500,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.487500,0.000000,38.290000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.767500,0.000000,38.290000>}
box{<0,0,-0.152400><3.280000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.487500,0.000000,38.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.575000,0.000000,2.537500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.892500,0.000000,3.810000>}
box{<0,0,-0.304800><1.311512,0.035000,0.304800> rotate<0,-75.985231,0> translate<48.575000,0.000000,2.537500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.307500,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,0.000000,6.032500>}
box{<0,0,-0.203200><1.618939,0.035000,0.203200> rotate<0,-11.309186,0> translate<47.307500,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,0.000000,7.937500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,0.000000,6.032500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.895000,0.000000,6.032500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.307500,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,0.000000,7.937500>}
box{<0,0,-0.203200><1.618939,0.035000,0.203200> rotate<0,11.309186,0> translate<47.307500,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,-1.535000,26.035000>}
box{<0,0,-0.203200><14.368410,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.735000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.916250,0.000000,29.442500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,0.000000,26.035000>}
box{<0,0,-0.203200><3.940369,0.035000,0.203200> rotate<0,59.852129,0> translate<46.916250,0.000000,29.442500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.697500,0.000000,31.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,28.892500>}
box{<0,0,-0.203200><3.339795,0.035000,0.203200> rotate<0,41.142863,0> translate<46.697500,0.000000,31.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.466250,-1.535000,30.321250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,28.892500>}
box{<0,0,-0.304800><2.256261,0.035000,0.304800> rotate<0,39.286814,0> translate<47.466250,-1.535000,30.321250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.132500,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,31.750000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.132500,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.532500,0.000000,31.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,31.750000>}
box{<0,0,-0.203200><2.683654,0.035000,0.203200> rotate<0,2.990148,0> translate<46.532500,0.000000,31.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,31.750000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.212500,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.618159,-1.535000,47.091841>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,41.910000>}
box{<0,0,-0.304800><6.306406,0.035000,0.304800> rotate<0,55.249564,0> translate<45.618159,-1.535000,47.091841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,37.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555000,0.000000,37.490000>}
box{<0,0,-0.203200><4.067500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,37.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.291250,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.847500,0.000000,15.875000>}
box{<0,0,-0.304800><5.556250,0.035000,0.304800> rotate<0,0.000000,0> translate<44.291250,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.847500,0.000000,8.572500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.847500,0.000000,15.875000>}
box{<0,0,-0.304800><7.302500,0.035000,0.304800> rotate<0,90.000000,0> translate<49.847500,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.466250,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,24.130000>}
box{<0,0,-0.203200><2.381250,0.035000,0.203200> rotate<0,0.000000,0> translate<47.466250,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767500,0.000000,38.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,40.640000>}
box{<0,0,-0.203200><2.586291,0.035000,0.203200> rotate<0,-65.313385,0> translate<48.767500,0.000000,38.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,41.910000>}
box{<0,0,-0.203200><5.905841,0.035000,0.203200> rotate<0,53.742615,0> translate<46.355000,0.000000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,41.910000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<49.847500,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.165000,0.000000,33.528000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,36.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.342500,0.000000,36.690000>}
box{<0,0,-0.203200><4.855000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,36.690000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.847500,0.000000,8.572500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,0.000000,6.985000>}
box{<0,0,-0.304800><1.709790,0.035000,0.304800> rotate<0,68.194090,0> translate<49.847500,0.000000,8.572500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.577500,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,-1.535000,42.386250>}
box{<0,0,-0.304800><4.402272,0.035000,0.304800> rotate<0,64.354747,0> translate<48.577500,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,-1.535000,42.386250>}
box{<0,0,-0.304800><9.048750,0.035000,0.304800> rotate<0,90.000000,0> translate<50.482500,-1.535000,42.386250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,28.257500>}
box{<0,0,-0.203200><1.709790,0.035000,0.203200> rotate<0,21.799971,0> translate<49.212500,0.000000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,34.290000>}
box{<0,0,-0.203200><5.312500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,46.355000>}
box{<0,0,-0.304800><3.190836,0.035000,0.304800> rotate<0,84.283844,0> translate<50.482500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.117500,-1.535000,30.638750>}
box{<0,0,-0.304800><2.584263,0.035000,0.304800> rotate<0,-42.507642,0> translate<49.212500,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.117500,-1.535000,32.226250>}
box{<0,0,-0.203200><1.279883,0.035000,0.203200> rotate<0,60.251142,0> translate<50.482500,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.117500,-1.535000,30.638750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.117500,-1.535000,32.226250>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,90.000000,0> translate<51.117500,-1.535000,32.226250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555000,0.000000,37.490000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276250,0.000000,40.957500>}
box{<0,0,-0.203200><3.871209,0.035000,0.203200> rotate<0,-63.596226,0> translate<49.555000,0.000000,37.490000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276250,0.000000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276250,0.000000,44.894500>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.276250,0.000000,44.894500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.513750,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435000,0.000000,21.590000>}
box{<0,0,-0.203200><4.921250,0.035000,0.203200> rotate<0,0.000000,0> translate<46.513750,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435000,0.000000,22.860000>}
box{<0,0,-0.203200><4.445000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.990000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.593750,-1.535000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.593750,-1.535000,40.481250>}
box{<0,0,-0.304800><6.985000,0.035000,0.304800> rotate<0,90.000000,0> translate<51.593750,-1.535000,40.481250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,19.050000>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.720000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.037500,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,20.320000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.037500,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,29.527500>}
box{<0,0,-0.203200><3.375071,0.035000,0.203200> rotate<0,41.183207,0> translate<49.212500,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.487500,0.000000,35.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.765000,0.000000,35.890000>}
box{<0,0,-0.203200><6.277500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.487500,0.000000,35.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.525500,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.943000,0.000000,35.052000>}
box{<0,0,-0.203200><6.417500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.525500,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.847500,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,26.352500>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.847500,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.165000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,30.797500>}
box{<0,0,-0.203200><3.329363,0.035000,0.203200> rotate<0,55.093868,0> translate<50.165000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.892500,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.130000,0.000000,5.715000>}
box{<0,0,-0.304800><3.756385,0.035000,0.304800> rotate<0,-30.471267,0> translate<48.892500,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.482500,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.130000,0.000000,6.985000>}
box{<0,0,-0.304800><1.647500,0.035000,0.304800> rotate<0,0.000000,0> translate<50.482500,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.130000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.228750,0.000000,11.112500>}
box{<0,0,-0.304800><1.590568,0.035000,0.304800> rotate<0,-86.434813,0> translate<52.130000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.895000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.228750,-1.535000,29.051250>}
box{<0,0,-0.304800><4.495737,0.035000,0.304800> rotate<0,-42.134814,0> translate<48.895000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.593750,-1.535000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.228750,-1.535000,32.385000>}
box{<0,0,-0.203200><1.279883,0.035000,0.203200> rotate<0,60.251142,0> translate<51.593750,-1.535000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.228750,-1.535000,29.051250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.228750,-1.535000,32.385000>}
box{<0,0,-0.304800><3.333750,0.035000,0.304800> rotate<0,90.000000,0> translate<52.228750,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.342500,0.000000,36.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.228750,0.000000,40.481250>}
box{<0,0,-0.203200><4.234562,0.035000,0.203200> rotate<0,-63.544212,0> translate<50.342500,0.000000,36.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.228750,0.000000,40.481250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.228750,0.000000,43.656250>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.228750,0.000000,43.656250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.276250,0.000000,44.894500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.387500,0.000000,46.037500>}
box{<0,0,-0.203200><1.594154,0.035000,0.203200> rotate<0,-45.803906,0> translate<51.276250,0.000000,44.894500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.402500,0.000000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.863750,0.000000,17.462500>}
box{<0,0,-0.406400><7.461250,0.035000,0.406400> rotate<0,0.000000,0> translate<45.402500,0.000000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.863750,0.000000,31.908750>}
box{<0,0,-0.304800><3.151098,0.035000,0.304800> rotate<0,49.082377,0> translate<50.800000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.132500,-1.535000,9.207500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.022500,-1.535000,17.938750>}
box{<0,0,-0.635000><12.460611,0.035000,0.635000> rotate<0,-44.480900,0> translate<44.132500,-1.535000,9.207500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.228750,0.000000,43.656250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,0.000000,44.608750>}
box{<0,0,-0.203200><1.239877,0.035000,0.203200> rotate<0,-50.191116,0> translate<52.228750,0.000000,43.656250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.943000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.530500,0.000000,33.782000>}
box{<0,0,-0.203200><2.032992,0.035000,0.203200> rotate<0,38.657257,0> translate<51.943000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.765000,0.000000,35.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.530500,0.000000,38.608000>}
box{<0,0,-0.203200><3.241067,0.035000,0.203200> rotate<0,-56.990158,0> translate<51.765000,0.000000,35.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.022500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.657500,-1.535000,46.355000>}
box{<0,0,-0.304800><3.237877,0.035000,0.304800> rotate<0,78.684874,0> translate<53.022500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.800000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.133750,-1.535000,42.703750>}
box{<0,0,-0.304800><4.944241,0.035000,0.304800> rotate<0,47.599421,0> translate<50.800000,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.593750,-1.535000,40.481250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.133750,-1.535000,42.703750>}
box{<0,0,-0.304800><3.375071,0.035000,0.304800> rotate<0,-41.183207,0> translate<51.593750,-1.535000,40.481250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.228750,0.000000,3.492500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,5.192438>}
box{<0,0,-0.304800><2.673734,0.035000,0.304800> rotate<0,-39.476118,0> translate<52.228750,0.000000,3.492500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.130000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,8.255000>}
box{<0,0,-0.304800><2.162500,0.035000,0.304800> rotate<0,0.000000,0> translate<52.130000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,5.192438>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,8.255000>}
box{<0,0,-0.304800><3.062563,0.035000,0.304800> rotate<0,90.000000,0> translate<54.292500,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.292500,0.000000,13.652500>}
box{<0,0,-0.304800><5.397500,0.035000,0.304800> rotate<0,90.000000,0> translate<54.292500,0.000000,13.652500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.957500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610000,-1.535000,23.177500>}
box{<0,0,-0.304800><15.792234,0.035000,0.304800> rotate<0,-30.171529,0> translate<40.957500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.927500,0.000000,26.352500>}
box{<0,0,-0.203200><4.939141,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.435000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,0.000000,44.608750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.086250,0.000000,44.608750>}
box{<0,0,-0.203200><2.063750,0.035000,0.203200> rotate<0,0.000000,0> translate<53.022500,0.000000,44.608750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.847500,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.245000,0.000000,15.875000>}
box{<0,0,-0.304800><5.397500,0.035000,0.304800> rotate<0,0.000000,0> translate<49.847500,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.530500,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.406250,0.000000,37.306250>}
box{<0,0,-0.203200><2.283198,0.035000,0.203200> rotate<0,34.757931,0> translate<53.530500,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.530500,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.723750,0.000000,33.655000>}
box{<0,0,-0.203200><2.196924,0.035000,0.203200> rotate<0,3.313789,0> translate<53.530500,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.292500,0.000000,5.192438>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.880000,0.000000,4.762500>}
box{<0,0,-0.406400><1.644689,0.035000,0.406400> rotate<0,15.152718,0> translate<54.292500,0.000000,5.192438> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<55.880000,0.000000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<55.880000,0.000000,4.762500>}
box{<0,0,-0.711200><2.381250,0.035000,0.711200> rotate<0,90.000000,0> translate<55.880000,0.000000,4.762500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.387500,0.000000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,0.000000,46.037500>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.387500,0.000000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.133750,0.000000,42.703750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.070500,0.000000,41.116250>}
box{<0,0,-0.203200><2.504228,0.035000,0.203200> rotate<0,39.337922,0> translate<54.133750,0.000000,42.703750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.562500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.197500,-1.535000,46.355000>}
box{<0,0,-0.304800><3.237877,0.035000,0.304800> rotate<0,78.684874,0> translate<55.562500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.070000,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.356250,-1.535000,34.290000>}
box{<0,0,-0.304800><9.020856,0.035000,0.304800> rotate<0,-61.626886,0> translate<52.070000,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,14.128750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,10.953750>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<56.515000,0.000000,10.953750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.245000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,14.128750>}
box{<0,0,-0.304800><2.159233,0.035000,0.304800> rotate<0,53.969065,0> translate<55.245000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,23.177500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,-1.535000,25.082500>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.610000,-1.535000,23.177500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<52.863750,0.000000,31.908750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,31.908750>}
box{<0,0,-0.304800><3.651250,0.035000,0.304800> rotate<0,0.000000,0> translate<52.863750,0.000000,31.908750> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.863750,0.000000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.832500,0.000000,17.938750>}
box{<0,0,-0.508000><3.997223,0.035000,0.508000> rotate<0,-6.842322,0> translate<52.863750,0.000000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<53.022500,-1.535000,17.938750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.832500,-1.535000,17.938750>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<53.022500,-1.535000,17.938750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.832500,0.000000,28.257500>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<50.800000,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.991250,-1.535000,27.305000>}
box{<0,0,-0.203200><2.272954,0.035000,0.203200> rotate<0,-77.900101,0> translate<56.515000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.086250,0.000000,44.608750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,42.545000>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,44.997030,0> translate<55.086250,0.000000,44.608750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,0.000000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,44.767500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<55.880000,0.000000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.832500,-1.535000,17.938750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.308750,-1.535000,20.637500>}
box{<0,0,-0.635000><2.740450,0.035000,0.635000> rotate<0,-79.986741,0> translate<56.832500,-1.535000,17.938750> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.308750,-1.535000,23.971250>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.308750,-1.535000,20.637500>}
box{<0,0,-0.635000><3.333750,0.035000,0.635000> rotate<0,-90.000000,0> translate<57.308750,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.356250,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.308750,-1.535000,39.687500>}
box{<0,0,-0.304800><5.480900,0.035000,0.304800> rotate<0,-79.986741,0> translate<56.356250,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.308750,-1.535000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.308750,-1.535000,39.687500>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<57.308750,-1.535000,39.687500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.657500,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.308750,-1.535000,42.862500>}
box{<0,0,-0.304800><5.052641,0.035000,0.304800> rotate<0,43.724084,0> translate<53.657500,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.070500,0.000000,41.116250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.340500,0.000000,40.322500>}
box{<0,0,-0.203200><1.497645,0.035000,0.203200> rotate<0,32.003271,0> translate<56.070500,0.000000,41.116250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,31.908750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.623750,0.000000,33.655000>}
box{<0,0,-0.304800><2.068506,0.035000,0.304800> rotate<0,-57.583429,0> translate<56.515000,0.000000,31.908750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.306250,0.000000,37.306250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.623750,0.000000,33.655000>}
box{<0,0,-0.304800><3.665028,0.035000,0.304800> rotate<0,85.024648,0> translate<57.306250,0.000000,37.306250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,29.527500>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.752500,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.975500,0.000000,42.545000>}
box{<0,0,-0.203200><0.825500,0.035000,0.203200> rotate<0,0.000000,0> translate<57.150000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.975500,0.000000,44.767500>}
box{<0,0,-0.203200><0.825500,0.035000,0.203200> rotate<0,0.000000,0> translate<57.150000,0.000000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.832500,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.102500,0.000000,26.987500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<56.832500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.927500,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.102500,-1.535000,35.083750>}
box{<0,0,-0.304800><9.290606,0.035000,0.304800> rotate<0,-70.012273,0> translate<54.927500,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.308750,-1.535000,23.971250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.261250,-1.535000,26.987500>}
box{<0,0,-0.406400><3.163071,0.035000,0.406400> rotate<0,-72.469649,0> translate<57.308750,-1.535000,23.971250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.102500,-1.535000,35.083750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.578750,-1.535000,38.735000>}
box{<0,0,-0.304800><3.682179,0.035000,0.304800> rotate<0,-82.563143,0> translate<58.102500,-1.535000,35.083750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.578750,-1.535000,43.338750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.578750,-1.535000,38.735000>}
box{<0,0,-0.304800><4.603750,0.035000,0.304800> rotate<0,-90.000000,0> translate<58.578750,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.197500,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.578750,-1.535000,43.338750>}
box{<0,0,-0.304800><3.842931,0.035000,0.304800> rotate<0,51.706424,0> translate<56.197500,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.737500,0.000000,30.797500>}
box{<0,0,-0.203200><6.667500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.864500,0.000000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.864500,0.000000,35.115500>}
box{<0,0,-0.203200><5.207000,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.864500,0.000000,35.115500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,0.000000,28.257500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<57.785000,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.102500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.055000,-1.535000,46.037500>}
box{<0,0,-0.304800><3.620057,0.035000,0.304800> rotate<0,74.739948,0> translate<58.102500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,0.000000,10.953750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.213750,0.000000,9.017000>}
box{<0,0,-0.304800><3.321784,0.035000,0.304800> rotate<0,35.662648,0> translate<56.515000,0.000000,10.953750> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.832500,0.000000,17.938750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.213750,0.000000,12.573000>}
box{<0,0,-0.635000><5.870402,0.035000,0.635000> rotate<0,66.064615,0> translate<56.832500,0.000000,17.938750> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<57.308750,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,20.637500>}
box{<0,0,-0.635000><2.381250,0.035000,0.635000> rotate<0,0.000000,0> translate<57.308750,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.435000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,0.000000,25.082500>}
box{<0,0,-0.203200><8.963402,0.035000,0.203200> rotate<0,-22.930587,0> translate<51.435000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.991250,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,34.290000>}
box{<0,0,-0.304800><7.488223,0.035000,0.304800> rotate<0,-68.870735,0> translate<56.991250,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.737500,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.007500,0.000000,29.527500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<58.737500,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642500,0.000000,23.177500>}
box{<0,0,-0.203200><9.337955,0.035000,0.203200> rotate<0,-17.817713,0> translate<51.752500,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.642500,-1.535000,36.195000>}
box{<0,0,-0.304800><2.129855,0.035000,0.304800> rotate<0,-63.430762,0> translate<59.690000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.372500,0.000000,17.938750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.960000,0.000000,17.462500>}
box{<0,0,-0.635000><1.657399,0.035000,0.635000> rotate<0,16.698142,0> translate<59.372500,0.000000,17.938750> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.623750,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<60.960000,0.000000,31.432500>}
box{<0,0,-0.508000><4.008749,0.035000,0.508000> rotate<0,33.668025,0> translate<57.623750,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<58.261250,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<60.960000,-1.535000,31.432500>}
box{<0,0,-0.508000><5.200123,0.035000,0.508000> rotate<0,-58.732392,0> translate<58.261250,-1.535000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,0.000000,37.934500>}
box{<0,0,-0.203200><1.768238,0.035000,0.203200> rotate<0,-79.650771,0> translate<60.642500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,0.000000,37.934500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,0.000000,38.925500>}
box{<0,0,-0.203200><0.991000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.960000,0.000000,38.925500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.499500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.960000,0.000000,40.449500>}
box{<0,0,-0.304800><2.554248,0.035000,0.304800> rotate<0,55.121034,0> translate<59.499500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,0.000000,28.257500>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<59.055000,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.007500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.429500,0.000000,29.527500>}
box{<0,0,-0.203200><1.422000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.007500,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<60.960000,0.000000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<61.912500,0.000000,15.875000>}
box{<0,0,-0.635000><1.851327,0.035000,0.635000> rotate<0,59.032347,0> translate<60.960000,0.000000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.864500,0.000000,35.115500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,32.702500>}
box{<0,0,-0.203200><4.141154,0.035000,0.203200> rotate<0,35.637457,0> translate<58.864500,0.000000,35.115500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.499500,0.000000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,44.767500>}
box{<0,0,-0.203200><2.730500,0.035000,0.203200> rotate<0,0.000000,0> translate<59.499500,0.000000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960000,0.000000,40.449500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.261750,0.000000,40.449500>}
box{<0,0,-0.203200><1.301750,0.035000,0.203200> rotate<0,0.000000,0> translate<60.960000,0.000000,40.449500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.213750,0.000000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.395500,0.000000,10.477500>}
box{<0,0,-0.635000><3.500942,0.035000,0.635000> rotate<0,-24.654637,0> translate<59.213750,0.000000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<61.912500,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.547500,0.000000,14.763750>}
box{<0,0,-0.635000><1.279883,0.035000,0.635000> rotate<0,60.251142,0> translate<61.912500,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.395500,0.000000,10.477500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<62.547500,0.000000,14.763750>}
box{<0,0,-0.635000><4.288944,0.035000,0.635000> rotate<0,-87.963209,0> translate<62.395500,0.000000,10.477500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,0.000000,22.225000>}
box{<0,0,-0.203200><11.252229,0.035000,0.203200> rotate<0,-16.388459,0> translate<51.752500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642500,0.000000,23.177500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,0.000000,25.082500>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.642500,0.000000,23.177500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.642500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.713000,0.000000,34.124500>}
box{<0,0,-0.203200><2.928129,0.035000,0.203200> rotate<0,44.997030,0> translate<60.642500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.865000,-1.535000,30.162500>}
box{<0,0,-0.304800><5.990578,0.035000,0.304800> rotate<0,-57.990789,0> translate<59.690000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.055000,-1.535000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.865000,-1.535000,36.830000>}
box{<0,0,-0.304800><9.964645,0.035000,0.304800> rotate<0,67.516110,0> translate<59.055000,-1.535000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.865000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.865000,-1.535000,36.830000>}
box{<0,0,-0.304800><6.667500,0.035000,0.304800> rotate<0,90.000000,0> translate<62.865000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,39.846250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,37.782500>}
box{<0,0,-0.203200><2.063750,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.865000,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.261750,0.000000,40.449500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,39.846250>}
box{<0,0,-0.203200><0.853124,0.035000,0.203200> rotate<0,44.997030,0> translate<62.261750,0.000000,40.449500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.213750,0.000000,9.017000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.406403,0.000000,7.065275>}
box{<0,0,-0.635000><4.624670,0.035000,0.635000> rotate<0,24.960836,0> translate<59.213750,0.000000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.406403,0.000000,7.065275>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.500000,0.000000,4.762500>}
box{<0,0,-0.635000><2.304676,0.035000,0.635000> rotate<0,87.666694,0> translate<63.406403,0.000000,7.065275> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<63.500000,0.000000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<63.500000,0.000000,4.762500>}
box{<0,0,-0.711200><2.381250,0.035000,0.711200> rotate<0,90.000000,0> translate<63.500000,0.000000,4.762500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<59.690000,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.500000,-1.535000,19.050000>}
box{<0,0,-0.635000><4.127500,0.035000,0.635000> rotate<0,22.618372,0> translate<59.690000,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.429500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,31.280500>}
box{<0,0,-0.203200><2.712928,0.035000,0.203200> rotate<0,-40.250444,0> translate<61.429500,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.713000,0.000000,34.124500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,34.124500>}
box{<0,0,-0.203200><0.787000,0.035000,0.203200> rotate<0,0.000000,0> translate<62.713000,0.000000,34.124500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.102500,0.000000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.008000,0.000000,26.987500>}
box{<0,0,-0.203200><5.905500,0.035000,0.203200> rotate<0,0.000000,0> translate<58.102500,0.000000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.135000,0.000000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.135000,0.000000,38.417500>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.135000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.684372,0.000000,42.650166>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.135000,0.000000,40.957500>}
box{<0,0,-0.203200><2.229224,0.035000,0.203200> rotate<0,49.399897,0> translate<62.684372,0.000000,42.650166> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.547500,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.452500,-1.535000,28.257500>}
box{<0,0,-0.304800><3.702654,0.035000,0.304800> rotate<0,-59.032347,0> translate<62.547500,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,0.000000,32.702500>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<62.230000,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.642500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.452500,-1.535000,36.830000>}
box{<0,0,-0.304800><13.259189,0.035000,0.304800> rotate<0,73.295918,0> translate<60.642500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.452500,-1.535000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.452500,-1.535000,36.830000>}
box{<0,0,-0.304800><8.572500,0.035000,0.304800> rotate<0,90.000000,0> translate<64.452500,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.452500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.611250,0.000000,32.702500>}
box{<0,0,-0.152400><0.158750,0.035000,0.152400> rotate<0,0.000000,0> translate<64.452500,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,42.862500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,36.867464,0> translate<62.230000,0.000000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,42.862500>}
box{<0,0,-0.203200><0.952500,0.035000,0.203200> rotate<0,90.000000,0> translate<64.770000,0.000000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.008000,0.000000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.960500,0.000000,27.940000>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,-44.997030,0> translate<64.008000,0.000000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<64.981250,0.000000,13.196250>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<65.239500,0.000000,10.477500>}
box{<0,0,-0.635000><2.730988,0.035000,0.635000> rotate<0,84.568259,0> translate<64.981250,0.000000,13.196250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,22.542500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,25.717500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,90.000000,0> translate<65.405000,0.000000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,40.957500>}
box{<0,0,-0.203200><1.144763,0.035000,0.203200> rotate<0,56.306216,0> translate<64.770000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,40.957500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,90.000000,0> translate<65.405000,0.000000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.315625,0.000000,44.979831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,46.386706>}
box{<0,0,-0.203200><1.779336,0.035000,0.203200> rotate<0,-52.245126,0> translate<64.315625,0.000000,44.979831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,46.386706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,49.530000>}
box{<0,0,-0.203200><3.143294,0.035000,0.203200> rotate<0,90.000000,0> translate<65.405000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.981250,0.000000,15.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.457500,0.000000,16.880000>}
box{<0,0,-0.203200><1.130238,0.035000,0.203200> rotate<0,-65.074515,0> translate<64.981250,0.000000,15.855000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.611250,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,31.750000>}
box{<0,0,-0.152400><1.463603,0.035000,0.152400> rotate<0,40.598615,0> translate<64.611250,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,44.640500>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,90.000000,0> translate<65.722500,0.000000,44.640500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.913000,0.000000,30.162500>}
box{<0,0,-0.203200><5.011675,0.035000,0.203200> rotate<0,-22.339174,0> translate<61.277500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.500000,0.000000,4.762500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<66.040000,0.000000,3.810000>}
box{<0,0,-0.635000><2.712721,0.035000,0.635000> rotate<0,20.554689,0> translate<63.500000,0.000000,4.762500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.547500,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,25.717500>}
box{<0,0,-0.304800><4.939141,0.035000,0.304800> rotate<0,-44.997030,0> translate<62.547500,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.182500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,37.782500>}
box{<0,0,-0.304800><12.090040,0.035000,0.304800> rotate<0,76.323655,0> translate<63.182500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,37.782500>}
box{<0,0,-0.304800><12.065000,0.035000,0.304800> rotate<0,90.000000,0> translate<66.040000,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.457500,0.000000,16.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.357500,0.000000,17.780000>}
box{<0,0,-0.203200><1.272792,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.457500,0.000000,16.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.484500,0.000000,27.432000>}
box{<0,0,-0.203200><2.026038,0.035000,0.203200> rotate<0,-57.800451,0> translate<65.405000,0.000000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.484500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.484500,0.000000,27.432000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<66.484500,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.484500,0.000000,42.735500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.484500,0.000000,44.259500>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<66.484500,0.000000,44.259500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.577500,0.000000,33.752500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.577500,0.000000,32.856500>}
box{<0,0,-0.152400><0.896000,0.035000,0.152400> rotate<0,-90.000000,0> translate<66.577500,0.000000,32.856500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.577500,0.000000,33.752500>}
box{<0,0,-0.203200><5.479376,0.035000,0.203200> rotate<0,47.345112,0> translate<62.865000,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.577500,0.000000,41.372500>}
box{<0,0,-0.152400><1.209153,0.035000,0.152400> rotate<0,44.997030,0> translate<65.722500,0.000000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.577500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.577500,0.000000,41.372500>}
box{<0,0,-0.152400><1.204000,0.035000,0.152400> rotate<0,90.000000,0> translate<66.577500,0.000000,41.372500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,0.000000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,0.000000,23.901000>}
box{<0,0,-0.152400><1.816500,0.035000,0.152400> rotate<0,-90.000000,0> translate<66.675000,0.000000,23.901000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.833750,0.000000,50.958750>}
box{<0,0,-0.203200><2.020558,0.035000,0.203200> rotate<0,-44.997030,0> translate<65.405000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.992500,0.000000,31.750000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<65.722500,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.992500,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,31.985000>}
box{<0,0,-0.152400><0.332340,0.035000,0.152400> rotate<0,-44.997030,0> translate<66.992500,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,31.985000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,32.856500>}
box{<0,0,-0.152400><0.871500,0.035000,0.152400> rotate<0,90.000000,0> translate<67.227500,0.000000,32.856500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,41.992500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,40.168500>}
box{<0,0,-0.152400><1.824000,0.035000,0.152400> rotate<0,-90.000000,0> translate<67.227500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.484500,0.000000,42.735500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.227500,0.000000,41.992500>}
box{<0,0,-0.152400><1.050761,0.035000,0.152400> rotate<0,44.997030,0> translate<66.484500,0.000000,42.735500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,22.542500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,21.272500>}
box{<0,0,-0.203200><2.289525,0.035000,0.203200> rotate<0,33.687844,0> translate<65.405000,0.000000,22.542500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,19.629425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,21.272500>}
box{<0,0,-0.203200><1.643075,0.035000,0.203200> rotate<0,90.000000,0> translate<67.310000,0.000000,21.272500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,0.000000,23.901000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.398500,0.000000,23.971250>}
box{<0,0,-0.152400><0.726903,0.035000,0.152400> rotate<0,-5.545523,0> translate<66.675000,0.000000,23.901000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.484500,0.000000,44.259500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.786250,0.000000,45.561250>}
box{<0,0,-0.152400><1.840953,0.035000,0.152400> rotate<0,-44.997030,0> translate<66.484500,0.000000,44.259500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.437000,0.000000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,30.162500>}
box{<0,0,-0.152400><0.440500,0.035000,0.152400> rotate<0,0.000000,0> translate<67.437000,0.000000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,32.856500>}
box{<0,0,-0.152400><2.694000,0.035000,0.152400> rotate<0,90.000000,0> translate<67.877500,0.000000,32.856500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,38.417500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,-90.000000,0> translate<67.877500,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,41.592500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,90.000000,0> translate<67.877500,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.357500,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.945000,0.000000,17.859375>}
box{<0,0,-0.203200><1.589483,0.035000,0.203200> rotate<0,-2.862216,0> translate<66.357500,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,41.660000>}
box{<0,0,-0.152400><0.095459,0.035000,0.152400> rotate<0,-44.997030,0> translate<67.877500,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.730000,0.000000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,43.282500>}
box{<0,0,-0.152400><0.304056,0.035000,0.152400> rotate<0,44.997030,0> translate<67.730000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,41.660000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,43.282500>}
box{<0,0,-0.152400><1.622500,0.035000,0.152400> rotate<0,90.000000,0> translate<67.945000,0.000000,43.282500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.730000,0.000000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,43.712500>}
box{<0,0,-0.152400><0.304056,0.035000,0.152400> rotate<0,-44.997030,0> translate<67.730000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,43.712500>}
box{<0,0,-0.152400><0.737500,0.035000,0.152400> rotate<0,-90.000000,0> translate<67.945000,0.000000,43.712500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.675000,0.000000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.262500,0.000000,27.622500>}
box{<0,0,-0.152400><2.479754,0.035000,0.152400> rotate<0,-50.191116,0> translate<66.675000,0.000000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.722500,0.000000,44.640500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.389500,0.000000,47.307500>}
box{<0,0,-0.152400><3.771708,0.035000,0.152400> rotate<0,-44.997030,0> translate<65.722500,0.000000,44.640500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.730000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.389500,0.000000,47.307500>}
box{<0,0,-0.304800><2.318285,0.035000,0.304800> rotate<0,73.467532,0> translate<67.730000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.135000,0.000000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.527500,0.000000,34.025000>}
box{<0,0,-0.203200><6.211933,0.035000,0.203200> rotate<0,44.997030,0> translate<64.135000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.527500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.527500,0.000000,34.025000>}
box{<0,0,-0.152400><1.168500,0.035000,0.152400> rotate<0,90.000000,0> translate<68.527500,0.000000,34.025000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.527500,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.527500,0.000000,40.168500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,-90.000000,0> translate<68.527500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.877500,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.527500,0.000000,41.592500>}
box{<0,0,-0.152400><0.650000,0.035000,0.152400> rotate<0,0.000000,0> translate<67.877500,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.945000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.897500,0.000000,44.767500>}
box{<0,0,-0.152400><1.004023,0.035000,0.152400> rotate<0,-18.433732,0> translate<67.945000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.900000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.900000,0.000000,21.892500>}
box{<0,0,-0.203200><4.142500,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.900000,0.000000,21.892500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.177500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.177500,0.000000,34.887500>}
box{<0,0,-0.152400><2.031000,0.035000,0.152400> rotate<0,90.000000,0> translate<69.177500,0.000000,34.887500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.405000,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.215000,0.000000,35.242500>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,44.997030,0> translate<65.405000,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.177500,0.000000,34.887500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.215000,0.000000,35.242500>}
box{<0,0,-0.152400><0.356975,0.035000,0.152400> rotate<0,-83.964450,0> translate<69.177500,0.000000,34.887500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.215000,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.215000,0.000000,38.417500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,-90.000000,0> translate<69.215000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.177500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.215000,0.000000,40.168500>}
box{<0,0,-0.152400><0.037500,0.035000,0.152400> rotate<0,0.000000,0> translate<69.177500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.786250,0.000000,45.561250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.430000,0.000000,45.720000>}
box{<0,0,-0.152400><1.651398,0.035000,0.152400> rotate<0,-5.516036,0> translate<67.786250,0.000000,45.561250> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<63.500000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,-1.535000,19.050000>}
box{<0,0,-0.635000><6.032500,0.035000,0.635000> rotate<0,0.000000,0> translate<63.500000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.262500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.827500,0.000000,29.822500>}
box{<0,0,-0.152400><2.699856,0.035000,0.152400> rotate<0,-54.569735,0> translate<68.262500,0.000000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.827500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.827500,0.000000,29.822500>}
box{<0,0,-0.152400><3.034000,0.035000,0.152400> rotate<0,-90.000000,0> translate<69.827500,0.000000,29.822500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.827500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,40.191000>}
box{<0,0,-0.152400><0.031820,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.827500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.430000,0.000000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,42.442500>}
box{<0,0,-0.152400><1.135529,0.035000,0.152400> rotate<0,68.287781,0> translate<69.430000,0.000000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,40.191000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,42.442500>}
box{<0,0,-0.152400><2.251500,0.035000,0.152400> rotate<0,90.000000,0> translate<69.850000,0.000000,42.442500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<67.616250,0.000000,13.196250>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<70.167500,0.000000,8.585000>}
box{<0,0,-0.838200><5.269962,0.035000,0.838200> rotate<0,61.041687,0> translate<67.616250,0.000000,13.196250> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.167500,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.167500,-1.535000,8.585000>}
box{<0,0,-0.635000><11.100000,0.035000,0.635000> rotate<0,-90.000000,0> translate<70.167500,-1.535000,8.585000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.167500,-1.535000,19.685000>}
box{<0,0,-0.635000><0.898026,0.035000,0.635000> rotate<0,-44.997030,0> translate<69.532500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.167500,-1.535000,20.625000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<70.167500,-1.535000,19.685000>}
box{<0,0,-0.635000><0.940000,0.035000,0.635000> rotate<0,-90.000000,0> translate<70.167500,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.900000,0.000000,21.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.167500,0.000000,20.625000>}
box{<0,0,-0.203200><1.792516,0.035000,0.203200> rotate<0,44.997030,0> translate<68.900000,0.000000,21.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,19.629425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.270675,0.000000,17.462500>}
box{<0,0,-0.203200><3.668945,0.035000,0.203200> rotate<0,36.198096,0> translate<67.310000,0.000000,19.629425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.477500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.477500,0.000000,31.425000>}
box{<0,0,-0.152400><1.431500,0.035000,0.152400> rotate<0,-90.000000,0> translate<70.477500,0.000000,31.425000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.945000,0.000000,17.859375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.485000,0.000000,16.192500>}
box{<0,0,-0.203200><3.038103,0.035000,0.203200> rotate<0,33.272692,0> translate<67.945000,0.000000,17.859375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.900000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,29.527500>}
box{<0,0,-0.152400><3.835333,0.035000,0.152400> rotate<0,-65.585716,0> translate<68.900000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.477500,0.000000,31.425000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,29.527500>}
box{<0,0,-0.152400><1.897515,0.035000,0.152400> rotate<0,89.767611,0> translate<70.477500,0.000000,31.425000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.477500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,32.856500>}
box{<0,0,-0.152400><0.007500,0.035000,0.152400> rotate<0,0.000000,0> translate<70.477500,0.000000,32.856500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.877500,0.000000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.485000,0.000000,35.560000>}
box{<0,0,-0.203200><3.868380,0.035000,0.203200> rotate<0,47.616064,0> translate<67.877500,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,35.560000>}
box{<0,0,-0.152400><2.703500,0.035000,0.152400> rotate<0,90.000000,0> translate<70.485000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.477500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,40.176000>}
box{<0,0,-0.152400><0.010607,0.035000,0.152400> rotate<0,-44.997030,0> translate<70.477500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,40.176000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,43.815000>}
box{<0,0,-0.152400><3.639000,0.035000,0.152400> rotate<0,90.000000,0> translate<70.485000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.167500,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.643750,-1.535000,19.685000>}
box{<0,0,-0.203200><0.476250,0.035000,0.203200> rotate<0,0.000000,0> translate<70.167500,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.396500,0.000000,23.971250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.800000,0.000000,26.035000>}
box{<0,0,-0.304800><2.102826,0.035000,0.304800> rotate<0,-78.932000,0> translate<70.396500,0.000000,23.971250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.800000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,28.260000>}
box{<0,0,-0.152400><2.247893,0.035000,0.152400> rotate<0,-81.810429,0> translate<70.800000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,28.260000>}
box{<0,0,-0.152400><4.596500,0.035000,0.152400> rotate<0,-90.000000,0> translate<71.120000,0.000000,28.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.215000,0.000000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.120000,0.000000,38.417500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<69.215000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,38.417500>}
box{<0,0,-0.152400><5.561000,0.035000,0.152400> rotate<0,90.000000,0> translate<71.120000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,40.176000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,42.227500>}
box{<0,0,-0.152400><2.051500,0.035000,0.152400> rotate<0,90.000000,0> translate<71.120000,0.000000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.897500,0.000000,44.767500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,45.085000>}
box{<0,0,-0.152400><2.245064,0.035000,0.152400> rotate<0,-8.129566,0> translate<68.897500,0.000000,44.767500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.430000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,47.410000>}
box{<0,0,-0.152400><2.390021,0.035000,0.152400> rotate<0,-44.997030,0> translate<69.430000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<69.430000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<71.120000,0.000000,49.110000>}
box{<0,0,-0.406400><1.741407,0.035000,0.406400> rotate<0,13.955523,0> translate<69.430000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.127500,0.000000,32.856500>}
box{<0,0,-0.152400><0.007500,0.035000,0.152400> rotate<0,0.000000,0> translate<71.120000,0.000000,32.856500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.127500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.127500,0.000000,34.607500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,90.000000,0> translate<71.127500,0.000000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,40.176000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.127500,0.000000,40.168500>}
box{<0,0,-0.152400><0.010607,0.035000,0.152400> rotate<0,44.997030,0> translate<71.120000,0.000000,40.176000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.485000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.208500,0.000000,43.815000>}
box{<0,0,-0.152400><0.723500,0.035000,0.152400> rotate<0,0.000000,0> translate<70.485000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,49.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.437500,0.000000,48.895000>}
box{<0,0,-0.152400><0.383447,0.035000,0.152400> rotate<0,34.102246,0> translate<71.120000,0.000000,49.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.120000,0.000000,49.110000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.540000,0.000000,48.895000>}
box{<0,0,-0.203200><0.471832,0.035000,0.203200> rotate<0,27.106334,0> translate<71.120000,0.000000,49.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.540000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.540000,0.000000,49.530000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<71.540000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,0.000000,41.592500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,90.000000,0> translate<71.755000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.777500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.777500,0.000000,27.861250>}
box{<0,0,-0.152400><4.995250,0.035000,0.152400> rotate<0,-90.000000,0> translate<71.777500,0.000000,27.861250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.777500,0.000000,40.168500>}
box{<0,0,-0.152400><0.022500,0.035000,0.152400> rotate<0,0.000000,0> translate<71.755000,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.072500,0.000000,42.545000>}
box{<0,0,-0.152400><1.004023,0.035000,0.152400> rotate<0,-18.433732,0> translate<71.120000,0.000000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,28.061250>}
box{<0,0,-0.152400><4.795250,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.427500,0.000000,28.061250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.120000,0.000000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.427500,0.000000,38.417500>}
box{<0,0,-0.203200><1.307500,0.035000,0.203200> rotate<0,0.000000,0> translate<71.120000,0.000000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,40.168500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,90.000000,0> translate<72.427500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,40.168500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.427500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.755000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,41.592500>}
box{<0,0,-0.152400><0.672500,0.035000,0.152400> rotate<0,0.000000,0> translate<71.755000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,41.630000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,41.592500>}
box{<0,0,-0.152400><0.037500,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.427500,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.777500,0.000000,27.861250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.492500,0.000000,25.241250>}
box{<0,0,-0.152400><2.715810,0.035000,0.152400> rotate<0,74.730697,0> translate<71.777500,0.000000,27.861250> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<66.040000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<72.707500,0.000000,3.810000>}
box{<0,0,-0.635000><6.667500,0.035000,0.635000> rotate<0,0.000000,0> translate<66.040000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.072500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.707500,0.000000,43.180000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.072500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.120000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.707500,0.000000,45.085000>}
box{<0,0,-0.152400><1.587500,0.035000,0.152400> rotate<0,0.000000,0> translate<71.120000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.707500,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.707500,0.000000,45.085000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<72.707500,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.270675,0.000000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.866250,0.000000,17.462500>}
box{<0,0,-0.203200><2.595575,0.035000,0.203200> rotate<0,0.000000,0> translate<70.270675,0.000000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,28.522500>}
box{<0,0,-0.152400><4.334000,0.035000,0.152400> rotate<0,-90.000000,0> translate<73.077500,0.000000,28.522500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,41.222500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,40.168500>}
box{<0,0,-0.152400><1.054000,0.035000,0.152400> rotate<0,-90.000000,0> translate<73.077500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.120000,0.000000,47.410000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<73.215500,0.000000,47.307500>}
box{<0,0,-0.508000><2.098005,0.035000,0.508000> rotate<0,2.800168,0> translate<71.120000,0.000000,47.410000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<67.616250,0.000000,15.855000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<73.445000,0.000000,13.017500>}
box{<0,0,-0.406400><6.482726,0.035000,0.406400> rotate<0,25.955618,0> translate<67.616250,0.000000,15.855000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.445000,0.000000,13.017500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.445000,0.000000,14.605000>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,90.000000,0> translate<73.445000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.485000,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.445000,0.000000,16.192500>}
box{<0,0,-0.203200><2.960000,0.035000,0.203200> rotate<0,0.000000,0> translate<70.485000,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,28.061250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.501250,0.000000,26.987500>}
box{<0,0,-0.152400><1.518512,0.035000,0.152400> rotate<0,44.997030,0> translate<72.427500,0.000000,28.061250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,28.522500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.660000,0.000000,27.940000>}
box{<0,0,-0.152400><0.823779,0.035000,0.152400> rotate<0,44.997030,0> translate<73.077500,0.000000,28.522500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.727500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.727500,0.000000,41.025000>}
box{<0,0,-0.152400><0.856500,0.035000,0.152400> rotate<0,90.000000,0> translate<73.727500,0.000000,41.025000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<70.396500,0.000000,23.971250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.977500,0.000000,23.495000>}
box{<0,0,-0.304800><3.612530,0.035000,0.304800> rotate<0,7.575016,0> translate<70.396500,0.000000,23.971250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<73.977500,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<74.192500,0.000000,25.241250>}
box{<0,0,-0.406400><1.759436,0.035000,0.406400> rotate<0,-82.975536,0> translate<73.977500,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.427500,0.000000,41.630000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.206500,0.000000,43.409000>}
box{<0,0,-0.152400><2.515886,0.035000,0.152400> rotate<0,-44.997030,0> translate<72.427500,0.000000,41.630000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.206500,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.206500,0.000000,43.409000>}
box{<0,0,-0.152400><0.406000,0.035000,0.152400> rotate<0,-90.000000,0> translate<74.206500,0.000000,43.409000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<72.707500,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<74.295000,0.000000,5.715000>}
box{<0,0,-0.635000><2.479754,0.035000,0.635000> rotate<0,-50.191116,0> translate<72.707500,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<73.977500,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<74.295000,0.000000,22.860000>}
box{<0,0,-0.406400><0.709952,0.035000,0.406400> rotate<0,63.430762,0> translate<73.977500,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.295000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<74.295000,-1.535000,22.860000>}
box{<0,0,-0.508000><17.145000,0.035000,0.508000> rotate<0,90.000000,0> translate<74.295000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.540000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.295000,0.000000,49.530000>}
box{<0,0,-0.203200><2.755000,0.035000,0.203200> rotate<0,0.000000,0> translate<71.540000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.136250,0.000000,31.012500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,30.777500>}
box{<0,0,-0.152400><0.336789,0.035000,0.152400> rotate<0,44.245210,0> translate<74.136250,0.000000,31.012500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,30.777500>}
box{<0,0,-0.152400><2.079000,0.035000,0.152400> rotate<0,-90.000000,0> translate<74.377500,0.000000,30.777500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,38.652500>}
box{<0,0,-0.152400><1.516000,0.035000,0.152400> rotate<0,-90.000000,0> translate<74.377500,0.000000,38.652500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.077500,0.000000,41.222500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.400000,0.000000,42.545000>}
box{<0,0,-0.152400><1.870297,0.035000,0.152400> rotate<0,-44.997030,0> translate<73.077500,0.000000,41.222500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.727500,0.000000,41.025000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.612500,0.000000,41.751250>}
box{<0,0,-0.152400><1.144842,0.035000,0.152400> rotate<0,-39.370439,0> translate<73.727500,0.000000,41.025000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.027500,0.000000,32.856500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.027500,0.000000,31.867500>}
box{<0,0,-0.152400><0.989000,0.035000,0.152400> rotate<0,-90.000000,0> translate<75.027500,0.000000,31.867500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.127500,0.000000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.247500,0.000000,34.607500>}
box{<0,0,-0.152400><4.120000,0.035000,0.152400> rotate<0,0.000000,0> translate<71.127500,0.000000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.501250,0.000000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.462500,0.000000,26.987500>}
box{<0,0,-0.152400><1.961250,0.035000,0.152400> rotate<0,0.000000,0> translate<73.501250,0.000000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.145000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,14.605000>}
box{<0,0,-0.203200><0.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<75.145000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.192500,0.000000,25.241250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.565000,0.000000,25.185000>}
box{<0,0,-0.304800><1.373652,0.035000,0.304800> rotate<0,2.346719,0> translate<74.192500,0.000000,25.241250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.462500,0.000000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.565000,0.000000,26.885000>}
box{<0,0,-0.152400><0.144957,0.035000,0.152400> rotate<0,44.997030,0> translate<75.462500,0.000000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.612500,0.000000,41.751250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.667500,0.000000,41.751250>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,0.000000,0> translate<74.612500,0.000000,41.751250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.145000,0.000000,13.017500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,13.017500>}
box{<0,0,-0.203200><0.578750,0.035000,0.203200> rotate<0,0.000000,0> translate<75.145000,0.000000,13.017500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.136250,0.000000,29.312500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<75.723750,0.000000,28.995000>}
box{<0,0,-0.304800><1.618939,0.035000,0.304800> rotate<0,11.309186,0> translate<74.136250,0.000000,29.312500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.723750,0.000000,30.695000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.780000,0.000000,30.797500>}
box{<0,0,-0.152400><0.116920,0.035000,0.152400> rotate<0,-61.238837,0> translate<75.723750,0.000000,30.695000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.780000,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.780000,0.000000,30.797500>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<75.780000,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.027500,0.000000,31.867500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.780000,0.000000,31.432500>}
box{<0,0,-0.152400><0.869184,0.035000,0.152400> rotate<0,30.029069,0> translate<75.027500,0.000000,31.867500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.833750,0.000000,50.958750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.938750,0.000000,50.958750>}
box{<0,0,-0.203200><9.105000,0.035000,0.203200> rotate<0,0.000000,0> translate<66.833750,0.000000,50.958750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.377500,0.000000,38.652500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.302500,0.000000,36.727500>}
box{<0,0,-0.152400><2.722361,0.035000,0.152400> rotate<0,44.997030,0> translate<74.377500,0.000000,38.652500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.660000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.517500,0.000000,27.940000>}
box{<0,0,-0.152400><2.857500,0.035000,0.152400> rotate<0,0.000000,0> translate<73.660000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.667500,0.000000,41.751250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,40.957500>}
box{<0,0,-0.203200><1.162987,0.035000,0.203200> rotate<0,43.037232,0> translate<75.667500,0.000000,41.751250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.295000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,48.838750>}
box{<0,0,-0.203200><2.327516,0.035000,0.203200> rotate<0,17.275788,0> translate<74.295000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.938750,0.000000,50.958750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,50.538750>}
box{<0,0,-0.203200><0.715088,0.035000,0.203200> rotate<0,35.966091,0> translate<75.938750,0.000000,50.958750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.866250,0.000000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.835000,0.000000,21.590000>}
box{<0,0,-0.203200><5.726014,0.035000,0.203200> rotate<0,-46.120259,0> translate<72.866250,0.000000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,21.590000>}
box{<0,0,-0.152400><6.032500,0.035000,0.152400> rotate<0,-90.000000,0> translate<76.835000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.517500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,27.622500>}
box{<0,0,-0.152400><0.449013,0.035000,0.152400> rotate<0,44.997030,0> translate<76.517500,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.723750,0.000000,28.995000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,29.947500>}
box{<0,0,-0.152400><1.463603,0.035000,0.152400> rotate<0,-40.598615,0> translate<75.723750,0.000000,28.995000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,29.947500>}
box{<0,0,-0.152400><3.072500,0.035000,0.152400> rotate<0,-90.000000,0> translate<76.835000,0.000000,29.947500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.247500,0.000000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.835000,0.000000,33.020000>}
box{<0,0,-0.152400><2.245064,0.035000,0.152400> rotate<0,44.997030,0> translate<75.247500,0.000000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.206500,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.835000,0.000000,44.002500>}
box{<0,0,-0.203200><2.635179,0.035000,0.203200> rotate<0,-4.079926,0> translate<74.206500,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.707500,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.835000,0.000000,46.802500>}
box{<0,0,-0.203200><4.470577,0.035000,0.203200> rotate<0,-22.591263,0> translate<72.707500,0.000000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.517500,0.000000,48.838750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.835000,0.000000,46.802500>}
box{<0,0,-0.406400><2.060854,0.035000,0.406400> rotate<0,81.132227,0> translate<76.517500,0.000000,48.838750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,50.538750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,50.482500>}
box{<0,0,-0.203200><0.954159,0.035000,0.203200> rotate<0,3.379461,0> translate<76.517500,0.000000,50.538750> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<70.008750,0.000000,8.572500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<77.787500,0.000000,8.572500>}
box{<0,0,-0.838200><7.778750,0.035000,0.838200> rotate<0,0.000000,0> translate<70.008750,0.000000,8.572500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.145000,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.787500,0.000000,18.835000>}
box{<0,0,-0.203200><3.737059,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.145000,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.302500,0.000000,36.727500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.787500,0.000000,35.242500>}
box{<0,0,-0.203200><2.100107,0.035000,0.203200> rotate<0,44.997030,0> translate<76.302500,0.000000,36.727500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.787500,0.000000,18.835000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.787500,0.000000,35.242500>}
box{<0,0,-0.203200><16.407500,0.035000,0.203200> rotate<0,90.000000,0> translate<77.787500,0.000000,35.242500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.400000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.422500,0.000000,42.545000>}
box{<0,0,-0.203200><4.022500,0.035000,0.203200> rotate<0,0.000000,0> translate<74.400000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.565000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,17.780000>}
box{<0,0,-0.203200><4.490128,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.565000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.027500,0.000000,40.168500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<78.740000,0.000000,36.512500>}
box{<0,0,-0.152400><5.210469,0.035000,0.152400> rotate<0,44.557737,0> translate<75.027500,0.000000,40.168500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,36.512500>}
box{<0,0,-0.203200><18.732500,0.035000,0.203200> rotate<0,90.000000,0> translate<78.740000,0.000000,36.512500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.422500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,42.862500>}
box{<0,0,-0.203200><0.449013,0.035000,0.203200> rotate<0,-44.997030,0> translate<78.422500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.835000,0.000000,46.802500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,46.196250>}
box{<0,0,-0.203200><1.999141,0.035000,0.203200> rotate<0,17.652063,0> translate<76.835000,0.000000,46.802500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,46.196250>}
box{<0,0,-0.203200><3.333750,0.035000,0.203200> rotate<0,90.000000,0> translate<78.740000,0.000000,46.196250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,13.017500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,16.986250>}
box{<0,0,-0.203200><5.612660,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.723750,0.000000,13.017500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,40.957500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<76.517500,0.000000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,16.986250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,40.957500>}
box{<0,0,-0.203200><23.971250,0.035000,0.203200> rotate<0,90.000000,0> translate<79.692500,0.000000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,50.482500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,48.260000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<77.470000,0.000000,50.482500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.692500,0.000000,48.260000>}
box{<0,0,-0.203200><7.302500,0.035000,0.203200> rotate<0,90.000000,0> translate<79.692500,0.000000,48.260000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.060700,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.772506,0.000000,3.291125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.997156,0> translate<3.060700,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.772506,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.772506,0.000000,1.155700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.772506,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.060700,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.484316,0.000000,1.155700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<3.060700,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.399497,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.111303,0.000000,3.291125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.997156,0> translate<5.399497,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.111303,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.111303,0.000000,1.155700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.111303,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.399497,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.823113,0.000000,1.155700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<5.399497,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.738294,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.161909,0.000000,3.291125>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<7.738294,0.000000,3.291125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.161909,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.161909,0.000000,2.935219>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.161909,0.000000,2.935219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.161909,0.000000,2.935219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.738294,0.000000,1.511603>}
box{<0,0,-0.203200><2.013297,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.738294,0.000000,1.511603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.738294,0.000000,1.511603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.738294,0.000000,1.155700>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.738294,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.077091,0.000000,2.935219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.432994,0.000000,3.291125>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.997282,0> translate<10.077091,0.000000,2.935219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.432994,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,3.291125>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<10.432994,0.000000,3.291125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,2.935219>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.997282,0> translate<11.144803,0.000000,3.291125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,2.935219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,2.579316>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.500706,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,2.223413>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.144803,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,2.223413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788897,0.000000,2.223413>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<10.788897,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,2.223413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,1.867506>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.997282,0> translate<11.144803,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,1.867506>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,1.511603>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.500706,0.000000,1.511603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.500706,0.000000,1.511603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,1.155700>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.144803,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.144803,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.432994,0.000000,1.155700>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<10.432994,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.432994,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.077091,0.000000,1.511603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<10.077091,0.000000,1.511603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.415888,0.000000,2.223413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.839503,0.000000,2.223413>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<12.415888,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.754684,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.466491,0.000000,3.291125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.997156,0> translate<14.754684,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.466491,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.466491,0.000000,1.155700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.466491,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.754684,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.178300,0.000000,1.155700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<14.754684,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517097,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.093481,0.000000,3.291125>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<17.093481,0.000000,3.291125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.093481,0.000000,3.291125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.093481,0.000000,2.223413>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.093481,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.093481,0.000000,2.223413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.805288,0.000000,2.579316>}
box{<0,0,-0.203200><0.795824,0.035000,0.203200> rotate<0,-26.563298,0> translate<17.093481,0.000000,2.223413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.805288,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161194,0.000000,2.579316>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<17.805288,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161194,0.000000,2.579316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517097,0.000000,2.223413>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<18.161194,0.000000,2.579316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517097,0.000000,2.223413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517097,0.000000,1.511603>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.517097,0.000000,1.511603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.517097,0.000000,1.511603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161194,0.000000,1.155700>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.161194,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161194,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.449384,0.000000,1.155700>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<17.449384,0.000000,1.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.449384,0.000000,1.155700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.093481,0.000000,1.511603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<17.093481,0.000000,1.511603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,25.045006>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.996904,0> translate<68.619316,-1.535000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,25.045006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,25.045006>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<67.195700,-1.535000,25.045006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,25.756816>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<67.195700,-1.535000,25.756816> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,26.671997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,27.383803>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.996904,0> translate<68.619316,-1.535000,26.671997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,27.383803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,27.383803>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<67.195700,-1.535000,27.383803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,26.671997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,28.095613>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<67.195700,-1.535000,28.095613> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,29.010794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,30.434409>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<69.331125,-1.535000,30.434409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,30.434409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.975219,-1.535000,30.434409>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<68.975219,-1.535000,30.434409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.975219,-1.535000,30.434409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,29.010794>}
box{<0,0,-0.203200><2.013297,0.035000,0.203200> rotate<0,-44.997030,0> translate<67.551603,-1.535000,29.010794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,29.010794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,29.010794>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<67.195700,-1.535000,29.010794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.975219,-1.535000,31.349591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,31.705494>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<68.975219,-1.535000,31.349591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,31.705494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,32.417303>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<69.331125,-1.535000,32.417303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,32.417303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.975219,-1.535000,32.773206>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<68.975219,-1.535000,32.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.975219,-1.535000,32.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,32.773206>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<68.619316,-1.535000,32.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,32.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,32.417303>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<68.263413,-1.535000,32.417303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,32.417303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,32.061397>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,-90.000000,0> translate<68.263413,-1.535000,32.061397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,32.417303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.907506,-1.535000,32.773206>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<67.907506,-1.535000,32.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.907506,-1.535000,32.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,32.773206>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<67.551603,-1.535000,32.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,32.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,32.417303>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<67.195700,-1.535000,32.417303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,32.417303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,31.705494>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<67.195700,-1.535000,31.705494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,31.705494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,31.349591>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<67.195700,-1.535000,31.705494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,33.688388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,35.112003>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<68.263413,-1.535000,35.112003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,36.027184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,36.738991>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.996904,0> translate<68.619316,-1.535000,36.027184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,36.738991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,36.738991>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<67.195700,-1.535000,36.738991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,36.027184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,37.450800>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<67.195700,-1.535000,37.450800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,39.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,38.365981>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,-90.000000,0> translate<69.331125,-1.535000,38.365981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.331125,-1.535000,38.365981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,38.365981>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,0.000000,0> translate<68.263413,-1.535000,38.365981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,38.365981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,39.077787>}
box{<0,0,-0.203200><0.795824,0.035000,0.203200> rotate<0,-63.430762,0> translate<68.263413,-1.535000,38.365981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,39.077787>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,39.433694>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,90.000000,0> translate<68.619316,-1.535000,39.433694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.619316,-1.535000,39.433694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,39.789597>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<68.263413,-1.535000,39.789597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.263413,-1.535000,39.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,39.789597>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<67.551603,-1.535000,39.789597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,39.789597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,39.433694>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<67.195700,-1.535000,39.433694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,39.433694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,38.721884>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<67.195700,-1.535000,38.721884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.195700,-1.535000,38.721884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.551603,-1.535000,38.365981>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<67.195700,-1.535000,38.721884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.920647,-1.535000,26.396950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.920647,-1.535000,28.532375>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,90.000000,0> translate<18.920647,-1.535000,28.532375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.920647,-1.535000,27.464663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.497031,-1.535000,27.464663>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<17.497031,-1.535000,27.464663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.497031,-1.535000,28.532375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.497031,-1.535000,26.396950>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.497031,-1.535000,26.396950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.581850,-1.535000,28.532375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.581850,-1.535000,27.108756>}
box{<0,0,-0.203200><1.423619,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.581850,-1.535000,27.108756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.581850,-1.535000,27.108756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.870044,-1.535000,26.396950>}
box{<0,0,-0.203200><1.006646,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.870044,-1.535000,26.396950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.870044,-1.535000,26.396950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.158234,-1.535000,27.108756>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.996904,0> translate<15.158234,-1.535000,27.108756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.158234,-1.535000,27.108756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.158234,-1.535000,28.532375>}
box{<0,0,-0.203200><1.423619,0.035000,0.203200> rotate<0,90.000000,0> translate<15.158234,-1.535000,28.532375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,30.510819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,30.163391>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<78.483250,-1.535000,30.510819> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,30.163391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,29.468528>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<78.830681,-1.535000,29.468528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,29.468528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,29.121100>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<78.483250,-1.535000,29.121100> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,29.121100>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,29.121100>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,0.000000,0> translate<78.135819,-1.535000,29.121100> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,29.121100>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,29.468528>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<77.788391,-1.535000,29.468528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,29.468528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,30.163391>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,90.000000,0> translate<77.788391,-1.535000,30.163391> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,30.163391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.440959,-1.535000,30.510819>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<77.440959,-1.535000,30.510819> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.440959,-1.535000,30.510819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,30.510819>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,30.510819> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,30.510819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,30.163391>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<76.746100,-1.535000,30.163391> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,30.163391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,29.468528>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<76.746100,-1.535000,29.468528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,29.468528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,29.121100>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<76.746100,-1.535000,29.468528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,32.154756>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,32.154756>}
box{<0,0,-0.228600><2.084581,0.035000,0.228600> rotate<0,0.000000,0> translate<76.746100,-1.535000,32.154756> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,31.459897>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,32.849616>}
box{<0,0,-0.228600><1.389719,0.035000,0.228600> rotate<0,90.000000,0> translate<78.830681,-1.535000,32.849616> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,33.798694>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,33.798694>}
box{<0,0,-0.228600><2.084581,0.035000,0.228600> rotate<0,0.000000,0> translate<76.746100,-1.535000,33.798694> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.440959,-1.535000,33.798694>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,35.188412>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,-44.996966,0> translate<77.440959,-1.535000,33.798694> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,34.146122>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,35.188412>}
box{<0,0,-0.228600><1.474022,0.035000,0.228600> rotate<0,44.997030,0> translate<76.746100,-1.535000,35.188412> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,37.527209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,36.137491>}
box{<0,0,-0.228600><1.389719,0.035000,0.228600> rotate<0,-90.000000,0> translate<78.830681,-1.535000,36.137491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,36.137491>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,36.137491>}
box{<0,0,-0.228600><1.042291,0.035000,0.228600> rotate<0,0.000000,0> translate<77.788391,-1.535000,36.137491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,36.137491>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,36.832350>}
box{<0,0,-0.228600><0.776876,0.035000,0.228600> rotate<0,-63.430865,0> translate<77.788391,-1.535000,36.137491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,36.832350>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,37.179781>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,90.000000,0> translate<78.135819,-1.535000,37.179781> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.135819,-1.535000,37.179781>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,37.527209>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<77.788391,-1.535000,37.527209> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.788391,-1.535000,37.527209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,37.527209>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,37.527209> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,37.527209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,37.179781>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<76.746100,-1.535000,37.179781> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,37.179781>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,36.484919>}
box{<0,0,-0.228600><0.694863,0.035000,0.228600> rotate<0,-90.000000,0> translate<76.746100,-1.535000,36.484919> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,36.484919>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,36.137491>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<76.746100,-1.535000,36.484919> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,38.476288>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,38.476288>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,38.476288> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,38.476288>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,38.823716>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<78.483250,-1.535000,38.476288> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,38.823716>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,39.518578>}
box{<0,0,-0.228600><0.694863,0.035000,0.228600> rotate<0,90.000000,0> translate<78.830681,-1.535000,39.518578> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,39.518578>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,39.866006>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<78.483250,-1.535000,39.866006> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,39.866006>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,39.866006>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,39.866006> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,39.866006>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,39.518578>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<76.746100,-1.535000,39.518578> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,39.518578>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,38.823716>}
box{<0,0,-0.228600><0.694863,0.035000,0.228600> rotate<0,-90.000000,0> translate<76.746100,-1.535000,38.823716> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,38.823716>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,38.476288>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<76.746100,-1.535000,38.823716> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,38.476288>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,39.866006>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,-44.996966,0> translate<77.093528,-1.535000,38.476288> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,40.815084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,40.815084>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,40.815084> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,40.815084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,41.162513>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<78.483250,-1.535000,40.815084> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,41.162513>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,41.857375>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,90.000000,0> translate<78.830681,-1.535000,41.857375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.830681,-1.535000,41.857375>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,42.204803>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<78.483250,-1.535000,42.204803> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,42.204803>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,42.204803>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<77.093528,-1.535000,42.204803> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,42.204803>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,41.857375>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<76.746100,-1.535000,41.857375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,41.857375>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,41.162513>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<76.746100,-1.535000,41.162513> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<76.746100,-1.535000,41.162513>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,40.815084>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<76.746100,-1.535000,41.162513> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<77.093528,-1.535000,40.815084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<78.483250,-1.535000,42.204803>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,-44.996966,0> translate<77.093528,-1.535000,40.815084> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,29.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,29.095700>}
box{<0,0,-0.203200><1.779522,0.035000,0.203200> rotate<0,0.000000,0> translate<70.726603,-1.535000,29.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,29.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,29.451603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<70.370700,-1.535000,29.451603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,29.451603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,30.163412>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<70.370700,-1.535000,30.163412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,30.163412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,30.519316>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.370700,-1.535000,30.163412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,30.519316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,30.519316>}
box{<0,0,-0.203200><1.779522,0.035000,0.203200> rotate<0,0.000000,0> translate<70.726603,-1.535000,30.519316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,32.858113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,32.502209>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<72.150219,-1.535000,32.858113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,32.502209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,31.790400>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<72.506125,-1.535000,31.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,31.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,31.434497>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<72.150219,-1.535000,31.434497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,31.434497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,31.434497>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<71.794316,-1.535000,31.434497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,31.434497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,31.790400>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<71.438412,-1.535000,31.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,31.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,32.502209>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<71.438412,-1.535000,32.502209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,32.502209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,32.858113>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<71.082506,-1.535000,32.858113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,32.858113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,32.858113>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<70.726603,-1.535000,32.858113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,32.858113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,32.502209>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.370700,-1.535000,32.502209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,32.502209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,31.790400>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<70.370700,-1.535000,31.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,31.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,31.434497>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<70.370700,-1.535000,31.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,33.773294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,33.773294>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<70.370700,-1.535000,33.773294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,33.773294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,34.841006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<72.506125,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,34.841006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,35.196909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<72.150219,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,35.196909>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<71.794316,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,34.841006>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<71.438412,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,34.841006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,35.196909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<71.082506,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,35.196909>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<70.726603,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,34.841006>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.370700,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,34.841006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,33.773294>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<70.370700,-1.535000,33.773294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,33.773294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,34.841006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<71.438412,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,36.112091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,37.535706>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<71.438412,-1.535000,37.535706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,39.874503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,39.518600>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<72.150219,-1.535000,39.874503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,39.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,38.806791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<72.506125,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,38.806791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,38.450888>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<72.150219,-1.535000,38.450888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,38.450888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,38.450888>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<71.794316,-1.535000,38.450888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.794316,-1.535000,38.450888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,38.806791>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<71.438412,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,38.806791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,39.518600>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<71.438412,-1.535000,39.518600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,39.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,39.874503>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<71.082506,-1.535000,39.874503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,39.874503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,39.874503>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<70.726603,-1.535000,39.874503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,39.874503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,39.518600>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.370700,-1.535000,39.518600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,39.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,38.806791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<70.370700,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,38.806791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.726603,-1.535000,38.450888>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<70.370700,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.370700,-1.535000,40.789684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,40.789684>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<70.370700,-1.535000,40.789684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,40.789684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,41.857397>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<72.506125,-1.535000,41.857397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.506125,-1.535000,41.857397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,42.213300>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<72.150219,-1.535000,42.213300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.150219,-1.535000,42.213300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,42.213300>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<71.438412,-1.535000,42.213300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.438412,-1.535000,42.213300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,41.857397>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<71.082506,-1.535000,41.857397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,41.857397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.082506,-1.535000,40.789684>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<71.082506,-1.535000,40.789684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,29.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,29.095700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,29.095700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,29.095700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,30.519316>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<74.613413,-1.535000,30.519316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,30.519316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,30.519316>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,30.519316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,31.434497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,31.434497>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,31.434497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,31.434497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,32.146303>}
box{<0,0,-0.203200><1.006646,0.035000,0.203200> rotate<0,-44.997030,0> translate<73.545700,-1.535000,31.434497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,32.146303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,32.858113>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.997156,0> translate<73.545700,-1.535000,32.858113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,32.858113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,32.858113>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,32.858113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,33.773294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,33.773294>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,33.773294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,33.773294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,34.841006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<75.681125,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,34.841006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,35.196909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<75.325219,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,35.196909>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<74.613413,-1.535000,35.196909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,35.196909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,34.841006>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<74.257506,-1.535000,34.841006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,34.841006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,33.773294>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<74.257506,-1.535000,33.773294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,36.112091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,36.112091>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<73.545700,-1.535000,36.112091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,36.112091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,37.179803>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<75.681125,-1.535000,37.179803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,37.179803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,37.535706>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<75.325219,-1.535000,37.535706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,37.535706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,37.535706>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<74.613413,-1.535000,37.535706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,37.535706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,37.179803>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<74.257506,-1.535000,37.179803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,37.179803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,36.112091>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<74.257506,-1.535000,36.112091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.257506,-1.535000,36.823897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,37.535706>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.997156,0> translate<73.545700,-1.535000,37.535706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,39.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,38.806791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<75.681125,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,38.806791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,38.450888>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<75.325219,-1.535000,38.450888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,38.450888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,38.450888>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<73.901603,-1.535000,38.450888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,38.450888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,38.806791>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<73.545700,-1.535000,38.806791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,38.806791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,39.518600>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<73.545700,-1.535000,39.518600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,39.518600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,39.874503>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<73.545700,-1.535000,39.518600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,39.874503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,39.874503>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<73.901603,-1.535000,39.874503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,39.874503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,39.518600>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<75.325219,-1.535000,39.874503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,42.213300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,41.857397>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<75.325219,-1.535000,42.213300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,41.857397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,41.145588>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<75.681125,-1.535000,41.145588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.681125,-1.535000,41.145588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,40.789684>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<75.325219,-1.535000,40.789684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.325219,-1.535000,40.789684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,40.789684>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<73.901603,-1.535000,40.789684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,40.789684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,41.145588>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<73.545700,-1.535000,41.145588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,41.145588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,41.857397>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<73.545700,-1.535000,41.857397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.545700,-1.535000,41.857397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,42.213300>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<73.545700,-1.535000,41.857397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.901603,-1.535000,42.213300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,42.213300>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<73.901603,-1.535000,42.213300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,42.213300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.613413,-1.535000,41.501491>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<74.613413,-1.535000,41.501491> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<36.830000,0.038000,23.495000><36.830000,-1.538000,23.495000>0.406400}
cylinder{<36.830000,0.038000,26.035000><36.830000,-1.538000,26.035000>0.406400}
cylinder{<30.480000,0.038000,23.495000><30.480000,-1.538000,23.495000>0.406400}
cylinder{<30.480000,0.038000,26.035000><30.480000,-1.538000,26.035000>0.406400}
cylinder{<24.130000,0.038000,23.495000><24.130000,-1.538000,23.495000>0.406400}
cylinder{<24.130000,0.038000,26.035000><24.130000,-1.538000,26.035000>0.406400}
cylinder{<73.215500,0.038000,47.307500><73.215500,-1.538000,47.307500>0.406400}
cylinder{<68.389500,0.038000,47.307500><68.389500,-1.538000,47.307500>0.406400}
cylinder{<59.372500,0.038000,17.938750><59.372500,-1.538000,17.938750>0.406400}
cylinder{<56.832500,0.038000,17.938750><56.832500,-1.538000,17.938750>0.406400}
cylinder{<59.213750,0.038000,9.017000><59.213750,-1.538000,9.017000>0.406400}
cylinder{<59.213750,0.038000,12.573000><59.213750,-1.538000,12.573000>0.406400}
cylinder{<35.877500,0.038000,9.017000><35.877500,-1.538000,9.017000>0.406400}
cylinder{<35.877500,0.038000,12.573000><35.877500,-1.538000,12.573000>0.406400}
cylinder{<44.132500,0.038000,6.667500><44.132500,-1.538000,6.667500>0.406400}
cylinder{<44.132500,0.038000,9.207500><44.132500,-1.538000,9.207500>0.406400}
cylinder{<29.845000,0.038000,9.525000><29.845000,-1.538000,9.525000>0.406400}
cylinder{<29.845000,0.038000,6.985000><29.845000,-1.538000,6.985000>0.406400}
cylinder{<54.292500,0.038000,13.652500><54.292500,-1.538000,13.652500>0.406400}
cylinder{<44.132500,0.038000,13.652500><44.132500,-1.538000,13.652500>0.406400}
cylinder{<63.500000,0.038000,4.762500><63.500000,-1.538000,4.762500>0.406400}
cylinder{<55.880000,0.038000,4.762500><55.880000,-1.538000,4.762500>0.406400}
cylinder{<63.500000,0.038000,2.381250><63.500000,-1.538000,2.381250>0.406400}
cylinder{<55.880000,0.038000,2.381250><55.880000,-1.538000,2.381250>0.406400}
cylinder{<52.228750,0.038000,11.112500><52.228750,-1.538000,11.112500>0.406400}
cylinder{<52.228750,0.038000,3.492500><52.228750,-1.538000,3.492500>0.406400}
cylinder{<18.573750,0.038000,24.606250><18.573750,-1.538000,24.606250>0.508000}
cylinder{<18.573750,0.038000,22.066250><18.573750,-1.538000,22.066250>0.508000}
cylinder{<4.445000,0.038000,33.655000><4.445000,-1.538000,33.655000>0.508000}
cylinder{<6.985000,0.038000,33.655000><6.985000,-1.538000,33.655000>0.508000}
cylinder{<4.445000,0.038000,36.195000><4.445000,-1.538000,36.195000>0.508000}
cylinder{<6.985000,0.038000,36.195000><6.985000,-1.538000,36.195000>0.508000}
cylinder{<4.445000,0.038000,38.735000><4.445000,-1.538000,38.735000>0.508000}
cylinder{<6.985000,0.038000,38.735000><6.985000,-1.538000,38.735000>0.508000}
cylinder{<3.175000,0.038000,43.497500><3.175000,-1.538000,43.497500>0.457200}
cylinder{<5.715000,0.038000,43.497500><5.715000,-1.538000,43.497500>0.457200}
cylinder{<8.255000,0.038000,43.497500><8.255000,-1.538000,43.497500>0.457200}
cylinder{<7.264400,0.038000,13.411200><7.264400,-1.538000,13.411200>0.508000}
cylinder{<7.264400,0.038000,6.908800><7.264400,-1.538000,6.908800>0.508000}
cylinder{<11.785600,0.038000,13.411200><11.785600,-1.538000,13.411200>0.508000}
cylinder{<11.785600,0.038000,6.908800><11.785600,-1.538000,6.908800>0.508000}
cylinder{<11.785600,0.038000,18.973800><11.785600,-1.538000,18.973800>0.508000}
cylinder{<11.785600,0.038000,25.476200><11.785600,-1.538000,25.476200>0.508000}
cylinder{<7.264400,0.038000,18.973800><7.264400,-1.538000,18.973800>0.508000}
cylinder{<7.264400,0.038000,25.476200><7.264400,-1.538000,25.476200>0.508000}
cylinder{<12.065000,0.038000,10.160000><12.065000,-1.538000,10.160000>0.400000}
cylinder{<6.985000,0.038000,10.160000><6.985000,-1.538000,10.160000>0.400000}
cylinder{<12.065000,0.038000,22.225000><12.065000,-1.538000,22.225000>0.400000}
cylinder{<6.985000,0.038000,22.225000><6.985000,-1.538000,22.225000>0.400000}
cylinder{<64.981250,0.038000,13.196250><64.981250,-1.538000,13.196250>0.500000}
cylinder{<64.981250,0.038000,15.855000><64.981250,-1.538000,15.855000>0.500000}
cylinder{<67.616250,0.038000,15.855000><67.616250,-1.538000,15.855000>0.500000}
cylinder{<67.616250,0.038000,13.196250><67.616250,-1.538000,13.196250>0.500000}
cylinder{<70.167500,0.038000,20.625000><70.167500,-1.538000,20.625000>0.750000}
cylinder{<70.167500,0.038000,8.585000><70.167500,-1.538000,8.585000>0.750000}
cylinder{<53.530500,0.038000,38.608000><53.530500,-1.538000,38.608000>0.406400}
cylinder{<53.530500,0.038000,33.782000><53.530500,-1.538000,33.782000>0.406400}
//Holes(fast)/Vias
cylinder{<26.035000,0.038000,38.100000><26.035000,-1.538000,38.100000>0.400000 }
cylinder{<74.295000,0.038000,22.860000><74.295000,-1.538000,22.860000>0.400000 }
cylinder{<74.295000,0.038000,5.715000><74.295000,-1.538000,5.715000>0.400000 }
cylinder{<27.622500,0.038000,16.827500><27.622500,-1.538000,16.827500>0.400000 }
cylinder{<21.272500,0.038000,2.063750><21.272500,-1.538000,2.063750>0.400000 }
cylinder{<21.272500,0.038000,8.255000><21.272500,-1.538000,8.255000>0.400000 }
cylinder{<62.547500,0.038000,22.225000><62.547500,-1.538000,22.225000>0.400000 }
cylinder{<62.547500,0.038000,25.082500><62.547500,-1.538000,25.082500>0.400000 }
cylinder{<59.690000,0.038000,25.082500><59.690000,-1.538000,25.082500>0.400000 }
cylinder{<54.927500,0.038000,26.352500><54.927500,-1.538000,26.352500>0.400000 }
cylinder{<52.070000,0.038000,26.352500><52.070000,-1.538000,26.352500>0.400000 }
cylinder{<23.177500,0.038000,38.100000><23.177500,-1.538000,38.100000>0.400000 }
cylinder{<26.035000,0.038000,35.242500><26.035000,-1.538000,35.242500>0.400000 }
cylinder{<60.960000,0.038000,31.432500><60.960000,-1.538000,31.432500>0.400000 }
cylinder{<45.878750,0.038000,27.781250><45.878750,-1.538000,27.781250>0.400000 }
cylinder{<11.112500,0.038000,45.720000><11.112500,-1.538000,45.720000>0.400000 }
cylinder{<49.212500,0.038000,28.892500><49.212500,-1.538000,28.892500>0.400000 }
cylinder{<48.895000,0.038000,26.035000><48.895000,-1.538000,26.035000>0.400000 }
cylinder{<54.133750,0.038000,42.703750><54.133750,-1.538000,42.703750>0.400000 }
cylinder{<77.787500,0.038000,8.572500><77.787500,-1.538000,8.572500>0.400000 }
cylinder{<1.746250,0.038000,1.746250><1.746250,-1.538000,1.746250>0.400000 }
cylinder{<79.533750,0.038000,1.746250><79.533750,-1.538000,1.746250>0.400000 }
cylinder{<79.533750,0.038000,51.911250><79.533750,-1.538000,51.911250>0.400000 }
cylinder{<1.746250,0.038000,51.911250><1.746250,-1.538000,51.911250>0.400000 }
cylinder{<23.495000,0.038000,32.226250><23.495000,-1.538000,32.226250>0.400000 }
cylinder{<47.307500,0.038000,40.163750><47.307500,-1.538000,40.163750>0.400000 }
cylinder{<21.272500,0.038000,20.320000><21.272500,-1.538000,20.320000>0.400000 }
cylinder{<43.815000,0.038000,44.767500><43.815000,-1.538000,44.767500>0.400000 }
cylinder{<18.097500,0.038000,41.275000><18.097500,-1.538000,41.275000>0.400000 }
cylinder{<11.430000,0.038000,42.545000><11.430000,-1.538000,42.545000>0.400000 }
cylinder{<45.720000,0.038000,42.545000><45.720000,-1.538000,42.545000>0.400000 }
cylinder{<40.005000,0.038000,42.354500><40.005000,-1.538000,42.354500>0.400000 }
cylinder{<40.957500,0.038000,44.767500><40.957500,-1.538000,44.767500>0.400000 }
cylinder{<37.147500,0.038000,44.450000><37.147500,-1.538000,44.450000>0.400000 }
cylinder{<34.607500,0.038000,44.450000><34.607500,-1.538000,44.450000>0.400000 }
cylinder{<32.067500,0.038000,44.450000><32.067500,-1.538000,44.450000>0.400000 }
cylinder{<29.527500,0.038000,44.450000><29.527500,-1.538000,44.450000>0.400000 }
cylinder{<26.987500,0.038000,44.450000><26.987500,-1.538000,44.450000>0.400000 }
cylinder{<24.447500,0.038000,44.608750><24.447500,-1.538000,44.608750>0.400000 }
cylinder{<21.748750,0.038000,44.926250><21.748750,-1.538000,44.926250>0.400000 }
cylinder{<60.642500,0.038000,36.195000><60.642500,-1.538000,36.195000>0.400000 }
cylinder{<40.957500,0.038000,15.240000><40.957500,-1.538000,15.240000>0.400000 }
cylinder{<49.212500,0.038000,31.750000><49.212500,-1.538000,31.750000>0.400000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//1C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.068500,0.000000,20.612500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.306500,0.000000,20.612500>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<39.306500,0.000000,20.612500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.043500,0.000000,21.932500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.306500,0.000000,21.932500>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<39.306500,0.000000,21.932500> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<40.404650,0.000000,21.271350>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<38.956850,0.000000,21.271350>}
//1C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.382750,0.000000,6.375000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.144750,0.000000,6.375000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.382750,0.000000,6.375000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.407750,0.000000,5.055000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.144750,0.000000,5.055000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.407750,0.000000,5.055000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<14.046600,0.000000,5.716150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<15.494400,0.000000,5.716150>}
//1C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.737250,0.000000,36.646250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.975250,0.000000,36.646250>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<55.975250,0.000000,36.646250> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.712250,0.000000,37.966250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.975250,0.000000,37.966250>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<55.975250,0.000000,37.966250> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<57.073400,0.000000,37.305100>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<55.625600,0.000000,37.305100>}
//1C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.054750,0.000000,32.995000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.292750,0.000000,32.995000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.292750,0.000000,32.995000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.029750,0.000000,34.315000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.292750,0.000000,34.315000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.292750,0.000000,34.315000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<57.390900,0.000000,33.653850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<55.943100,0.000000,33.653850>}
//1C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.906000,0.000000,13.310000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.144000,0.000000,13.310000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.144000,0.000000,13.310000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.881000,0.000000,14.630000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.144000,0.000000,14.630000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.144000,0.000000,14.630000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<10.242150,0.000000,13.968850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<8.794350,0.000000,13.968850>}
//1C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.770000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.770000,0.000000,30.861000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<10.770000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.090000,0.000000,30.124000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.090000,0.000000,30.861000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<12.090000,0.000000,30.861000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<11.428850,0.000000,29.762850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<11.428850,0.000000,31.210650>}
//1D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.487500,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.087500,0.000000,29.490000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<44.087500,0.000000,29.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.087500,0.000000,29.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.287500,0.000000,29.490000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.287500,0.000000,29.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.287500,0.000000,29.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.887500,0.000000,29.890000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<34.887500,0.000000,29.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.887500,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.887500,0.000000,38.690000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.887500,0.000000,38.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.887500,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.287500,0.000000,39.090000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.887500,0.000000,38.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.287500,0.000000,39.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.087500,0.000000,39.090000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.287500,0.000000,39.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.087500,0.000000,39.090000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.487500,0.000000,38.690000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<44.087500,0.000000,39.090000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.487500,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.487500,0.000000,29.890000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.487500,0.000000,29.890000> }
difference{
cylinder{<43.687500,0,30.290000><43.687500,0.036000,30.290000>0.409700 translate<0,0.000000,0>}
cylinder{<43.687500,-0.1,30.290000><43.687500,0.135000,30.290000>0.155700 translate<0,0.000000,0>}}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<45.212550,0.000000,30.290000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<45.212550,0.000000,31.090000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<45.212550,0.000000,31.890100>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<45.212550,0.000000,32.689950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<45.212550,0.000000,33.490050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<45.212550,0.000000,34.290000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<45.212550,0.000000,35.089950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<45.212550,0.000000,35.890050>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<45.212550,0.000000,36.689900>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<45.212550,0.000000,37.490000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<45.212550,0.000000,38.290000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<43.687500,0.000000,39.815050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.887500,0.000000,39.815050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.087400,0.000000,39.815050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<41.287550,0.000000,39.815050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<40.487450,0.000000,39.815050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<39.687500,0.000000,39.815050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<38.887550,0.000000,39.815050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<38.087450,0.000000,39.815050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<37.287600,0.000000,39.815050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<36.487500,0.000000,39.815050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<35.687500,0.000000,39.815050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<34.162450,0.000000,38.290000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<34.162450,0.000000,37.490000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<34.162450,0.000000,36.689900>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<34.162450,0.000000,35.890050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<34.162450,0.000000,35.089950>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<34.162450,0.000000,34.290000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<34.162450,0.000000,33.490050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<34.162450,0.000000,32.689950>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<34.162450,0.000000,31.890100>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<34.162450,0.000000,31.090000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<34.162450,0.000000,30.290000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<35.687500,0.000000,28.764950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<36.487500,0.000000,28.764950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<37.287600,0.000000,28.764950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<38.087450,0.000000,28.764950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<38.887550,0.000000,28.764950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<39.687500,0.000000,28.764950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<40.487450,0.000000,28.764950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<41.287550,0.000000,28.764950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.087400,0.000000,28.764950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.887500,0.000000,28.764950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<43.687500,0.000000,28.764950>}
//1D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.871700,0.000000,39.306500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.871700,0.000000,29.908500>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.871700,0.000000,29.908500> }
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<18.402300,0.000000,39.306500>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<15.252700,0.000000,29.908500>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<15.252700,0.000000,39.306500>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<18.402300,0.000000,29.908500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.783300,0.000000,29.908500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.783300,0.000000,39.306500>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.783300,0.000000,39.306500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.402300,0.000000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.252700,0.000000,39.687500>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<15.252700,0.000000,39.687500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.252700,0.000000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,29.527500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<15.252700,0.000000,29.527500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.335500,0.000000,29.527500>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.319500,0.000000,29.527500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.335500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.402300,0.000000,29.527500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<17.335500,0.000000,29.527500> }
object{ARC(0.508000,0.152400,0.000000,180.000000,0.036000) translate<16.827500,0.000000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.427700,0.000000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<18.427700,0.000000,39.687500>}
box{<0,0,-0.025400><10.160000,0.036000,0.025400> rotate<0,90.000000,0> translate<18.427700,0.000000,39.687500> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,33.972500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,30.162500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,31.432500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.329400,0.000000,32.702500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,33.972500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,32.702500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,31.432500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,30.162500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,35.242500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,36.512500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,37.782500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<19.354800,0.000000,39.052500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,35.242500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,36.512500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,37.782500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<14.300200,0.000000,39.052500>}
//1HL1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.925000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.735000,-1.536000,27.305000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.925000,-1.536000,27.305000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<36.830000,-1.536000,24.765000>}
difference{
cylinder{<36.830000,0,24.765000><36.830000,0.036000,24.765000>2.616200 translate<0,-1.536000,0>}
cylinder{<36.830000,-0.1,24.765000><36.830000,0.135000,24.765000>2.463800 translate<0,-1.536000,0>}}
//1HL2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.575000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.385000,-1.536000,27.305000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.575000,-1.536000,27.305000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<30.480000,-1.536000,24.765000>}
difference{
cylinder{<30.480000,0,24.765000><30.480000,0.036000,24.765000>2.616200 translate<0,-1.536000,0>}
cylinder{<30.480000,-0.1,24.765000><30.480000,0.135000,24.765000>2.463800 translate<0,-1.536000,0>}}
//1HL3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,-1.536000,27.305000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.225000,-1.536000,27.305000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,270.000000,360.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(1.143000,0.152400,90.000000,180.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,270.000000,360.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(1.651000,0.152400,90.000000,180.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,270.000000,360.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
object{ARC(2.159000,0.152400,90.000000,180.000000,0.036000) translate<24.130000,-1.536000,24.765000>}
difference{
cylinder{<24.130000,0,24.765000><24.130000,0.036000,24.765000>2.616200 translate<0,-1.536000,0>}
cylinder{<24.130000,-0.1,24.765000><24.130000,0.135000,24.765000>2.463800 translate<0,-1.536000,0>}}
//1R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.203700,0.000000,20.637500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.781300,0.000000,20.637500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<2.781300,0.000000,20.637500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.203700,0.000000,19.367500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.781300,0.000000,19.367500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<2.781300,0.000000,19.367500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<2.628900,0.000000,20.002500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<4.356100,0.000000,20.002500>}
//1R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,21.831300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,23.253700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<34.925000,0.000000,23.253700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,21.831300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,23.253700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<33.655000,0.000000,23.253700> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<34.290000,0.000000,23.406100>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<34.290000,0.000000,21.678900>}
//1R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,19.767550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,21.189950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<31.115000,0.000000,21.189950> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,19.767550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,21.189950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<29.845000,0.000000,21.189950> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<30.480000,0.000000,21.342350>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<30.480000,0.000000,19.615150>}
//1R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,32.461200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,31.038800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.305000,0.000000,31.038800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,32.461200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,31.038800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.575000,0.000000,31.038800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<27.940000,0.000000,30.886400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<27.940000,0.000000,32.613600>}
//1R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.349700,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.349700,0.000000,33.032700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<29.349700,0.000000,33.032700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.975300,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.975300,0.000000,33.032700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<30.975300,0.000000,33.032700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<30.162500,0.000000,33.388300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<30.162500,0.000000,30.746700>}
//1R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,22.428200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,22.428200>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.462000,0.000000,22.428200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,20.751800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,20.751800>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.462000,0.000000,20.751800> }
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-0.000000,0> translate<13.195300,0.000000,21.590000>}
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-0.000000,0> translate<16.014700,0.000000,21.590000>}
//1R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,36.118800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,37.541200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<11.430000,0.000000,37.541200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,36.118800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,37.541200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,37.541200> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<10.795000,0.000000,37.693600>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<10.795000,0.000000,35.966400>}
//1R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.951200,0.000000,28.257500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.528800,0.000000,28.257500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<14.528800,0.000000,28.257500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.951200,0.000000,26.987500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.528800,0.000000,26.987500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<14.528800,0.000000,26.987500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<14.376400,0.000000,27.622500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<16.103600,0.000000,27.622500>}
//1R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,25.158700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,0.000000,23.736300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.810000,0.000000,23.736300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,25.158700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,23.736300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.080000,0.000000,23.736300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<4.445000,0.000000,23.583900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<4.445000,0.000000,25.311100>}
//1R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,38.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,37.690000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.065000,-1.536000,37.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,-1.536000,38.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,-1.536000,37.690000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.335000,-1.536000,37.690000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<12.698500,-1.536000,37.368600>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<12.698500,-1.536000,38.841800>}
//1R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,15.633700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.637500,0.000000,14.211300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.637500,0.000000,14.211300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,15.633700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.907500,0.000000,14.211300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.907500,0.000000,14.211300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<21.272500,0.000000,14.058900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<21.272500,0.000000,15.786100>}
//1R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.841200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.418800,0.000000,16.510000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<23.418800,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.841200,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.418800,0.000000,15.240000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<23.418800,0.000000,15.240000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<23.266400,0.000000,15.875000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<24.993600,0.000000,15.875000>}
//1R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,33.737550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,35.159950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,-1.536000,35.159950> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,33.737550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,35.159950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,-1.536000,35.159950> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<17.145000,-1.536000,35.312350>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<17.145000,-1.536000,33.585150>}
//1R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.097500,0.000000,15.633700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.097500,0.000000,14.211300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.097500,0.000000,14.211300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,15.633700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.367500,0.000000,14.211300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.367500,0.000000,14.211300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<18.732500,0.000000,14.058900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<18.732500,0.000000,15.786100>}
//1R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.263750,0.000000,23.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.263750,0.000000,21.972000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.263750,0.000000,21.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.663750,0.000000,23.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.663750,0.000000,21.972000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.663750,0.000000,21.972000> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-270.000000,0> translate<27.462500,0.000000,24.135950>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-270.000000,0> translate<27.462500,0.000000,21.595950>}
//1VD1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.486900,-1.536000,30.003750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008100,-1.536000,30.003750>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.486900,-1.536000,30.003750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.486900,-1.536000,33.813750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008100,-1.536000,33.813750>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<9.486900,-1.536000,33.813750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.486900,-1.536000,33.813750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.486900,-1.536000,30.003750>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.486900,-1.536000,30.003750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008100,-1.536000,33.813750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.008100,-1.536000,30.003750>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.008100,-1.536000,30.003750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.940500,-1.536000,30.908750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.917500,-1.536000,31.908750>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,44.345691,0> translate<10.917500,-1.536000,31.908750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.917500,-1.536000,31.908750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.940500,-1.536000,32.908750>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-44.345691,0> translate<10.917500,-1.536000,31.908750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.940500,-1.536000,32.908750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.940500,-1.536000,30.908750>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<11.940500,-1.536000,30.908750> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-0.000000,0> translate<9.220200,-1.536000,31.908750>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-0.000000,0> translate<14.274800,-1.536000,31.908750>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-0.000000,0> translate<10.672500,-1.536000,31.908750>}
//1VD2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.281900,-1.536000,14.922500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.803100,-1.536000,14.922500>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<20.281900,-1.536000,14.922500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.281900,-1.536000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.803100,-1.536000,18.732500>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<20.281900,-1.536000,18.732500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.281900,-1.536000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.281900,-1.536000,14.922500>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.281900,-1.536000,14.922500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.803100,-1.536000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.803100,-1.536000,14.922500>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.803100,-1.536000,14.922500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.735500,-1.536000,15.827500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.712500,-1.536000,16.827500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,44.345691,0> translate<21.712500,-1.536000,16.827500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.712500,-1.536000,16.827500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.735500,-1.536000,17.827500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-44.345691,0> translate<21.712500,-1.536000,16.827500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.735500,-1.536000,17.827500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.735500,-1.536000,15.827500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.735500,-1.536000,15.827500> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-0.000000,0> translate<20.015200,-1.536000,16.827500>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-0.000000,0> translate<25.069800,-1.536000,16.827500>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-0.000000,0> translate<21.467500,-1.536000,16.827500>}
//1VT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.345400,0.000000,10.166350>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.024600,0.000000,10.166350>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<19.024600,0.000000,10.166350> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.024600,0.000000,10.166350>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.024600,0.000000,13.011150>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<19.024600,0.000000,13.011150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.024600,0.000000,13.011150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.345400,0.000000,13.011150>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<19.024600,0.000000,13.011150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.345400,0.000000,13.011150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.345400,0.000000,10.166350>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.345400,0.000000,10.166350> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<20.688300,0.000000,11.588750>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<18.681700,0.000000,10.648950>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<18.681700,0.000000,12.528550>}
//1VT2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,20.821650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,19.500850>}
box{<0,0,-0.063500><1.320800,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.869900,0.000000,19.500850> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,19.500850>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.025100,0.000000,19.500850>}
box{<0,0,-0.063500><2.844800,0.036000,0.063500> rotate<0,0.000000,0> translate<23.025100,0.000000,19.500850> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.025100,0.000000,19.500850>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.025100,0.000000,20.821650>}
box{<0,0,-0.063500><1.320800,0.036000,0.063500> rotate<0,90.000000,0> translate<23.025100,0.000000,20.821650> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.025100,0.000000,20.821650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.869900,0.000000,20.821650>}
box{<0,0,-0.063500><2.844800,0.036000,0.063500> rotate<0,0.000000,0> translate<23.025100,0.000000,20.821650> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<24.447500,0.000000,21.164550>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<25.387300,0.000000,19.157950>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<23.507700,0.000000,19.157950>}
//1VT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.217900,-1.536000,39.204900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.897100,-1.536000,39.204900>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<14.897100,-1.536000,39.204900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.897100,-1.536000,39.204900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.897100,-1.536000,36.360100>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.897100,-1.536000,36.360100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.897100,-1.536000,36.360100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.217900,-1.536000,36.360100>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<14.897100,-1.536000,36.360100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.217900,-1.536000,36.360100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.217900,-1.536000,39.204900>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<16.217900,-1.536000,39.204900> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<16.560800,-1.536000,37.782500>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<14.554200,-1.536000,38.722300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<14.554200,-1.536000,36.842700>}
//2C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.961000,0.000000,48.870000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.199000,0.000000,48.870000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<68.199000,0.000000,48.870000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.936000,0.000000,50.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.199000,0.000000,50.190000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<68.199000,0.000000,50.190000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<69.297150,0.000000,49.528850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<67.849350,0.000000,49.528850>}
//2C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.780000,0.000000,48.641000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.780000,0.000000,47.879000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<71.780000,0.000000,47.879000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.460000,0.000000,48.616000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.460000,0.000000,47.879000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<70.460000,0.000000,47.879000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<71.121150,0.000000,48.977150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<71.121150,0.000000,47.529350>}
//2C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.177500,0.000000,50.069750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<77.177500,0.000000,49.307750>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<77.177500,0.000000,49.307750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.857500,0.000000,50.044750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.857500,0.000000,49.307750>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<75.857500,0.000000,49.307750> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<76.518650,0.000000,50.405900>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<76.518650,0.000000,48.958100>}
//2C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.079600,0.000000,46.367700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<78.079600,0.000000,44.437300>}
box{<0,0,-0.050800><1.930400,0.036000,0.050800> rotate<0,-90.000000,0> translate<78.079600,0.000000,44.437300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.590400,0.000000,46.367700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<75.590400,0.000000,44.437300>}
box{<0,0,-0.050800><1.930400,0.036000,0.050800> rotate<0,-90.000000,0> translate<75.590400,0.000000,44.437300> }
box{<-0.375050,0,-1.299950><0.375050,0.036000,1.299950> rotate<0,-270.000000,0> translate<76.839550,0.000000,46.729250>}
box{<-0.375050,0,-1.299950><0.375050,0.036000,1.299950> rotate<0,-270.000000,0> translate<76.830450,0.000000,44.075750>}
//2C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.469000,0.000000,26.695000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.231000,0.000000,26.695000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<69.469000,0.000000,26.695000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.494000,0.000000,25.375000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.231000,0.000000,25.375000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<69.494000,0.000000,25.375000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<69.132850,0.000000,26.036150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<70.580650,0.000000,26.036150>}
//2D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.602500,0.000000,39.437500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.002500,0.000000,39.437500>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.602500,0.000000,39.437500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.002500,0.000000,39.437500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.002500,0.000000,33.587500>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.002500,0.000000,33.587500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.002500,0.000000,33.587500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.602500,0.000000,33.587500>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.602500,0.000000,33.587500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.602500,0.000000,33.587500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.602500,0.000000,39.437500>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,90.000000,0> translate<65.602500,0.000000,39.437500> }
difference{
cylinder{<65.802500,0,32.912500><65.802500,0.036000,32.912500>0.435400 translate<0,0.000000,0>}
cylinder{<65.802500,-0.1,32.912500><65.802500,0.135000,32.912500>0.283000 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<66.577500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<66.577500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<67.227500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<67.877500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<67.227500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<67.877500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<68.527500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<69.177500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<69.827500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<70.477500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<71.127500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<71.777500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<72.427500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<73.077500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<73.727500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<74.377500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<75.027500,0.000000,39.945300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<68.527500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<69.177500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<69.827500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<70.477500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<71.127500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<71.777500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<72.427500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<73.077500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<73.727500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<74.377500,0.000000,33.079700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-0.000000,0> translate<75.027500,0.000000,33.079700>}
//2R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.148000,0.000000,43.141500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.012000,0.000000,43.141500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.148000,0.000000,43.141500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.012000,0.000000,43.853500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.148000,0.000000,43.853500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.148000,0.000000,43.853500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<69.215000,0.000000,43.497500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<67.945000,0.000000,43.497500>}
//2R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.620500,0.000000,43.015000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.819500,0.000000,43.015000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.819500,0.000000,43.015000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.620500,0.000000,44.615000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.819500,0.000000,44.615000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.819500,0.000000,44.615000> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-180.000000,0> translate<73.983450,0.000000,43.816250>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-180.000000,0> translate<71.443450,0.000000,43.816250>}
//2R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,15.836500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,15.836500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,15.836500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,16.548500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,16.548500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,16.548500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<74.930000,0.000000,16.192500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<73.660000,0.000000,16.192500>}
//2R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,14.249000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,14.249000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,14.249000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,14.961000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,14.961000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,14.961000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<74.930000,0.000000,14.605000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<73.660000,0.000000,14.605000>}
//2R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,13.373500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,13.373500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,13.373500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.863000,0.000000,12.661500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.727000,0.000000,12.661500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.863000,0.000000,12.661500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<73.660000,0.000000,13.017500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<74.930000,0.000000,13.017500>}
//2R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.984500,0.000000,24.771250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.785500,0.000000,24.771250>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.984500,0.000000,24.771250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.984500,0.000000,23.171250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.785500,0.000000,23.171250>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.984500,0.000000,23.171250> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-0.000000,0> translate<67.621550,0.000000,23.970000>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-0.000000,0> translate<70.161550,0.000000,23.970000>}
//2R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.774500,0.000000,25.597250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.910500,0.000000,25.597250>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.910500,0.000000,25.597250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.910500,0.000000,24.885250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.774500,0.000000,24.885250>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.910500,0.000000,24.885250> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<72.707500,0.000000,25.241250>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<73.977500,0.000000,25.241250>}
//2R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.921000,0.000000,25.603000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.921000,0.000000,26.467000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.921000,0.000000,26.467000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.209000,0.000000,26.467000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.209000,0.000000,25.603000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.209000,0.000000,25.603000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<75.565000,0.000000,26.670000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<75.565000,0.000000,25.400000>}
//2R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.492250,0.000000,29.730500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.492250,0.000000,30.594500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.492250,0.000000,30.594500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.780250,0.000000,30.594500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.780250,0.000000,29.730500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.780250,0.000000,29.730500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<74.136250,0.000000,30.797500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<74.136250,0.000000,29.527500>}
//2R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.079750,0.000000,29.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.079750,0.000000,30.277000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.079750,0.000000,30.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.367750,0.000000,30.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.367750,0.000000,29.413000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.367750,0.000000,29.413000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<75.723750,0.000000,30.480000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<75.723750,0.000000,29.210000>}
//2Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<73.850500,-1.536000,45.148500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<67.754500,-1.536000,45.148500>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<67.754500,-1.536000,45.148500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<73.850500,-1.536000,49.466500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<67.754500,-1.536000,49.466500>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<67.754500,-1.536000,49.466500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.850500,-1.536000,45.656500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.754500,-1.536000,45.656500>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.754500,-1.536000,45.656500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.754500,-1.536000,48.958500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.850500,-1.536000,48.958500>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.754500,-1.536000,48.958500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.056500,-1.536000,48.069500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.548500,-1.536000,48.069500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.548500,-1.536000,48.069500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.548500,-1.536000,48.069500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.548500,-1.536000,46.545500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.548500,-1.536000,46.545500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.548500,-1.536000,46.545500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.056500,-1.536000,46.545500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.548500,-1.536000,46.545500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.056500,-1.536000,46.545500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.056500,-1.536000,48.069500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.056500,-1.536000,48.069500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.167500,-1.536000,48.069500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.167500,-1.536000,47.307500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.167500,-1.536000,47.307500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.167500,-1.536000,47.307500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.167500,-1.536000,46.545500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.167500,-1.536000,46.545500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.437500,-1.536000,48.069500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.437500,-1.536000,47.307500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.437500,-1.536000,47.307500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.437500,-1.536000,47.307500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.437500,-1.536000,46.545500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.437500,-1.536000,46.545500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.167500,-1.536000,47.307500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.532500,-1.536000,47.307500>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.532500,-1.536000,47.307500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.437500,-1.536000,47.307500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.072500,-1.536000,47.307500>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.437500,-1.536000,47.307500> }
object{ARC(2.159000,0.406400,270.000000,450.000000,0.036000) translate<73.850500,-1.536000,47.307500>}
object{ARC(2.159000,0.406400,90.000000,270.000000,0.036000) translate<67.754500,-1.536000,47.307500>}
object{ARC(1.651000,0.152400,270.000000,450.000000,0.036000) translate<73.850500,-1.536000,47.307500>}
object{ARC(1.651000,0.152400,90.000000,270.000000,0.036000) translate<67.754500,-1.536000,47.307500>}
//3C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.261500,-1.536000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.261500,-1.536000,18.573750>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.261500,-1.536000,18.573750> }
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<59.753500,-1.536000,18.573750>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<59.753500,-1.536000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.451500,-1.536000,19.081750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,-1.536000,19.081750>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.451500,-1.536000,19.081750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.943500,-1.536000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.943500,-1.536000,18.573750>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.943500,-1.536000,18.573750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.451500,-1.536000,16.795750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,-1.536000,16.795750>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.451500,-1.536000,16.795750> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<56.451500,-1.536000,18.573750>}
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<56.451500,-1.536000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.407300,-1.536000,18.700750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<58.407300,-1.536000,17.176750>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,-90.000000,0> translate<58.407300,-1.536000,17.176750> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<57.772300,-1.536000,18.700750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<57.772300,-1.536000,17.176750>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,-90.000000,0> translate<57.772300,-1.536000,17.176750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.832500,-1.536000,17.938750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.772300,-1.536000,17.938750>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<56.832500,-1.536000,17.938750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.372500,-1.536000,17.938750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.407300,-1.536000,17.938750>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,0.000000,0> translate<58.407300,-1.536000,17.938750> }
//3C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.356750,-1.536000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.356750,-1.536000,8.128000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.356750,-1.536000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.975750,-1.536000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.737750,-1.536000,7.747000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.975750,-1.536000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,10.033000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.213750,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.943750,-1.536000,10.033000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.943750,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.943750,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.943750,-1.536000,10.541000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.943750,-1.536000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.943750,-1.536000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483750,-1.536000,10.541000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.943750,-1.536000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483750,-1.536000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483750,-1.536000,10.033000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.483750,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.483750,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,10.033000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.213750,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.213750,-1.536000,12.446000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.213750,-1.536000,12.446000> }
difference{
cylinder{<59.213750,0,10.795000><59.213750,0.036000,10.795000>4.140200 translate<0,-1.536000,0>}
cylinder{<59.213750,-0.1,10.795000><59.213750,0.135000,10.795000>3.987800 translate<0,-1.536000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<59.213750,-1.536000,11.303000>}
//3C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.020500,-1.536000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.020500,-1.536000,8.128000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.020500,-1.536000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.639500,-1.536000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.401500,-1.536000,7.747000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.639500,-1.536000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,10.033000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.877500,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,-1.536000,10.033000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.607500,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,-1.536000,10.541000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.607500,-1.536000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,-1.536000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.147500,-1.536000,10.541000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.607500,-1.536000,10.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.147500,-1.536000,10.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.147500,-1.536000,10.033000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.147500,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.147500,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,10.033000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.877500,-1.536000,10.033000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.877500,-1.536000,12.446000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.877500,-1.536000,12.446000> }
difference{
cylinder{<35.877500,0,10.795000><35.877500,0.036000,10.795000>4.140200 translate<0,-1.536000,0>}
cylinder{<35.877500,-0.1,10.795000><35.877500,0.135000,10.795000>3.987800 translate<0,-1.536000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<35.877500,-1.536000,11.303000>}
//3C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.402500,-1.536000,5.778500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.402500,-1.536000,10.096500>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.402500,-1.536000,10.096500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.862500,-1.536000,10.096500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.862500,-1.536000,5.778500>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.862500,-1.536000,5.778500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.148500,-1.536000,10.350500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.116500,-1.536000,10.350500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.116500,-1.536000,10.350500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.148500,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.116500,-1.536000,5.524500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.116500,-1.536000,5.524500> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.148500,-1.536000,10.096500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.148500,-1.536000,5.778500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<43.116500,-1.536000,10.096500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<43.116500,-1.536000,5.778500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,8.699500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,8.318500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.132500,-1.536000,8.318500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,8.318500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,8.191500>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.132500,-1.536000,8.191500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.132500,-1.536000,8.191500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.894500,-1.536000,8.191500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<44.132500,-1.536000,8.191500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.132500,-1.536000,8.191500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.370500,-1.536000,8.191500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<43.370500,-1.536000,8.191500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.894500,-1.536000,7.683500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.132500,-1.536000,7.683500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<44.132500,-1.536000,7.683500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.132500,-1.536000,7.683500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.370500,-1.536000,7.683500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<43.370500,-1.536000,7.683500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,7.683500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,7.556500>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.132500,-1.536000,7.556500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,7.556500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.132500,-1.536000,7.175500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.132500,-1.536000,7.175500> }
//3C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,-1.536000,6.096000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.575000,-1.536000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,-1.536000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,-1.536000,10.414000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.115000,-1.536000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,-1.536000,5.842000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,-1.536000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,-1.536000,10.668000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,-1.536000,10.668000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.829000,-1.536000,6.096000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.829000,-1.536000,10.414000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.861000,-1.536000,6.096000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.861000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,7.874000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.845000,-1.536000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.845000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.083000,-1.536000,8.001000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.083000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.607000,-1.536000,8.001000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.845000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.083000,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,-1.536000,8.509000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.083000,-1.536000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.845000,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.607000,-1.536000,8.509000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.845000,-1.536000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,8.636000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.845000,-1.536000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,-1.536000,9.017000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.845000,-1.536000,9.017000> }
//3D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.430000,0.000000,5.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,5.220000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.130000,0.000000,5.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,5.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.630000,0.000000,5.220000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.630000,0.000000,5.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.630000,0.000000,5.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.630000,0.000000,10.020000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<47.630000,0.000000,10.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.630000,0.000000,10.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,10.020000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.630000,0.000000,10.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,10.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.430000,0.000000,10.020000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.130000,0.000000,10.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.430000,0.000000,10.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.430000,0.000000,5.220000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.430000,0.000000,5.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,5.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.130000,0.000000,10.020000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<48.130000,0.000000,10.020000> }
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<46.980000,0.000000,9.525000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<46.980000,0.000000,8.255000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<46.980000,0.000000,6.985000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<46.980000,0.000000,5.715000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<52.080000,0.000000,5.715000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<52.080000,0.000000,6.985000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<52.080000,0.000000,8.255000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<52.080000,0.000000,9.525000>}
//3L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.132500,-1.536000,13.652500>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.148500,-1.536000,13.652500>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.132500,-1.536000,13.652500> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.292500,-1.536000,13.652500>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.276500,-1.536000,13.652500>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<53.276500,-1.536000,13.652500> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.133500,-1.536000,14.541500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.133500,-1.536000,12.763500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.291500,-1.536000,12.763500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.291500,-1.536000,14.541500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.387500,-1.536000,12.763500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.387500,-1.536000,14.541500>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.387500,-1.536000,14.541500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.133500,-1.536000,14.795500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,14.795500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.752500,-1.536000,14.795500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.625500,-1.536000,14.668500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,14.795500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.625500,-1.536000,14.668500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.133500,-1.536000,12.509500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,12.509500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.752500,-1.536000,12.509500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.625500,-1.536000,12.636500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,12.509500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.625500,-1.536000,12.636500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.799500,-1.536000,14.668500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.672500,-1.536000,14.795500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.672500,-1.536000,14.795500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.799500,-1.536000,14.668500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.625500,-1.536000,14.668500>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.799500,-1.536000,14.668500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.799500,-1.536000,12.636500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.672500,-1.536000,12.509500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.672500,-1.536000,12.509500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.799500,-1.536000,12.636500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.625500,-1.536000,12.636500>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.799500,-1.536000,12.636500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.291500,-1.536000,14.795500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.672500,-1.536000,14.795500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.291500,-1.536000,14.795500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.291500,-1.536000,12.509500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.672500,-1.536000,12.509500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.291500,-1.536000,12.509500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,-1.536000,12.763500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,-1.536000,14.541500>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.037500,-1.536000,14.541500> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<45.605700,-1.536000,13.652500>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<52.819300,-1.536000,13.652500>}
//3R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.880000,-1.536000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<56.769000,-1.536000,4.762500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<55.880000,-1.536000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,-1.536000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.611000,-1.536000,4.762500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.611000,-1.536000,4.762500> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.976000,-1.536000,5.524500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.976000,-1.536000,4.000500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.404000,-1.536000,4.000500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.404000,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,-1.536000,4.000500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,-1.536000,5.524500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.230000,-1.536000,5.524500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,5.778500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,5.778500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,-1.536000,5.778500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,5.651500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,5.778500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.468000,-1.536000,5.651500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,3.746500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,3.746500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,-1.536000,3.746500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,3.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,3.746500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<61.468000,-1.536000,3.873500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,5.651500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,5.778500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.785000,-1.536000,5.778500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,5.651500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,5.651500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,-1.536000,5.651500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,3.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,3.746500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.785000,-1.536000,3.746500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,3.873500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,3.873500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,-1.536000,3.873500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,-1.536000,5.778500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,5.778500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,-1.536000,5.778500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,-1.536000,3.746500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,3.746500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,-1.536000,3.746500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,-1.536000,4.000500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,-1.536000,5.524500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,-1.536000,5.524500> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<56.959500,-1.536000,4.762500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<62.420500,-1.536000,4.762500>}
//3R1A silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.880000,-1.536000,2.381250>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<56.769000,-1.536000,2.381250>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<55.880000,-1.536000,2.381250> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,-1.536000,2.381250>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.611000,-1.536000,2.381250>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.611000,-1.536000,2.381250> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.976000,-1.536000,3.143250>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.976000,-1.536000,1.619250>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.404000,-1.536000,1.619250>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.404000,-1.536000,3.143250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,-1.536000,1.619250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,-1.536000,3.143250>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.230000,-1.536000,3.143250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,3.397250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,3.397250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,-1.536000,3.397250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,3.270250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,3.397250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.468000,-1.536000,3.270250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,-1.536000,1.365250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,1.365250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,-1.536000,1.365250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,1.492250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,-1.536000,1.365250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<61.468000,-1.536000,1.492250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,3.270250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,3.397250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.785000,-1.536000,3.397250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,3.270250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,3.270250>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,-1.536000,3.270250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,1.492250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,1.365250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.785000,-1.536000,1.365250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,-1.536000,1.492250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,-1.536000,1.492250>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,-1.536000,1.492250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,-1.536000,3.397250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,3.397250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,-1.536000,3.397250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,-1.536000,1.365250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,-1.536000,1.365250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,-1.536000,1.365250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,-1.536000,1.619250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,-1.536000,3.143250>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,-1.536000,3.143250> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<56.959500,-1.536000,2.381250>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<62.420500,-1.536000,2.381250>}
//3R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.228750,-1.536000,3.492500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.228750,-1.536000,4.381500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<52.228750,-1.536000,4.381500> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.228750,-1.536000,11.112500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<52.228750,-1.536000,10.223500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<52.228750,-1.536000,10.223500> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.466750,-1.536000,9.588500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.990750,-1.536000,9.588500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.990750,-1.536000,5.016500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.466750,-1.536000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.990750,-1.536000,9.842500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.466750,-1.536000,9.842500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.466750,-1.536000,9.842500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,9.588500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,9.207500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.212750,-1.536000,9.207500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.339750,-1.536000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,9.207500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.212750,-1.536000,9.207500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,9.588500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,9.207500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.244750,-1.536000,9.207500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.117750,-1.536000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,9.207500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.117750,-1.536000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.339750,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,5.397500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.212750,-1.536000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.339750,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.339750,-1.536000,9.080500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.339750,-1.536000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.117750,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,5.397500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.117750,-1.536000,5.524500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.117750,-1.536000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.117750,-1.536000,9.080500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.117750,-1.536000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.212750,-1.536000,5.397500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.212750,-1.536000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.244750,-1.536000,5.397500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.244750,-1.536000,5.397500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.990750,-1.536000,4.762500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.466750,-1.536000,4.762500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.466750,-1.536000,4.762500> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.228750,-1.536000,4.572000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<52.228750,-1.536000,10.033000>}
//3R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.653700,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,0.000000,4.445000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<47.231300,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.653700,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.231300,0.000000,3.175000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<47.231300,0.000000,3.175000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<47.078900,0.000000,3.810000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<48.806100,0.000000,3.810000>}
//3R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.468800,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.891200,0.000000,3.175000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.468800,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.468800,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.891200,0.000000,4.445000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.468800,0.000000,4.445000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<44.043600,0.000000,3.810000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<42.316400,0.000000,3.810000>}
//3VD1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.052500,0.000000,7.581900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.052500,0.000000,12.103100>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,90.000000,0> translate<39.052500,0.000000,12.103100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.862500,0.000000,7.581900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.862500,0.000000,12.103100>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,90.000000,0> translate<42.862500,0.000000,12.103100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.862500,0.000000,7.581900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.052500,0.000000,7.581900>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<39.052500,0.000000,7.581900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.862500,0.000000,12.103100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.052500,0.000000,12.103100>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<39.052500,0.000000,12.103100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.957500,0.000000,10.035500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.957500,0.000000,9.012500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,45.648369,0> translate<39.957500,0.000000,10.035500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.957500,0.000000,9.012500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.957500,0.000000,10.035500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-45.648369,0> translate<40.957500,0.000000,9.012500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.957500,0.000000,10.035500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.957500,0.000000,10.035500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.957500,0.000000,10.035500> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-90.000000,0> translate<40.957500,0.000000,7.315200>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-90.000000,0> translate<40.957500,0.000000,12.369800>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-90.000000,0> translate<40.957500,0.000000,8.767500>}
//4C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.105500,-1.536000,34.461250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.105500,-1.536000,32.531250>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.105500,-1.536000,32.531250> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.679500,-1.536000,34.461250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.679500,-1.536000,32.531250>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.679500,-1.536000,32.531250> }
box{<-0.375050,0,-0.850000><0.375050,0.036000,0.850000> rotate<0,-270.000000,0> translate<28.893400,-1.536000,34.823000>}
box{<-0.375050,0,-0.850000><0.375050,0.036000,0.850000> rotate<0,-270.000000,0> translate<28.891600,-1.536000,32.169500>}
//4R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.728163,-1.536000,39.310388>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.544019,-1.536000,40.475550>}
box{<0,0,-0.076200><1.422401,0.036000,0.076200> rotate<0,-54.996348,0> translate<42.728163,-1.536000,39.310388> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.768484,-1.536000,38.581947>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.584341,-1.536000,39.747109>}
box{<0,0,-0.076200><1.422401,0.036000,0.076200> rotate<0,-54.996348,0> translate<43.768484,-1.536000,38.581947> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-235.000000,0> translate<44.151591,-1.536000,40.236169>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-235.000000,0> translate<43.160913,-1.536000,38.821328>}
//4R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.270700,-1.536000,34.639250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.270700,-1.536000,32.353250>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.270700,-1.536000,32.353250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.594300,-1.536000,34.639250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.594300,-1.536000,32.353250>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.594300,-1.536000,32.353250> }
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-90.000000,0> translate<31.432500,-1.536000,32.086550>}
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-90.000000,0> translate<31.432500,-1.536000,34.905950>}
//4R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,-1.536000,35.166300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,-1.536000,36.588700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<33.020000,-1.536000,36.588700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,-1.536000,35.166300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,-1.536000,36.588700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<34.290000,-1.536000,36.588700> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<33.655000,-1.536000,36.741100>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<33.655000,-1.536000,35.013900>}
//4R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.762450,-1.536000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.340050,-1.536000,37.465000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.340050,-1.536000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.762450,-1.536000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.340050,-1.536000,38.735000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.340050,-1.536000,38.735000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<28.187650,-1.536000,38.100000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<29.914850,-1.536000,38.100000>}
//4R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.984950,-1.536000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.562550,-1.536000,41.592500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.562550,-1.536000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.984950,-1.536000,42.862500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.562550,-1.536000,42.862500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.562550,-1.536000,42.862500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<30.410150,-1.536000,42.227500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<32.137350,-1.536000,42.227500>}
//4VT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.490400,-1.536000,37.617400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.169600,-1.536000,37.617400>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<36.169600,-1.536000,37.617400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.169600,-1.536000,37.617400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.169600,-1.536000,34.772600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.169600,-1.536000,34.772600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.169600,-1.536000,34.772600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.490400,-1.536000,34.772600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<36.169600,-1.536000,34.772600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.490400,-1.536000,34.772600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.490400,-1.536000,37.617400>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<37.490400,-1.536000,37.617400> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<37.833300,-1.536000,36.195000>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<35.826700,-1.536000,37.134800>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<35.826700,-1.536000,35.255200>}
//4VT2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.540500,-1.536000,41.560500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.540500,-1.536000,40.354500>}
box{<0,0,-0.101600><1.206000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.540500,-1.536000,40.354500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.540500,-1.536000,40.354500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.244500,-1.536000,40.354500>}
box{<0,0,-0.101600><2.704000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.540500,-1.536000,40.354500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.244500,-1.536000,40.354500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.244500,-1.536000,41.560500>}
box{<0,0,-0.101600><1.206000,0.036000,0.101600> rotate<0,90.000000,0> translate<30.244500,-1.536000,41.560500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.244500,-1.536000,41.560500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.540500,-1.536000,41.560500>}
box{<0,0,-0.101600><2.704000,0.036000,0.101600> rotate<0,0.000000,0> translate<27.540500,-1.536000,41.560500> }
box{<-0.250000,0,-0.298300><0.250000,0.036000,0.298300> rotate<0,-180.000000,0> translate<29.817500,-1.536000,40.005800>}
box{<-0.250000,0,-0.298300><0.250000,0.036000,0.298300> rotate<0,-180.000000,0> translate<27.967500,-1.536000,40.005800>}
box{<-0.237500,0,-0.298300><0.237500,0.036000,0.298300> rotate<0,-0.000000,0> translate<28.905000,-1.536000,41.909200>}
//4VT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.029900,-1.536000,40.297100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.029900,-1.536000,41.617900>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<36.029900,-1.536000,41.617900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.029900,-1.536000,41.617900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.185100,-1.536000,41.617900>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<33.185100,-1.536000,41.617900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.185100,-1.536000,41.617900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.185100,-1.536000,40.297100>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.185100,-1.536000,40.297100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.185100,-1.536000,40.297100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.029900,-1.536000,40.297100>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<33.185100,-1.536000,40.297100> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<34.607500,-1.536000,39.954200>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<35.547300,-1.536000,41.960800>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<33.667700,-1.536000,41.960800>}
//HW silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,25.241250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,23.971250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.303750,-1.536000,23.971250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,23.971250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,23.336250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.303750,-1.536000,23.971250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,23.336250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,23.336250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.938750,-1.536000,23.336250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,23.336250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,23.971250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.208750,-1.536000,23.336250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,25.876250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,25.876250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.938750,-1.536000,25.876250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,25.241250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,25.876250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.303750,-1.536000,25.241250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,25.876250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,25.241250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.208750,-1.536000,25.876250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,23.971250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,25.241250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.843750,-1.536000,25.241250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,23.336250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,22.701250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.303750,-1.536000,22.701250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,22.701250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,21.431250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.303750,-1.536000,21.431250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.303750,-1.536000,21.431250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,20.796250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.303750,-1.536000,21.431250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.938750,-1.536000,20.796250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,20.796250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.938750,-1.536000,20.796250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,20.796250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,21.431250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.208750,-1.536000,20.796250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,21.431250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,22.701250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.843750,-1.536000,22.701250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.843750,-1.536000,22.701250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.208750,-1.536000,23.336250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.208750,-1.536000,23.336250> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.573750,-1.536000,24.606250>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.573750,-1.536000,22.066250>}
//ISP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,34.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.255000,-1.536000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,34.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.620000,-1.536000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,35.560000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.620000,-1.536000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,36.830000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.255000,-1.536000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,37.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.620000,-1.536000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,32.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.620000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,38.100000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.620000,-1.536000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,39.370000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.255000,-1.536000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,40.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.620000,-1.536000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,40.005000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.810000,-1.536000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,35.560000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,-1.536000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,34.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,32.385000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.810000,-1.536000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,33.020000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,33.020000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,-1.536000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.175000,-1.536000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,38.100000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<3.175000,-1.536000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.175000,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.810000,-1.536000,37.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.175000,-1.536000,38.100000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.445000,-1.536000,36.195000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.445000,-1.536000,33.655000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.445000,-1.536000,38.735000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<6.985000,-1.536000,33.655000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<6.985000,-1.536000,36.195000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<6.985000,-1.536000,38.735000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.340500,0.000000,45.783500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.134500,0.000000,45.783500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.340500,0.000000,45.783500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.340500,0.000000,44.005500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<60.134500,0.000000,44.005500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<60.134500,0.000000,45.529500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.340500,0.000000,45.529500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.086500,0.000000,45.529500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.086500,0.000000,44.005500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.086500,0.000000,44.005500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.388500,0.000000,45.529500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.388500,0.000000,44.005500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.388500,0.000000,44.005500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.134500,0.000000,43.751500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.340500,0.000000,43.751500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.340500,0.000000,43.751500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.721500,0.000000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.213500,0.000000,44.767500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.213500,0.000000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,0.000000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.261500,0.000000,44.767500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.753500,0.000000,44.767500> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<58.991500,0.000000,44.767500>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<58.483500,0.000000,44.767500>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.340500,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.134500,0.000000,43.561000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.340500,0.000000,43.561000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.340500,0.000000,41.783000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<60.134500,0.000000,41.783000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<60.134500,0.000000,43.307000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.340500,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.086500,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.086500,0.000000,41.783000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.086500,0.000000,41.783000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.388500,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.388500,0.000000,41.783000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.388500,0.000000,41.783000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.134500,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.340500,0.000000,41.529000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.340500,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.721500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.213500,0.000000,42.545000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.213500,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.261500,0.000000,42.545000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.753500,0.000000,42.545000> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<58.991500,0.000000,42.545000>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<58.483500,0.000000,42.545000>}
//JI silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.325500,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.119500,0.000000,28.956000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.325500,0.000000,28.956000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<64.325500,0.000000,27.178000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<67.119500,0.000000,27.178000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<67.119500,0.000000,28.702000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<64.325500,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.071500,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.071500,0.000000,27.178000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.071500,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.373500,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.373500,0.000000,27.178000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.373500,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.119500,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.325500,0.000000,26.924000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.325500,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.706500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.198500,0.000000,27.940000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.198500,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.738500,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.246500,0.000000,27.940000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.738500,0.000000,27.940000> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<65.976500,0.000000,27.940000>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<65.468500,0.000000,27.940000>}
//JO silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.705500,0.000000,41.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.499500,0.000000,41.338500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.705500,0.000000,41.338500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<56.705500,0.000000,39.560500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<59.499500,0.000000,39.560500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<59.499500,0.000000,41.084500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<56.705500,0.000000,41.084500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.451500,0.000000,41.084500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.451500,0.000000,39.560500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.451500,0.000000,39.560500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,0.000000,41.084500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.753500,0.000000,39.560500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.753500,0.000000,39.560500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.499500,0.000000,39.306500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.705500,0.000000,39.306500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.705500,0.000000,39.306500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.086500,0.000000,40.322500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.578500,0.000000,40.322500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<56.578500,0.000000,40.322500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.118500,0.000000,40.322500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.626500,0.000000,40.322500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.118500,0.000000,40.322500> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<58.356500,0.000000,40.322500>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<57.848500,0.000000,40.322500>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,44.513500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,42.481500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.905000,-1.536000,42.481500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,42.227500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,42.481500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,42.227500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<6.985000,-1.536000,42.481500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,44.767500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,-1.536000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,44.513500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,44.767500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.985000,-1.536000,44.513500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,-1.536000,44.513500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<9.271000,-1.536000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,-1.536000,42.481500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.271000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,-1.536000,42.481500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,-1.536000,44.513500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.525000,-1.536000,44.513500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,42.481500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.731000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,-1.536000,42.227500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,-1.536000,42.481500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,-1.536000,42.227500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<4.445000,-1.536000,42.481500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,-1.536000,42.481500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.191000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,42.481500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,-1.536000,42.227500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<1.905000,-1.536000,42.481500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,-1.536000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,-1.536000,42.227500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.159000,-1.536000,42.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,44.513500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<6.731000,-1.536000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,-1.536000,44.513500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,-1.536000,44.767500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.445000,-1.536000,44.513500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,-1.536000,44.513500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<4.191000,-1.536000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.905000,-1.536000,44.513500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,-1.536000,44.767500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.905000,-1.536000,44.513500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,-1.536000,44.767500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,-1.536000,44.767500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,-1.536000,44.767500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,-1.536000,44.767500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.159000,-1.536000,44.767500> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<3.175000,-1.536000,43.497500>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<5.715000,-1.536000,43.497500>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-0.000000,0> translate<8.255000,-1.536000,43.497500>}
//JR silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,38.290500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.944000,0.000000,41.084500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.944000,0.000000,41.084500> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.722000,0.000000,38.290500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.722000,0.000000,41.084500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<60.198000,0.000000,41.084500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<60.198000,0.000000,38.290500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.198000,0.000000,38.036500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,38.036500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.198000,0.000000,38.036500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.198000,0.000000,41.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,41.338500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.198000,0.000000,41.338500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,0.000000,38.290500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.976000,0.000000,38.290500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,38.671500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,38.163500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,38.163500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,40.703500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,41.211500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.960000,0.000000,41.211500> }
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<60.960000,0.000000,39.941500>}
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<60.960000,0.000000,39.433500>}
//JS silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,31.178500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,31.178500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.278000,0.000000,31.178500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<65.278000,0.000000,29.400500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<68.072000,0.000000,29.400500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<68.072000,0.000000,30.924500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<65.278000,0.000000,30.924500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,0.000000,30.924500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.024000,0.000000,29.400500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.024000,0.000000,29.400500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.326000,0.000000,30.924500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.326000,0.000000,29.400500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.326000,0.000000,29.400500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,29.146500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.278000,0.000000,29.146500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.278000,0.000000,29.146500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.659000,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.151000,0.000000,30.162500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<65.151000,0.000000,30.162500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.691000,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.199000,0.000000,30.162500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<67.691000,0.000000,30.162500> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<66.929000,0.000000,30.162500>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<66.421000,0.000000,30.162500>}
//JV silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,-1.536000,42.354500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,-1.536000,39.560500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.019000,-1.536000,39.560500> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.797000,-1.536000,42.354500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.797000,-1.536000,39.560500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.273000,-1.536000,39.560500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.273000,-1.536000,42.354500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,-1.536000,42.608500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,42.608500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,-1.536000,42.608500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,-1.536000,39.306500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.797000,-1.536000,39.306500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.273000,-1.536000,39.306500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,-1.536000,39.560500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,-1.536000,42.354500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.051000,-1.536000,42.354500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,-1.536000,41.973500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,-1.536000,42.481500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.035000,-1.536000,42.481500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,-1.536000,39.941500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,-1.536000,39.433500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.035000,-1.536000,39.433500> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<26.035000,-1.536000,40.703500>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<26.035000,-1.536000,41.211500>}
//JX silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.290250,-1.536000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.290250,-1.536000,39.878000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.290250,-1.536000,39.878000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.068250,-1.536000,42.672000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.068250,-1.536000,39.878000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.544250,-1.536000,39.878000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.544250,-1.536000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.544250,-1.536000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.068250,-1.536000,42.926000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.544250,-1.536000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.544250,-1.536000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.068250,-1.536000,39.624000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.544250,-1.536000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.322250,-1.536000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.322250,-1.536000,42.672000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.322250,-1.536000,42.672000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.306250,-1.536000,42.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.306250,-1.536000,42.799000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.306250,-1.536000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.306250,-1.536000,40.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.306250,-1.536000,39.751000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.306250,-1.536000,39.751000> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<37.306250,-1.536000,41.021000>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<37.306250,-1.536000,41.529000>}
//RES silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.975000,0.000000,46.196250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.155000,0.000000,46.196250>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.155000,0.000000,46.196250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.975000,0.000000,47.466250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.155000,0.000000,47.466250>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.155000,0.000000,47.466250> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<5.833600,0.000000,46.829750>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-180.000000,0> translate<7.306800,0.000000,46.829750>}
//RJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.687200,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.687200,0.000000,33.667700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<62.687200,0.000000,33.667700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.312800,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.312800,0.000000,33.667700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<64.312800,0.000000,33.667700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<63.500000,0.000000,34.023300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<63.500000,0.000000,31.381700>}
//RJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,-1.536000,27.006550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.262300,-1.536000,27.006550>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<41.262300,-1.536000,27.006550> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,-1.536000,25.380950>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.262300,-1.536000,25.380950>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<41.262300,-1.536000,25.380950> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<40.906700,-1.536000,26.193750>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<43.548300,-1.536000,26.193750>}
//RJ3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.895034,-1.536000,36.014503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.539016,-1.536000,34.658484>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.539016,-1.536000,34.658484> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.044506,-1.536000,34.865031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.688488,-1.536000,33.509013>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.688488,-1.536000,33.509013> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-45.000000,0> translate<19.862306,-1.536000,33.832303>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-45.000000,0> translate<21.730197,-1.536000,35.700194>}
//RJ4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.284550,-1.536000,41.357791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.658247,-1.536000,40.341563>}
box{<0,0,-0.076200><1.917702,0.036000,0.076200> rotate<0,-31.997917,0> translate<20.658247,-1.536000,40.341563> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.145984,-1.536000,39.979203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.519684,-1.536000,38.962978>}
box{<0,0,-0.076200><1.917698,0.036000,0.076200> rotate<0,-31.997887,0> translate<21.519684,-1.536000,38.962978> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-32.000000,0> translate<20.787400,-1.536000,39.463831>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-32.000000,0> translate<23.027603,-1.536000,40.863666>}
//RJ5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.712137,0.000000,44.129038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.612191,0.000000,42.558150>}
box{<0,0,-0.076200><1.917699,0.036000,0.076200> rotate<0,-54.996380,0> translate<63.612191,0.000000,42.558150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.380522,0.000000,45.061444>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.280575,0.000000,43.490556>}
box{<0,0,-0.076200><1.917699,0.036000,0.076200> rotate<0,-54.996380,0> translate<62.280575,0.000000,43.490556> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-55.000000,0> translate<62.742419,0.000000,42.733063>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-55.000000,0> translate<64.257578,0.000000,44.896934>}
//RJ6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.097500,0.000000,8.077200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.179800,0.000000,8.077200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<16.179800,0.000000,8.077200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.097500,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.179800,0.000000,9.702800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<16.179800,0.000000,9.702800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<15.824200,0.000000,8.890000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<18.465800,0.000000,8.890000>}
//RJ7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,-1.536000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.427200,-1.536000,42.532300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.427200,-1.536000,42.532300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.052800,-1.536000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.052800,-1.536000,42.532300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.052800,-1.536000,42.532300> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<15.240000,-1.536000,42.176700>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<15.240000,-1.536000,44.818300>}
//RJ8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,11.290300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.782700,0.000000,11.290300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,11.290300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,9.664700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.782700,0.000000,9.664700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,9.664700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<65.138300,0.000000,10.477500>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<62.496700,0.000000,10.477500>}
//RJ9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.934700,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.934700,0.000000,17.157700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<10.934700,0.000000,17.157700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.560300,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.560300,0.000000,17.157700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<12.560300,0.000000,17.157700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<11.747500,0.000000,17.513300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<11.747500,0.000000,14.871700>}
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,7.112000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,6.858000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.763000,-1.536000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,6.858000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,7.112000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,13.208000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,13.462000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.763000,-1.536000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,13.462000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,-1.536000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,7.620000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,-1.536000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,7.112000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.065000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,7.112000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,13.208000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,13.208000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,13.208000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<12.065000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,13.208000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,11.430000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<8.255000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,11.430000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.795000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,8.890000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<8.255000,-1.536000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,8.890000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<8.255000,-1.536000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.477000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,11.430000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<6.477000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,11.430000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<6.731000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.477000,-1.536000,8.890000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<6.477000,-1.536000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,11.430000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,90.000000,0> translate<12.319000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.573000,-1.536000,9.017000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<12.319000,-1.536000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.573000,-1.536000,11.430000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<12.319000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,12.319000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,11.430000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,12.319000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,-1.536000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,8.001000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,8.890000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,11.430000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,12.319000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,12.319000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,9.017000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,8.001000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,7.112000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,7.112000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,13.208000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,13.208000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,-1.536000,8.890000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.684000,-1.536000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,-1.536000,11.430000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.239000,-1.536000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,12.573000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.255000,-1.536000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,-1.536000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,-1.536000,12.573000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,-1.536000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,-1.536000,12.319000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,15.944344,0> translate<9.017000,-1.536000,12.573000> }
difference{
cylinder{<9.525000,0,10.160000><9.525000,0.036000,10.160000>1.854200 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,10.160000><9.525000,0.135000,10.160000>1.701800 translate<0,-1.536000,0>}}
difference{
cylinder{<11.684000,0,12.319000><11.684000,0.036000,12.319000>0.584200 translate<0,-1.536000,0>}
cylinder{<11.684000,-0.1,12.319000><11.684000,0.135000,12.319000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<11.557000,0,8.001000><11.557000,0.036000,8.001000>0.584200 translate<0,-1.536000,0>}
cylinder{<11.557000,-0.1,8.001000><11.557000,0.135000,8.001000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<7.366000,0,8.001000><7.366000,0.036000,8.001000>0.584200 translate<0,-1.536000,0>}
cylinder{<7.366000,-0.1,8.001000><7.366000,0.135000,8.001000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<7.366000,0,12.319000><7.366000,0.036000,12.319000>0.584200 translate<0,-1.536000,0>}
cylinder{<7.366000,-0.1,12.319000><7.366000,0.135000,12.319000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<9.525000,0,10.160000><9.525000,0.036000,10.160000>0.660400 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,10.160000><9.525000,0.135000,10.160000>0.609600 translate<0,-1.536000,0>}}
difference{
cylinder{<9.525000,0,10.160000><9.525000,0.036000,10.160000>0.330200 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,10.160000><9.525000,0.135000,10.160000>0.177800 translate<0,-1.536000,0>}}
//S2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,25.273000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,25.527000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.763000,-1.536000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,25.527000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,-1.536000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,25.273000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,19.177000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,18.923000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.763000,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,18.923000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,24.765000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<12.065000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,25.273000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,-1.536000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,25.273000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,19.177000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.065000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,19.177000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,19.177000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,-1.536000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,19.177000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.985000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,20.955000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<8.255000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,20.955000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<8.255000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<8.255000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,23.495000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<8.255000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.795000,-1.536000,23.495000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.795000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.573000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,20.955000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<12.319000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,20.955000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<12.319000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.319000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<12.573000,-1.536000,23.495000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<12.319000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,20.955000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,-90.000000,0> translate<6.731000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.477000,-1.536000,23.368000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<6.477000,-1.536000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.731000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<6.477000,-1.536000,20.955000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<6.477000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,24.384000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,-1.536000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,20.066000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,20.955000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,20.066000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,-1.536000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,24.384000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,23.495000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,20.955000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,20.066000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,-1.536000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,23.368000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,-1.536000,24.384000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,-1.536000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,25.273000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,25.273000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,-1.536000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,-1.536000,19.177000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,-1.536000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,-1.536000,19.177000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,-1.536000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,-1.536000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,-1.536000,23.495000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.366000,-1.536000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,-1.536000,20.955000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.811000,-1.536000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,-1.536000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,-1.536000,19.812000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.033000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,-1.536000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,-1.536000,19.812000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.255000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,-1.536000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,-1.536000,20.066000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,15.944344,0> translate<9.144000,-1.536000,20.066000> }
difference{
cylinder{<9.525000,0,22.225000><9.525000,0.036000,22.225000>1.854200 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,22.225000><9.525000,0.135000,22.225000>1.701800 translate<0,-1.536000,0>}}
difference{
cylinder{<7.366000,0,20.066000><7.366000,0.036000,20.066000>0.584200 translate<0,-1.536000,0>}
cylinder{<7.366000,-0.1,20.066000><7.366000,0.135000,20.066000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<7.493000,0,24.384000><7.493000,0.036000,24.384000>0.584200 translate<0,-1.536000,0>}
cylinder{<7.493000,-0.1,24.384000><7.493000,0.135000,24.384000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<11.684000,0,24.384000><11.684000,0.036000,24.384000>0.584200 translate<0,-1.536000,0>}
cylinder{<11.684000,-0.1,24.384000><11.684000,0.135000,24.384000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<11.684000,0,20.066000><11.684000,0.036000,20.066000>0.584200 translate<0,-1.536000,0>}
cylinder{<11.684000,-0.1,20.066000><11.684000,0.135000,20.066000>0.431800 translate<0,-1.536000,0>}}
difference{
cylinder{<9.525000,0,22.225000><9.525000,0.036000,22.225000>0.660400 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,22.225000><9.525000,0.135000,22.225000>0.609600 translate<0,-1.536000,0>}}
difference{
cylinder{<9.525000,0,22.225000><9.525000,0.036000,22.225000>0.330200 translate<0,-1.536000,0>}
cylinder{<9.525000,-0.1,22.225000><9.525000,0.135000,22.225000>0.177800 translate<0,-1.536000,0>}}
//U$1 silk screen
//U$2 silk screen
//USB silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,20.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,20.505000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.567500,-1.536000,20.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,20.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,8.705000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<80.317500,-1.536000,8.705000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,8.705000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,8.705000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.567500,-1.536000,8.705000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,8.705000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,20.505000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.567500,-1.536000,20.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.187500,-1.536000,20.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,20.505000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<72.187500,-1.536000,20.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.252500,-1.536000,8.705000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,8.705000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.567500,-1.536000,8.705000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.567500,-1.536000,20.505000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.252500,-1.536000,20.505000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.567500,-1.536000,20.505000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<80.317500,-1.536000,8.705000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<72.187500,-1.536000,8.705000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<72.187500,-1.536000,8.705000> }
//X2 silk screen
//Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<55.816500,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<55.816500,-1.536000,33.274000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,-90.000000,0> translate<55.816500,-1.536000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<51.244500,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<51.244500,-1.536000,33.274000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,-90.000000,0> translate<51.244500,-1.536000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.308500,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.308500,-1.536000,33.274000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.308500,-1.536000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.752500,-1.536000,39.116000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.752500,-1.536000,39.116000> }
object{ARC(1.778000,0.152400,180.000000,360.000000,0.036000) translate<53.530500,-1.536000,33.274000>}
object{ARC(2.286000,0.406400,180.000000,360.000000,0.036000) translate<53.530500,-1.536000,33.274000>}
object{ARC(2.286000,0.406400,0.000000,180.000000,0.036000) translate<53.530500,-1.536000,39.116000>}
object{ARC(1.778000,0.152400,0.000000,180.000000,0.036000) translate<53.530500,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,35.941000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.641500,-1.536000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,35.941000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.641500,-1.536000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,36.449000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.419500,-1.536000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,36.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,36.449000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.641500,-1.536000,36.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,35.560000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.641500,-1.536000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,35.560000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.530500,-1.536000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.641500,-1.536000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,36.830000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.641500,-1.536000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.419500,-1.536000,36.830000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.530500,-1.536000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,34.925000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.530500,-1.536000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.530500,-1.536000,37.465000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.530500,-1.536000,37.465000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  HWPROGUSB(-40.650000,0,-26.822500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//1R21	2k	R1206W
//2D1	PL-2303XA	SSOP28DB
//2R2	220k	R1206W
//2R6	220k	R1206W
//3C2	470µ / 10V	RCL_E3,5-8
//3C3	100µ 16V	RCL_E3,5-8
//4VT2	IRML6402	SUPER-SOT3
//HW	High Voltage Enable	PINHEAD_1X02
//JP2	Selfprogramming	JUMPER_JP2
//RES	0R-JUMPA	A0R-JMP
//U$1	5.08	KEY
//U$2	5.08	KEY
//USB		PROGRAMMER_PN61729-S
//X2	P_AVR_P	P_AVR
