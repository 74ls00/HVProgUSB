//POVRay-File created by 3d41.ulp v20110101
//C:/Users/LED/Documents/Documents/Projects/EAGLE/HVProg/programmer/HWProgUSB.brd
//2015-09-11 21:00:23

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
#declare global_seed=seed(712);
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
<0.000000,0.000000><79.990000,0.000000>
<79.990000,0.000000><79.990000,52.375000>
<79.990000,52.375000><0.000000,52.375000>
<0.000000,52.375000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbruche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<40.957500,-1.500000,20.637500>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C1 100n C0805
#ifndef(pack_ZC2) #declare global_pack_ZC2=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<65.881250,-1.500000,5.080000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C2 100n C0805
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<24.288750,-1.500000,36.671250>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C4 33p C0805
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<23.971250,-1.500000,33.020000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C5 33p C0805
#ifndef(pack_ZC8) #declare global_pack_ZC8=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<71.120000,-1.500000,13.335000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C8 100n C0805
#ifndef(pack_ZC9) #declare global_pack_ZC9=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<69.215000,-1.500000,29.845000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 1C9 100n C0805
#ifndef(pack_ZD1) #declare global_pack_ZD1=yes; object {QFP_TQFP_44_080MM("MEGA8535-A","ATMEL",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<40.957500,-1.500000,33.655000>translate<0,-0.035000,0> }#end		//TQFP-44 1D1 MEGA8535-A TQFP44
#ifndef(pack_ZD2) #declare global_pack_ZD2=yes; object {IC_SMD_SO16("74HC165D","PHILIPS",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<63.817500,-1.500000,33.972500>translate<0,-0.035000,0> }#end		//SMD IC SO16 Package 1D2 74HC165D SO16
#ifndef(pack_ZHL1) #declare global_pack_ZHL1=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.815000,0.000000,24.130000>}#end		//Diskrete 5MM LED 1HL1 red LED5MM
#ifndef(pack_ZHL2) #declare global_pack_ZHL2=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<50.165000,0.000000,24.130000>}#end		//Diskrete 5MM LED 1HL2 green LED5MM
#ifndef(pack_ZHL3) #declare global_pack_ZHL3=yes; object {DIODE_DIS_LED_5MM(Yellow,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<56.515000,0.000000,24.130000>}#end		//Diskrete 5MM LED 1HL3 yellow LED5MM
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<77.152500,-1.500000,19.367500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R1 10k M0805
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_SMD_CHIP_0805("152",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<46.355000,-1.500000,21.907500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R2 1k5 M0805
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("152",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<50.165000,-1.500000,19.843750>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R3 1k5 M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("363",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<52.705000,-1.500000,31.115000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R4 36k M0805
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_1206("154",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<50.482500,-1.500000,31.432500>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 1R5 150k R1206
#ifndef(pack_ZR6) #declare global_pack_ZR6=yes; object {RES_SMD_CHIP_1206("223",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<66.040000,-1.500000,20.955000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 1R6 22k M1206
#ifndef(pack_ZR8) #declare global_pack_ZR8=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<69.850000,-1.500000,36.195000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R8 10k M0805
#ifndef(pack_ZR9) #declare global_pack_ZR9=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<65.405000,-1.500000,26.987500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R9 10k M0805
#ifndef(pack_ZR10) #declare global_pack_ZR10=yes; object {RES_SMD_CHIP_0805("473",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<76.200000,-1.500000,23.812500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R10 47k M0805
#ifndef(pack_ZR16) #declare global_pack_ZR16=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<67.945000,0.000000,37.465000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R16 10k R0805
#ifndef(pack_ZR17) #declare global_pack_ZR17=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<59.372500,-1.500000,14.287500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R17 10k M0805
#ifndef(pack_ZR18) #declare global_pack_ZR18=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<56.515000,-1.500000,15.240000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R18 10k M0805
#ifndef(pack_ZR19) #declare global_pack_ZR19=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<63.500000,0.000000,33.813750>translate<0,0.035000,0> }#end		//SMD Resistor 0805 1R19 1k M0805
#ifndef(pack_ZR20) #declare global_pack_ZR20=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<61.912500,-1.500000,14.287500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 1R20 10k M0805
#ifndef(pack_ZVD1) #declare global_pack_ZVD1=yes; object {DIODE_SMD_SMB()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<68.897500,0.000000,31.273750>translate<0,0.035000,0> }#end		//DO214 AA 1VD1 SS12 SMB
#ifndef(pack_ZVD2) #declare global_pack_ZVD2=yes; object {DIODE_SMD_SMB()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<58.102500,0.000000,16.192500>translate<0,0.035000,0> }#end		//DO214 AA 1VD2 SB130 SMB
#ifndef(pack_ZVT1) #declare global_pack_ZVT1=yes; object {IC_SMD_SOT23("BC847","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<60.960000,-1.500000,10.953750>translate<0,-0.035000,0> }#end		//SOT23 1VT1 BC847 SOT23
#ifndef(pack_ZVT2) #declare global_pack_ZVT2=yes; object {IC_SMD_SOT23("BC857","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<56.197500,-1.500000,19.526250>translate<0,-0.035000,0> }#end		//SOT23 1VT2 BC857 SOT23-BEC
#ifndef(pack_ZVT3) #declare global_pack_ZVT3=yes; object {IC_SMD_SOT23("BC847","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<65.087500,0.000000,37.147500>translate<0,0.035000,0> }#end		//SOT23 1VT3 BC847 SOT23
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<12.065000,-1.500000,48.895000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 2C1 20 C0805
#ifndef(pack_ZC2) #declare global_pack_ZC2=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<9.525000,-1.500000,47.625000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 2C2 20 C0805
#ifndef(pack_ZC3) #declare global_pack_ZC3=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<4.127500,-1.500000,49.053750>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 2C3 100n C0805
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_SMD_CHIP_1210()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<3.810000,-1.500000,44.767500>translate<0,-0.035000,0> }#end		//SMD Capacitor 1210 2C4 10mf C1210
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<10.795000,-1.500000,25.400000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 2C5 1mf C0805
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0603("224",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<12.065000,-1.500000,42.862500>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R1 220k R0603
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0603("101",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<6.350000,-1.500000,15.557500>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R3 100 R0603
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0603("101",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<6.350000,-1.500000,13.970000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R4 100 R0603
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_0603("152",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<6.350000,-1.500000,12.382500>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R5 1.5k R0603
#ifndef(pack_ZR7) #declare global_pack_ZR7=yes; object {RES_SMD_CHIP_0603("224",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<7.302500,-1.500000,24.606250>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R7 220k R0603
#ifndef(pack_ZR8) #declare global_pack_ZR8=yes; object {RES_SMD_CHIP_0603("224",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<5.080000,-1.500000,25.400000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R8 220k R0603
#ifndef(pack_ZR9) #declare global_pack_ZR9=yes; object {RES_SMD_CHIP_0603("224",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<6.508750,-1.500000,29.527500>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R9 220k R0603
#ifndef(pack_ZR10) #declare global_pack_ZR10=yes; object {RES_SMD_CHIP_0603("224",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<4.921250,-1.500000,29.210000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 2R10 220k R0603
#ifndef(pack_ZZ1) #declare global_pack_ZZ1=yes; object {SPC_XTAL_5MM("12MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.842500,0.000000,46.672500>}#end		//Quarz 4,9MM 2Z1 12MHz HC49/S
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_DIS_CERAMIC_25MM_44MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.542500,0.000000,17.303750>}#end		//ceramic disc capacitator 3C1 100n C025-024X044
#ifndef(pack_ZC4) #declare global_pack_ZC4=yes; object {CAP_DIS_CERAMIC_25MM_50MM("1n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<36.512500,0.000000,7.302500>}#end		//ceramic disc capacitator 3C4 1n C025-025X050
#ifndef(pack_ZC5) #declare global_pack_ZC5=yes; object {CAP_DIS_CERAMIC_25MM_50MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<50.800000,0.000000,7.620000>}#end		//ceramic disc capacitator 3C5 100n C025-025X050
#ifndef(pack_ZD1) #declare global_pack_ZD1=yes; object {IC_SMD_SO8("MC34063AD","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<31.115000,-1.500000,6.985000>translate<0,-0.035000,0> }#end		//SMD IC SO8 Package 3D1 MC34063AD SOIC8
#ifndef(pack_ZL1) #declare global_pack_ZL1=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.432500,0.000000,13.017500>}#end		//Discrete Resistor 0,3W 10MM Grid 3L1 100uh 0207/10
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_DIS_0204_075MM(texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{T_Silver_5E finish{reflection 0.1 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.955000,0.000000,4.127500>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R1 0.5-1 0204/7
#ifndef(pack_ZR1A) #declare global_pack_ZR1A=yes; object {RES_DIS_0204_075MM(texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{checker Black White}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.955000,0.000000,1.746250>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R1A  0204/7
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_DIS_0204_075MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<28.416250,0.000000,6.667500>}#end		//Discrete Resistor 0,15W 7,5MM Grid 3R2 220 0204/7
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("222",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<32.702500,-1.500000,3.175000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 3R3 2k2 M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("203",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<37.465000,-1.500000,3.175000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 3R4 20k M0805
#ifndef(pack_ZVD1) #declare global_pack_ZVD1=yes; object {DIODE_SMD_SMB()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<39.687500,-1.500000,9.207500>translate<0,-0.035000,0> }#end		//DO214 AA 3VD1 SS12 SMB
#ifndef(pack_ZC1) #declare global_pack_ZC1=yes; object {CAP_SMD_CHIP_1206()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<51.752500,0.000000,32.861250>translate<0,0.035000,0> }#end		//SMD Capacitor 1206 4C1 10n C1206
#ifndef(pack_ZR1) #declare global_pack_ZR1=yes; object {RES_SMD_CHIP_0805("222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-305.000000,0> rotate<0,0,0> translate<36.988750,0.000000,38.893750>translate<0,0.035000,0> }#end		//SMD Resistor 0805 4R1 2k2 M0805
#ifndef(pack_ZR2) #declare global_pack_ZR2=yes; object {RES_SMD_CHIP_1206("222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<49.212500,0.000000,32.861250>translate<0,0.035000,0> }#end		//SMD Resistor 1206 4R2 2k2 M1206
#ifndef(pack_ZR3) #declare global_pack_ZR3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.990000,0.000000,35.242500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 4R3 10k M0805
#ifndef(pack_ZR4) #declare global_pack_ZR4=yes; object {RES_SMD_CHIP_0805("152",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<51.593750,0.000000,37.465000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 4R4 1.5k M0805
#ifndef(pack_ZR5) #declare global_pack_ZR5=yes; object {RES_SMD_CHIP_0805("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.371250,0.000000,41.592500>translate<0,0.035000,0> }#end		//SMD Resistor 0805 4R5 1k M0805
#ifndef(pack_ZVT1) #declare global_pack_ZVT1=yes; object {IC_SMD_SOT23("BC847","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.815000,0.000000,35.560000>translate<0,0.035000,0> }#end		//SOT23 4VT1 BC847 SOT23
#ifndef(pack_ZVT3) #declare global_pack_ZVT3=yes; object {IC_SMD_SOT23("IRML2502","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<46.037500,0.000000,40.322500>translate<0,0.035000,0> }#end		//SOT23 4VT3 IRML2502 SOT23
#ifndef(pack_ISP6) #declare global_pack_ISP6=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<74.930000,0.000000,35.560000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) ISP6  MA03-2
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper J1 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper J2 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JI 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JO 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JR 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JS 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JV 
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper JX 
#ifndef(pack_RJ1) #declare global_pack_RJ1=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<17.145000,-1.500000,32.067500>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ1 0 R1206
#ifndef(pack_RJ2) #declare global_pack_RJ2=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.417500,0.000000,25.558750>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ2 0 R1206
#ifndef(pack_RJ3) #declare global_pack_RJ3=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-135.000000,0> rotate<0,0,0> translate<59.848750,0.000000,34.131250>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ3 0 R1206
#ifndef(pack_RJ4) #declare global_pack_RJ4=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-148.000000,0> rotate<0,0,0> translate<58.737500,0.000000,39.528750>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ4 0 R1206
#ifndef(pack_RJ5) #declare global_pack_RJ5=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-55.000000,0> rotate<0,0,180> translate<17.145000,-1.500000,43.180000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ5 0 R1206
#ifndef(pack_RJ6) #declare global_pack_RJ6=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<63.500000,-1.500000,8.255000>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ6 0 R1206
#ifndef(pack_RJ7) #declare global_pack_RJ7=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<65.405000,0.000000,42.862500>translate<0,0.035000,0> }#end		//SMD Resistor 1206 RJ7 0 R1206
#ifndef(pack_RJ8) #declare global_pack_RJ8=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<16.827500,-1.500000,9.842500>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ8 0 R1206
#ifndef(pack_RJ9) #declare global_pack_RJ9=yes; object {RES_SMD_CHIP_1206("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<68.897500,-1.500000,15.557500>translate<0,-0.035000,0> }#end		//SMD Resistor 1206 RJ9 0 R1206
#ifndef(pack_S1) #declare global_pack_S1=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<71.120000,0.000000,9.525000>}#end		//Tactile Switch-Omron S1  B3F-10XX
#ifndef(pack_S2) #declare global_pack_S2=yes; object {SWITCH_B3F_10XX1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<71.120000,0.000000,21.590000>}#end		//Tactile Switch-Omron S2  B3F-10XX
#ifndef(pack_Z1) #declare global_pack_Z1=yes; object {SPC_XTAL_5MM("7,3728MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.114500,0.000000,35.560000>}#end		//Quarz 4,9MM Z1 7,3728MHz HC49U-V
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.007500,-1.537000,20.637500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.907500,-1.537000,20.637500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.831250,-1.537000,5.080000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.931250,-1.537000,5.080000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.338750,-1.537000,36.671250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.238750,-1.537000,36.671250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.021250,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.921250,-1.537000,33.020000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<70.170000,-1.537000,13.335000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<72.070000,-1.537000,13.335000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<69.215000,-1.537000,28.895000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<69.215000,-1.537000,30.795000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,29.655000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,30.455000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,31.255000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,32.055000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,32.855000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,33.655000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,34.455000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,35.255000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,36.055000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,36.855000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.157500,-1.537000,37.655000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.957500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.757500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.557500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.357500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.157500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.957500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.757500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.557500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.357500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.157500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.957500,-1.537000,39.455000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,37.655000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,36.855000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,36.055000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,35.255000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,34.455000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,33.655000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,32.855000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,32.055000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,31.255000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,30.455000>}
object{TOOLS_PCB_SMD(1.500000,0.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.757500,-1.537000,29.655000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.957500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.157500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.357500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.557500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.757500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.957500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.157500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.357500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.557500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.757500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.957500,-1.537000,27.855000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,29.527500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,30.797500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,32.067500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,33.337500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,34.607500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,35.877500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,37.147500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<60.744100,-1.537000,38.417500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,38.417500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,37.147500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,35.877500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,34.607500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,33.337500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,32.067500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,30.797500>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.890900,-1.537000,29.527500>}
#ifndef(global_pack_ZHL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.815000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_ZHL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<43.815000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_ZHL2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.165000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_ZHL2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.165000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_ZHL3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<56.515000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_ZHL3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<56.515000,0,25.400000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<78.102500,-1.537000,19.367500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<76.202500,-1.537000,19.367500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.355000,-1.537000,22.857500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.355000,-1.537000,20.957500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.165000,-1.537000,20.793750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.165000,-1.537000,18.893750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.705000,-1.537000,30.165000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.705000,-1.537000,32.065000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.482500,-1.537000,32.854500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.482500,-1.537000,30.010500>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<67.440000,-1.537000,20.955000>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.640000,-1.537000,20.955000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<69.850000,-1.537000,37.145000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<69.850000,-1.537000,35.245000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.355000,-1.537000,26.987500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.455000,-1.537000,26.987500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<76.200000,-1.537000,22.862500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<76.200000,-1.537000,24.762500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<67.945000,0.000000,38.415000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<67.945000,0.000000,36.515000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<59.372500,-1.537000,13.337500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<59.372500,-1.537000,15.237500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.465000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.565000,-1.537000,15.240000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<63.500000,0.000000,34.763750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<63.500000,0.000000,32.863750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<61.912500,-1.537000,13.337500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<61.912500,-1.537000,15.237500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<53.181250,-1.537000,23.724000>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<53.181250,-1.537000,20.726000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<66.697500,0.000000,31.273750>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<71.097500,0.000000,31.273750>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.902500,0.000000,16.192500>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<60.302500,0.000000,16.192500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<62.060000,-1.537000,11.903750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<62.060000,-1.537000,10.003750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<59.860000,-1.537000,10.953750>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<57.147500,-1.537000,18.426250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<56.197500,-1.537000,20.626250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<55.247500,-1.537000,18.426250>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.187500,0.000000,36.197500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.187500,0.000000,38.097500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<63.987500,0.000000,37.147500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.215000,-1.537000,48.895000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.915000,-1.537000,48.895000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.525000,-1.537000,48.475000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.525000,-1.537000,46.775000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.127500,-1.537000,49.903750>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.127500,-1.537000,48.203750>}
object{TOOLS_PCB_SMD(1.600000,2.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.810000,-1.537000,46.167500>}
object{TOOLS_PCB_SMD(1.600000,2.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.810000,-1.537000,43.367500>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.745000,-1.537000,25.400000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.845000,-1.537000,25.400000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.067500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.417500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.767500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.117500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.467500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.817500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.167500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.517500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.867500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.217500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.567500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.917500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.267500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.617500,-1.537000,32.221500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.617500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.267500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.917500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.567500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.217500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.867500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.517500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.167500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.817500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.467500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.117500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.767500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.417500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.067500,-1.537000,39.533500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.915000,-1.537000,42.862500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.215000,-1.537000,42.862500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.438500,-1.537000,43.180000>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.436500,-1.537000,43.180000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.200000,-1.537000,15.557500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.500000,-1.537000,15.557500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.200000,-1.537000,13.970000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.500000,-1.537000,13.970000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<5.500000,-1.537000,12.382500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<7.200000,-1.537000,12.382500>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.246500,-1.537000,23.336250>}
object{TOOLS_PCB_SMD(1.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.248500,-1.537000,23.336250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.452500,-1.537000,24.606250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.152500,-1.537000,24.606250>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<5.080000,-1.537000,24.550000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<5.080000,-1.537000,26.250000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.508750,-1.537000,28.677500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<6.508750,-1.537000,30.377500>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.921250,-1.537000,28.360000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.921250,-1.537000,30.060000>}
#ifndef(global_pack_ZZ1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<7.429500,0,46.672500> texture{col_thl}}
#ifndef(global_pack_ZZ1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<12.255500,0,46.672500> texture{col_thl}}
#ifndef(global_pack_ZC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.272500,0,17.303750> texture{col_thl}}
#ifndef(global_pack_ZC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<23.812500,0,17.303750> texture{col_thl}}
#ifndef(global_pack_ZC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<21.431250,0,8.382000> texture{col_thl}}
#ifndef(global_pack_ZC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.431250,0,11.938000> texture{col_thl}}
#ifndef(global_pack_ZC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.767500,0,8.382000> texture{col_thl}}
#ifndef(global_pack_ZC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<44.767500,0,11.938000> texture{col_thl}}
#ifndef(global_pack_ZC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.512500,0,6.032500> texture{col_thl}}
#ifndef(global_pack_ZC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.512500,0,8.572500> texture{col_thl}}
#ifndef(global_pack_ZC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_ZC5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.715000,-1.537000,8.890000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.715000,-1.537000,7.620000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.715000,-1.537000,6.350000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.715000,-1.537000,5.080000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.515000,-1.537000,5.080000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.515000,-1.537000,6.350000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.515000,-1.537000,7.620000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.515000,-1.537000,8.890000>}
#ifndef(global_pack_ZL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.352500,0,13.017500> texture{col_thl}}
#ifndef(global_pack_ZL1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<36.512500,0,13.017500> texture{col_thl}}
#ifndef(global_pack_ZR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.145000,0,4.127500> texture{col_thl}}
#ifndef(global_pack_ZR1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.765000,0,4.127500> texture{col_thl}}
#ifndef(global_pack_ZR1A) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.145000,0,1.746250> texture{col_thl}}
#ifndef(global_pack_ZR1A) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.765000,0,1.746250> texture{col_thl}}
#ifndef(global_pack_ZR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<28.416250,0,10.477500> texture{col_thl}}
#ifndef(global_pack_ZR2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<28.416250,0,2.857500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.652500,-1.537000,3.175000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.752500,-1.537000,3.175000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.515000,-1.537000,3.175000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.415000,-1.537000,3.175000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.687500,-1.537000,11.407500>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.687500,-1.537000,7.007500>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<51.752500,0.000000,34.261250>}
object{TOOLS_PCB_SMD(1.600000,1.800000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<51.752500,0.000000,31.461250>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-305.000000,0> texture{col_pds} translate<36.443850,0.000000,39.671944>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-305.000000,0> texture{col_pds} translate<37.533647,0.000000,38.115553>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.212500,0.000000,31.461250>}
object{TOOLS_PCB_SMD(1.600000,2.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<49.212500,0.000000,34.261250>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.990000,0.000000,36.192500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.990000,0.000000,34.292500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<52.543750,0.000000,37.465000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.643750,0.000000,37.465000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.321250,0.000000,41.592500>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.421250,0.000000,41.592500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.915000,0.000000,34.610000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.915000,0.000000,36.510000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.715000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.802500,0.000000,39.222500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.702500,0.000000,39.222500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.752500,0.000000,41.422500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.987500,0.000000,41.422500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.087500,0.000000,41.422500>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<46.037500,0.000000,39.222500>}
#ifndef(global_pack_HW) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<62.071250,0,23.971250> texture{col_thl}}
#ifndef(global_pack_HW) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<62.071250,0,21.431250> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<76.200000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<76.200000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<76.200000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_ISP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<73.660000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.145500,-1.537000,44.132500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.669500,-1.537000,44.132500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.145500,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.669500,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.160500,-1.537000,27.305000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.684500,-1.537000,27.305000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.780500,-1.537000,39.687500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.304500,-1.537000,39.687500>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<77.470000,0,42.862500> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,42.862500> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<72.390000,0,42.862500> texture{col_thl}}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.685000,-1.537000,39.814500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.685000,-1.537000,38.290500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.208000,-1.537000,29.527500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.732000,-1.537000,29.527500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<54.610000,0.000000,39.560500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<54.610000,0.000000,41.084500>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.338750,0.000000,39.878000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.338750,0.000000,41.402000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<73.230000,-1.537000,46.196250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<74.930000,-1.537000,46.196250>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<76.630000,-1.537000,46.196250>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.145000,-1.537000,33.489500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.145000,-1.537000,30.645500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.839500,0.000000,25.558750>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.995500,0.000000,25.558750>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-135.000000,0> texture{col_pds} translate<60.854253,0.000000,33.125744>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-135.000000,0> texture{col_pds} translate<58.843244,0.000000,35.136753>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-148.000000,0> texture{col_pds} translate<59.943422,0.000000,38.775203>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-148.000000,0> texture{col_pds} translate<57.531575,0.000000,40.282294>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-125.000000,0> texture{col_pds} translate<17.960628,-1.537000,42.015166>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-125.000000,0> texture{col_pds} translate<16.329375,-1.537000,44.344831>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<64.922000,-1.537000,8.255000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<62.078000,-1.537000,8.255000>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<65.405000,0.000000,41.440500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<65.405000,0.000000,44.284500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.405500,-1.537000,9.842500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.249500,-1.537000,9.842500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.897500,-1.537000,16.979500>}
object{TOOLS_PCB_SMD(1.600000,1.803000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<68.897500,-1.537000,14.135500>}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<73.380600,0,12.776200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<73.380600,0,6.273800> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<68.859400,0,12.776200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<68.859400,0,6.273800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<68.859400,0,18.338800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<68.859400,0,24.841200> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<73.380600,0,18.338800> texture{col_thl}}
#ifndef(global_pack_S2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.316000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<73.380600,0,24.841200> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,9.525000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,9.525000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_U_2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.663750,0,12.561250> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.663750,0,15.220000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<13.028750,0,15.220000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.300000,1.000000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<13.028750,0,12.561250> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.000000,1.500000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<10.477500,0,19.990000> texture{col_thl}}
#ifndef(global_pack_USB) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(6.000000,1.500000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<10.477500,0,7.950000> texture{col_thl}}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.482500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.782500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.462500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.002500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.542500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.082500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.622500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.162500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.702500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.242500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<64.452500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<69.532500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.402500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(4.572000,53.848000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.497500,-1.537000,49.530000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<58.102500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.862500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<66.992500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<61.912500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.942500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.022500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<55.562500,0.000000,48.895000>}
object{TOOLS_PCB_SMD(6.000000,2.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.322500,0.000000,48.895000>}
#ifndef(global_pack_Z1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<27.114500,0,37.973000> texture{col_thl}}
#ifndef(global_pack_Z1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.112800,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<27.114500,0,33.147000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<54.610000,0,37.465000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<6.350000,0,22.225000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<6.350000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<53.022500,0,16.192500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<59.372500,0,1.428750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<59.372500,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<18.097500,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<18.097500,0,24.447500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<20.955000,0,24.447500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<25.717500,0,25.717500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<28.575000,0,25.717500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<57.467500,0,37.465000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<54.610000,0,34.607500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<19.685000,0,30.797500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<34.766250,0,27.146250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<69.532500,0,45.085000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<31.432500,0,28.257500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<31.750000,0,25.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<26.511250,0,42.068750> texture{col_thl}}
object{TOOLS_PCB_VIA(5.000000,0.800000,1,16,1,0) translate<2.857500,0,7.937500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<78.898750,0,1.111250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<1.111250,0,1.111250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<1.111250,0,51.276250> texture{col_thl}}
object{TOOLS_PCB_VIA(1.930400,0.800000,1,16,0,0) translate<78.898750,0,51.276250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<57.150000,0,31.591250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<33.337500,0,39.528750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<59.372500,0,19.685000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<36.830000,0,44.132500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<62.547500,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<69.215000,0,41.910000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<34.925000,0,41.910000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<40.640000,0,41.719500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<39.687500,0,44.132500> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<43.497500,0,43.815000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<46.037500,0,43.815000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<48.577500,0,43.815000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<51.117500,0,43.815000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<53.657500,0,43.815000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<56.197500,0,43.973750> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<58.896250,0,44.291250> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<20.002500,0,35.560000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<39.687500,0,14.605000> texture{col_thl}}
object{TOOLS_PCB_VIA(2.300000,0.800000,1,16,1,0) translate<31.432500,0,31.115000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,16.351250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,40.322500>}
box{<0,0,-0.203200><23.971250,0.035000,0.203200> rotate<0,90.000000,0> translate<0.952500,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,47.625000>}
box{<0,0,-0.203200><7.302500,0.035000,0.203200> rotate<0,90.000000,0> translate<0.952500,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,35.877500>}
box{<0,0,-0.203200><18.732500,0.035000,0.203200> rotate<0,90.000000,0> translate<1.905000,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,45.561250>}
box{<0,0,-0.203200><3.333750,0.035000,0.203200> rotate<0,90.000000,0> translate<1.905000,-1.535000,45.561250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.222500,-1.535000,41.910000>}
box{<0,0,-0.203200><0.449013,0.035000,0.203200> rotate<0,44.997030,0> translate<1.905000,-1.535000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.857500,-1.535000,18.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.857500,-1.535000,34.607500>}
box{<0,0,-0.203200><16.407500,0.035000,0.203200> rotate<0,90.000000,0> translate<2.857500,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,-1.535000,49.847500>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.952500,-1.535000,47.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,20.955000>}
box{<0,0,-0.152400><6.032500,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.810000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,29.312500>}
box{<0,0,-0.152400><3.072500,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.810000,-1.535000,29.312500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,45.561250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,46.167500>}
box{<0,0,-0.203200><1.999141,0.035000,0.203200> rotate<0,-17.652063,0> translate<1.905000,-1.535000,45.561250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,27.305000>}
box{<0,0,-0.152400><0.449013,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.810000,-1.535000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,40.322500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.952500,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.810000,-1.535000,46.167500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.127500,-1.535000,48.203750>}
box{<0,0,-0.406400><2.060854,0.035000,0.406400> rotate<0,-81.132227,0> translate<3.810000,-1.535000,46.167500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175000,-1.535000,49.847500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,49.903750>}
box{<0,0,-0.203200><0.954159,0.035000,0.203200> rotate<0,-3.379461,0> translate<3.175000,-1.535000,49.847500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.857500,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342500,-1.535000,36.092500>}
box{<0,0,-0.203200><2.100107,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.857500,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,49.903750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.706250,-1.535000,50.323750>}
box{<0,0,-0.203200><0.715088,0.035000,0.203200> rotate<0,-35.966091,0> translate<4.127500,-1.535000,49.903750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.865000,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.865000,-1.535000,30.162500>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<4.865000,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.952500,-1.535000,16.351250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,12.382500>}
box{<0,0,-0.203200><5.612660,0.035000,0.203200> rotate<0,44.997030,0> translate<0.952500,-1.535000,16.351250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,29.312500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.921250,-1.535000,28.360000>}
box{<0,0,-0.152400><1.463603,0.035000,0.152400> rotate<0,40.598615,0> translate<3.810000,-1.535000,29.312500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.865000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.921250,-1.535000,30.060000>}
box{<0,0,-0.152400><0.116920,0.035000,0.152400> rotate<0,61.238837,0> translate<4.865000,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.977500,-1.535000,41.116250>}
box{<0,0,-0.203200><1.162987,0.035000,0.203200> rotate<0,-43.037232,0> translate<4.127500,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.905000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,13.970000>}
box{<0,0,-0.203200><4.490128,0.035000,0.203200> rotate<0,44.997030,0> translate<1.905000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.182500,-1.535000,26.352500>}
box{<0,0,-0.152400><0.144957,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.080000,-1.535000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.397500,-1.535000,33.972500>}
box{<0,0,-0.152400><2.245064,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.810000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.921250,-1.535000,12.382500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.500000,-1.535000,12.382500>}
box{<0,0,-0.203200><0.578750,0.035000,0.203200> rotate<0,0.000000,0> translate<4.921250,-1.535000,12.382500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.500000,-1.535000,13.970000>}
box{<0,0,-0.203200><0.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.080000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.857500,-1.535000,18.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.500000,-1.535000,15.557500>}
box{<0,0,-0.203200><3.737059,0.035000,0.203200> rotate<0,44.997030,0> translate<2.857500,-1.535000,18.200000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.865000,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.617500,-1.535000,31.232500>}
box{<0,0,-0.152400><0.869184,0.035000,0.152400> rotate<0,-30.029069,0> translate<4.865000,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.617500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.617500,-1.535000,31.232500>}
box{<0,0,-0.152400><0.989000,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.617500,-1.535000,31.232500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,-1.535000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.617500,-1.535000,39.533500>}
box{<0,0,-0.152400><5.210469,0.035000,0.152400> rotate<0,-44.557737,0> translate<1.905000,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.977500,-1.535000,41.116250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.032500,-1.535000,41.116250>}
box{<0,0,-0.152400><1.055000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.977500,-1.535000,41.116250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.222500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.245000,-1.535000,41.910000>}
box{<0,0,-0.203200><4.022500,0.035000,0.203200> rotate<0,0.000000,0> translate<2.222500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,30.142500>}
box{<0,0,-0.152400><2.079000,0.035000,0.152400> rotate<0,-90.000000,0> translate<6.267500,-1.535000,30.142500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.342500,-1.535000,36.092500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,38.017500>}
box{<0,0,-0.152400><2.722361,0.035000,0.152400> rotate<0,-44.997030,0> translate<4.342500,-1.535000,36.092500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,38.017500>}
box{<0,0,-0.152400><1.516000,0.035000,0.152400> rotate<0,-90.000000,0> translate<6.267500,-1.535000,38.017500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<6.350000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<6.350000,0.000000,22.225000>}
box{<0,0,-0.508000><17.145000,0.035000,0.508000> rotate<0,90.000000,0> translate<6.350000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.127500,-1.535000,48.203750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,48.895000>}
box{<0,0,-0.203200><2.327516,0.035000,0.203200> rotate<0,-17.275788,0> translate<4.127500,-1.535000,48.203750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.438500,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.438500,-1.535000,42.774000>}
box{<0,0,-0.152400><0.406000,0.035000,0.152400> rotate<0,-90.000000,0> translate<6.438500,-1.535000,42.774000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,43.367500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.438500,-1.535000,43.180000>}
box{<0,0,-0.203200><2.635179,0.035000,0.203200> rotate<0,4.079926,0> translate<3.810000,-1.535000,43.367500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,24.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.452500,-1.535000,24.606250>}
box{<0,0,-0.304800><1.373652,0.035000,0.304800> rotate<0,-2.346719,0> translate<5.080000,-1.535000,24.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.921250,-1.535000,28.360000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.508750,-1.535000,28.677500>}
box{<0,0,-0.304800><1.618939,0.035000,0.304800> rotate<0,-11.309186,0> translate<4.921250,-1.535000,28.360000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.267500,-1.535000,30.142500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.508750,-1.535000,30.377500>}
box{<0,0,-0.152400><0.336789,0.035000,0.152400> rotate<0,-44.245210,0> translate<6.267500,-1.535000,30.142500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.667500,-1.535000,22.860000>}
box{<0,0,-0.406400><0.709952,0.035000,0.406400> rotate<0,-63.430762,0> translate<6.350000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.452500,-1.535000,24.606250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.667500,-1.535000,22.860000>}
box{<0,0,-0.406400><1.759436,0.035000,0.406400> rotate<0,82.975536,0> translate<6.452500,-1.535000,24.606250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.032500,-1.535000,41.116250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.917500,-1.535000,40.390000>}
box{<0,0,-0.152400><1.144842,0.035000,0.152400> rotate<0,39.370439,0> translate<6.032500,-1.535000,41.116250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.917500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.917500,-1.535000,40.390000>}
box{<0,0,-0.152400><0.856500,0.035000,0.152400> rotate<0,90.000000,0> translate<6.917500,-1.535000,40.390000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,-1.535000,27.305000>}
box{<0,0,-0.152400><2.857500,0.035000,0.152400> rotate<0,0.000000,0> translate<4.127500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.182500,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.143750,-1.535000,26.352500>}
box{<0,0,-0.152400><1.961250,0.035000,0.152400> rotate<0,0.000000,0> translate<5.182500,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.200000,-1.535000,12.382500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.200000,-1.535000,13.970000>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,90.000000,0> translate<7.200000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,27.887500>}
box{<0,0,-0.152400><0.823779,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.985000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,27.887500>}
box{<0,0,-0.152400><4.334000,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.567500,-1.535000,27.887500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,40.587500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,39.533500>}
box{<0,0,-0.152400><1.054000,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.567500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.245000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.567500,-1.535000,40.587500>}
box{<0,0,-0.152400><1.870297,0.035000,0.152400> rotate<0,44.997030,0> translate<6.245000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.778750,-1.535000,16.827500>}
box{<0,0,-0.203200><5.726014,0.035000,0.203200> rotate<0,46.120259,0> translate<3.810000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.350000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.937500,-1.535000,3.175000>}
box{<0,0,-0.635000><2.479754,0.035000,0.635000> rotate<0,50.191116,0> translate<6.350000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.810000,-1.535000,46.167500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.937500,-1.535000,44.450000>}
box{<0,0,-0.203200><4.470577,0.035000,0.203200> rotate<0,22.591263,0> translate<3.810000,-1.535000,46.167500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.937500,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.937500,-1.535000,44.450000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<7.937500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.143750,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,27.426250>}
box{<0,0,-0.152400><1.518512,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.143750,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,27.426250>}
box{<0,0,-0.152400><4.795250,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.217500,-1.535000,27.426250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,39.533500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,90.000000,0> translate<8.217500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,39.533500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.217500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,40.995000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,40.957500>}
box{<0,0,-0.152400><0.037500,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.217500,-1.535000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.438500,-1.535000,42.774000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,40.995000>}
box{<0,0,-0.152400><2.515886,0.035000,0.152400> rotate<0,44.997030,0> translate<6.438500,-1.535000,42.774000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.937500,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.572500,-1.535000,41.910000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<7.937500,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.152500,-1.535000,24.606250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.867500,-1.535000,27.226250>}
box{<0,0,-0.152400><2.715810,0.035000,0.152400> rotate<0,-74.730697,0> translate<8.152500,-1.535000,24.606250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.867500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.867500,-1.535000,27.226250>}
box{<0,0,-0.152400><4.995250,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.867500,-1.535000,27.226250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.867500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,39.533500>}
box{<0,0,-0.152400><0.022500,0.035000,0.152400> rotate<0,0.000000,0> translate<8.867500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.217500,-1.535000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,40.957500>}
box{<0,0,-0.152400><0.672500,0.035000,0.152400> rotate<0,0.000000,0> translate<8.217500,-1.535000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,40.957500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,90.000000,0> translate<8.890000,-1.535000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.105000,-1.535000,48.895000>}
box{<0,0,-0.203200><2.755000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.350000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.105000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.105000,-1.535000,48.895000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.105000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.397500,-1.535000,33.972500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.517500,-1.535000,33.972500>}
box{<0,0,-0.152400><4.120000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.397500,-1.535000,33.972500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.517500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.517500,-1.535000,33.972500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.517500,-1.535000,33.972500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,27.625000>}
box{<0,0,-0.152400><4.596500,0.035000,0.152400> rotate<0,-90.000000,0> translate<9.525000,-1.535000,27.625000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.517500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,32.221500>}
box{<0,0,-0.152400><0.007500,0.035000,0.152400> rotate<0,0.000000,0> translate<9.517500,-1.535000,32.221500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.217500,-1.535000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.525000,-1.535000,37.782500>}
box{<0,0,-0.203200><1.307500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.217500,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,37.782500>}
box{<0,0,-0.152400><5.561000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.525000,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.517500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,39.541000>}
box{<0,0,-0.152400><0.010607,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.517500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.572500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,41.592500>}
box{<0,0,-0.152400><1.004023,0.035000,0.152400> rotate<0,18.433732,0> translate<8.572500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,39.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,41.592500>}
box{<0,0,-0.152400><2.051500,0.035000,0.152400> rotate<0,90.000000,0> translate<9.525000,-1.535000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.937500,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,44.450000>}
box{<0,0,-0.152400><1.587500,0.035000,0.152400> rotate<0,0.000000,0> translate<7.937500,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<7.429500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<9.525000,-1.535000,46.775000>}
box{<0,0,-0.508000><2.098005,0.035000,0.508000> rotate<0,-2.800168,0> translate<7.429500,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.105000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.525000,-1.535000,48.475000>}
box{<0,0,-0.203200><0.471832,0.035000,0.203200> rotate<0,-27.106334,0> translate<9.105000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.207500,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,48.475000>}
box{<0,0,-0.152400><0.383447,0.035000,0.152400> rotate<0,-34.102246,0> translate<9.207500,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,27.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.845000,-1.535000,25.400000>}
box{<0,0,-0.152400><2.247893,0.035000,0.152400> rotate<0,81.810429,0> translate<9.525000,-1.535000,27.625000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.200000,-1.535000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,15.557500>}
box{<0,0,-0.203200><2.960000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.200000,-1.535000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,34.925000>}
box{<0,0,-0.152400><2.703500,0.035000,0.152400> rotate<0,90.000000,0> translate<10.160000,-1.535000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.436500,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,43.180000>}
box{<0,0,-0.152400><0.723500,0.035000,0.152400> rotate<0,0.000000,0> translate<9.436500,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,39.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,43.180000>}
box{<0,0,-0.152400><3.639000,0.035000,0.152400> rotate<0,90.000000,0> translate<10.160000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.167500,-1.535000,30.790000>}
box{<0,0,-0.152400><1.897515,0.035000,0.152400> rotate<0,-89.767611,0> translate<10.160000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.167500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.167500,-1.535000,30.790000>}
box{<0,0,-0.152400><1.431500,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.167500,-1.535000,30.790000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.167500,-1.535000,32.221500>}
box{<0,0,-0.152400><0.007500,0.035000,0.152400> rotate<0,0.000000,0> translate<10.160000,-1.535000,32.221500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,39.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.167500,-1.535000,39.533500>}
box{<0,0,-0.152400><0.010607,0.035000,0.152400> rotate<0,44.997030,0> translate<10.160000,-1.535000,39.541000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.667500,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.248500,-1.535000,23.336250>}
box{<0,0,-0.304800><3.612530,0.035000,0.304800> rotate<0,-7.575016,0> translate<6.667500,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.845000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.248500,-1.535000,23.336250>}
box{<0,0,-0.304800><2.102826,0.035000,0.304800> rotate<0,78.932000,0> translate<9.845000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.778750,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.374325,-1.535000,16.827500>}
box{<0,0,-0.203200><2.595575,0.035000,0.203200> rotate<0,0.000000,0> translate<7.778750,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.477500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.477500,0.000000,7.950000>}
box{<0,0,-0.635000><11.100000,0.035000,0.635000> rotate<0,-90.000000,0> translate<10.477500,0.000000,7.950000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.001250,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.477500,0.000000,19.050000>}
box{<0,0,-0.203200><0.476250,0.035000,0.203200> rotate<0,0.000000,0> translate<10.001250,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.477500,0.000000,19.990000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.477500,0.000000,19.050000>}
box{<0,0,-0.635000><0.940000,0.035000,0.635000> rotate<0,-90.000000,0> translate<10.477500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<2.857500,-1.535000,7.937500>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.636250,-1.535000,7.937500>}
box{<0,0,-0.838200><7.778750,0.035000,0.838200> rotate<0,0.000000,0> translate<2.857500,-1.535000,7.937500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,-1.535000,39.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,-1.535000,41.807500>}
box{<0,0,-0.152400><2.251500,0.035000,0.152400> rotate<0,90.000000,0> translate<10.795000,-1.535000,41.807500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.817500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.817500,-1.535000,29.187500>}
box{<0,0,-0.152400><3.034000,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.817500,-1.535000,29.187500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,-1.535000,39.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.817500,-1.535000,39.533500>}
box{<0,0,-0.152400><0.031820,0.035000,0.152400> rotate<0,44.997030,0> translate<10.795000,-1.535000,39.556000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.477500,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,0.000000,18.415000>}
box{<0,0,-0.635000><0.898026,0.035000,0.635000> rotate<0,44.997030,0> translate<10.477500,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.795000,-1.535000,41.807500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.215000,-1.535000,42.862500>}
box{<0,0,-0.152400><1.135529,0.035000,0.152400> rotate<0,-68.287781,0> translate<10.795000,-1.535000,41.807500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,46.775000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.215000,-1.535000,45.085000>}
box{<0,0,-0.152400><2.390021,0.035000,0.152400> rotate<0,44.997030,0> translate<9.525000,-1.535000,46.775000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.525000,-1.535000,48.475000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.215000,-1.535000,48.895000>}
box{<0,0,-0.406400><1.741407,0.035000,0.406400> rotate<0,-13.955523,0> translate<9.525000,-1.535000,48.475000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.525000,-1.535000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,37.782500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.525000,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,37.782500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.430000,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.467500,-1.535000,34.252500>}
box{<0,0,-0.152400><0.356975,0.035000,0.152400> rotate<0,83.964450,0> translate<11.430000,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.467500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.467500,-1.535000,34.252500>}
box{<0,0,-0.152400><2.031000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.467500,-1.535000,34.252500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.467500,-1.535000,39.533500>}
box{<0,0,-0.152400><0.037500,0.035000,0.152400> rotate<0,0.000000,0> translate<11.430000,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.477500,-1.535000,19.990000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.745000,-1.535000,21.257500>}
box{<0,0,-0.203200><1.792516,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.477500,-1.535000,19.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.745000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.745000,-1.535000,21.257500>}
box{<0,0,-0.203200><4.142500,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.745000,-1.535000,21.257500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.745000,-1.535000,25.400000>}
box{<0,0,-0.152400><3.835333,0.035000,0.152400> rotate<0,65.585716,0> translate<10.160000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.747500,-1.535000,44.132500>}
box{<0,0,-0.152400><2.245064,0.035000,0.152400> rotate<0,8.129566,0> translate<9.525000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.117500,-1.535000,32.221500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.117500,-1.535000,33.390000>}
box{<0,0,-0.152400><1.168500,0.035000,0.152400> rotate<0,90.000000,0> translate<12.117500,-1.535000,33.390000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.117500,-1.535000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.117500,-1.535000,39.533500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.117500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.817500,-1.535000,29.187500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.382500,-1.535000,26.987500>}
box{<0,0,-0.152400><2.699856,0.035000,0.152400> rotate<0,54.569735,0> translate<10.817500,-1.535000,29.187500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,17.224375>}
box{<0,0,-0.203200><3.038103,0.035000,0.203200> rotate<0,-33.272692,0> translate<10.160000,-1.535000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,41.025000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,42.647500>}
box{<0,0,-0.152400><1.622500,0.035000,0.152400> rotate<0,90.000000,0> translate<12.700000,-1.535000,42.647500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,43.077500>}
box{<0,0,-0.152400><0.737500,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.700000,-1.535000,43.077500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.747500,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,43.815000>}
box{<0,0,-0.152400><1.004023,0.035000,0.152400> rotate<0,18.433732,0> translate<11.747500,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,32.221500>}
box{<0,0,-0.152400><2.694000,0.035000,0.152400> rotate<0,90.000000,0> translate<12.767500,-1.535000,32.221500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.767500,-1.535000,37.782500>}
box{<0,0,-0.203200><3.868380,0.035000,0.203200> rotate<0,-47.616064,0> translate<10.160000,-1.535000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,37.782500>}
box{<0,0,-0.152400><1.751000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.767500,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.117500,-1.535000,40.957500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,40.957500>}
box{<0,0,-0.152400><0.650000,0.035000,0.152400> rotate<0,0.000000,0> translate<12.117500,-1.535000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,41.025000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,40.957500>}
box{<0,0,-0.152400><0.095459,0.035000,0.152400> rotate<0,44.997030,0> translate<12.700000,-1.535000,41.025000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,40.957500>}
box{<0,0,-0.152400><1.424000,0.035000,0.152400> rotate<0,90.000000,0> translate<12.767500,-1.535000,40.957500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.215000,-1.535000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.858750,-1.535000,44.926250>}
box{<0,0,-0.152400><1.651398,0.035000,0.152400> rotate<0,5.516036,0> translate<11.215000,-1.535000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,42.647500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.915000,-1.535000,42.862500>}
box{<0,0,-0.152400><0.304056,0.035000,0.152400> rotate<0,-44.997030,0> translate<12.700000,-1.535000,42.647500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,43.077500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.915000,-1.535000,42.862500>}
box{<0,0,-0.152400><0.304056,0.035000,0.152400> rotate<0,44.997030,0> translate<12.700000,-1.535000,43.077500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.255500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.915000,-1.535000,48.895000>}
box{<0,0,-0.304800><2.318285,0.035000,0.304800> rotate<0,-73.467532,0> translate<12.255500,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<10.477500,-1.535000,7.950000>}
cylinder{<0,0,0><0,0.035000,0>0.838200 translate<13.028750,-1.535000,12.561250>}
box{<0,0,-0.838200><5.269962,0.035000,0.838200> rotate<0,-61.041687,0> translate<10.477500,-1.535000,7.950000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.200000,-1.535000,12.382500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.028750,-1.535000,15.220000>}
box{<0,0,-0.406400><6.482726,0.035000,0.406400> rotate<0,-25.955618,0> translate<7.200000,-1.535000,12.382500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.767500,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.208000,-1.535000,29.527500>}
box{<0,0,-0.152400><0.440500,0.035000,0.152400> rotate<0,0.000000,0> translate<12.767500,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.374325,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,18.994425>}
box{<0,0,-0.203200><3.668945,0.035000,0.203200> rotate<0,-36.198096,0> translate<10.374325,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,18.994425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,20.637500>}
box{<0,0,-0.203200><1.643075,0.035000,0.203200> rotate<0,90.000000,0> translate<13.335000,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,31.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,32.221500>}
box{<0,0,-0.152400><0.871500,0.035000,0.152400> rotate<0,90.000000,0> translate<13.417500,-1.535000,32.221500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,41.357500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,39.533500>}
box{<0,0,-0.152400><1.824000,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.417500,-1.535000,39.533500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,31.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.652500,-1.535000,31.115000>}
box{<0,0,-0.152400><0.332340,0.035000,0.152400> rotate<0,44.997030,0> translate<13.417500,-1.535000,31.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.706250,-1.535000,50.323750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.811250,-1.535000,50.323750>}
box{<0,0,-0.203200><9.105000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.706250,-1.535000,50.323750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.246500,-1.535000,23.336250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,23.266000>}
box{<0,0,-0.152400><0.726903,0.035000,0.152400> rotate<0,5.545523,0> translate<13.246500,-1.535000,23.336250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,23.266000>}
box{<0,0,-0.152400><1.816500,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.970000,-1.535000,23.266000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.382500,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,25.082500>}
box{<0,0,-0.152400><2.479754,0.035000,0.152400> rotate<0,50.191116,0> translate<12.382500,-1.535000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.067500,-1.535000,33.117500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.067500,-1.535000,32.221500>}
box{<0,0,-0.152400><0.896000,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.067500,-1.535000,32.221500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.067500,-1.535000,39.533500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.067500,-1.535000,40.737500>}
box{<0,0,-0.152400><1.204000,0.035000,0.152400> rotate<0,90.000000,0> translate<14.067500,-1.535000,40.737500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.160500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.160500,-1.535000,26.797000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.160500,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.417500,-1.535000,41.357500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.160500,-1.535000,42.100500>}
box{<0,0,-0.152400><1.050761,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.417500,-1.535000,41.357500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.858750,-1.535000,44.926250>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.160500,-1.535000,43.624500>}
box{<0,0,-0.152400><1.840953,0.035000,0.152400> rotate<0,44.997030,0> translate<12.858750,-1.535000,44.926250> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.160500,-1.535000,42.100500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.160500,-1.535000,43.624500>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<14.160500,-1.535000,43.624500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,17.224375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.287500,-1.535000,17.145000>}
box{<0,0,-0.203200><1.589483,0.035000,0.203200> rotate<0,2.862216,0> translate<12.700000,-1.535000,17.224375> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.937500,-1.535000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<14.605000,-1.535000,3.175000>}
box{<0,0,-0.635000><6.667500,0.035000,0.635000> rotate<0,0.000000,0> translate<7.937500,-1.535000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,37.147500>}
box{<0,0,-0.304800><12.065000,0.035000,0.304800> rotate<0,90.000000,0> translate<14.605000,0.000000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.652500,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,31.115000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.652500,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.067500,-1.535000,40.737500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,41.592500>}
box{<0,0,-0.152400><1.209153,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.067500,-1.535000,40.737500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.255500,-1.535000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,44.005500>}
box{<0,0,-0.152400><3.771708,0.035000,0.152400> rotate<0,44.997030,0> translate<12.255500,-1.535000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,44.005500>}
box{<0,0,-0.152400><2.413000,0.035000,0.152400> rotate<0,90.000000,0> translate<14.922500,-1.535000,44.005500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.287500,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.187500,-1.535000,16.245000>}
box{<0,0,-0.203200><1.272792,0.035000,0.203200> rotate<0,44.997030,0> translate<14.287500,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335000,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,21.907500>}
box{<0,0,-0.203200><2.289525,0.035000,0.203200> rotate<0,-33.687844,0> translate<13.335000,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.160500,-1.535000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,25.082500>}
box{<0,0,-0.203200><2.026038,0.035000,0.203200> rotate<0,57.800451,0> translate<14.160500,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,21.907500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,25.082500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.240000,-1.535000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,38.417500>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.430000,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,40.322500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.240000,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.811250,-1.535000,50.323750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,48.895000>}
box{<0,0,-0.203200><2.020558,0.035000,0.203200> rotate<0,44.997030,0> translate<13.811250,-1.535000,50.323750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,45.751706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,48.895000>}
box{<0,0,-0.203200><3.143294,0.035000,0.203200> rotate<0,90.000000,0> translate<15.240000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.405500,-1.535000,9.842500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.663750,-1.535000,12.561250>}
box{<0,0,-0.635000><2.730988,0.035000,0.635000> rotate<0,-84.568259,0> translate<15.405500,-1.535000,9.842500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.187500,-1.535000,16.245000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.663750,-1.535000,15.220000>}
box{<0,0,-0.203200><1.130238,0.035000,0.203200> rotate<0,65.074515,0> translate<15.187500,-1.535000,16.245000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,41.275000>}
box{<0,0,-0.203200><1.144763,0.035000,0.203200> rotate<0,-56.306216,0> translate<15.240000,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,42.227500>}
box{<0,0,-0.203200><0.952500,0.035000,0.203200> rotate<0,90.000000,0> translate<15.875000,-1.535000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.922500,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.033750,-1.535000,32.067500>}
box{<0,0,-0.152400><1.463603,0.035000,0.152400> rotate<0,-40.598615,0> translate<14.922500,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.033750,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.192500,-1.535000,32.067500>}
box{<0,0,-0.152400><0.158750,0.035000,0.152400> rotate<0,0.000000,0> translate<16.033750,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.192500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.192500,0.000000,36.195000>}
box{<0,0,-0.304800><8.572500,0.035000,0.304800> rotate<0,90.000000,0> translate<16.192500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,-1.535000,45.751706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.329375,-1.535000,44.344831>}
box{<0,0,-0.203200><1.779336,0.035000,0.203200> rotate<0,52.245126,0> translate<15.240000,-1.535000,45.751706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.117500,-1.535000,33.390000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,37.782500>}
box{<0,0,-0.203200><6.211933,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.117500,-1.535000,33.390000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,37.782500>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.510000,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.684500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.637000,-1.535000,26.352500>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,44.997030,0> translate<15.684500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<14.605000,-1.535000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,-1.535000,4.127500>}
box{<0,0,-0.635000><2.712721,0.035000,0.635000> rotate<0,-20.554689,0> translate<14.605000,-1.535000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,1.746250>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<17.145000,-1.535000,4.127500>}
box{<0,0,-0.711200><2.381250,0.035000,0.711200> rotate<0,90.000000,0> translate<17.145000,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.112500,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,0.000000,18.415000>}
box{<0,0,-0.635000><6.032500,0.035000,0.635000> rotate<0,0.000000,0> translate<11.112500,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,-1.535000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.238597,-1.535000,6.430275>}
box{<0,0,-0.635000><2.304676,0.035000,0.635000> rotate<0,-87.666694,0> translate<17.145000,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.462500,0.000000,48.895000>}
box{<0,0,-0.304800><12.090040,0.035000,0.304800> rotate<0,-76.323655,0> translate<14.605000,0.000000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,36.195000>}
box{<0,0,-0.304800><6.667500,0.035000,0.304800> rotate<0,90.000000,0> translate<17.780000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.067500,-1.535000,33.117500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,37.147500>}
box{<0,0,-0.203200><5.479376,0.035000,0.203200> rotate<0,-47.345112,0> translate<14.067500,-1.535000,33.117500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,39.211250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,37.147500>}
box{<0,0,-0.203200><2.063750,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,-1.535000,33.489500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.932000,-1.535000,33.489500>}
box{<0,0,-0.203200><0.787000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.145000,-1.535000,33.489500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.960628,-1.535000,42.015166>}
box{<0,0,-0.203200><2.229224,0.035000,0.203200> rotate<0,-49.399897,0> translate<16.510000,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,25.082500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.097500,0.000000,21.590000>}
box{<0,0,-0.304800><4.939141,0.035000,0.304800> rotate<0,44.997030,0> translate<14.605000,0.000000,25.082500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.192500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.097500,0.000000,24.447500>}
box{<0,0,-0.304800><3.702654,0.035000,0.304800> rotate<0,59.032347,0> translate<16.192500,0.000000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.097500,-1.535000,14.128750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.249500,-1.535000,9.842500>}
box{<0,0,-0.635000><4.288944,0.035000,0.635000> rotate<0,87.963209,0> translate<18.097500,-1.535000,14.128750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,39.211250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.383250,-1.535000,39.814500>}
box{<0,0,-0.203200><0.853124,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.780000,-1.535000,39.211250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.192500,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,32.067500>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.192500,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,44.132500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-36.867464,0> translate<15.875000,-1.535000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.097500,-1.535000,14.128750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.732500,-1.535000,15.240000>}
box{<0,0,-0.635000><1.279883,0.035000,0.635000> rotate<0,-60.251142,0> translate<18.097500,-1.535000,14.128750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.145000,-1.535000,30.645500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.215500,-1.535000,28.892500>}
box{<0,0,-0.203200><2.712928,0.035000,0.203200> rotate<0,40.250444,0> translate<17.145000,-1.535000,30.645500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,-1.535000,27.622500>}
box{<0,0,-0.203200><5.011675,0.035000,0.203200> rotate<0,22.339174,0> translate<14.732000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.732500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.685000,-1.535000,16.827500>}
box{<0,0,-0.635000><1.851327,0.035000,0.635000> rotate<0,-59.032347,0> translate<18.732500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,-1.535000,37.299500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,-1.535000,38.290500>}
box{<0,0,-0.203200><0.991000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.685000,-1.535000,38.290500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.383250,-1.535000,39.814500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,-1.535000,39.814500>}
box{<0,0,-0.203200><1.301750,0.035000,0.203200> rotate<0,0.000000,0> translate<18.383250,-1.535000,39.814500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,-1.535000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.002500,-1.535000,22.542500>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<18.097500,-1.535000,24.447500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.932000,-1.535000,33.489500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.002500,-1.535000,35.560000>}
box{<0,0,-0.203200><2.928129,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.932000,-1.535000,33.489500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,-1.535000,37.299500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.002500,-1.535000,35.560000>}
box{<0,0,-0.203200><1.768238,0.035000,0.203200> rotate<0,79.650771,0> translate<19.685000,-1.535000,37.299500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.192500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.002500,0.000000,48.895000>}
box{<0,0,-0.304800><13.259189,0.035000,0.304800> rotate<0,-73.295918,0> translate<16.192500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.215500,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.637500,-1.535000,28.892500>}
box{<0,0,-0.203200><1.422000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.215500,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.145000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,0.000000,20.002500>}
box{<0,0,-0.635000><4.127500,0.035000,0.635000> rotate<0,-22.618372,0> translate<17.145000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.955000,0.000000,24.447500>}
box{<0,0,-0.304800><5.990578,0.035000,0.304800> rotate<0,57.990789,0> translate<17.780000,0.000000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.002500,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.955000,0.000000,33.655000>}
box{<0,0,-0.304800><2.129855,0.035000,0.304800> rotate<0,63.430762,0> translate<20.002500,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.685000,-1.535000,39.814500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.145500,-1.535000,41.910000>}
box{<0,0,-0.304800><2.554248,0.035000,0.304800> rotate<0,-55.121034,0> translate<19.685000,-1.535000,39.814500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.145500,-1.535000,44.132500>}
box{<0,0,-0.203200><2.730500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.415000,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.685000,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.272500,-1.535000,17.303750>}
box{<0,0,-0.635000><1.657399,0.035000,0.635000> rotate<0,-16.698142,0> translate<19.685000,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.238597,-1.535000,6.430275>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.431250,-1.535000,8.382000>}
box{<0,0,-0.635000><4.624670,0.035000,0.635000> rotate<0,-24.960836,0> translate<17.238597,-1.535000,6.430275> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.249500,-1.535000,9.842500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.431250,-1.535000,8.382000>}
box{<0,0,-0.635000><3.500942,0.035000,0.635000> rotate<0,24.654637,0> translate<18.249500,-1.535000,9.842500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.367500,-1.535000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,27.622500>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.367500,-1.535000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,0.000000,45.402500>}
box{<0,0,-0.304800><9.964645,0.035000,0.304800> rotate<0,-67.516110,0> translate<17.780000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.415000,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.780500,-1.535000,34.480500>}
box{<0,0,-0.203200><4.141154,0.035000,0.203200> rotate<0,-35.637457,0> translate<18.415000,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.780500,-1.535000,39.687500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.780500,-1.535000,34.480500>}
box{<0,0,-0.203200><5.207000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.780500,-1.535000,34.480500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.637500,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.907500,-1.535000,30.162500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.637500,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.066250,0.000000,42.703750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.066250,0.000000,38.100000>}
box{<0,0,-0.304800><4.603750,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.066250,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,0.000000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<22.383750,0.000000,26.352500>}
box{<0,0,-0.508000><5.200123,0.035000,0.508000> rotate<0,58.732392,0> translate<19.685000,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.637000,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.542500,-1.535000,26.352500>}
box{<0,0,-0.203200><5.905500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.637000,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.066250,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.542500,0.000000,34.448750>}
box{<0,0,-0.304800><3.682179,0.035000,0.304800> rotate<0,82.563143,0> translate<22.066250,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,0.000000,45.402500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.542500,0.000000,48.895000>}
box{<0,0,-0.304800><3.620057,0.035000,0.304800> rotate<0,-74.739948,0> translate<21.590000,0.000000,45.402500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,28.892500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.590000,-1.535000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<19.685000,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.021250,-1.535000,33.020000>}
box{<0,0,-0.508000><4.008749,0.035000,0.508000> rotate<0,-33.668025,0> translate<19.685000,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<20.955000,0.000000,20.002500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.336250,0.000000,20.002500>}
box{<0,0,-0.635000><2.381250,0.035000,0.635000> rotate<0,0.000000,0> translate<20.955000,0.000000,20.002500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.336250,0.000000,23.336250>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.336250,0.000000,20.002500>}
box{<0,0,-0.635000><3.333750,0.035000,0.635000> rotate<0,-90.000000,0> translate<23.336250,0.000000,20.002500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.383750,0.000000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.336250,0.000000,23.336250>}
box{<0,0,-0.406400><3.163071,0.035000,0.406400> rotate<0,72.469649,0> translate<22.383750,0.000000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.336250,0.000000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.336250,0.000000,39.052500>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<23.336250,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.021250,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.338750,-1.535000,36.671250>}
box{<0,0,-0.304800><3.665028,0.035000,0.304800> rotate<0,-85.024648,0> translate<23.021250,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.669500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.825500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.669500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.669500,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,44.132500>}
box{<0,0,-0.203200><0.825500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.669500,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.955000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.653750,0.000000,26.670000>}
box{<0,0,-0.304800><7.488223,0.035000,0.304800> rotate<0,68.870735,0> translate<20.955000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<21.431250,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.812500,-1.535000,17.303750>}
box{<0,0,-0.635000><5.870402,0.035000,0.635000> rotate<0,-66.064615,0> translate<21.431250,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.336250,0.000000,20.002500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.812500,0.000000,17.303750>}
box{<0,0,-0.635000><2.740450,0.035000,0.635000> rotate<0,79.986741,0> translate<23.336250,0.000000,20.002500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.542500,-1.535000,26.352500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,27.622500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.542500,-1.535000,26.352500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.431250,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,10.318750>}
box{<0,0,-0.304800><3.321784,0.035000,0.304800> rotate<0,-35.662648,0> translate<21.431250,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,13.493750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,10.318750>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<24.130000,-1.535000,10.318750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.653750,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,24.447500>}
box{<0,0,-0.203200><2.272954,0.035000,0.203200> rotate<0,77.900101,0> translate<23.653750,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.021250,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,31.273750>}
box{<0,0,-0.304800><2.068506,0.035000,0.304800> rotate<0,57.583429,0> translate<23.021250,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.336250,0.000000,39.052500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.288750,0.000000,33.655000>}
box{<0,0,-0.304800><5.480900,0.035000,0.304800> rotate<0,79.986741,0> translate<23.336250,0.000000,39.052500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.066250,0.000000,42.703750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.447500,0.000000,45.720000>}
box{<0,0,-0.304800><3.842931,0.035000,0.304800> rotate<0,-51.706424,0> translate<22.066250,0.000000,42.703750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.304500,-1.535000,39.687500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.574500,-1.535000,40.481250>}
box{<0,0,-0.203200><1.497645,0.035000,0.203200> rotate<0,-32.003271,0> translate<23.304500,-1.535000,39.687500> }
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<24.765000,-1.535000,1.746250>}
cylinder{<0,0,0><0,0.035000,0>0.711200 translate<24.765000,-1.535000,4.127500>}
box{<0,0,-0.711200><2.381250,0.035000,0.711200> rotate<0,90.000000,0> translate<24.765000,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,-1.535000,45.402500>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.495000,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.447500,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.082500,0.000000,48.895000>}
box{<0,0,-0.304800><3.237877,0.035000,0.304800> rotate<0,-78.684874,0> translate<24.447500,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,13.493750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,15.240000>}
box{<0,0,-0.304800><2.159233,0.035000,0.304800> rotate<0,-53.969065,0> translate<24.130000,-1.535000,13.493750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.558750,-1.535000,43.973750>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.495000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.542500,0.000000,34.448750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.717500,0.000000,25.717500>}
box{<0,0,-0.304800><9.290606,0.035000,0.304800> rotate<0,70.012273,0> translate<22.542500,0.000000,34.448750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,0.000000,22.542500>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<24.130000,0.000000,24.447500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.765000,-1.535000,4.127500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.352500,-1.535000,4.557437>}
box{<0,0,-0.406400><1.644689,0.035000,0.406400> rotate<0,-15.152718,0> translate<24.765000,-1.535000,4.127500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,4.557437>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,7.620000>}
box{<0,0,-0.304800><3.062563,0.035000,0.304800> rotate<0,90.000000,0> translate<26.352500,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,13.017500>}
box{<0,0,-0.304800><5.397500,0.035000,0.304800> rotate<0,90.000000,0> translate<26.352500,-1.535000,13.017500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.574500,-1.535000,40.481250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.511250,-1.535000,42.068750>}
box{<0,0,-0.203200><2.504228,0.035000,0.203200> rotate<0,-39.337922,0> translate<24.574500,-1.535000,40.481250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.336250,0.000000,42.227500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.987500,0.000000,45.720000>}
box{<0,0,-0.304800><5.052641,0.035000,0.304800> rotate<0,-43.724084,0> translate<23.336250,0.000000,42.227500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.921250,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.114500,-1.535000,33.147000>}
box{<0,0,-0.203200><2.196924,0.035000,0.203200> rotate<0,-3.313789,0> translate<24.921250,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.238750,-1.535000,36.671250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.114500,-1.535000,37.973000>}
box{<0,0,-0.203200><2.283198,0.035000,0.203200> rotate<0,-34.757931,0> translate<25.238750,-1.535000,36.671250> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<23.812500,0.000000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.622500,0.000000,17.303750>}
box{<0,0,-0.635000><3.810000,0.035000,0.635000> rotate<0,0.000000,0> translate<23.812500,0.000000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.558750,-1.535000,43.973750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,43.973750>}
box{<0,0,-0.203200><2.063750,0.035000,0.203200> rotate<0,0.000000,0> translate<25.558750,-1.535000,43.973750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.987500,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.622500,0.000000,48.895000>}
box{<0,0,-0.304800><3.237877,0.035000,0.304800> rotate<0,-78.684874,0> translate<26.987500,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<23.812500,-1.535000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<27.781250,-1.535000,16.827500>}
box{<0,0,-0.508000><3.997223,0.035000,0.508000> rotate<0,6.842322,0> translate<23.812500,-1.535000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.781250,-1.535000,31.273750>}
box{<0,0,-0.304800><3.651250,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130000,-1.535000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,-1.535000,45.402500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.257500,-1.535000,45.402500>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.765000,-1.535000,45.402500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,4.557437>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.416250,-1.535000,2.857500>}
box{<0,0,-0.304800><2.673734,0.035000,0.304800> rotate<0,39.476118,0> translate<26.352500,-1.535000,4.557437> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.416250,0.000000,28.416250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.416250,0.000000,31.750000>}
box{<0,0,-0.304800><3.333750,0.035000,0.304800> rotate<0,90.000000,0> translate<28.416250,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.622500,-1.535000,43.973750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.416250,-1.535000,43.021250>}
box{<0,0,-0.203200><1.239877,0.035000,0.203200> rotate<0,50.191116,0> translate<27.622500,-1.535000,43.973750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.416250,-1.535000,39.846250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.416250,-1.535000,43.021250>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.416250,-1.535000,43.021250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.352500,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.515000,-1.535000,7.620000>}
box{<0,0,-0.304800><2.162500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.352500,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.416250,-1.535000,10.477500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.515000,-1.535000,8.890000>}
box{<0,0,-0.304800><1.590568,0.035000,0.304800> rotate<0,86.434813,0> translate<28.416250,-1.535000,10.477500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.288750,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.575000,0.000000,25.717500>}
box{<0,0,-0.304800><9.020856,0.035000,0.304800> rotate<0,61.626886,0> translate<24.288750,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.907500,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,30.162500>}
box{<0,0,-0.203200><6.667500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.907500,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.114500,-1.535000,33.147000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,-1.535000,34.417000>}
box{<0,0,-0.203200><2.032992,0.035000,0.203200> rotate<0,-38.657257,0> translate<27.114500,-1.535000,33.147000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.114500,-1.535000,37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.880000,-1.535000,35.255000>}
box{<0,0,-0.203200><3.241067,0.035000,0.203200> rotate<0,56.990158,0> translate<27.114500,-1.535000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.097500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,18.415000>}
box{<0,0,-0.203200><11.252229,0.035000,0.203200> rotate<0,16.388459,0> translate<18.097500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.002500,-1.535000,22.542500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,19.685000>}
box{<0,0,-0.203200><9.337955,0.035000,0.203200> rotate<0,17.817713,0> translate<20.002500,-1.535000,22.542500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,28.892500>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.860000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.416250,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.051250,0.000000,32.861250>}
box{<0,0,-0.203200><1.279883,0.035000,0.203200> rotate<0,-60.251142,0> translate<28.416250,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.511250,0.000000,42.068750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.051250,0.000000,39.846250>}
box{<0,0,-0.304800><3.375071,0.035000,0.304800> rotate<0,41.183207,0> translate<26.511250,0.000000,42.068750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.051250,0.000000,32.861250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.051250,0.000000,39.846250>}
box{<0,0,-0.304800><6.985000,0.035000,0.304800> rotate<0,90.000000,0> translate<29.051250,0.000000,39.846250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,20.955000>}
box{<0,0,-0.203200><8.963402,0.035000,0.203200> rotate<0,22.930587,0> translate<20.955000,-1.535000,24.447500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.717500,-1.535000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,22.225000>}
box{<0,0,-0.203200><4.939141,0.035000,0.203200> rotate<0,44.997030,0> translate<25.717500,-1.535000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.257500,-1.535000,45.402500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.368750,-1.535000,44.259500>}
box{<0,0,-0.203200><1.594154,0.035000,0.203200> rotate<0,45.803906,0> translate<28.257500,-1.535000,45.402500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.368750,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.368750,-1.535000,44.259500>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.368750,-1.535000,44.259500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.527500,0.000000,30.003750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.527500,0.000000,31.591250>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,90.000000,0> translate<29.527500,0.000000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.812500,-1.535000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,-1.535000,27.622500>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.812500,-1.535000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.781250,-1.535000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,-1.535000,33.655000>}
box{<0,0,-0.304800><3.151098,0.035000,0.304800> rotate<0,-49.082377,0> translate<27.781250,-1.535000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.511250,0.000000,42.068750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,0.000000,45.720000>}
box{<0,0,-0.304800><4.944241,0.035000,0.304800> rotate<0,-47.599421,0> translate<26.511250,0.000000,42.068750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.515000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,-1.535000,6.350000>}
box{<0,0,-0.304800><1.647500,0.035000,0.304800> rotate<0,0.000000,0> translate<28.515000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.527500,0.000000,31.591250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.162500,0.000000,32.702500>}
box{<0,0,-0.203200><1.279883,0.035000,0.203200> rotate<0,-60.251142,0> translate<29.527500,0.000000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,0.000000,41.751250>}
box{<0,0,-0.304800><9.048750,0.035000,0.304800> rotate<0,90.000000,0> translate<30.162500,0.000000,41.751250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,0.000000,48.895000>}
box{<0,0,-0.304800><3.190836,0.035000,0.304800> rotate<0,-84.283844,0> translate<29.845000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.416250,-1.535000,39.846250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.302500,-1.535000,36.055000>}
box{<0,0,-0.203200><4.234562,0.035000,0.203200> rotate<0,63.544212,0> translate<28.416250,-1.535000,39.846250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,32.893000>}
box{<0,0,-0.203200><3.329363,0.035000,0.203200> rotate<0,-55.093868,0> translate<28.575000,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.797500,-1.535000,7.937500>}
box{<0,0,-0.304800><1.709790,0.035000,0.304800> rotate<0,-68.194090,0> translate<30.162500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.797500,-1.535000,15.240000>}
box{<0,0,-0.304800><5.397500,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.797500,-1.535000,7.937500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.797500,-1.535000,15.240000>}
box{<0,0,-0.304800><7.302500,0.035000,0.304800> rotate<0,90.000000,0> translate<30.797500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,23.495000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<28.575000,-1.535000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,41.275000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.797500,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.368750,-1.535000,40.322500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.090000,-1.535000,36.855000>}
box{<0,0,-0.203200><3.871209,0.035000,0.203200> rotate<0,63.596226,0> translate<29.368750,-1.535000,40.322500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.527500,0.000000,30.003750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,28.257500>}
box{<0,0,-0.304800><2.584263,0.035000,0.304800> rotate<0,42.507642,0> translate<29.527500,0.000000,30.003750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,-1.535000,27.622500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,28.257500>}
box{<0,0,-0.203200><1.709790,0.035000,0.203200> rotate<0,-21.799971,0> translate<29.845000,-1.535000,27.622500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,28.892500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,31.115000>}
box{<0,0,-0.203200><3.375071,0.035000,0.203200> rotate<0,-41.183207,0> translate<28.892500,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,31.115000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.432500,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,7.302500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,5.397500>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.750000,-1.535000,5.397500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.416250,0.000000,28.416250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,25.400000>}
box{<0,0,-0.304800><4.495737,0.035000,0.304800> rotate<0,42.134814,0> translate<28.416250,0.000000,28.416250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.515000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.752500,-1.535000,3.175000>}
box{<0,0,-0.304800><3.756385,0.035000,0.304800> rotate<0,30.471267,0> translate<28.515000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877500,-1.535000,37.655000>}
box{<0,0,-0.203200><2.586291,0.035000,0.203200> rotate<0,65.313385,0> translate<30.797500,-1.535000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.162500,0.000000,41.751250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.067500,0.000000,45.720000>}
box{<0,0,-0.304800><4.402272,0.035000,0.304800> rotate<0,-64.354747,0> translate<30.162500,0.000000,41.751250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.067500,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.067500,0.000000,48.260000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<32.067500,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.752500,-1.535000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.070000,-1.535000,1.902500>}
box{<0,0,-0.304800><1.311512,0.035000,0.304800> rotate<0,75.985231,0> translate<31.752500,-1.535000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,32.893000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,-1.535000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.067500,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.702500,0.000000,48.895000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.067500,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.070000,-1.535000,1.902500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,0.952500>}
box{<0,0,-0.304800><1.343503,0.035000,0.304800> rotate<0,44.997030,0> translate<32.070000,-1.535000,1.902500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.178750,-1.535000,23.495000>}
box{<0,0,-0.203200><2.381250,0.035000,0.203200> rotate<0,0.000000,0> translate<30.797500,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.178750,0.000000,29.686250>}
box{<0,0,-0.304800><2.256261,0.035000,0.304800> rotate<0,-39.286814,0> translate<31.432500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.337500,-1.535000,5.080000>}
box{<0,0,-0.203200><1.618939,0.035000,0.203200> rotate<0,11.309186,0> translate<31.750000,-1.535000,5.397500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,7.302500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.337500,-1.535000,7.620000>}
box{<0,0,-0.203200><1.618939,0.035000,0.203200> rotate<0,-11.309186,0> translate<31.750000,-1.535000,7.302500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,32.893000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.350000,-1.535000,32.055000>}
box{<0,0,-0.203200><1.278072,0.035000,0.203200> rotate<0,40.968142,0> translate<32.385000,-1.535000,32.893000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,22.225000>}
box{<0,0,-0.203200><4.445000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.337500,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.715000,-1.535000,5.080000>}
box{<0,0,-0.203200><0.377500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.337500,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.652500,-1.535000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.715000,-1.535000,5.080000>}
box{<0,0,-0.304800><1.906025,0.035000,0.304800> rotate<0,-88.115076,0> translate<33.652500,-1.535000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.337500,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.715000,-1.535000,7.620000>}
box{<0,0,-0.203200><0.377500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.337500,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.728750,-1.535000,28.807500>}
box{<0,0,-0.203200><3.940369,0.035000,0.203200> rotate<0,-59.852129,0> translate<31.750000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.947500,-1.535000,30.455000>}
box{<0,0,-0.203200><3.339795,0.035000,0.203200> rotate<0,-41.142863,0> translate<31.432500,-1.535000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.432500,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.112500,-1.535000,31.255000>}
box{<0,0,-0.203200><2.683654,0.035000,0.203200> rotate<0,-2.990148,0> translate<31.432500,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131250,-1.535000,20.955000>}
box{<0,0,-0.203200><4.921250,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.797500,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,46.037500>}
box{<0,0,-0.203200><5.905841,0.035000,0.203200> rotate<0,-53.742615,0> translate<30.797500,-1.535000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.607500,-1.535000,19.685000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892500,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.715000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,7.620000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.715000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.892500,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,18.415000>}
box{<0,0,-0.203200><6.032500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.892500,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.026841,0.000000,46.456841>}
box{<0,0,-0.304800><6.306406,0.035000,0.304800> rotate<0,-55.249564,0> translate<31.432500,0.000000,41.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.607500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.026841,0.000000,48.140188>}
box{<0,0,-0.203200><1.526418,0.035000,0.203200> rotate<0,-74.049668,0> translate<34.607500,0.000000,46.672500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.026841,0.000000,46.456841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.026841,0.000000,48.140188>}
box{<0,0,-0.203200><1.683347,0.035000,0.203200> rotate<0,90.000000,0> translate<35.026841,0.000000,48.140188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.119500,-1.535000,34.417000>}
box{<0,0,-0.203200><6.417500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.702000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.728750,-1.535000,28.807500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,29.655000>}
box{<0,0,-0.203200><1.661199,0.035000,0.203200> rotate<0,-30.673370,0> translate<33.728750,-1.535000,28.807500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.947500,-1.535000,30.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,30.455000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.947500,-1.535000,30.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.132500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,30.455000>}
box{<0,0,-0.203200><0.035355,0.035000,0.203200> rotate<0,44.997030,0> translate<35.132500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.112500,-1.535000,31.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,31.255000>}
box{<0,0,-0.203200><1.045000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.112500,-1.535000,31.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.350000,-1.535000,32.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,32.055000>}
box{<0,0,-0.203200><1.807500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.350000,-1.535000,32.055000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,33.655000>}
box{<0,0,-0.203200><5.312500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.845000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.119500,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,34.455000>}
box{<0,0,-0.203200><0.053740,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.119500,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.880000,-1.535000,35.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,35.255000>}
box{<0,0,-0.203200><6.277500,0.035000,0.203200> rotate<0,0.000000,0> translate<28.880000,-1.535000,35.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.302500,-1.535000,36.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,36.055000>}
box{<0,0,-0.203200><4.855000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.302500,-1.535000,36.055000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.090000,-1.535000,36.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,36.855000>}
box{<0,0,-0.203200><4.067500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.090000,-1.535000,36.855000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.877500,-1.535000,37.655000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.157500,-1.535000,37.655000>}
box{<0,0,-0.152400><3.280000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.877500,-1.535000,37.655000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.781250,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.242500,-1.535000,16.827500>}
box{<0,0,-0.406400><7.461250,0.035000,0.406400> rotate<0,0.000000,0> translate<27.781250,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.026841,0.000000,48.140188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.242500,0.000000,48.895000>}
box{<0,0,-0.203200><0.785016,0.035000,0.203200> rotate<0,-74.049811,0> translate<35.026841,0.000000,48.140188> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,0.952500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,0.952500>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<33.020000,-1.535000,0.952500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.766250,-1.535000,27.146250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,28.257500>}
box{<0,0,-0.203200><1.365619,0.035000,0.203200> rotate<0,-54.458728,0> translate<34.766250,-1.535000,27.146250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.178750,0.000000,29.686250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,0.000000,29.686250>}
box{<0,0,-0.304800><2.381250,0.035000,0.304800> rotate<0,0.000000,0> translate<33.178750,0.000000,29.686250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.797500,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.353750,-1.535000,15.240000>}
box{<0,0,-0.304800><5.556250,0.035000,0.304800> rotate<0,0.000000,0> translate<30.797500,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.925000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.443850,0.000000,39.671944>}
box{<0,0,-0.406400><2.704774,0.035000,0.406400> rotate<0,55.833659,0> translate<34.925000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,-1.535000,0.952500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,-1.535000,1.905000>}
box{<0,0,-0.304800><1.347038,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.560000,-1.535000,0.952500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,-1.535000,1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,-1.535000,3.172500>}
box{<0,0,-0.304800><1.267500,0.035000,0.304800> rotate<0,90.000000,0> translate<36.512500,-1.535000,3.172500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.715000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.512500,-1.535000,6.032500>}
box{<0,0,-0.203200><2.815460,0.035000,0.203200> rotate<0,6.474604,0> translate<33.715000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.622500,0.000000,17.303750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<36.512500,0.000000,8.572500>}
box{<0,0,-0.635000><12.460611,0.035000,0.635000> rotate<0,44.480900,0> translate<27.622500,0.000000,17.303750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.512500,-1.535000,8.572500>}
box{<0,0,-0.203200><1.851327,0.035000,0.203200> rotate<0,-30.961713,0> translate<34.925000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.715000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,-1.535000,13.017500>}
box{<0,0,-0.304800><4.986207,0.035000,0.304800> rotate<0,-55.868030,0> translate<33.715000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.432500,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,0.000000,31.115000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<31.432500,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,-1.535000,3.172500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.515000,-1.535000,3.175000>}
box{<0,0,-0.304800><0.003536,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.512500,-1.535000,3.172500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.178750,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.883750,-1.535000,26.670000>}
box{<0,0,-0.203200><4.879308,0.035000,0.203200> rotate<0,-40.592247,0> translate<33.178750,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.883750,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957500,-1.535000,26.743750>}
box{<0,0,-0.203200><0.104298,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.883750,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957500,-1.535000,26.743750>}
box{<0,0,-0.203200><1.111250,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.957500,-1.535000,26.743750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.337500,-1.535000,39.528750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957500,-1.535000,39.455000>}
box{<0,0,-0.203200><3.620751,0.035000,0.203200> rotate<0,1.167044,0> translate<33.337500,-1.535000,39.528750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.560000,0.000000,29.686250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.995500,0.000000,28.250750>}
box{<0,0,-0.304800><2.030104,0.035000,0.304800> rotate<0,44.997030,0> translate<35.560000,0.000000,29.686250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.995500,0.000000,25.558750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.995500,0.000000,28.250750>}
box{<0,0,-0.304800><2.692000,0.035000,0.304800> rotate<0,90.000000,0> translate<36.995500,0.000000,28.250750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.147500,-1.535000,41.910000>}
box{<0,0,-0.203200><2.222500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.925000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.512500,-1.535000,8.572500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.465000,-1.535000,9.207500>}
box{<0,0,-0.406400><1.144763,0.035000,0.406400> rotate<0,-33.687844,0> translate<36.512500,-1.535000,8.572500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.242500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.465000,-1.535000,18.415000>}
box{<0,0,-0.406400><2.731238,0.035000,0.406400> rotate<0,-35.535332,0> translate<35.242500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.157500,-1.535000,32.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.776250,-1.535000,32.855000>}
box{<0,0,-0.203200><2.618750,0.035000,0.203200> rotate<0,0.000000,0> translate<35.157500,-1.535000,32.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,26.035000>}
box{<0,0,-0.203200><5.617148,0.035000,0.203200> rotate<0,-42.706571,0> translate<33.655000,-1.535000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.757500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,27.830000>}
box{<0,0,-0.203200><0.035355,0.035000,0.203200> rotate<0,44.997030,0> translate<37.757500,-1.535000,27.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,27.830000>}
box{<0,0,-0.203200><1.795000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.782500,-1.535000,27.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,30.480000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.560000,-1.535000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,0.000000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,0.000000,48.895000>}
box{<0,0,-0.203200><2.857500,0.035000,0.203200> rotate<0,90.000000,0> translate<37.782500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.512500,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.417500,0.000000,29.210000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<36.512500,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.417500,0.000000,21.431250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.417500,0.000000,29.210000>}
box{<0,0,-0.203200><7.778750,0.035000,0.203200> rotate<0,90.000000,0> translate<38.417500,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131250,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,24.905000>}
box{<0,0,-0.203200><5.932469,0.035000,0.203200> rotate<0,-41.743072,0> translate<34.131250,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,24.905000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,27.855000>}
box{<0,0,-0.203200><2.950000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.557500,-1.535000,27.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.147500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,40.500000>}
box{<0,0,-0.203200><1.994041,0.035000,0.203200> rotate<0,44.997030,0> translate<37.147500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.557500,-1.535000,40.500000>}
box{<0,0,-0.203200><1.045000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.557500,-1.535000,40.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.353750,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.576250,-1.535000,16.668750>}
box{<0,0,-0.304800><2.642127,0.035000,0.304800> rotate<0,-32.733066,0> translate<36.353750,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.825516,-1.535000,41.441922>}
box{<0,0,-0.203200><3.349820,0.035000,0.203200> rotate<0,53.433329,0> translate<36.830000,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,-1.535000,20.637500>}
box{<0,0,-0.203200><2.731238,0.035000,0.203200> rotate<0,-54.458728,0> translate<37.465000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.607500,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,24.276250>}
box{<0,0,-0.203200><6.606215,0.035000,0.203200> rotate<0,-44.023474,0> translate<34.607500,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,24.276250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,27.855000>}
box{<0,0,-0.203200><3.578750,0.035000,0.203200> rotate<0,90.000000,0> translate<39.357500,-1.535000,27.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.825516,-1.535000,41.441922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,40.751188>}
box{<0,0,-0.203200><0.871849,0.035000,0.203200> rotate<0,52.394079,0> translate<38.825516,-1.535000,41.441922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.357500,-1.535000,40.751188>}
box{<0,0,-0.203200><1.296187,0.035000,0.203200> rotate<0,90.000000,0> translate<39.357500,-1.535000,40.751188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,40.640000>}
box{<0,0,-0.203200><4.318467,0.035000,0.203200> rotate<0,53.969065,0> translate<36.830000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,37.941250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,40.640000>}
box{<0,0,-0.203200><2.698750,0.035000,0.203200> rotate<0,90.000000,0> translate<39.370000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<38.415000,-1.535000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.687500,-1.535000,7.007500>}
box{<0,0,-0.635000><4.038231,0.035000,0.635000> rotate<0,-71.627625,0> translate<38.415000,-1.535000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.512500,-1.535000,13.017500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.687500,-1.535000,11.407500>}
box{<0,0,-0.406400><3.559877,0.035000,0.406400> rotate<0,26.887181,0> translate<36.512500,-1.535000,13.017500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,0.000000,22.542500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.687500,0.000000,14.605000>}
box{<0,0,-0.304800><15.792234,0.035000,0.304800> rotate<0,30.171529,0> translate<26.035000,0.000000,22.542500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,-1.535000,30.480000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.782500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.782500,0.000000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.687500,0.000000,44.132500>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<37.782500,0.000000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.839500,0.000000,22.866750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.839500,0.000000,25.558750>}
box{<0,0,-0.203200><2.692000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.839500,0.000000,25.558750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.052500,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.007500,-1.535000,20.637500>}
box{<0,0,-0.203200><0.955000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.052500,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,23.488750>}
box{<0,0,-0.203200><7.288484,0.035000,0.203200> rotate<0,-44.114616,0> translate<34.925000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,23.488750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,27.855000>}
box{<0,0,-0.203200><4.366250,0.035000,0.203200> rotate<0,90.000000,0> translate<40.157500,-1.535000,27.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,40.487500>}
box{<0,0,-0.203200><1.032500,0.035000,0.203200> rotate<0,90.000000,0> translate<40.157500,-1.535000,40.487500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.157500,-1.535000,40.487500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,-1.535000,41.719500>}
box{<0,0,-0.203200><1.323114,0.035000,0.203200> rotate<0,-68.608193,0> translate<40.157500,-1.535000,40.487500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.322500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.767000,0.000000,48.450500>}
box{<0,0,-0.203200><0.628618,0.035000,0.203200> rotate<0,44.997030,0> translate<40.322500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,48.323500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.767000,0.000000,48.450500>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.640000,0.000000,48.323500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.007500,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,23.177500>}
box{<0,0,-0.203200><2.711844,0.035000,0.203200> rotate<0,-69.488825,0> translate<40.007500,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,23.177500>}
box{<0,0,-0.203200><4.677500,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.957500,-1.535000,23.177500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,29.210000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<39.687500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,29.210000>}
box{<0,0,-0.203200><1.355000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.957500,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.776250,-1.535000,32.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,36.036250>}
box{<0,0,-0.203200><4.498967,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.776250,-1.535000,32.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,36.036250>}
box{<0,0,-0.203200><3.418750,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.957500,-1.535000,36.036250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.337500,0.000000,39.528750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.275000,0.000000,28.416250>}
box{<0,0,-0.304800><13.656191,0.035000,0.304800> rotate<0,54.458728,0> translate<33.337500,0.000000,39.528750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<37.465000,-1.535000,9.207500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.592500,-1.535000,9.207500>}
box{<0,0,-0.406400><4.127500,0.035000,0.406400> rotate<0,0.000000,0> translate<37.465000,-1.535000,9.207500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.687500,-1.535000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,-1.535000,43.497500>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,18.433732,0> translate<39.687500,-1.535000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,48.323500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,0.000000,43.645000>}
box{<0,0,-0.203200><4.774476,0.035000,0.203200> rotate<0,78.487195,0> translate<40.640000,0.000000,48.323500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.533647,0.000000,38.115553>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.722500,0.000000,31.461250>}
box{<0,0,-0.203200><7.862966,0.035000,0.203200> rotate<0,57.805959,0> translate<37.533647,0.000000,38.115553> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,23.012500>}
box{<0,0,-0.203200><4.842500,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.757500,-1.535000,23.012500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,27.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,30.486250>}
box{<0,0,-0.203200><2.631250,0.035000,0.203200> rotate<0,90.000000,0> translate<41.757500,-1.535000,30.486250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,36.982500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,39.455000>}
box{<0,0,-0.203200><2.472500,0.035000,0.203200> rotate<0,90.000000,0> translate<41.757500,-1.535000,39.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,23.012500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.907500,-1.535000,20.637500>}
box{<0,0,-0.203200><2.379732,0.035000,0.203200> rotate<0,86.380418,0> translate<41.757500,-1.535000,23.012500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,15.240000>}
box{<0,0,-0.203200><14.368410,0.035000,0.203200> rotate<0,44.997030,0> translate<31.750000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.576250,-1.535000,16.668750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,19.050000>}
box{<0,0,-0.304800><4.096857,0.035000,0.304800> rotate<0,-35.535332,0> translate<38.576250,-1.535000,16.668750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.907500,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,19.050000>}
box{<0,0,-0.304800><1.587502,0.035000,0.304800> rotate<0,89.903837,0> translate<41.907500,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,41.719500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.005250,0.000000,39.878000>}
box{<0,0,-0.203200><2.292385,0.035000,0.203200> rotate<0,53.444000,0> translate<40.640000,0.000000,41.719500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.839500,0.000000,22.866750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.068750,0.000000,20.637500>}
box{<0,0,-0.203200><3.152636,0.035000,0.203200> rotate<0,44.997030,0> translate<39.839500,0.000000,22.866750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,37.941250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.386250,0.000000,32.861250>}
box{<0,0,-0.203200><5.907975,0.035000,0.203200> rotate<0,59.296364,0> translate<39.370000,0.000000,37.941250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,-1.535000,43.497500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.557500,-1.535000,41.897500>}
box{<0,0,-0.203200><1.868482,0.035000,0.203200> rotate<0,58.900884,0> translate<41.592500,-1.535000,43.497500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.557500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.557500,-1.535000,41.897500>}
box{<0,0,-0.203200><2.442500,0.035000,0.203200> rotate<0,90.000000,0> translate<42.557500,-1.535000,41.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.715000,0.000000,37.317500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.715000,0.000000,35.560000>}
box{<0,0,-0.203200><1.757500,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.715000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.592500,0.000000,43.645000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,41.422500>}
box{<0,0,-0.203200><2.559767,0.035000,0.203200> rotate<0,60.251142,0> translate<41.592500,0.000000,43.645000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.417500,0.000000,21.431250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,16.668750>}
box{<0,0,-0.203200><6.735192,0.035000,0.203200> rotate<0,44.997030,0> translate<38.417500,0.000000,21.431250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.715000,0.000000,37.317500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,37.782500>}
box{<0,0,-0.203200><0.657609,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.715000,0.000000,37.317500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.687500,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.338750,-1.535000,14.605000>}
box{<0,0,-0.304800><3.651250,0.035000,0.304800> rotate<0,0.000000,0> translate<39.687500,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.005250,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.338750,0.000000,39.878000>}
box{<0,0,-0.203200><1.333500,0.035000,0.203200> rotate<0,0.000000,0> translate<42.005250,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,41.422500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.338750,0.000000,41.402000>}
box{<0,0,-0.203200><0.476691,0.035000,0.203200> rotate<0,2.464591,0> translate<42.862500,0.000000,41.422500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357500,-1.535000,42.050000>}
box{<0,0,-0.203200><2.595000,0.035000,0.203200> rotate<0,90.000000,0> translate<43.357500,-1.535000,42.050000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<42.862500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.497500,0.000000,43.815000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,82.869514,0> translate<42.862500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357500,-1.535000,42.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.497500,-1.535000,43.815000>}
box{<0,0,-0.203200><1.770544,0.035000,0.203200> rotate<0,-85.459147,0> translate<43.357500,-1.535000,42.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.957500,-1.535000,36.036250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.132500,-1.535000,32.861250>}
box{<0,0,-0.203200><4.490128,0.035000,0.203200> rotate<0,44.997030,0> translate<40.957500,-1.535000,36.036250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,30.486250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.132500,-1.535000,32.861250>}
box{<0,0,-0.203200><3.358757,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.757500,-1.535000,30.486250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.157500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.157500,-1.535000,41.300000>}
box{<0,0,-0.203200><1.845000,0.035000,0.203200> rotate<0,90.000000,0> translate<44.157500,-1.535000,41.300000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<39.687500,-1.535000,7.007500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<44.767500,-1.535000,8.382000>}
box{<0,0,-0.635000><5.262666,0.035000,0.635000> rotate<0,-15.139057,0> translate<39.687500,-1.535000,7.007500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.592500,-1.535000,9.207500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.767500,-1.535000,11.938000>}
box{<0,0,-0.406400><4.187631,0.035000,0.406400> rotate<0,-40.692845,0> translate<41.592500,-1.535000,9.207500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.957500,-1.535000,39.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.957500,-1.535000,40.195000>}
box{<0,0,-0.203200><0.740000,0.035000,0.203200> rotate<0,90.000000,0> translate<44.957500,-1.535000,40.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,0.000000,15.240000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.910000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.757500,-1.535000,36.982500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,-1.535000,33.655000>}
box{<0,0,-0.203200><4.705796,0.035000,0.203200> rotate<0,44.997030,0> translate<41.757500,-1.535000,36.982500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.862500,0.000000,41.422500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.087500,0.000000,41.422500>}
box{<0,0,-0.203200><2.225000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.862500,0.000000,41.422500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.338750,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.105500,0.000000,39.222500>}
box{<0,0,-0.203200><1.884432,0.035000,0.203200> rotate<0,20.354529,0> translate<43.338750,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.815000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.402500,-1.535000,25.400000>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.815000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.767500,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.847000,-1.535000,11.938000>}
box{<0,0,-0.508000><1.079500,0.035000,0.508000> rotate<0,0.000000,0> translate<44.767500,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.105500,0.000000,39.222500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.037500,0.000000,39.222500>}
box{<0,0,-0.203200><0.932000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.105500,0.000000,39.222500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.157500,-1.535000,41.300000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.037500,-1.535000,43.815000>}
box{<0,0,-0.203200><3.140004,0.035000,0.203200> rotate<0,-53.217825,0> translate<44.157500,-1.535000,41.300000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.402500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.037500,0.000000,43.815000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,82.869514,0> translate<45.402500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,16.668750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,16.668750>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.180000,0.000000,16.668750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.068750,0.000000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,20.637500>}
box{<0,0,-0.203200><4.286250,0.035000,0.203200> rotate<0,0.000000,0> translate<42.068750,0.000000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.907500,-1.535000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,-1.535000,20.957500>}
box{<0,0,-0.203200><4.458997,0.035000,0.203200> rotate<0,-4.115099,0> translate<41.907500,-1.535000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.815000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.355000,-1.535000,22.857500>}
box{<0,0,-0.406400><2.540001,0.035000,0.406400> rotate<0,0.056390,0> translate<43.815000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.513750,0.000000,37.782500>}
box{<0,0,-0.203200><3.333750,0.035000,0.203200> rotate<0,0.000000,0> translate<43.180000,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.402500,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,26.755000>}
box{<0,0,-0.203200><1.916259,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.402500,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,26.755000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,27.305000>}
box{<0,0,-0.203200><0.550000,0.035000,0.203200> rotate<0,90.000000,0> translate<46.757500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,29.655000>}
box{<0,0,-0.203200><2.350000,0.035000,0.203200> rotate<0,90.000000,0> translate<46.757500,-1.535000,29.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.132500,-1.535000,32.861250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,32.855000>}
box{<0,0,-0.203200><2.625007,0.035000,0.203200> rotate<0,0.136409,0> translate<44.132500,-1.535000,32.861250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,33.655000>}
box{<0,0,-0.203200><1.672500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.085000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.338750,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831250,-1.535000,14.605000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.338750,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.915000,0.000000,34.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,0.000000,34.292500>}
box{<0,0,-0.203200><2.099150,0.035000,0.203200> rotate<0,8.698897,0> translate<44.915000,0.000000,34.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.915000,0.000000,36.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,0.000000,36.192500>}
box{<0,0,-0.203200><2.099150,0.035000,0.203200> rotate<0,8.698897,0> translate<44.915000,0.000000,36.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,37.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.180000,-1.535000,37.655000>}
box{<0,0,-0.203200><0.422500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,37.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990000,0.000000,36.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.305000,0.000000,35.877500>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,44.997030,0> translate<46.990000,0.000000,36.192500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<44.767500,-1.535000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.434500,-1.535000,6.350000>}
box{<0,0,-0.508000><3.352896,0.035000,0.508000> rotate<0,37.301486,0> translate<44.767500,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,31.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.625000,-1.535000,31.255000>}
box{<0,0,-0.203200><0.867500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,31.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.625000,-1.535000,32.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.625000,-1.535000,31.255000>}
box{<0,0,-0.203200><0.800000,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.625000,-1.535000,31.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,32.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.625000,-1.535000,32.055000>}
box{<0,0,-0.203200><0.867500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,32.055000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,30.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.650000,-1.535000,30.455000>}
box{<0,0,-0.203200><0.892500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,30.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,36.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.967500,-1.535000,36.855000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,36.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,32.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.107500,-1.535000,32.855000>}
box{<0,0,-0.203200><1.350000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,32.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.625000,-1.535000,31.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.120000,-1.535000,31.255000>}
box{<0,0,-0.203200><0.495000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.625000,-1.535000,31.255000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.513750,0.000000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,37.465000>}
box{<0,0,-0.203200><1.774879,0.035000,0.203200> rotate<0,10.304166,0> translate<46.513750,0.000000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.987500,0.000000,41.422500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.421250,0.000000,41.592500>}
box{<0,0,-0.304800><1.443793,0.035000,0.304800> rotate<0,-6.761554,0> translate<46.987500,0.000000,41.422500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.957500,-1.535000,40.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.577500,-1.535000,43.815000>}
box{<0,0,-0.203200><5.119453,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.957500,-1.535000,40.195000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<47.942500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.577500,0.000000,43.815000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,82.869514,0> translate<47.942500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.729500,-1.535000,33.655000>}
box{<0,0,-0.203200><1.972000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,36.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.755000,-1.535000,36.055000>}
box{<0,0,-0.203200><1.997500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,36.055000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.180000,-1.535000,37.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767500,-1.535000,39.242500>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.180000,-1.535000,37.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.650000,-1.535000,30.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,-1.535000,28.257500>}
box{<0,0,-0.203200><2.696370,0.035000,0.203200> rotate<0,54.582228,0> translate<47.650000,-1.535000,30.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.120000,-1.535000,31.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,-1.535000,30.162500>}
box{<0,0,-0.203200><1.545028,0.035000,0.203200> rotate<0,44.997030,0> translate<48.120000,-1.535000,31.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.107500,-1.535000,32.855000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.212500,-1.535000,31.432500>}
box{<0,0,-0.304800><1.801258,0.035000,0.304800> rotate<0,52.156447,0> translate<48.107500,-1.535000,32.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.722500,0.000000,31.461250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,31.461250>}
box{<0,0,-0.203200><7.490000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.722500,0.000000,31.461250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.990000,0.000000,34.292500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.212500,0.000000,34.261250>}
box{<0,0,-0.406400><2.222720,0.035000,0.406400> rotate<0,0.805515,0> translate<46.990000,0.000000,34.292500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,35.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.860000,-1.535000,35.255000>}
box{<0,0,-0.203200><3.102500,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,35.255000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,-1.535000,20.957500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.165000,-1.535000,18.893750>}
box{<0,0,-0.304800><4.333032,0.035000,0.304800> rotate<0,28.441052,0> translate<46.355000,-1.535000,20.957500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.165000,-1.535000,20.793750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.165000,-1.535000,22.860000>}
box{<0,0,-0.406400><2.066250,0.035000,0.406400> rotate<0,90.000000,0> translate<50.165000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.330500,-1.535000,30.162500>}
box{<0,0,-0.203200><1.118000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.212500,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.330500,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,30.010500>}
box{<0,0,-0.203200><0.214960,0.035000,0.203200> rotate<0,44.997030,0> translate<50.330500,-1.535000,30.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.729500,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,32.854500>}
box{<0,0,-0.203200><1.927125,0.035000,0.203200> rotate<0,24.541988,0> translate<48.729500,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767500,-1.535000,39.242500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,42.545000>}
box{<0,0,-0.203200><3.721254,0.035000,0.203200> rotate<0,-62.552859,0> translate<48.767500,-1.535000,39.242500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.305000,0.000000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.641250,0.000000,35.877500>}
box{<0,0,-0.203200><3.336250,0.035000,0.203200> rotate<0,0.000000,0> translate<47.305000,0.000000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.643750,0.000000,37.465000>}
box{<0,0,-0.203200><2.383750,0.035000,0.203200> rotate<0,0.000000,0> translate<48.260000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<47.434500,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.800000,-1.535000,6.350000>}
box{<0,0,-0.508000><3.365500,0.035000,0.508000> rotate<0,0.000000,0> translate<47.434500,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<45.847000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.800000,-1.535000,8.890000>}
box{<0,0,-0.508000><5.815713,0.035000,0.508000> rotate<0,31.605416,0> translate<45.847000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.643750,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.802500,0.000000,39.222500>}
box{<0,0,-0.203200><1.764655,0.035000,0.203200> rotate<0,-84.833042,0> translate<50.643750,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,32.854500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.965500,-1.535000,33.337500>}
box{<0,0,-0.203200><0.683065,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.482500,-1.535000,32.854500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.117500,-1.535000,43.815000>}
box{<0,0,-0.203200><1.419903,0.035000,0.203200> rotate<0,-63.430762,0> translate<50.482500,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<50.482500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.117500,0.000000,43.815000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,82.869514,0> translate<50.482500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,34.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.123750,-1.535000,34.455000>}
box{<0,0,-0.203200><4.366250,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,34.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,-1.535000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,-1.535000,31.432500>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.212500,-1.535000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,0.000000,31.461250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,31.461250>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<49.212500,0.000000,31.461250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.641250,0.000000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,34.261250>}
box{<0,0,-0.203200><1.961413,0.035000,0.203200> rotate<0,55.485934,0> translate<50.641250,0.000000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.321250,0.000000,41.592500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<51.752500,0.000000,41.422500>}
box{<0,0,-0.304800><1.441311,0.035000,0.304800> rotate<0,6.773255,0> translate<50.321250,0.000000,41.592500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,34.261250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.882500,0.000000,34.290000>}
box{<0,0,-0.203200><0.133141,0.035000,0.203200> rotate<0,-12.469639,0> translate<51.752500,0.000000,34.261250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.965500,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.911250,-1.535000,33.496250>}
box{<0,0,-0.203200><0.958981,0.035000,0.203200> rotate<0,-9.527994,0> translate<50.965500,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.085000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,10.477500>}
box{<0,0,-0.203200><8.454090,0.035000,0.203200> rotate<0,34.284614,0> translate<45.085000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,-1.535000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,31.750000>}
box{<0,0,-0.203200><0.449013,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.752500,-1.535000,31.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,16.668750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.387500,0.000000,11.906250>}
box{<0,0,-0.203200><7.685861,0.035000,0.203200> rotate<0,38.287636,0> translate<46.355000,0.000000,16.668750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.390000,-1.535000,31.750000>}
box{<0,0,-0.203200><0.320000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.482500,-1.535000,30.010500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.550500,-1.535000,30.010500>}
box{<0,0,-0.203200><2.068000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.482500,-1.535000,30.010500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.543750,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.702500,0.000000,39.222500>}
box{<0,0,-0.508000><1.764655,0.035000,0.508000> rotate<0,-84.833042,0> translate<52.543750,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,0.000000,20.637500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,0.000000,13.335000>}
box{<0,0,-0.203200><9.677242,0.035000,0.203200> rotate<0,48.987680,0> translate<46.355000,0.000000,20.637500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.550500,-1.535000,30.010500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,30.165000>}
box{<0,0,-0.203200><0.218496,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.550500,-1.535000,30.010500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.390000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,32.065000>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.390000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,-1.535000,32.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.707500,-1.535000,32.067500>}
box{<0,0,-0.203200><0.003536,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.705000,-1.535000,32.065000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.165000,-1.535000,18.893750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.022500,-1.535000,16.192500>}
box{<0,0,-0.304800><3.932182,0.035000,0.304800> rotate<0,43.387043,0> translate<50.165000,-1.535000,18.893750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.386250,0.000000,32.861250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,0.000000,32.861250>}
box{<0,0,-0.203200><10.636250,0.035000,0.203200> rotate<0,0.000000,0> translate<42.386250,0.000000,32.861250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.967500,-1.535000,36.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,-1.535000,41.910000>}
box{<0,0,-0.203200><7.148850,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.967500,-1.535000,36.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.702500,0.000000,39.222500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.040500,0.000000,39.560500>}
box{<0,0,-0.203200><0.478004,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.702500,0.000000,39.222500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.022500,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.181250,-1.535000,20.726000>}
box{<0,0,-0.304800><4.536279,0.035000,0.304800> rotate<0,-87.988680,0> translate<53.022500,-1.535000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831250,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,10.477500>}
box{<0,0,-0.203200><7.707145,0.035000,0.203200> rotate<0,32.378541,0> translate<46.831250,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.165000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,25.400000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.165000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.212500,-1.535000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,28.257500>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<49.212500,-1.535000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.657500,-1.535000,43.815000>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,-71.560328,0> translate<53.022500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.022500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<53.657500,0.000000,43.815000>}
box{<0,0,-0.406400><5.119534,0.035000,0.406400> rotate<0,82.869514,0> translate<53.022500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.757500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.816250,-1.535000,27.305000>}
box{<0,0,-0.203200><7.058750,0.035000,0.203200> rotate<0,0.000000,0> translate<46.757500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.022500,0.000000,32.861250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.975000,0.000000,32.702500>}
box{<0,0,-0.203200><0.965639,0.035000,0.203200> rotate<0,9.461698,0> translate<53.022500,0.000000,32.861250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.752500,0.000000,41.422500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.272000,0.000000,41.422500>}
box{<0,0,-0.203200><2.519500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.752500,0.000000,41.422500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<50.800000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.451250,-1.535000,1.428750>}
box{<0,0,-0.508000><6.127832,0.035000,0.508000> rotate<0,53.423443,0> translate<50.800000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<51.882500,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,34.607500>}
box{<0,0,-0.508000><2.745917,0.035000,0.508000> rotate<0,-6.639306,0> translate<51.882500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.911250,-1.535000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,34.607500>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,-22.378658,0> translate<51.911250,-1.535000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.123750,-1.535000,34.455000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,-1.535000,37.465000>}
box{<0,0,-0.406400><4.605870,0.035000,0.406400> rotate<0,-40.804367,0> translate<51.123750,-1.535000,34.455000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<52.543750,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,37.465000>}
box{<0,0,-0.508000><2.066250,0.035000,0.508000> rotate<0,0.000000,0> translate<52.543750,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.040500,0.000000,39.560500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<54.610000,0.000000,39.560500>}
box{<0,0,-0.350000><1.569500,0.035000,0.350000> rotate<0,0.000000,0> translate<53.040500,0.000000,39.560500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.272000,0.000000,41.422500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,0.000000,41.084500>}
box{<0,0,-0.203200><0.478004,0.035000,0.203200> rotate<0,44.997030,0> translate<54.272000,0.000000,41.422500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,10.477500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.927500,-1.535000,5.715000>}
box{<0,0,-0.203200><5.020116,0.035000,0.203200> rotate<0,71.560328,0> translate<53.340000,-1.535000,10.477500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<52.707500,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.927500,-1.535000,32.067500>}
box{<0,0,-0.406400><2.220000,0.035000,0.406400> rotate<0,0.000000,0> translate<52.707500,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.245000,-1.535000,29.845000>}
box{<0,0,-0.203200><2.479754,0.035000,0.203200> rotate<0,-39.802944,0> translate<53.340000,-1.535000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.816250,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,-1.535000,28.575000>}
box{<0,0,-0.203200><2.159233,0.035000,0.203200> rotate<0,-36.024996,0> translate<53.816250,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.975000,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,0.000000,32.702500>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,0.000000,0> translate<53.975000,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.755000,-1.535000,36.055000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,-1.535000,42.545000>}
box{<0,0,-0.203200><9.405432,0.035000,0.203200> rotate<0,-43.629348,0> translate<48.755000,-1.535000,36.055000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.247500,-1.535000,18.426250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.565000,-1.535000,15.240000>}
box{<0,0,-0.406400><3.202030,0.035000,0.406400> rotate<0,84.303873,0> translate<55.247500,-1.535000,18.426250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,27.305000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-36.867464,0> translate<53.340000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<53.022500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<55.902500,0.000000,16.192500>}
box{<0,0,-0.508000><2.880000,0.035000,0.508000> rotate<0,0.000000,0> translate<53.022500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.197500,-1.535000,43.973750>}
box{<0,0,-0.203200><1.563506,0.035000,0.203200> rotate<0,-66.033153,0> translate<55.562500,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.562500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.197500,0.000000,43.973750>}
box{<0,0,-0.406400><4.962049,0.035000,0.406400> rotate<0,82.642166,0> translate<55.562500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<55.565000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.200000,-1.535000,13.173750>}
box{<0,0,-0.406400><2.161623,0.035000,0.406400> rotate<0,72.911946,0> translate<55.565000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,0.000000,32.702500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.356250,0.000000,33.496250>}
box{<0,0,-0.203200><1.122532,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.562500,0.000000,32.702500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.022500,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,-1.535000,6.667500>}
box{<0,0,-0.304800><10.145106,0.035000,0.304800> rotate<0,69.859086,0> translate<53.022500,-1.535000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.197500,-1.535000,20.626250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,-1.535000,22.860000>}
box{<0,0,-0.304800><2.256202,0.035000,0.304800> rotate<0,-81.904895,0> translate<56.197500,-1.535000,20.626250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<53.181250,-1.535000,23.724000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.515000,-1.535000,25.400000>}
box{<0,0,-0.304800><3.731336,0.035000,0.304800> rotate<0,-26.688614,0> translate<53.181250,-1.535000,23.724000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.610000,0.000000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.515000,0.000000,35.877500>}
box{<0,0,-0.508000><2.289525,0.035000,0.508000> rotate<0,-33.687844,0> translate<54.610000,0.000000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.610000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.515000,-1.535000,35.877500>}
box{<0,0,-0.406400><2.479754,0.035000,0.406400> rotate<0,39.802944,0> translate<54.610000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.927500,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.832500,-1.535000,34.131250>}
box{<0,0,-0.304800><2.808574,0.035000,0.304800> rotate<0,-47.287489,0> translate<54.927500,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.515000,-1.535000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.832500,-1.535000,34.131250>}
box{<0,0,-0.406400><1.774879,0.035000,0.406400> rotate<0,79.689894,0> translate<56.515000,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.275000,0.000000,28.416250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.991250,0.000000,28.416250>}
box{<0,0,-0.304800><15.716250,0.035000,0.304800> rotate<0,0.000000,0> translate<41.275000,0.000000,28.416250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.927500,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,3.492500>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<54.927500,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.147500,-1.535000,18.426250>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.467500,-1.535000,15.242500>}
box{<0,0,-0.406400><3.199791,0.035000,0.406400> rotate<0,84.254893,0> translate<57.147500,-1.535000,18.426250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.465000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.467500,-1.535000,15.242500>}
box{<0,0,-0.203200><0.003536,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.465000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<56.515000,0.000000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<57.467500,0.000000,37.465000>}
box{<0,0,-0.508000><1.851327,0.035000,0.508000> rotate<0,-59.032347,0> translate<56.515000,0.000000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<54.610000,0.000000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531575,0.000000,40.282294>}
box{<0,0,-0.304800><3.029709,0.035000,0.304800> rotate<0,15.352867,0> translate<54.610000,0.000000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.860000,-1.535000,35.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,-1.535000,42.862500>}
box{<0,0,-0.203200><10.985430,0.035000,0.203200> rotate<0,-43.826087,0> translate<49.860000,-1.535000,35.255000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.515000,-1.535000,6.667500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.102500,-1.535000,5.080000>}
box{<0,0,-0.406400><2.245064,0.035000,0.406400> rotate<0,44.997030,0> translate<56.515000,-1.535000,6.667500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,31.591250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.102500,-1.535000,34.290000>}
box{<0,0,-0.203200><2.861906,0.035000,0.203200> rotate<0,-70.555308,0> translate<57.150000,-1.535000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.102500,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.261250,-1.535000,5.080000>}
box{<0,0,-0.203200><0.158750,0.035000,0.203200> rotate<0,0.000000,0> translate<58.102500,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.245000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,29.845000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.245000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.531575,0.000000,40.282294>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.896250,0.000000,42.068750>}
box{<0,0,-0.304800><2.248058,0.035000,0.304800> rotate<0,-52.620296,0> translate<57.531575,0.000000,40.282294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,-1.535000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.896250,-1.535000,44.291250>}
box{<0,0,-0.203200><1.810028,0.035000,0.203200> rotate<0,-52.121576,0> translate<57.785000,-1.535000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.102500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.896250,0.000000,44.291250>}
box{<0,0,-0.406400><4.671676,0.035000,0.406400> rotate<0,80.212299,0> translate<58.102500,0.000000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.562500,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,-1.535000,28.575000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.562500,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.467500,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.055000,-1.535000,38.417500>}
box{<0,0,-0.304800><1.851327,0.035000,0.304800> rotate<0,-30.961713,0> translate<57.467500,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.356250,0.000000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.213750,0.000000,33.496250>}
box{<0,0,-0.203200><2.857500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.356250,0.000000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<54.451250,-1.535000,1.428750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.372500,-1.535000,1.428750>}
box{<0,0,-0.508000><4.921250,0.035000,0.508000> rotate<0,0.000000,0> translate<54.451250,-1.535000,1.428750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.200000,-1.535000,13.173750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.372500,-1.535000,7.620000>}
box{<0,0,-0.406400><6.396006,0.035000,0.406400> rotate<0,60.259475,0> translate<56.200000,-1.535000,13.173750> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.372500,0.000000,1.428750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.372500,0.000000,7.620000>}
box{<0,0,-0.508000><6.191250,0.035000,0.508000> rotate<0,90.000000,0> translate<59.372500,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.372500,0.000000,7.778750>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<59.372500,0.000000,7.620000>}
box{<0,0,-0.508000><0.158750,0.035000,0.508000> rotate<0,-90.000000,0> translate<59.372500,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,10.477500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,0.000000,10.477500>}
box{<0,0,-0.203200><7.302500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,0.000000,10.477500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.465000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.372500,-1.535000,15.237500>}
box{<0,0,-0.406400><1.907502,0.035000,0.406400> rotate<0,0.075088,0> translate<57.465000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.197500,-1.535000,20.626250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.372500,-1.535000,19.685000>}
box{<0,0,-0.304800><3.311582,0.035000,0.304800> rotate<0,16.511720,0> translate<56.197500,-1.535000,20.626250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,-1.535000,30.797500>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.420000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.467500,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,0.000000,40.640000>}
box{<0,0,-0.203200><3.702654,0.035000,0.203200> rotate<0,-59.032347,0> translate<57.467500,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.102500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,-1.535000,35.877500>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.102500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.372500,-1.535000,13.337500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<59.860000,-1.535000,10.953750>}
box{<0,0,-0.406400><2.433089,0.035000,0.406400> rotate<0,78.436659,0> translate<59.372500,-1.535000,13.337500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<58.843244,0.000000,35.136753>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.943422,0.000000,38.775203>}
box{<0,0,-0.304800><3.801146,0.035000,0.304800> rotate<0,-73.171140,0> translate<58.843244,0.000000,35.136753> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.150000,0.000000,31.591250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.007500,0.000000,29.051250>}
box{<0,0,-0.304800><3.823206,0.035000,0.304800> rotate<0,41.630792,0> translate<57.150000,0.000000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.007500,-1.535000,29.527500>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.055000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.302500,0.000000,16.192500>}
box{<0,0,-0.203200><3.614202,0.035000,0.203200> rotate<0,75.084051,0> translate<59.372500,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.387500,0.000000,11.906250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,0.000000,11.906250>}
box{<0,0,-0.203200><7.937500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.387500,0.000000,11.906250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.007500,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,29.527500>}
box{<0,0,-0.203200><0.736600,0.035000,0.203200> rotate<0,0.000000,0> translate<60.007500,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,30.797500>}
box{<0,0,-0.203200><1.371600,0.035000,0.203200> rotate<0,0.000000,0> translate<59.372500,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,33.337500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.744100,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,34.607500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.744100,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.690000,-1.535000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,35.877500>}
box{<0,0,-0.203200><1.054100,0.035000,0.203200> rotate<0,0.000000,0> translate<59.690000,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.055000,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.744100,-1.535000,38.417500>}
box{<0,0,-0.304800><1.689100,0.035000,0.304800> rotate<0,0.000000,0> translate<59.055000,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.372500,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.801250,0.000000,42.068750>}
box{<0,0,-0.304800><2.020558,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.372500,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.896250,0.000000,42.068750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.801250,0.000000,43.338750>}
box{<0,0,-0.203200><2.289525,0.035000,0.203200> rotate<0,-33.687844,0> translate<58.896250,0.000000,42.068750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.705000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,0.000000,13.335000>}
box{<0,0,-0.203200><8.572500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.705000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,-1.535000,27.305000>}
box{<0,0,-0.203200><5.397500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.912500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.912500,-1.535000,15.237500>}
box{<0,0,-0.203200><1.272500,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.912500,-1.535000,15.237500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.801250,0.000000,43.338750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.912500,0.000000,48.895000>}
box{<0,0,-0.304800><5.666285,0.035000,0.304800> rotate<0,-78.684874,0> translate<60.801250,0.000000,43.338750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.912500,-1.535000,13.337500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.060000,-1.535000,11.903750>}
box{<0,0,-0.406400><1.441317,0.035000,0.406400> rotate<0,84.120690,0> translate<61.912500,-1.535000,13.337500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<56.991250,0.000000,28.416250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.071250,0.000000,23.971250>}
box{<0,0,-0.304800><6.750143,0.035000,0.304800> rotate<0,41.183207,0> translate<56.991250,0.000000,28.416250> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.060000,-1.535000,10.003750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.078000,-1.535000,8.255000>}
box{<0,0,-0.406400><1.748843,0.035000,0.406400> rotate<0,89.404371,0> translate<62.060000,-1.535000,10.003750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<60.854253,0.000000,33.125744>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.229997,0.000000,31.273750>}
box{<0,0,-0.406400><2.307066,0.035000,0.406400> rotate<0,53.389861,0> translate<60.854253,0.000000,33.125744> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.912500,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,-1.535000,18.415000>}
box{<0,0,-0.203200><1.931277,0.035000,0.203200> rotate<0,-80.532363,0> translate<61.912500,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,-1.535000,30.797500>}
box{<0,0,-0.203200><1.485900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.744100,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.213750,0.000000,33.496250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,36.353750>}
box{<0,0,-0.203200><4.154885,0.035000,0.203200> rotate<0,-43.448975,0> translate<59.213750,0.000000,33.496250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,-1.535000,38.417500>}
box{<0,0,-0.203200><1.485900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.744100,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,-1.535000,32.067500>}
box{<0,0,-0.203200><1.803400,0.035000,0.203200> rotate<0,0.000000,0> translate<60.744100,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,36.353750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,0.000000,40.640000>}
box{<0,0,-0.203200><4.297993,0.035000,0.203200> rotate<0,-85.757945,0> translate<62.230000,0.000000,36.353750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.372500,0.000000,10.477500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,6.985000>}
box{<0,0,-0.203200><4.939141,0.035000,0.203200> rotate<0,44.997030,0> translate<59.372500,0.000000,10.477500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,6.985000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<62.865000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,-1.535000,28.892500>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.277500,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,-1.535000,30.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,-1.535000,28.892500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.865000,-1.535000,28.892500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,-1.535000,30.162500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<62.230000,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.801250,0.000000,42.068750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.182500,0.000000,42.862500>}
box{<0,0,-0.304800><2.510058,0.035000,0.304800> rotate<0,-18.433732,0> translate<60.801250,0.000000,42.068750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.182500,0.000000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.182500,0.000000,42.862500>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.182500,0.000000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.261250,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,5.080000>}
box{<0,0,-0.406400><5.238750,0.035000,0.406400> rotate<0,0.000000,0> translate<58.261250,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,-1.535000,5.080000>}
box{<0,0,-0.203200><11.112500,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.500000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.302500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.817500,0.000000,16.192500>}
box{<0,0,-0.203200><3.515000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.302500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.817500,-1.535000,37.147500>}
box{<0,0,-0.203200><2.032992,0.035000,0.203200> rotate<0,38.657257,0> translate<62.230000,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,34.763750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.987500,0.000000,37.147500>}
box{<0,0,-0.203200><2.433089,0.035000,0.203200> rotate<0,-78.436659,0> translate<63.500000,0.000000,34.763750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.987500,0.000000,38.594250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.987500,0.000000,37.147500>}
box{<0,0,-0.304800><1.446750,0.035000,0.304800> rotate<0,-90.000000,0> translate<63.987500,0.000000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,0.000000,11.906250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,0.000000,7.778750>}
box{<0,0,-0.203200><5.837166,0.035000,0.203200> rotate<0,44.997030,0> translate<60.325000,0.000000,11.906250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,0.000000,7.778750>}
box{<0,0,-0.203200><3.016250,0.035000,0.203200> rotate<0,90.000000,0> translate<64.452500,0.000000,7.778750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,27.778750>}
box{<0,0,-0.203200><0.796250,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.452500,-1.535000,27.778750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,-1.535000,32.067500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,31.591250>}
box{<0,0,-0.203200><1.963629,0.035000,0.203200> rotate<0,14.035317,0> translate<62.547500,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,31.591250>}
box{<0,0,-0.203200><1.111250,0.035000,0.203200> rotate<0,90.000000,0> translate<64.452500,-1.535000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.547500,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,38.417500>}
box{<0,0,-0.203200><2.927205,0.035000,0.203200> rotate<0,49.395445,0> translate<62.547500,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.182500,0.000000,44.132500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.452500,0.000000,48.895000>}
box{<0,0,-0.304800><4.928925,0.035000,0.304800> rotate<0,-75.063629,0> translate<63.182500,0.000000,44.132500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,27.778750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.455000,-1.535000,26.987500>}
box{<0,0,-0.203200><0.791254,0.035000,0.203200> rotate<0,89.813044,0> translate<64.452500,-1.535000,27.778750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.455000,-1.535000,29.530000>}
box{<0,0,-0.203200><0.955003,0.035000,0.203200> rotate<0,-89.844082,0> translate<64.452500,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.455000,-1.535000,29.530000>}
box{<0,0,-0.203200><0.950003,0.035000,0.203200> rotate<0,89.843292,0> translate<64.452500,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.071250,-1.535000,21.431250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.640000,-1.535000,20.955000>}
box{<0,0,-0.304800><2.612526,0.035000,0.304800> rotate<0,10.502764,0> translate<62.071250,-1.535000,21.431250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.230000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.640000,-1.535000,20.955000>}
box{<0,0,-0.304800><3.501385,0.035000,0.304800> rotate<0,-46.501323,0> translate<62.230000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,32.863750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.772500,0.000000,32.863750>}
box{<0,0,-0.203200><1.272500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.500000,0.000000,32.863750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<64.922000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<64.922000,-1.535000,15.074500>}
box{<0,0,-0.406400><6.819500,0.035000,0.406400> rotate<0,90.000000,0> translate<64.922000,-1.535000,15.074500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,34.763750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.926250,0.000000,34.763750>}
box{<0,0,-0.203200><1.426250,0.035000,0.203200> rotate<0,0.000000,0> translate<63.500000,0.000000,34.763750> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<63.500000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<64.931250,-1.535000,5.080000>}
box{<0,0,-0.406400><1.431250,0.035000,0.406400> rotate<0,0.000000,0> translate<63.500000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.817500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.087500,0.000000,15.557500>}
box{<0,0,-0.203200><1.419903,0.035000,0.203200> rotate<0,26.563298,0> translate<63.817500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.926250,0.000000,34.763750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.087500,0.000000,34.766250>}
box{<0,0,-0.203200><0.161269,0.035000,0.203200> rotate<0,-0.888177,0> translate<64.926250,0.000000,34.763750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.772500,0.000000,32.863750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.246250,0.000000,33.178750>}
box{<0,0,-0.203200><0.568915,0.035000,0.203200> rotate<0,-33.618018,0> translate<64.772500,0.000000,32.863750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.987500,0.000000,38.594250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.405000,0.000000,41.440500>}
box{<0,0,-0.304800><3.179693,0.035000,0.304800> rotate<0,-63.521414,0> translate<63.987500,0.000000,38.594250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.277500,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.722500,0.000000,8.890000>}
box{<0,0,-0.203200><6.286179,0.035000,0.203200> rotate<0,44.997030,0> translate<61.277500,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.722500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.722500,0.000000,8.890000>}
box{<0,0,-0.203200><3.492500,0.035000,0.203200> rotate<0,90.000000,0> translate<65.722500,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<60.007500,0.000000,29.051250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.722500,0.000000,29.051250>}
box{<0,0,-0.304800><5.715000,0.035000,0.304800> rotate<0,0.000000,0> translate<60.007500,0.000000,29.051250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.500000,-1.535000,16.192500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,19.685000>}
box{<0,0,-0.304800><4.318467,0.035000,0.304800> rotate<0,-53.969065,0> translate<63.500000,-1.535000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,25.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,19.685000>}
box{<0,0,-0.304800><5.395000,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.040000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.290000,-1.535000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,-1.535000,46.037500>}
box{<0,0,-0.203200><31.750000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.290000,-1.535000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,25.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.355000,-1.535000,26.987500>}
box{<0,0,-0.304800><1.933334,0.035000,0.304800> rotate<0,-80.617619,0> translate<66.040000,-1.535000,25.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.355000,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.355000,-1.535000,29.527500>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<66.355000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.187500,0.000000,38.097500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.357500,0.000000,39.687500>}
box{<0,0,-0.304800><1.599062,0.035000,0.304800> rotate<0,-83.891683,0> translate<66.187500,0.000000,38.097500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.865000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.675000,0.000000,0.635000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,44.997030,0> translate<62.865000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.931250,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.675000,-1.535000,7.458750>}
box{<0,0,-0.203200><2.949426,0.035000,0.203200> rotate<0,-53.753058,0> translate<64.931250,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.675000,-1.535000,11.112500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.675000,-1.535000,7.458750>}
box{<0,0,-0.203200><3.653750,0.035000,0.203200> rotate<0,-90.000000,0> translate<66.675000,-1.535000,7.458750> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.675000,-1.535000,14.287500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.675000,-1.535000,11.112500>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,-90.000000,0> translate<66.675000,-1.535000,11.112500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<62.229997,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<66.697500,0.000000,31.273750>}
box{<0,0,-0.406400><4.467503,0.035000,0.406400> rotate<0,0.000000,0> translate<62.229997,0.000000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.355000,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,29.527500>}
box{<0,0,-0.203200><0.535900,0.035000,0.203200> rotate<0,0.000000,0> translate<66.355000,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,32.067500>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<66.890900,-1.535000,32.067500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.744100,-1.535000,34.607500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,34.607500>}
box{<0,0,-0.203200><6.146800,0.035000,0.203200> rotate<0,0.000000,0> translate<60.744100,-1.535000,34.607500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.817500,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,37.147500>}
box{<0,0,-0.203200><3.073400,0.035000,0.203200> rotate<0,0.000000,0> translate<63.817500,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,-1.535000,38.417500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,38.417500>}
box{<0,0,-0.203200><2.438400,0.035000,0.203200> rotate<0,0.000000,0> translate<64.452500,-1.535000,38.417500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<64.922000,-1.535000,15.074500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.992500,-1.535000,17.462500>}
box{<0,0,-0.508000><3.160619,0.035000,0.508000> rotate<0,-49.070049,0> translate<64.922000,-1.535000,15.074500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.405000,0.000000,44.284500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.992500,0.000000,46.189500>}
box{<0,0,-0.304800><2.479754,0.035000,0.304800> rotate<0,-50.191116,0> translate<65.405000,0.000000,44.284500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.992500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.992500,0.000000,46.189500>}
box{<0,0,-0.203200><2.705500,0.035000,0.203200> rotate<0,-90.000000,0> translate<66.992500,0.000000,46.189500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.452500,0.000000,4.762500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,1.905000>}
box{<0,0,-0.203200><4.041115,0.035000,0.203200> rotate<0,44.997030,0> translate<64.452500,0.000000,4.762500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.357500,0.000000,39.687500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,40.490000>}
box{<0,0,-0.304800><1.245497,0.035000,0.304800> rotate<0,-40.112150,0> translate<66.357500,0.000000,39.687500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.182500,0.000000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,42.862500>}
box{<0,0,-0.203200><4.127500,0.035000,0.203200> rotate<0,0.000000,0> translate<63.182500,0.000000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,40.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,42.862500>}
box{<0,0,-0.304800><2.372500,0.035000,0.304800> rotate<0,90.000000,0> translate<67.310000,0.000000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,43.815000>}
box{<0,0,-0.304800><0.952500,0.035000,0.304800> rotate<0,90.000000,0> translate<67.310000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.675000,-1.535000,14.287500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.627500,-1.535000,15.557500>}
box{<0,0,-0.304800><1.587500,0.035000,0.304800> rotate<0,-53.126596,0> translate<66.675000,-1.535000,14.287500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.722500,0.000000,5.397500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.945000,0.000000,3.175000>}
box{<0,0,-0.203200><3.143090,0.035000,0.203200> rotate<0,44.997030,0> translate<65.722500,0.000000,5.397500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.187500,0.000000,36.197500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.945000,0.000000,36.515000>}
box{<0,0,-0.203200><1.785949,0.035000,0.203200> rotate<0,-10.239608,0> translate<66.187500,0.000000,36.197500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<66.992500,-1.535000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<68.148200,-1.535000,18.415000>}
box{<0,0,-0.508000><1.497631,0.035000,0.508000> rotate<0,-39.491916,0> translate<66.992500,-1.535000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.246250,0.000000,33.178750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.423750,0.000000,33.178750>}
box{<0,0,-0.203200><3.177500,0.035000,0.203200> rotate<0,0.000000,0> translate<65.246250,0.000000,33.178750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.440000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.580000,-1.535000,21.590000>}
box{<0,0,-0.152400><1.304923,0.035000,0.152400> rotate<0,-29.116652,0> translate<67.440000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.582500,-1.535000,35.877500>}
box{<0,0,-0.203200><1.691600,0.035000,0.203200> rotate<0,0.000000,0> translate<66.890900,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.423750,0.000000,33.178750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.738750,0.000000,32.863750>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,44.997030,0> translate<68.423750,0.000000,33.178750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.738750,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.738750,0.000000,32.863750>}
box{<0,0,-0.203200><3.018750,0.035000,0.203200> rotate<0,90.000000,0> translate<68.738750,0.000000,32.863750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.831250,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.859400,-1.535000,6.273800>}
box{<0,0,-0.203200><2.353413,0.035000,0.203200> rotate<0,-30.479704,0> translate<66.831250,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.859400,-1.535000,6.273800>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<68.580000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.859400,-1.535000,12.776200>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<68.580000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.148200,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.859400,-1.535000,18.338800>}
box{<0,0,-0.203200><0.715270,0.035000,0.203200> rotate<0,6.115100,0> translate<68.148200,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.859400,-1.535000,18.338800>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<68.580000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.580000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<68.859400,-1.535000,24.841200>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<68.580000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.859400,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.897500,-1.535000,14.135500>}
box{<0,0,-0.203200><1.359834,0.035000,0.203200> rotate<0,-88.388636,0> translate<68.859400,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.859400,-1.535000,18.338800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.897500,-1.535000,16.979500>}
box{<0,0,-0.203200><1.359834,0.035000,0.203200> rotate<0,88.388636,0> translate<68.859400,-1.535000,18.338800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.890900,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.897500,-1.535000,33.337500>}
box{<0,0,-0.203200><2.006600,0.035000,0.203200> rotate<0,0.000000,0> translate<66.890900,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.890900,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.215000,-1.535000,28.895000>}
box{<0,0,-0.304800><2.408630,0.035000,0.304800> rotate<0,15.223236,0> translate<66.890900,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.890900,-1.535000,30.797500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.215000,-1.535000,30.795000>}
box{<0,0,-0.304800><2.324101,0.035000,0.304800> rotate<0,0.061628,0> translate<66.890900,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.040000,-1.535000,46.037500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.215000,-1.535000,41.910000>}
box{<0,0,-0.203200><5.207387,0.035000,0.203200> rotate<0,52.427948,0> translate<66.040000,-1.535000,46.037500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.945000,0.000000,38.415000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.215000,0.000000,41.910000>}
box{<0,0,-0.304800><3.718592,0.035000,0.304800> rotate<0,-70.025436,0> translate<67.945000,0.000000,38.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<65.722500,0.000000,29.051250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.246750,0.000000,27.940000>}
box{<0,0,-0.304800><3.695296,0.035000,0.304800> rotate<0,17.499706,0> translate<65.722500,0.000000,29.051250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.087500,0.000000,34.766250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.373750,0.000000,34.766250>}
box{<0,0,-0.203200><4.286250,0.035000,0.203200> rotate<0,0.000000,0> translate<65.087500,0.000000,34.766250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.532500,0.000000,45.085000>}
box{<0,0,-0.304800><2.559767,0.035000,0.304800> rotate<0,-29.742918,0> translate<67.310000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,-1.535000,45.085000>}
box{<0,0,-0.635000><4.445000,0.035000,0.635000> rotate<0,-90.000000,0> translate<69.532500,-1.535000,45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,0.000000,45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<69.532500,0.000000,48.260000>}
box{<0,0,-0.635000><3.175000,0.035000,0.635000> rotate<0,90.000000,0> translate<69.532500,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.532500,0.000000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.532500,0.000000,48.260000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<69.532500,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.497500,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.532500,-1.535000,49.530000>}
box{<0,0,-0.203200><26.035000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.497500,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.897500,-1.535000,33.337500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.535000,-1.535000,33.816250>}
box{<0,0,-0.203200><0.797250,0.035000,0.203200> rotate<0,-36.903395,0> translate<68.897500,-1.535000,33.337500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.535000,-1.535000,33.816250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.535000,-1.535000,35.247500>}
box{<0,0,-0.203200><1.431250,0.035000,0.203200> rotate<0,90.000000,0> translate<69.535000,-1.535000,35.247500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.582500,-1.535000,35.877500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.850000,-1.535000,35.245000>}
box{<0,0,-0.203200><1.416550,0.035000,0.203200> rotate<0,26.518079,0> translate<68.582500,-1.535000,35.877500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.535000,-1.535000,35.247500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.850000,-1.535000,35.245000>}
box{<0,0,-0.203200><0.315010,0.035000,0.203200> rotate<0,0.454689,0> translate<69.535000,-1.535000,35.247500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.890900,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.850000,-1.535000,37.145000>}
box{<0,0,-0.304800><2.959101,0.035000,0.304800> rotate<0,0.048403,0> translate<66.890900,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.373750,0.000000,34.766250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.008750,0.000000,35.401250>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<69.373750,0.000000,34.766250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.008750,0.000000,39.211250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.008750,0.000000,35.401250>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<70.008750,0.000000,35.401250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.532500,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.167500,0.000000,48.895000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<69.532500,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.859400,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.170000,-1.535000,13.335000>}
box{<0,0,-0.203200><1.424756,0.035000,0.203200> rotate<0,-23.090402,0> translate<68.859400,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.850000,-1.535000,37.145000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.170000,-1.535000,37.147500>}
box{<0,0,-0.203200><0.320010,0.035000,0.203200> rotate<0,-0.447585,0> translate<69.850000,-1.535000,37.145000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,3.492500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.599300,-1.535000,3.492500>}
box{<0,0,-0.203200><13.449300,0.035000,0.203200> rotate<0,0.000000,0> translate<57.150000,-1.535000,3.492500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.738750,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.120000,0.000000,28.257500>}
box{<0,0,-0.203200><2.861906,0.035000,0.203200> rotate<0,33.687844,0> translate<68.738750,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<69.246750,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.361300,0.000000,26.555700>}
box{<0,0,-0.304800><2.527372,0.035000,0.304800> rotate<0,33.208758,0> translate<69.246750,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.437500,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.437500,0.000000,38.735000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<71.437500,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<68.859400,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.596250,-1.535000,28.098750>}
box{<0,0,-0.304800><4.254642,0.035000,0.304800> rotate<0,-49.961205,0> translate<68.859400,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<69.215000,-1.535000,30.795000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<71.596250,-1.535000,31.430000>}
box{<0,0,-0.406400><2.464463,0.035000,0.406400> rotate<0,-14.930432,0> translate<69.215000,-1.535000,30.795000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.596250,-1.535000,28.098750>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.596250,-1.535000,31.430000>}
box{<0,0,-0.304800><3.331250,0.035000,0.304800> rotate<0,90.000000,0> translate<71.596250,-1.535000,31.430000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<70.170000,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.596250,-1.535000,37.147500>}
box{<0,0,-0.508000><1.426250,0.035000,0.508000> rotate<0,0.000000,0> translate<70.170000,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.596250,-1.535000,31.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.596250,-1.535000,37.147500>}
box{<0,0,-0.304800><5.717500,0.035000,0.304800> rotate<0,90.000000,0> translate<71.596250,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.437500,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.390000,0.000000,40.005000>}
box{<0,0,-0.203200><1.587500,0.035000,0.203200> rotate<0,-53.126596,0> translate<71.437500,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.008750,0.000000,39.211250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.390000,0.000000,42.862500>}
box{<0,0,-0.203200><4.359126,0.035000,0.203200> rotate<0,-56.884904,0> translate<70.008750,0.000000,39.211250> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<72.390000,-1.535000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.230000,-1.535000,46.196250>}
box{<0,0,-0.304800><3.437948,0.035000,0.304800> rotate<0,-75.852647,0> translate<72.390000,-1.535000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.599300,-1.535000,3.492500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.380600,-1.535000,6.273800>}
box{<0,0,-0.203200><3.933352,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.599300,-1.535000,3.492500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.070000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.380600,-1.535000,12.776200>}
box{<0,0,-0.203200><1.424756,0.035000,0.203200> rotate<0,23.090402,0> translate<72.070000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<71.361300,0.000000,26.555700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<73.380600,0.000000,24.841200>}
box{<0,0,-0.304800><2.648978,0.035000,0.304800> rotate<0,40.330480,0> translate<71.361300,0.000000,26.555700> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.380600,-1.535000,6.273800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.660000,-1.535000,9.525000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<73.380600,-1.535000,6.273800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.380600,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.660000,-1.535000,9.525000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<73.380600,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.380600,-1.535000,18.338800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.660000,-1.535000,21.590000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,-85.082596,0> translate<73.380600,-1.535000,18.338800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.380600,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.660000,-1.535000,21.590000>}
box{<0,0,-0.635000><3.263183,0.035000,0.635000> rotate<0,85.082596,0> translate<73.380600,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<71.097500,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<73.660000,0.000000,33.020000>}
box{<0,0,-0.635000><3.100935,0.035000,0.635000> rotate<0,-34.270737,0> translate<71.097500,0.000000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.437500,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.660000,0.000000,35.560000>}
box{<0,0,-0.203200><2.927205,0.035000,0.203200> rotate<0,40.598615,0> translate<71.437500,0.000000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<71.596250,-1.535000,37.147500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<73.660000,-1.535000,38.100000>}
box{<0,0,-0.508000><2.272954,0.035000,0.508000> rotate<0,-24.773506,0> translate<71.596250,-1.535000,37.147500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.945000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.136250,0.000000,3.175000>}
box{<0,0,-0.203200><6.191250,0.035000,0.203200> rotate<0,0.000000,0> translate<67.945000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.120000,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.295000,0.000000,28.257500>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<71.120000,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.087500,0.000000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.612500,0.000000,15.557500>}
box{<0,0,-0.203200><9.525000,0.035000,0.203200> rotate<0,0.000000,0> translate<65.087500,0.000000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.627500,-1.535000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.612500,-1.535000,15.557500>}
box{<0,0,-0.250000><6.985000,0.035000,0.250000> rotate<0,0.000000,0> translate<67.627500,-1.535000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<67.310000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,1.905000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<67.310000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.930000,-1.535000,46.196250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<74.930000,-1.535000,42.862500>}
box{<0,0,-0.304800><3.333750,0.035000,0.304800> rotate<0,-90.000000,0> translate<74.930000,-1.535000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.612500,0.000000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.247500,0.000000,16.192500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<74.612500,0.000000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.247500,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.247500,0.000000,16.192500>}
box{<0,0,-0.203200><11.112500,0.035000,0.203200> rotate<0,-90.000000,0> translate<75.247500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.295000,0.000000,28.257500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.247500,0.000000,27.305000>}
box{<0,0,-0.203200><1.347038,0.035000,0.203200> rotate<0,44.997030,0> translate<74.295000,0.000000,28.257500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.675000,0.000000,0.635000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,0.635000>}
box{<0,0,-0.203200><9.048750,0.035000,0.203200> rotate<0,0.000000,0> translate<66.675000,0.000000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.136250,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,4.762500>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,-44.997030,0> translate<74.136250,0.000000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,4.762500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,14.287500>}
box{<0,0,-0.203200><9.525000,0.035000,0.203200> rotate<0,90.000000,0> translate<75.723750,0.000000,14.287500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<73.380600,-1.535000,24.841200>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.200000,-1.535000,24.762500>}
box{<0,0,-0.508000><2.820498,0.035000,0.508000> rotate<0,1.598819,0> translate<73.380600,-1.535000,24.841200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<74.930000,-1.535000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.200000,-1.535000,38.100000>}
box{<0,0,-0.406400><4.928925,0.035000,0.406400> rotate<0,75.063629,0> translate<74.930000,-1.535000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<74.612500,-1.535000,15.557500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.202500,-1.535000,16.512500>}
box{<0,0,-0.406400><1.854757,0.035000,0.406400> rotate<0,-30.988200,0> translate<74.612500,-1.535000,15.557500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.202500,-1.535000,19.367500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<76.202500,-1.535000,16.512500>}
box{<0,0,-0.406400><2.855000,0.035000,0.406400> rotate<0,-90.000000,0> translate<76.202500,-1.535000,16.512500> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.200000,-1.535000,22.862500>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<76.202500,-1.535000,19.367500>}
box{<0,0,-0.508000><3.495001,0.035000,0.508000> rotate<0,89.953079,0> translate<76.200000,-1.535000,22.862500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,14.287500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,15.081250>}
box{<0,0,-0.203200><1.122532,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.723750,0.000000,14.287500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.200000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,30.797500>}
box{<0,0,-0.203200><2.245064,0.035000,0.203200> rotate<0,81.864495,0> translate<76.200000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,15.081250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.517500,0.000000,30.797500>}
box{<0,0,-0.203200><15.716250,0.035000,0.203200> rotate<0,90.000000,0> translate<76.517500,0.000000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.930000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.993750,0.000000,3.968750>}
box{<0,0,-0.203200><2.918583,0.035000,0.203200> rotate<0,-44.997030,0> translate<74.930000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.993750,0.000000,3.968750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.993750,0.000000,13.652500>}
box{<0,0,-0.203200><9.683750,0.035000,0.203200> rotate<0,90.000000,0> translate<76.993750,0.000000,13.652500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.390000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,40.005000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,0.000000,0> translate<72.390000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<76.630000,-1.535000,46.196250>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<77.470000,-1.535000,42.862500>}
box{<0,0,-0.304800><3.437948,0.035000,0.304800> rotate<0,75.852647,0> translate<76.630000,-1.535000,46.196250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.993750,0.000000,13.652500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.628750,0.000000,14.287500>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<76.993750,0.000000,13.652500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.628750,0.000000,14.287500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.628750,0.000000,31.591250>}
box{<0,0,-0.203200><17.303750,0.035000,0.203200> rotate<0,90.000000,0> translate<77.628750,0.000000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.380600,-1.535000,12.776200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.102500,-1.535000,15.275600>}
box{<0,0,-0.203200><5.342597,0.035000,0.203200> rotate<0,-27.891360,0> translate<73.380600,-1.535000,12.776200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.102500,-1.535000,19.367500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.102500,-1.535000,15.275600>}
box{<0,0,-0.203200><4.091900,0.035000,0.203200> rotate<0,-90.000000,0> translate<78.102500,-1.535000,15.275600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.102500,-1.535000,19.367500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,-1.535000,29.845000>}
box{<0,0,-0.203200><10.477500,0.035000,0.203200> rotate<0,-89.980390,0> translate<78.102500,-1.535000,19.367500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.628750,0.000000,31.591250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,0.000000,32.385000>}
box{<0,0,-0.203200><0.925664,0.035000,0.203200> rotate<0,-59.032347,0> translate<77.628750,0.000000,31.591250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,0.000000,32.385000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<78.105000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.200000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,0.000000,34.925000>}
box{<0,0,-0.203200><2.008046,0.035000,0.203200> rotate<0,18.433732,0> translate<76.200000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.723750,0.000000,0.635000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.263750,0.000000,3.175000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<75.723750,0.000000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.263750,0.000000,12.858750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.263750,0.000000,3.175000>}
box{<0,0,-0.203200><9.683750,0.035000,0.203200> rotate<0,-90.000000,0> translate<78.263750,0.000000,3.175000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.263750,0.000000,12.858750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,13.335000>}
box{<0,0,-0.203200><0.673519,0.035000,0.203200> rotate<0,-44.997030,0> translate<78.263750,0.000000,12.858750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,13.335000>}
box{<0,0,-0.203200><17.938750,0.035000,0.203200> rotate<0,-90.000000,0> translate<78.740000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.105000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,30.797500>}
box{<0,0,-0.203200><1.144763,0.035000,0.203200> rotate<0,-56.306216,0> translate<78.105000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,30.797500>}
box{<0,0,-0.203200><7.937500,0.035000,0.203200> rotate<0,-90.000000,0> translate<78.740000,-1.535000,30.797500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,-1.535000,42.862500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,-1.535000,38.735000>}
box{<0,0,-0.203200><4.318467,0.035000,0.203200> rotate<0,72.892460,0> translate<77.470000,-1.535000,42.862500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<78.740000,0.000000,31.273750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.216250,0.000000,32.385000>}
box{<0,0,-0.203200><1.209004,0.035000,0.203200> rotate<0,-66.797001,0> translate<78.740000,0.000000,31.273750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.216250,0.000000,38.258750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.216250,0.000000,32.385000>}
box{<0,0,-0.203200><5.873750,0.035000,0.203200> rotate<0,-90.000000,0> translate<79.216250,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.470000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<79.216250,0.000000,38.258750>}
box{<0,0,-0.203200><2.469570,0.035000,0.203200> rotate<0,44.997030,0> translate<77.470000,0.000000,40.005000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.584300,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.872494,-1.535000,2.656125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.997156,0> translate<76.872494,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.872494,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.872494,-1.535000,0.520700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<76.872494,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<77.584300,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<76.160684,-1.535000,0.520700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<76.160684,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.245503,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.533697,-1.535000,2.656125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.997156,0> translate<74.533697,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.533697,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<74.533697,-1.535000,0.520700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<74.533697,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<75.245503,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<73.821888,-1.535000,0.520700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<73.821888,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.906706,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.483091,-1.535000,2.656125>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<71.483091,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.483091,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.483091,-1.535000,2.300219>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,-90.000000,0> translate<71.483091,-1.535000,2.300219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<71.483091,-1.535000,2.300219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.906706,-1.535000,0.876603>}
box{<0,0,-0.203200><2.013297,0.035000,0.203200> rotate<0,44.997030,0> translate<71.483091,-1.535000,2.300219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.906706,-1.535000,0.876603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<72.906706,-1.535000,0.520700>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<72.906706,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.567909,-1.535000,2.300219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.212006,-1.535000,2.656125>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.997282,0> translate<70.212006,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.212006,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,2.656125>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<69.500197,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,2.300219>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.997282,0> translate<69.144294,-1.535000,2.300219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,2.300219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,1.944316>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<69.144294,-1.535000,1.944316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,1.588413>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<69.144294,-1.535000,1.944316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,1.588413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.856103,-1.535000,1.588413>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<69.500197,-1.535000,1.588413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,1.588413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,1.232506>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.997282,0> translate<69.144294,-1.535000,1.232506> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,1.232506>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,0.876603>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,-90.000000,0> translate<69.144294,-1.535000,0.876603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.144294,-1.535000,0.876603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,0.520700>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<69.144294,-1.535000,0.876603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<69.500197,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.212006,-1.535000,0.520700>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<69.500197,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.212006,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<70.567909,-1.535000,0.876603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<70.212006,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<68.229112,-1.535000,1.588413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<66.805497,-1.535000,1.588413>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<66.805497,-1.535000,1.588413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.890316,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.178509,-1.535000,2.656125>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.997156,0> translate<65.178509,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.178509,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.178509,-1.535000,0.520700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<65.178509,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.890316,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.466700,-1.535000,0.520700>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<64.466700,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.127903,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.551519,-1.535000,2.656125>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<62.127903,-1.535000,2.656125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.551519,-1.535000,2.656125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.551519,-1.535000,1.588413>}
box{<0,0,-0.203200><1.067713,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.551519,-1.535000,1.588413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.551519,-1.535000,1.588413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.839713,-1.535000,1.944316>}
box{<0,0,-0.203200><0.795824,0.035000,0.203200> rotate<0,26.563298,0> translate<62.839713,-1.535000,1.944316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.839713,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.483806,-1.535000,1.944316>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<62.483806,-1.535000,1.944316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.483806,-1.535000,1.944316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.127903,-1.535000,1.588413>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.127903,-1.535000,1.588413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.127903,-1.535000,1.588413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.127903,-1.535000,0.876603>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.127903,-1.535000,0.876603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.127903,-1.535000,0.876603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.483806,-1.535000,0.520700>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<62.127903,-1.535000,0.876603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.483806,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.195616,-1.535000,0.520700>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<62.483806,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.195616,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.551519,-1.535000,0.876603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.195616,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,23.698200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,24.410006>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.996904,0> translate<11.313875,0.000000,24.410006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,24.410006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,24.410006>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<11.313875,0.000000,24.410006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,23.698200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,25.121816>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<13.449300,0.000000,25.121816> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,26.036997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,26.748803>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.996904,0> translate<11.313875,0.000000,26.748803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,26.748803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,26.748803>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<11.313875,0.000000,26.748803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,26.036997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,27.460612>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<13.449300,0.000000,27.460612> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,28.375794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,29.799409>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<11.313875,0.000000,29.799409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,29.799409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669781,0.000000,29.799409>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,0.000000,0> translate<11.313875,0.000000,29.799409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669781,0.000000,29.799409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,28.375794>}
box{<0,0,-0.203200><2.013297,0.035000,0.203200> rotate<0,44.997030,0> translate<11.669781,0.000000,29.799409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,28.375794>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,28.375794>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<13.093397,0.000000,28.375794> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669781,0.000000,30.714591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,31.070494>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<11.313875,0.000000,31.070494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,31.070494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,31.782303>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<11.313875,0.000000,31.782303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,31.782303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669781,0.000000,32.138206>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<11.313875,0.000000,31.782303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.669781,0.000000,32.138206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,32.138206>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<11.669781,0.000000,32.138206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,32.138206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,31.782303>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<12.025684,0.000000,32.138206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,31.782303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,31.426397>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.381588,0.000000,31.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,31.782303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.737494,0.000000,32.138206>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<12.381588,0.000000,31.782303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.737494,0.000000,32.138206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,32.138206>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<12.737494,0.000000,32.138206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,32.138206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,31.782303>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<13.093397,0.000000,32.138206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,31.782303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,31.070494>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.449300,0.000000,31.070494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,31.070494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,30.714591>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.093397,0.000000,30.714591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,33.053387>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,34.477003>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<12.381588,0.000000,34.477003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,35.392184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,36.103991>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,44.996904,0> translate<11.313875,0.000000,36.103991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,36.103991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,36.103991>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<11.313875,0.000000,36.103991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,35.392184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,36.815800>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<13.449300,0.000000,36.815800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,39.154597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,37.730981>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.313875,0.000000,37.730981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.313875,0.000000,37.730981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,37.730981>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,0.000000,0> translate<11.313875,0.000000,37.730981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,37.730981>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,38.442788>}
box{<0,0,-0.203200><0.795824,0.035000,0.203200> rotate<0,63.430762,0> translate<12.025684,0.000000,38.442788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,38.442788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,38.798694>}
box{<0,0,-0.203200><0.355906,0.035000,0.203200> rotate<0,90.000000,0> translate<12.025684,0.000000,38.798694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025684,0.000000,38.798694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,39.154597>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.025684,0.000000,38.798694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.381588,0.000000,39.154597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,39.154597>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<12.381588,0.000000,39.154597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,39.154597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,38.798694>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<13.093397,0.000000,39.154597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,38.798694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,38.086884>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.449300,0.000000,38.086884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.449300,0.000000,38.086884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.093397,0.000000,37.730981>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.093397,0.000000,37.730981> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.724353,0.000000,25.761950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.724353,0.000000,27.897375>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,90.000000,0> translate<61.724353,0.000000,27.897375> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.724353,0.000000,26.829663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.147969,0.000000,26.829663>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<61.724353,0.000000,26.829663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.147969,0.000000,27.897375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.147969,0.000000,25.761950>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.147969,0.000000,25.761950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.063150,0.000000,27.897375>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.063150,0.000000,26.473756>}
box{<0,0,-0.203200><1.423619,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.063150,0.000000,26.473756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.063150,0.000000,26.473756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.774956,0.000000,25.761950>}
box{<0,0,-0.203200><1.006646,0.035000,0.203200> rotate<0,44.997030,0> translate<64.063150,0.000000,26.473756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.774956,0.000000,25.761950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.486766,0.000000,26.473756>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.996904,0> translate<64.774956,0.000000,25.761950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.486766,0.000000,26.473756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.486766,0.000000,27.897375>}
box{<0,0,-0.203200><1.423619,0.035000,0.203200> rotate<0,90.000000,0> translate<65.486766,0.000000,27.897375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,29.875819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,29.528391>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<1.814319,0.000000,29.528391> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,29.528391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,28.833528>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<1.814319,0.000000,28.833528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,28.833528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,28.486100>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<1.814319,0.000000,28.833528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,28.486100>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,28.486100>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,0.000000,0> translate<2.161750,0.000000,28.486100> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,28.486100>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,28.833528>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<2.509181,0.000000,28.486100> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,28.833528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,29.528391>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,90.000000,0> translate<2.856609,0.000000,29.528391> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,29.528391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.204041,0.000000,29.875819>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<2.856609,0.000000,29.528391> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.204041,0.000000,29.875819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,29.875819>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,0.000000,0> translate<3.204041,0.000000,29.875819> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,29.875819>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,29.528391>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<3.551472,0.000000,29.875819> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,29.528391>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,28.833528>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<3.898900,0.000000,28.833528> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,28.833528>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,28.486100>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<3.551472,0.000000,28.486100> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,31.519756>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,31.519756>}
box{<0,0,-0.228600><2.084581,0.035000,0.228600> rotate<0,0.000000,0> translate<1.814319,0.000000,31.519756> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,30.824897>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,32.214616>}
box{<0,0,-0.228600><1.389719,0.035000,0.228600> rotate<0,90.000000,0> translate<1.814319,0.000000,32.214616> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,33.163694>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,33.163694>}
box{<0,0,-0.228600><2.084581,0.035000,0.228600> rotate<0,0.000000,0> translate<1.814319,0.000000,33.163694> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.204041,0.000000,33.163694>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,34.553413>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,44.996966,0> translate<1.814319,0.000000,34.553413> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,33.511122>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,34.553413>}
box{<0,0,-0.228600><1.474022,0.035000,0.228600> rotate<0,-44.997030,0> translate<2.856609,0.000000,33.511122> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,36.892209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,35.502491>}
box{<0,0,-0.228600><1.389719,0.035000,0.228600> rotate<0,-90.000000,0> translate<1.814319,0.000000,35.502491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,35.502491>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,35.502491>}
box{<0,0,-0.228600><1.042291,0.035000,0.228600> rotate<0,0.000000,0> translate<1.814319,0.000000,35.502491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,35.502491>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,36.197350>}
box{<0,0,-0.228600><0.776876,0.035000,0.228600> rotate<0,63.430865,0> translate<2.509181,0.000000,36.197350> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,36.197350>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,36.544781>}
box{<0,0,-0.228600><0.347431,0.035000,0.228600> rotate<0,90.000000,0> translate<2.509181,0.000000,36.544781> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.509181,0.000000,36.544781>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,36.892209>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<2.509181,0.000000,36.544781> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.856609,0.000000,36.892209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,36.892209>}
box{<0,0,-0.228600><0.694863,0.035000,0.228600> rotate<0,0.000000,0> translate<2.856609,0.000000,36.892209> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,36.892209>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,36.544781>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<3.551472,0.000000,36.892209> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,36.544781>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,35.849919>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<3.898900,0.000000,35.849919> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,35.849919>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,35.502491>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<3.551472,0.000000,35.502491> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,37.841287>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,37.841287>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<2.161750,0.000000,37.841287> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,37.841287>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,38.188716>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<1.814319,0.000000,38.188716> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,38.188716>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,38.883578>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,90.000000,0> translate<1.814319,0.000000,38.883578> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,38.883578>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,39.231006>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<1.814319,0.000000,38.883578> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,39.231006>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,39.231006>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<2.161750,0.000000,39.231006> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,39.231006>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,38.883578>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<3.551472,0.000000,39.231006> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,38.883578>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,38.188716>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<3.898900,0.000000,38.188716> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,38.188716>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,37.841287>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<3.551472,0.000000,37.841287> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,37.841287>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,39.231006>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,44.996966,0> translate<2.161750,0.000000,39.231006> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,40.180084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,40.180084>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<2.161750,0.000000,40.180084> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,40.180084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,40.527513>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,44.996773,0> translate<1.814319,0.000000,40.527513> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,40.527513>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,41.222375>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,90.000000,0> translate<1.814319,0.000000,41.222375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<1.814319,0.000000,41.222375>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,41.569803>}
box{<0,0,-0.228600><0.491340,0.035000,0.228600> rotate<0,-44.996773,0> translate<1.814319,0.000000,41.222375> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,41.569803>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,41.569803>}
box{<0,0,-0.228600><1.389722,0.035000,0.228600> rotate<0,0.000000,0> translate<2.161750,0.000000,41.569803> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,41.569803>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,41.222375>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,44.997030,0> translate<3.551472,0.000000,41.569803> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,41.222375>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,40.527513>}
box{<0,0,-0.228600><0.694862,0.035000,0.228600> rotate<0,-90.000000,0> translate<3.898900,0.000000,40.527513> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.898900,0.000000,40.527513>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,40.180084>}
box{<0,0,-0.228600><0.491338,0.035000,0.228600> rotate<0,-44.997030,0> translate<3.551472,0.000000,40.180084> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<3.551472,0.000000,40.180084>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<2.161750,0.000000,41.569803>}
box{<0,0,-0.228600><1.965361,0.035000,0.228600> rotate<0,44.996966,0> translate<2.161750,0.000000,41.569803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,28.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,28.460700>}
box{<0,0,-0.203200><1.779522,0.035000,0.203200> rotate<0,0.000000,0> translate<8.138875,0.000000,28.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,28.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,28.816603>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.918397,0.000000,28.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,28.816603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,29.528413>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<10.274300,0.000000,29.528413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,29.528413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,29.884316>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<9.918397,0.000000,29.884316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,29.884316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,29.884316>}
box{<0,0,-0.203200><1.779522,0.035000,0.203200> rotate<0,0.000000,0> translate<8.138875,0.000000,29.884316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,32.223112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,31.867209>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<8.138875,0.000000,31.867209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,31.867209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,31.155400>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.138875,0.000000,31.155400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,31.155400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,30.799497>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<8.138875,0.000000,31.155400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,30.799497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,30.799497>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<8.494781,0.000000,30.799497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,30.799497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,31.155400>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.850684,0.000000,30.799497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,31.155400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,31.867209>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<9.206588,0.000000,31.867209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,31.867209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,32.223112>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<9.206588,0.000000,31.867209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,32.223112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,32.223112>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<9.562494,0.000000,32.223112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,32.223112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,31.867209>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<9.918397,0.000000,32.223112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,31.867209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,31.155400>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.274300,0.000000,31.155400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,31.155400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,30.799497>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.918397,0.000000,30.799497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,33.138294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,33.138294>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<8.138875,0.000000,33.138294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,33.138294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,34.206006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<8.138875,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,34.206006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,34.561909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<8.138875,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,34.561909>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<8.494781,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,34.206006>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<8.850684,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,34.206006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,34.561909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<9.206588,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,34.561909>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<9.562494,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,34.206006>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<9.918397,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,34.206006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,33.138294>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.274300,0.000000,33.138294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,33.138294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,34.206006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<9.206588,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,35.477091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,36.900706>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<9.206588,0.000000,36.900706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,39.239503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,38.883600>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<8.138875,0.000000,38.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,38.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,38.171791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.138875,0.000000,38.171791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,38.171791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,37.815888>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<8.138875,0.000000,38.171791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,37.815888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,37.815888>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<8.494781,0.000000,37.815888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.850684,0.000000,37.815888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,38.171791>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.850684,0.000000,37.815888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,38.171791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,38.883600>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<9.206588,0.000000,38.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,38.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,39.239503>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<9.206588,0.000000,38.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,39.239503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,39.239503>}
box{<0,0,-0.203200><0.355903,0.035000,0.203200> rotate<0,0.000000,0> translate<9.562494,0.000000,39.239503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,39.239503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,38.883600>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<9.918397,0.000000,39.239503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,38.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,38.171791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.274300,0.000000,38.171791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,38.171791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.918397,0.000000,37.815888>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.918397,0.000000,37.815888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.274300,0.000000,40.154684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,40.154684>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<8.138875,0.000000,40.154684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,40.154684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,41.222397>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<8.138875,0.000000,41.222397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.138875,0.000000,41.222397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,41.578300>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<8.138875,0.000000,41.222397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494781,0.000000,41.578300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,41.578300>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<8.494781,0.000000,41.578300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.206588,0.000000,41.578300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,41.222397>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<9.206588,0.000000,41.578300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,41.222397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.562494,0.000000,40.154684>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.562494,0.000000,40.154684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,28.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,28.460700>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,28.460700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,28.460700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,29.884316>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,90.000000,0> translate<6.031588,0.000000,29.884316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,29.884316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,29.884316>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,29.884316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,30.799497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,30.799497>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,30.799497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,30.799497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,31.511303>}
box{<0,0,-0.203200><1.006646,0.035000,0.203200> rotate<0,44.997030,0> translate<6.387494,0.000000,31.511303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,31.511303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,32.223112>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.997156,0> translate<6.387494,0.000000,31.511303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,32.223112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,32.223112>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,32.223112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,33.138294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,33.138294>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,33.138294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,33.138294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,34.206006>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<4.963875,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,34.206006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,34.561909>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<4.963875,0.000000,34.206006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,34.561909>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<5.319781,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,34.561909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,34.206006>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<6.031588,0.000000,34.561909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,34.206006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,33.138294>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.387494,0.000000,33.138294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,35.477091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,35.477091>}
box{<0,0,-0.203200><2.135425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.963875,0.000000,35.477091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,35.477091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,36.544803>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,90.000000,0> translate<4.963875,0.000000,36.544803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,36.544803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,36.900706>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<4.963875,0.000000,36.544803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,36.900706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,36.900706>}
box{<0,0,-0.203200><0.711806,0.035000,0.203200> rotate<0,0.000000,0> translate<5.319781,0.000000,36.900706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,36.900706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,36.544803>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<6.031588,0.000000,36.900706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,36.544803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,35.477091>}
box{<0,0,-0.203200><1.067712,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.387494,0.000000,35.477091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.387494,0.000000,36.188897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,36.900706>}
box{<0,0,-0.203200><1.006648,0.035000,0.203200> rotate<0,-44.997156,0> translate<6.387494,0.000000,36.188897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,38.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,38.171791>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.963875,0.000000,38.171791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,38.171791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,37.815888>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<4.963875,0.000000,38.171791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,37.815888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,37.815888>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<5.319781,0.000000,37.815888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,37.815888>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,38.171791>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.743397,0.000000,37.815888> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,38.171791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,38.883600>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<7.099300,0.000000,38.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,38.883600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,39.239503>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<6.743397,0.000000,39.239503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,39.239503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,39.239503>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<5.319781,0.000000,39.239503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,39.239503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,38.883600>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<4.963875,0.000000,38.883600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,41.578300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,41.222397>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,-44.996779,0> translate<4.963875,0.000000,41.222397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,41.222397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,40.510587>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.963875,0.000000,40.510587> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.963875,0.000000,40.510587>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,40.154684>}
box{<0,0,-0.203200><0.503325,0.035000,0.203200> rotate<0,44.996779,0> translate<4.963875,0.000000,40.510587> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.319781,0.000000,40.154684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,40.154684>}
box{<0,0,-0.203200><1.423616,0.035000,0.203200> rotate<0,0.000000,0> translate<5.319781,0.000000,40.154684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,40.154684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,40.510587>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.743397,0.000000,40.154684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,40.510587>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,41.222397>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,90.000000,0> translate<7.099300,0.000000,41.222397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.099300,0.000000,41.222397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,41.578300>}
box{<0,0,-0.203200><0.503323,0.035000,0.203200> rotate<0,44.997030,0> translate<6.743397,0.000000,41.578300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.743397,0.000000,41.578300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,41.578300>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,0.000000,0> translate<6.031588,0.000000,41.578300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,41.578300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.031588,0.000000,40.866491>}
box{<0,0,-0.203200><0.711809,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.031588,0.000000,40.866491> }
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
cylinder{<43.815000,0.038000,22.860000><43.815000,-1.538000,22.860000>0.406400}
cylinder{<43.815000,0.038000,25.400000><43.815000,-1.538000,25.400000>0.406400}
cylinder{<50.165000,0.038000,22.860000><50.165000,-1.538000,22.860000>0.406400}
cylinder{<50.165000,0.038000,25.400000><50.165000,-1.538000,25.400000>0.406400}
cylinder{<56.515000,0.038000,22.860000><56.515000,-1.538000,22.860000>0.406400}
cylinder{<56.515000,0.038000,25.400000><56.515000,-1.538000,25.400000>0.406400}
cylinder{<7.429500,0.038000,46.672500><7.429500,-1.538000,46.672500>0.406400}
cylinder{<12.255500,0.038000,46.672500><12.255500,-1.538000,46.672500>0.406400}
cylinder{<21.272500,0.038000,17.303750><21.272500,-1.538000,17.303750>0.406400}
cylinder{<23.812500,0.038000,17.303750><23.812500,-1.538000,17.303750>0.406400}
cylinder{<21.431250,0.038000,8.382000><21.431250,-1.538000,8.382000>0.406400}
cylinder{<21.431250,0.038000,11.938000><21.431250,-1.538000,11.938000>0.406400}
cylinder{<44.767500,0.038000,8.382000><44.767500,-1.538000,8.382000>0.406400}
cylinder{<44.767500,0.038000,11.938000><44.767500,-1.538000,11.938000>0.406400}
cylinder{<36.512500,0.038000,6.032500><36.512500,-1.538000,6.032500>0.406400}
cylinder{<36.512500,0.038000,8.572500><36.512500,-1.538000,8.572500>0.406400}
cylinder{<50.800000,0.038000,8.890000><50.800000,-1.538000,8.890000>0.406400}
cylinder{<50.800000,0.038000,6.350000><50.800000,-1.538000,6.350000>0.406400}
cylinder{<26.352500,0.038000,13.017500><26.352500,-1.538000,13.017500>0.406400}
cylinder{<36.512500,0.038000,13.017500><36.512500,-1.538000,13.017500>0.406400}
cylinder{<17.145000,0.038000,4.127500><17.145000,-1.538000,4.127500>0.406400}
cylinder{<24.765000,0.038000,4.127500><24.765000,-1.538000,4.127500>0.406400}
cylinder{<17.145000,0.038000,1.746250><17.145000,-1.538000,1.746250>0.406400}
cylinder{<24.765000,0.038000,1.746250><24.765000,-1.538000,1.746250>0.406400}
cylinder{<28.416250,0.038000,10.477500><28.416250,-1.538000,10.477500>0.406400}
cylinder{<28.416250,0.038000,2.857500><28.416250,-1.538000,2.857500>0.406400}
cylinder{<62.071250,0.038000,23.971250><62.071250,-1.538000,23.971250>0.508000}
cylinder{<62.071250,0.038000,21.431250><62.071250,-1.538000,21.431250>0.508000}
cylinder{<76.200000,0.038000,33.020000><76.200000,-1.538000,33.020000>0.508000}
cylinder{<73.660000,0.038000,33.020000><73.660000,-1.538000,33.020000>0.508000}
cylinder{<76.200000,0.038000,35.560000><76.200000,-1.538000,35.560000>0.508000}
cylinder{<73.660000,0.038000,35.560000><73.660000,-1.538000,35.560000>0.508000}
cylinder{<76.200000,0.038000,38.100000><76.200000,-1.538000,38.100000>0.508000}
cylinder{<73.660000,0.038000,38.100000><73.660000,-1.538000,38.100000>0.508000}
cylinder{<77.470000,0.038000,42.862500><77.470000,-1.538000,42.862500>0.457200}
cylinder{<74.930000,0.038000,42.862500><74.930000,-1.538000,42.862500>0.457200}
cylinder{<72.390000,0.038000,42.862500><72.390000,-1.538000,42.862500>0.457200}
cylinder{<73.380600,0.038000,12.776200><73.380600,-1.538000,12.776200>0.508000}
cylinder{<73.380600,0.038000,6.273800><73.380600,-1.538000,6.273800>0.508000}
cylinder{<68.859400,0.038000,12.776200><68.859400,-1.538000,12.776200>0.508000}
cylinder{<68.859400,0.038000,6.273800><68.859400,-1.538000,6.273800>0.508000}
cylinder{<68.859400,0.038000,18.338800><68.859400,-1.538000,18.338800>0.508000}
cylinder{<68.859400,0.038000,24.841200><68.859400,-1.538000,24.841200>0.508000}
cylinder{<73.380600,0.038000,18.338800><73.380600,-1.538000,18.338800>0.508000}
cylinder{<73.380600,0.038000,24.841200><73.380600,-1.538000,24.841200>0.508000}
cylinder{<68.580000,0.038000,9.525000><68.580000,-1.538000,9.525000>0.400000}
cylinder{<73.660000,0.038000,9.525000><73.660000,-1.538000,9.525000>0.400000}
cylinder{<68.580000,0.038000,21.590000><68.580000,-1.538000,21.590000>0.400000}
cylinder{<73.660000,0.038000,21.590000><73.660000,-1.538000,21.590000>0.400000}
cylinder{<15.663750,0.038000,12.561250><15.663750,-1.538000,12.561250>0.500000}
cylinder{<15.663750,0.038000,15.220000><15.663750,-1.538000,15.220000>0.500000}
cylinder{<13.028750,0.038000,15.220000><13.028750,-1.538000,15.220000>0.500000}
cylinder{<13.028750,0.038000,12.561250><13.028750,-1.538000,12.561250>0.500000}
cylinder{<10.477500,0.038000,19.990000><10.477500,-1.538000,19.990000>0.750000}
cylinder{<10.477500,0.038000,7.950000><10.477500,-1.538000,7.950000>0.750000}
cylinder{<27.114500,0.038000,37.973000><27.114500,-1.538000,37.973000>0.406400}
cylinder{<27.114500,0.038000,33.147000><27.114500,-1.538000,33.147000>0.406400}
//Holes(fast)/Vias
cylinder{<54.610000,0.038000,37.465000><54.610000,-1.538000,37.465000>0.400000 }
cylinder{<6.350000,0.038000,22.225000><6.350000,-1.538000,22.225000>0.400000 }
cylinder{<6.350000,0.038000,5.080000><6.350000,-1.538000,5.080000>0.400000 }
cylinder{<53.022500,0.038000,16.192500><53.022500,-1.538000,16.192500>0.400000 }
cylinder{<59.372500,0.038000,1.428750><59.372500,-1.538000,1.428750>0.400000 }
cylinder{<59.372500,0.038000,7.620000><59.372500,-1.538000,7.620000>0.400000 }
cylinder{<18.097500,0.038000,21.590000><18.097500,-1.538000,21.590000>0.400000 }
cylinder{<18.097500,0.038000,24.447500><18.097500,-1.538000,24.447500>0.400000 }
cylinder{<20.955000,0.038000,24.447500><20.955000,-1.538000,24.447500>0.400000 }
cylinder{<25.717500,0.038000,25.717500><25.717500,-1.538000,25.717500>0.400000 }
cylinder{<28.575000,0.038000,25.717500><28.575000,-1.538000,25.717500>0.400000 }
cylinder{<57.467500,0.038000,37.465000><57.467500,-1.538000,37.465000>0.400000 }
cylinder{<54.610000,0.038000,34.607500><54.610000,-1.538000,34.607500>0.400000 }
cylinder{<19.685000,0.038000,30.797500><19.685000,-1.538000,30.797500>0.400000 }
cylinder{<34.766250,0.038000,27.146250><34.766250,-1.538000,27.146250>0.400000 }
cylinder{<69.532500,0.038000,45.085000><69.532500,-1.538000,45.085000>0.400000 }
cylinder{<31.432500,0.038000,28.257500><31.432500,-1.538000,28.257500>0.400000 }
cylinder{<31.750000,0.038000,25.400000><31.750000,-1.538000,25.400000>0.400000 }
cylinder{<26.511250,0.038000,42.068750><26.511250,-1.538000,42.068750>0.400000 }
cylinder{<2.857500,0.038000,7.937500><2.857500,-1.538000,7.937500>0.400000 }
cylinder{<78.898750,0.038000,1.111250><78.898750,-1.538000,1.111250>0.400000 }
cylinder{<1.111250,0.038000,1.111250><1.111250,-1.538000,1.111250>0.400000 }
cylinder{<1.111250,0.038000,51.276250><1.111250,-1.538000,51.276250>0.400000 }
cylinder{<78.898750,0.038000,51.276250><78.898750,-1.538000,51.276250>0.400000 }
cylinder{<57.150000,0.038000,31.591250><57.150000,-1.538000,31.591250>0.400000 }
cylinder{<33.337500,0.038000,39.528750><33.337500,-1.538000,39.528750>0.400000 }
cylinder{<59.372500,0.038000,19.685000><59.372500,-1.538000,19.685000>0.400000 }
cylinder{<36.830000,0.038000,44.132500><36.830000,-1.538000,44.132500>0.400000 }
cylinder{<62.547500,0.038000,40.640000><62.547500,-1.538000,40.640000>0.400000 }
cylinder{<69.215000,0.038000,41.910000><69.215000,-1.538000,41.910000>0.400000 }
cylinder{<34.925000,0.038000,41.910000><34.925000,-1.538000,41.910000>0.400000 }
cylinder{<40.640000,0.038000,41.719500><40.640000,-1.538000,41.719500>0.400000 }
cylinder{<39.687500,0.038000,44.132500><39.687500,-1.538000,44.132500>0.400000 }
cylinder{<43.497500,0.038000,43.815000><43.497500,-1.538000,43.815000>0.400000 }
cylinder{<46.037500,0.038000,43.815000><46.037500,-1.538000,43.815000>0.400000 }
cylinder{<48.577500,0.038000,43.815000><48.577500,-1.538000,43.815000>0.400000 }
cylinder{<51.117500,0.038000,43.815000><51.117500,-1.538000,43.815000>0.400000 }
cylinder{<53.657500,0.038000,43.815000><53.657500,-1.538000,43.815000>0.400000 }
cylinder{<56.197500,0.038000,43.973750><56.197500,-1.538000,43.973750>0.400000 }
cylinder{<58.896250,0.038000,44.291250><58.896250,-1.538000,44.291250>0.400000 }
cylinder{<20.002500,0.038000,35.560000><20.002500,-1.538000,35.560000>0.400000 }
cylinder{<39.687500,0.038000,14.605000><39.687500,-1.538000,14.605000>0.400000 }
cylinder{<31.432500,0.038000,31.115000><31.432500,-1.538000,31.115000>0.400000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//1C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.576500,-1.536000,19.977500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.338500,-1.536000,19.977500>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<40.576500,-1.536000,19.977500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.601500,-1.536000,21.297500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.338500,-1.536000,21.297500>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<40.601500,-1.536000,21.297500> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<40.240350,-1.536000,20.636350>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<41.688150,-1.536000,20.636350>}
//1C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.262250,-1.536000,5.740000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.500250,-1.536000,5.740000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<65.500250,-1.536000,5.740000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.237250,-1.536000,4.420000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<65.500250,-1.536000,4.420000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<65.500250,-1.536000,4.420000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<66.598400,-1.536000,5.081150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<65.150600,-1.536000,5.081150>}
//1C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.907750,-1.536000,36.011250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.669750,-1.536000,36.011250>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.907750,-1.536000,36.011250> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.932750,-1.536000,37.331250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.669750,-1.536000,37.331250>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.932750,-1.536000,37.331250> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<23.571600,-1.536000,36.670100>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<25.019400,-1.536000,36.670100>}
//1C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.590250,-1.536000,32.360000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.352250,-1.536000,32.360000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.590250,-1.536000,32.360000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.615250,-1.536000,33.680000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.352250,-1.536000,33.680000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<23.615250,-1.536000,33.680000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<23.254100,-1.536000,33.018850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<24.701900,-1.536000,33.018850>}
//1C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.739000,-1.536000,12.675000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.501000,-1.536000,12.675000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<70.739000,-1.536000,12.675000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<70.764000,-1.536000,13.995000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.501000,-1.536000,13.995000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<70.764000,-1.536000,13.995000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<70.402850,-1.536000,13.333850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<71.850650,-1.536000,13.333850>}
//1C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.875000,-1.536000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<69.875000,-1.536000,30.226000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<69.875000,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.555000,-1.536000,29.489000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<68.555000,-1.536000,30.226000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<68.555000,-1.536000,30.226000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<69.216150,-1.536000,29.127850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-90.000000,0> translate<69.216150,-1.536000,30.575650>}
//1D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.157500,-1.536000,29.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.557500,-1.536000,28.855000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<36.157500,-1.536000,29.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.557500,-1.536000,28.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.357500,-1.536000,28.855000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.557500,-1.536000,28.855000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.357500,-1.536000,28.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.757500,-1.536000,29.255000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<45.357500,-1.536000,28.855000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.757500,-1.536000,29.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.757500,-1.536000,38.055000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<45.757500,-1.536000,38.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.757500,-1.536000,38.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.357500,-1.536000,38.455000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<45.357500,-1.536000,38.455000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.357500,-1.536000,38.455000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.557500,-1.536000,38.455000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.557500,-1.536000,38.455000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.557500,-1.536000,38.455000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.157500,-1.536000,38.055000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<36.157500,-1.536000,38.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.157500,-1.536000,38.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.157500,-1.536000,29.255000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.157500,-1.536000,29.255000> }
difference{
cylinder{<36.957500,0,29.655000><36.957500,0.036000,29.655000>0.409700 translate<0,-1.536000,0>}
cylinder{<36.957500,-0.1,29.655000><36.957500,0.135000,29.655000>0.155700 translate<0,-1.536000,0>}}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<35.432450,-1.536000,29.655000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<35.432450,-1.536000,30.455000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<35.432450,-1.536000,31.255100>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<35.432450,-1.536000,32.054950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<35.432450,-1.536000,32.855050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<35.432450,-1.536000,33.655000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<35.432450,-1.536000,34.454950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<35.432450,-1.536000,35.255050>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<35.432450,-1.536000,36.054900>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<35.432450,-1.536000,36.855000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<35.432450,-1.536000,37.655000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<36.957500,-1.536000,39.180050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<37.757500,-1.536000,39.180050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<38.557600,-1.536000,39.180050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<39.357450,-1.536000,39.180050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<40.157550,-1.536000,39.180050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<40.957500,-1.536000,39.180050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<41.757450,-1.536000,39.180050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<42.557550,-1.536000,39.180050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<43.357400,-1.536000,39.180050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<44.157500,-1.536000,39.180050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<44.957500,-1.536000,39.180050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<46.482550,-1.536000,37.655000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<46.482550,-1.536000,36.855000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<46.482550,-1.536000,36.054900>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<46.482550,-1.536000,35.255050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<46.482550,-1.536000,34.454950>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<46.482550,-1.536000,33.655000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<46.482550,-1.536000,32.855050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-0.000000,0> translate<46.482550,-1.536000,32.054950>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<46.482550,-1.536000,31.255100>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-0.000000,0> translate<46.482550,-1.536000,30.455000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-0.000000,0> translate<46.482550,-1.536000,29.655000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<44.957500,-1.536000,28.129950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<44.157500,-1.536000,28.129950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<43.357400,-1.536000,28.129950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<42.557550,-1.536000,28.129950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<41.757450,-1.536000,28.129950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<40.957500,-1.536000,28.129950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<40.157550,-1.536000,28.129950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-0.000000,0> translate<39.357450,-1.536000,28.129950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<38.557600,-1.536000,28.129950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-0.000000,0> translate<37.757500,-1.536000,28.129950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-0.000000,0> translate<36.957500,-1.536000,28.129950>}
//1D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.773300,-1.536000,38.671500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.773300,-1.536000,29.273500>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.773300,-1.536000,29.273500> }
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<62.242700,-1.536000,38.671500>}
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<65.392300,-1.536000,29.273500>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<65.392300,-1.536000,38.671500>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<62.242700,-1.536000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.861700,-1.536000,29.273500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.861700,-1.536000,38.671500>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,90.000000,0> translate<61.861700,-1.536000,38.671500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.242700,-1.536000,39.052500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.392300,-1.536000,39.052500>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<62.242700,-1.536000,39.052500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.392300,-1.536000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.325500,-1.536000,28.892500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<64.325500,-1.536000,28.892500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.325500,-1.536000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.309500,-1.536000,28.892500>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.309500,-1.536000,28.892500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.309500,-1.536000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.242700,-1.536000,28.892500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<62.242700,-1.536000,28.892500> }
object{ARC(0.508000,0.152400,0.000000,180.000000,0.036000) translate<63.817500,-1.536000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.217300,-1.536000,28.892500>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<62.217300,-1.536000,39.052500>}
box{<0,0,-0.025400><10.160000,0.036000,0.025400> rotate<0,90.000000,0> translate<62.217300,-1.536000,39.052500> }
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,33.337500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,29.527500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,30.797500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.315600,-1.536000,32.067500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,33.337500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,32.067500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,30.797500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,29.527500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,34.607500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,35.877500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,37.147500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<61.290200,-1.536000,38.417500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,34.607500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,35.877500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,37.147500>}
box{<-0.254000,0,-0.571500><0.254000,0.036000,0.571500> rotate<0,-90.000000,0> translate<66.344800,-1.536000,38.417500>}
//1HL1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.720000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.910000,0.000000,26.670000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.910000,0.000000,26.670000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<43.815000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<43.815000,0.000000,24.130000>}
difference{
cylinder{<43.815000,0,24.130000><43.815000,0.036000,24.130000>2.616200 translate<0,0.000000,0>}
cylinder{<43.815000,-0.1,24.130000><43.815000,0.135000,24.130000>2.463800 translate<0,0.000000,0>}}
//1HL2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.260000,0.000000,26.670000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.260000,0.000000,26.670000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<50.165000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<50.165000,0.000000,24.130000>}
difference{
cylinder{<50.165000,0,24.130000><50.165000,0.036000,24.130000>2.616200 translate<0,0.000000,0>}
cylinder{<50.165000,-0.1,24.130000><50.165000,0.135000,24.130000>2.463800 translate<0,0.000000,0>}}
//1HL3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.420000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.610000,0.000000,26.670000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.610000,0.000000,26.670000> }
object{ARC(3.175000,0.254000,126.869898,413.130102,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,180.000000,270.000000,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(1.143000,0.152400,0.000000,90.000000,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,180.000000,270.000000,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(1.651000,0.152400,0.000000,90.000000,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,180.000000,270.000000,0.036000) translate<56.515000,0.000000,24.130000>}
object{ARC(2.159000,0.152400,0.000000,90.000000,0.036000) translate<56.515000,0.000000,24.130000>}
difference{
cylinder{<56.515000,0,24.130000><56.515000,0.036000,24.130000>2.616200 translate<0,0.000000,0>}
cylinder{<56.515000,-0.1,24.130000><56.515000,0.135000,24.130000>2.463800 translate<0,0.000000,0>}}
//1R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.441300,-1.536000,20.002500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.863700,-1.536000,20.002500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<76.441300,-1.536000,20.002500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.441300,-1.536000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.863700,-1.536000,18.732500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<76.441300,-1.536000,18.732500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<78.016100,-1.536000,19.367500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<76.288900,-1.536000,19.367500>}
//1R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,-1.536000,21.196300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,-1.536000,22.618700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<45.720000,-1.536000,22.618700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,-1.536000,21.196300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,-1.536000,22.618700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,-1.536000,22.618700> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<46.355000,-1.536000,22.771100>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<46.355000,-1.536000,21.043900>}
//1R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,-1.536000,19.132550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,-1.536000,20.554950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,-1.536000,20.554950> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,-1.536000,19.132550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,-1.536000,20.554950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,-1.536000,20.554950> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<50.165000,-1.536000,20.707350>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<50.165000,-1.536000,18.980150>}
//1R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,-1.536000,31.826200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.340000,-1.536000,30.403800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.340000,-1.536000,30.403800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,-1.536000,31.826200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,-1.536000,30.403800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,-1.536000,30.403800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<52.705000,-1.536000,30.251400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<52.705000,-1.536000,31.978600>}
//1R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.295300,-1.536000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.295300,-1.536000,32.397700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<51.295300,-1.536000,32.397700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.669700,-1.536000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.669700,-1.536000,32.397700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<49.669700,-1.536000,32.397700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<50.482500,-1.536000,32.753300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<50.482500,-1.536000,30.111700>}
//1R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,21.793200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,21.793200>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.897000,-1.536000,21.793200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.897000,-1.536000,20.116800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.183000,-1.536000,20.116800>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.897000,-1.536000,20.116800> }
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-180.000000,0> translate<67.449700,-1.536000,20.955000>}
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-180.000000,0> translate<64.630300,-1.536000,20.955000>}
//1R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,-1.536000,35.483800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.215000,-1.536000,36.906200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<69.215000,-1.536000,36.906200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,-1.536000,35.483800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,-1.536000,36.906200>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<70.485000,-1.536000,36.906200> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<69.850000,-1.536000,37.058600>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<69.850000,-1.536000,35.331400>}
//1R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.693800,-1.536000,27.622500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.116200,-1.536000,27.622500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<64.693800,-1.536000,27.622500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.693800,-1.536000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.116200,-1.536000,26.352500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<64.693800,-1.536000,26.352500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<66.268600,-1.536000,26.987500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<64.541400,-1.536000,26.987500>}
//1R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,-1.536000,24.523700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,-1.536000,23.101300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.835000,-1.536000,23.101300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,-1.536000,24.523700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.565000,-1.536000,23.101300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.565000,-1.536000,23.101300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<76.200000,-1.536000,22.948900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<76.200000,-1.536000,24.676100>}
//1R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,37.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,37.055000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.580000,0.000000,37.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,37.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.310000,0.000000,37.055000>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.310000,0.000000,37.055000> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<67.946500,0.000000,36.733600>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-270.000000,0> translate<67.946500,0.000000,38.206800>}
//1R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.007500,-1.536000,14.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.007500,-1.536000,13.576300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.007500,-1.536000,13.576300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.737500,-1.536000,14.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.737500,-1.536000,13.576300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.737500,-1.536000,13.576300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<59.372500,-1.536000,13.423900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<59.372500,-1.536000,15.151100>}
//1R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,-1.536000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.226200,-1.536000,15.875000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<55.803800,-1.536000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,-1.536000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.226200,-1.536000,14.605000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<55.803800,-1.536000,14.605000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<57.378600,-1.536000,15.240000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<55.651400,-1.536000,15.240000>}
//1R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,33.102550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,34.524950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<64.135000,0.000000,34.524950> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,33.102550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,34.524950>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<62.865000,0.000000,34.524950> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<63.500000,0.000000,34.677350>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<63.500000,0.000000,32.950150>}
//1R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.547500,-1.536000,14.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.547500,-1.536000,13.576300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.547500,-1.536000,13.576300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.277500,-1.536000,14.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.277500,-1.536000,13.576300>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.277500,-1.536000,13.576300> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<61.912500,-1.536000,13.423900>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<61.912500,-1.536000,15.151100>}
//1R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.381250,-1.536000,23.138000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.381250,-1.536000,21.337000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.381250,-1.536000,21.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.981250,-1.536000,23.138000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.981250,-1.536000,21.337000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.981250,-1.536000,21.337000> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-270.000000,0> translate<53.182500,-1.536000,23.500950>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-270.000000,0> translate<53.182500,-1.536000,20.960950>}
//1VD1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.158100,0.000000,29.368750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.636900,0.000000,29.368750>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<66.636900,0.000000,29.368750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.158100,0.000000,33.178750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.636900,0.000000,33.178750>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<66.636900,0.000000,33.178750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.158100,0.000000,33.178750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<71.158100,0.000000,29.368750>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<71.158100,0.000000,29.368750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.636900,0.000000,33.178750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<66.636900,0.000000,29.368750>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<66.636900,0.000000,29.368750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.704500,0.000000,30.273750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.727500,0.000000,31.273750>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-44.345691,0> translate<68.704500,0.000000,30.273750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.727500,0.000000,31.273750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.704500,0.000000,32.273750>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,44.345691,0> translate<68.704500,0.000000,32.273750> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.704500,0.000000,32.273750>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.704500,0.000000,30.273750>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.704500,0.000000,30.273750> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-180.000000,0> translate<71.424800,0.000000,31.273750>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-180.000000,0> translate<66.370200,0.000000,31.273750>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-180.000000,0> translate<69.972500,0.000000,31.273750>}
//1VD2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.363100,0.000000,14.287500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.841900,0.000000,14.287500>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<55.841900,0.000000,14.287500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.363100,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.841900,0.000000,18.097500>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,0.000000,0> translate<55.841900,0.000000,18.097500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.363100,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<60.363100,0.000000,14.287500>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<60.363100,0.000000,14.287500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.841900,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<55.841900,0.000000,14.287500>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,-90.000000,0> translate<55.841900,0.000000,14.287500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.909500,0.000000,15.192500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.932500,0.000000,16.192500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-44.345691,0> translate<57.909500,0.000000,15.192500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.932500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.909500,0.000000,17.192500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,44.345691,0> translate<57.909500,0.000000,17.192500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.909500,0.000000,17.192500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.909500,0.000000,15.192500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.909500,0.000000,15.192500> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-180.000000,0> translate<60.629800,0.000000,16.192500>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-180.000000,0> translate<55.575200,0.000000,16.192500>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-180.000000,0> translate<59.177500,0.000000,16.192500>}
//1VT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.299600,-1.536000,9.531350>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.620400,-1.536000,9.531350>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<60.299600,-1.536000,9.531350> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.620400,-1.536000,9.531350>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.620400,-1.536000,12.376150>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<61.620400,-1.536000,12.376150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.620400,-1.536000,12.376150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.299600,-1.536000,12.376150>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<60.299600,-1.536000,12.376150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.299600,-1.536000,12.376150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.299600,-1.536000,9.531350>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.299600,-1.536000,9.531350> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<59.956700,-1.536000,10.953750>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<61.963300,-1.536000,10.013950>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-270.000000,0> translate<61.963300,-1.536000,11.893550>}
//1VT2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.775100,-1.536000,20.186650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.775100,-1.536000,18.865850>}
box{<0,0,-0.063500><1.320800,0.036000,0.063500> rotate<0,-90.000000,0> translate<54.775100,-1.536000,18.865850> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.775100,-1.536000,18.865850>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.619900,-1.536000,18.865850>}
box{<0,0,-0.063500><2.844800,0.036000,0.063500> rotate<0,0.000000,0> translate<54.775100,-1.536000,18.865850> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.619900,-1.536000,18.865850>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.619900,-1.536000,20.186650>}
box{<0,0,-0.063500><1.320800,0.036000,0.063500> rotate<0,90.000000,0> translate<57.619900,-1.536000,20.186650> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.619900,-1.536000,20.186650>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.775100,-1.536000,20.186650>}
box{<0,0,-0.063500><2.844800,0.036000,0.063500> rotate<0,0.000000,0> translate<54.775100,-1.536000,20.186650> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<56.197500,-1.536000,20.529550>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<55.257700,-1.536000,18.522950>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<57.137300,-1.536000,18.522950>}
//1VT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.427100,0.000000,38.569900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.747900,0.000000,38.569900>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<64.427100,0.000000,38.569900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.747900,0.000000,38.569900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.747900,0.000000,35.725100>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<65.747900,0.000000,35.725100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.747900,0.000000,35.725100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.427100,0.000000,35.725100>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<64.427100,0.000000,35.725100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.427100,0.000000,35.725100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.427100,0.000000,38.569900>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<64.427100,0.000000,38.569900> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<64.084200,0.000000,37.147500>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<66.090800,0.000000,38.087300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<66.090800,0.000000,36.207700>}
//2C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.684000,-1.536000,48.235000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.446000,-1.536000,48.235000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.684000,-1.536000,48.235000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.709000,-1.536000,49.555000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.446000,-1.536000,49.555000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.709000,-1.536000,49.555000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<11.347850,-1.536000,48.893850>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-0.000000,0> translate<12.795650,-1.536000,48.893850>}
//2C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.865000,-1.536000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.865000,-1.536000,47.244000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.865000,-1.536000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.185000,-1.536000,47.981000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.185000,-1.536000,47.244000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<10.185000,-1.536000,47.244000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<9.523850,-1.536000,48.342150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<9.523850,-1.536000,46.894350>}
//2C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.467500,-1.536000,49.434750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.467500,-1.536000,48.672750>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,-90.000000,0> translate<3.467500,-1.536000,48.672750> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.787500,-1.536000,49.409750>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.787500,-1.536000,48.672750>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,-90.000000,0> translate<4.787500,-1.536000,48.672750> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<4.126350,-1.536000,49.770900>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-270.000000,0> translate<4.126350,-1.536000,48.323100>}
//2C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.565400,-1.536000,45.732700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.565400,-1.536000,43.802300>}
box{<0,0,-0.050800><1.930400,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.565400,-1.536000,43.802300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.054600,-1.536000,45.732700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.054600,-1.536000,43.802300>}
box{<0,0,-0.050800><1.930400,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.054600,-1.536000,43.802300> }
box{<-0.375050,0,-1.299950><0.375050,0.036000,1.299950> rotate<0,-270.000000,0> translate<3.805450,-1.536000,46.094250>}
box{<-0.375050,0,-1.299950><0.375050,0.036000,1.299950> rotate<0,-270.000000,0> translate<3.814550,-1.536000,43.440750>}
//2C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.176000,-1.536000,26.060000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.414000,-1.536000,26.060000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.414000,-1.536000,26.060000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.151000,-1.536000,24.740000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.414000,-1.536000,24.740000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.414000,-1.536000,24.740000> }
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<11.512150,-1.536000,25.401150>}
box{<-0.375050,0,-0.725050><0.375050,0.036000,0.725050> rotate<0,-180.000000,0> translate<10.064350,-1.536000,25.401150>}
//2D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.042500,-1.536000,38.802500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.642500,-1.536000,38.802500>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.642500,-1.536000,38.802500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.642500,-1.536000,38.802500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.642500,-1.536000,32.952500>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.642500,-1.536000,32.952500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.642500,-1.536000,32.952500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.042500,-1.536000,32.952500>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.642500,-1.536000,32.952500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.042500,-1.536000,32.952500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.042500,-1.536000,38.802500>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.042500,-1.536000,38.802500> }
difference{
cylinder{<14.842500,0,32.277500><14.842500,0.036000,32.277500>0.435400 translate<0,-1.536000,0>}
cylinder{<14.842500,-0.1,32.277500><14.842500,0.135000,32.277500>0.283000 translate<0,-1.536000,0>}}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<14.067500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<14.067500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<13.417500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<12.767500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<13.417500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<12.767500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<12.117500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<11.467500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<10.817500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<10.167500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<9.517500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<8.867500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<8.217500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<7.567500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<6.917500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<6.267500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<5.617500,-1.536000,39.310300>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<12.117500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<11.467500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<10.817500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<10.167500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<9.517500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<8.867500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<8.217500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<7.567500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<6.917500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<6.267500,-1.536000,32.444700>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-180.000000,0> translate<5.617500,-1.536000,32.444700>}
//2R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.497000,-1.536000,42.506500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.633000,-1.536000,42.506500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.633000,-1.536000,42.506500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.633000,-1.536000,43.218500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.497000,-1.536000,43.218500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.633000,-1.536000,43.218500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<11.430000,-1.536000,42.862500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<12.700000,-1.536000,42.862500>}
//2R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.024500,-1.536000,42.380000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.825500,-1.536000,42.380000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.024500,-1.536000,42.380000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.024500,-1.536000,43.980000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.825500,-1.536000,43.980000>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.024500,-1.536000,43.980000> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-0.000000,0> translate<6.661550,-1.536000,43.181250>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-0.000000,0> translate<9.201550,-1.536000,43.181250>}
//2R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,15.201500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,15.201500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,15.201500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,15.913500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,15.913500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,15.913500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<5.715000,-1.536000,15.557500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<6.985000,-1.536000,15.557500>}
//2R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,13.614000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,13.614000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,13.614000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,14.326000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,14.326000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,14.326000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<5.715000,-1.536000,13.970000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<6.985000,-1.536000,13.970000>}
//2R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,12.738500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,12.738500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,12.738500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.782000,-1.536000,12.026500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.918000,-1.536000,12.026500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.918000,-1.536000,12.026500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<6.985000,-1.536000,12.382500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<5.715000,-1.536000,12.382500>}
//2R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.660500,-1.536000,24.136250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.859500,-1.536000,24.136250>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.859500,-1.536000,24.136250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.660500,-1.536000,22.536250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.859500,-1.536000,22.536250>}
box{<0,0,-0.076200><1.801000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.859500,-1.536000,22.536250> }
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-180.000000,0> translate<13.023450,-1.536000,23.335000>}
box{<-0.375050,0,-0.875050><0.375050,0.036000,0.875050> rotate<0,-180.000000,0> translate<10.483450,-1.536000,23.335000>}
//2R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.870500,-1.536000,24.962250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.734500,-1.536000,24.962250>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.870500,-1.536000,24.962250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.734500,-1.536000,24.250250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.870500,-1.536000,24.250250>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.870500,-1.536000,24.250250> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<7.937500,-1.536000,24.606250>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<6.667500,-1.536000,24.606250>}
//2R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.724000,-1.536000,24.968000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.724000,-1.536000,25.832000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.724000,-1.536000,25.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.436000,-1.536000,25.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.436000,-1.536000,24.968000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.436000,-1.536000,24.968000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<5.080000,-1.536000,26.035000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<5.080000,-1.536000,24.765000>}
//2R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.152750,-1.536000,29.095500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.152750,-1.536000,29.959500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.152750,-1.536000,29.959500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.864750,-1.536000,29.959500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.864750,-1.536000,29.095500>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.864750,-1.536000,29.095500> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<6.508750,-1.536000,30.162500>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<6.508750,-1.536000,28.892500>}
//2R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.565250,-1.536000,28.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.565250,-1.536000,29.642000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.565250,-1.536000,29.642000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.277250,-1.536000,29.642000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.277250,-1.536000,28.778000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.277250,-1.536000,28.778000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<4.921250,-1.536000,29.845000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<4.921250,-1.536000,28.575000>}
//2Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.794500,0.000000,44.513500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<12.890500,0.000000,44.513500>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<6.794500,0.000000,44.513500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.794500,0.000000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<12.890500,0.000000,48.831500>}
box{<0,0,-0.203200><6.096000,0.036000,0.203200> rotate<0,0.000000,0> translate<6.794500,0.000000,48.831500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.794500,0.000000,45.021500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.890500,0.000000,45.021500>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.794500,0.000000,45.021500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.890500,0.000000,48.323500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.794500,0.000000,48.323500>}
box{<0,0,-0.076200><6.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.794500,0.000000,48.323500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.588500,0.000000,47.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.096500,0.000000,47.434500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.588500,0.000000,47.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.096500,0.000000,47.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.096500,0.000000,45.910500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.096500,0.000000,45.910500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.096500,0.000000,45.910500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.588500,0.000000,45.910500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.588500,0.000000,45.910500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.588500,0.000000,45.910500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.588500,0.000000,47.434500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.588500,0.000000,47.434500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,47.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,46.672500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.477500,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,45.910500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.477500,0.000000,45.910500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.207500,0.000000,47.434500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.207500,0.000000,46.672500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.207500,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.207500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.207500,0.000000,45.910500>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.207500,0.000000,45.910500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.477500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.112500,0.000000,46.672500>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.477500,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.207500,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.572500,0.000000,46.672500>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.572500,0.000000,46.672500> }
object{ARC(2.159000,0.406400,90.000000,270.000000,0.036000) translate<6.794500,0.000000,46.672500>}
object{ARC(2.159000,0.406400,270.000000,450.000000,0.036000) translate<12.890500,0.000000,46.672500>}
object{ARC(1.651000,0.152400,90.000000,270.000000,0.036000) translate<6.794500,0.000000,46.672500>}
object{ARC(1.651000,0.152400,270.000000,450.000000,0.036000) translate<12.890500,0.000000,46.672500>}
//3C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.383500,0.000000,16.668750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.383500,0.000000,17.938750>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.383500,0.000000,17.938750> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<20.891500,0.000000,17.938750>}
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<20.891500,0.000000,16.668750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.193500,0.000000,18.446750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,0.000000,18.446750>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.891500,0.000000,18.446750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.701500,0.000000,16.668750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.701500,0.000000,17.938750>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.701500,0.000000,17.938750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.193500,0.000000,16.160750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,0.000000,16.160750>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.891500,0.000000,16.160750> }
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<24.193500,0.000000,17.938750>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<24.193500,0.000000,16.668750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.237700,0.000000,18.065750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.237700,0.000000,16.541750>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.237700,0.000000,16.541750> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.872700,0.000000,18.065750>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.872700,0.000000,16.541750>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.872700,0.000000,16.541750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.812500,0.000000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.872700,0.000000,17.303750>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,0.000000,0> translate<22.872700,0.000000,17.303750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.272500,0.000000,17.303750>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.237700,0.000000,17.303750>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.272500,0.000000,17.303750> }
//3C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.288250,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.288250,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.288250,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.669250,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.907250,0.000000,7.112000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.907250,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,9.398000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.431250,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.701250,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.431250,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.701250,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.701250,0.000000,9.906000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.701250,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.701250,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.161250,0.000000,9.906000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.161250,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.161250,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.161250,0.000000,9.398000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.161250,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.161250,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.161250,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.431250,0.000000,11.811000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.431250,0.000000,11.811000> }
difference{
cylinder{<21.431250,0,10.160000><21.431250,0.036000,10.160000>4.140200 translate<0,0.000000,0>}
cylinder{<21.431250,-0.1,10.160000><21.431250,0.135000,10.160000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<21.431250,0.000000,10.668000>}
//3C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.624500,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.624500,0.000000,7.493000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.624500,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.005500,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.243500,0.000000,7.112000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.243500,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,9.398000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.767500,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.767500,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,9.906000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.037500,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.037500,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.497500,0.000000,9.906000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.497500,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.497500,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.497500,0.000000,9.398000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.497500,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.497500,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.497500,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.767500,0.000000,11.811000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.767500,0.000000,11.811000> }
difference{
cylinder{<44.767500,0,10.160000><44.767500,0.036000,10.160000>4.140200 translate<0,0.000000,0>}
cylinder{<44.767500,-0.1,10.160000><44.767500,0.135000,10.160000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<44.767500,0.000000,10.668000>}
//3C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.242500,0.000000,5.143500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.242500,0.000000,9.461500>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.242500,0.000000,9.461500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.782500,0.000000,9.461500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.782500,0.000000,5.143500>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.782500,0.000000,5.143500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.496500,0.000000,9.715500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.528500,0.000000,9.715500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.496500,0.000000,9.715500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.496500,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.528500,0.000000,4.889500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.496500,0.000000,4.889500> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.496500,0.000000,9.461500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.496500,0.000000,5.143500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<37.528500,0.000000,9.461500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<37.528500,0.000000,5.143500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,8.064500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,7.683500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.512500,0.000000,7.683500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,7.683500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,7.556500>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.512500,0.000000,7.556500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.512500,0.000000,7.556500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.750500,0.000000,7.556500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.750500,0.000000,7.556500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.512500,0.000000,7.556500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,7.556500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<36.512500,0.000000,7.556500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.750500,0.000000,7.048500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.512500,0.000000,7.048500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.750500,0.000000,7.048500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.512500,0.000000,7.048500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.274500,0.000000,7.048500>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<36.512500,0.000000,7.048500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,7.048500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,6.921500>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.512500,0.000000,6.921500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,6.921500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.512500,0.000000,6.540500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.512500,0.000000,6.540500> }
//3C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,5.461000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,9.779000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,5.207000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.784000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,10.033000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.784000,0.000000,10.033000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.816000,0.000000,5.461000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.816000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.784000,0.000000,5.461000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.784000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,7.239000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,7.366000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.562000,0.000000,7.366000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.800000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.038000,0.000000,7.366000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.038000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.562000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,7.874000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.800000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.038000,0.000000,7.874000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.038000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,8.001000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,8.382000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,8.382000> }
//3D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.215000,-1.536000,4.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,4.585000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.215000,-1.536000,4.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,4.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.015000,-1.536000,4.585000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.515000,-1.536000,4.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.015000,-1.536000,4.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.015000,-1.536000,9.385000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<33.015000,-1.536000,9.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.015000,-1.536000,9.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,9.385000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.515000,-1.536000,9.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,9.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.215000,-1.536000,9.385000>}
box{<0,0,-0.101600><3.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.215000,-1.536000,9.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.215000,-1.536000,9.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.215000,-1.536000,4.585000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.215000,-1.536000,4.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,4.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.515000,-1.536000,9.385000>}
box{<0,0,-0.101600><4.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<32.515000,-1.536000,9.385000> }
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<33.665000,-1.536000,8.890000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<33.665000,-1.536000,7.620000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<33.665000,-1.536000,6.350000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<33.665000,-1.536000,5.080000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<28.565000,-1.536000,5.080000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<28.565000,-1.536000,6.350000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<28.565000,-1.536000,7.620000>}
box{<-0.245000,0,-0.550000><0.245000,0.036000,0.550000> rotate<0,-270.000000,0> translate<28.565000,-1.536000,8.890000>}
//3L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.512500,0.000000,13.017500>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.496500,0.000000,13.017500>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.496500,0.000000,13.017500> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<26.352500,0.000000,13.017500>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.368500,0.000000,13.017500>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<26.352500,0.000000,13.017500> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.511500,0.000000,13.906500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.511500,0.000000,12.128500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.353500,0.000000,12.128500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.353500,0.000000,13.906500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,12.128500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.257500,0.000000,13.906500>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.257500,0.000000,13.906500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.511500,0.000000,14.160500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,14.160500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.511500,0.000000,14.160500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.019500,0.000000,14.033500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,14.160500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.892500,0.000000,14.160500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.511500,0.000000,11.874500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,11.874500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.511500,0.000000,11.874500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.019500,0.000000,12.001500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,11.874500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.892500,0.000000,11.874500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.845500,0.000000,14.033500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,14.160500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.845500,0.000000,14.033500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.845500,0.000000,14.033500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.019500,0.000000,14.033500>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.019500,0.000000,14.033500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.845500,0.000000,12.001500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,11.874500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.845500,0.000000,12.001500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.845500,0.000000,12.001500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.019500,0.000000,12.001500>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.019500,0.000000,12.001500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.353500,0.000000,14.160500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,14.160500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.972500,0.000000,14.160500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.353500,0.000000,11.874500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.972500,0.000000,11.874500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.972500,0.000000,11.874500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,0.000000,12.128500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.607500,0.000000,13.906500>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.607500,0.000000,13.906500> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<35.039300,0.000000,13.017500>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<27.825700,0.000000,13.017500>}
//3R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.765000,0.000000,4.127500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.876000,0.000000,4.127500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<23.876000,0.000000,4.127500> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,4.127500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.034000,0.000000,4.127500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<17.145000,0.000000,4.127500> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.669000,0.000000,4.889500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.669000,0.000000,3.365500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,3.365500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,3.365500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,4.889500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.415000,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,5.143500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.143500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,5.143500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.143500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,5.143500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,3.111500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.111500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,3.111500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,3.238500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.111500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,3.111500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,5.143500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,5.016500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,5.016500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,5.016500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,5.016500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.238500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,3.111500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,3.238500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.238500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,3.238500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,3.238500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,5.143500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,5.143500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,5.143500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,3.111500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,3.111500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,3.111500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,3.365500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,4.889500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,4.889500> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.685500,0.000000,4.127500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.224500,0.000000,4.127500>}
//3R1A silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.765000,0.000000,1.746250>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.876000,0.000000,1.746250>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<23.876000,0.000000,1.746250> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.145000,0.000000,1.746250>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.034000,0.000000,1.746250>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<17.145000,0.000000,1.746250> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.669000,0.000000,2.508250>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.669000,0.000000,0.984250>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,0.984250>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,2.508250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,0.984250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,2.508250>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.415000,0.000000,2.508250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,2.762250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,2.762250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,2.762250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,2.635250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,2.762250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,2.762250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,0.000000,0.730250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,0.730250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,0.000000,0.730250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,0.857250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,0.730250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,0.730250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,2.635250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,2.762250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,2.635250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,2.635250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,2.635250>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,2.635250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,0.857250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,0.730250>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,0.857250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,0.857250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,0.857250>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.177000,0.000000,0.857250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,2.762250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,2.762250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,2.762250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,0.730250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,0.730250>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,0.730250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,0.984250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,2.508250>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,2.508250> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.685500,0.000000,1.746250>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.224500,0.000000,1.746250>}
//3R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.416250,0.000000,2.857500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.416250,0.000000,3.746500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<28.416250,0.000000,3.746500> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.416250,0.000000,10.477500>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<28.416250,0.000000,9.588500>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<28.416250,0.000000,9.588500> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<29.178250,0.000000,8.953500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<27.654250,0.000000,8.953500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<27.654250,0.000000,4.381500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<29.178250,0.000000,4.381500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.654250,0.000000,9.207500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.178250,0.000000,9.207500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.654250,0.000000,9.207500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,8.953500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,8.572500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.432250,0.000000,8.572500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.305250,0.000000,8.445500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,8.572500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.305250,0.000000,8.445500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,8.953500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,8.572500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.400250,0.000000,8.572500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.527250,0.000000,8.445500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,8.572500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<27.400250,0.000000,8.572500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.305250,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,4.762500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.305250,0.000000,4.889500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.305250,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.305250,0.000000,8.445500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.305250,0.000000,8.445500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.527250,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,4.762500>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.400250,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.527250,0.000000,4.889500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.527250,0.000000,8.445500>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.527250,0.000000,8.445500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,4.381500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.432250,0.000000,4.762500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<29.432250,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,4.381500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400250,0.000000,4.762500>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.400250,0.000000,4.762500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.654250,0.000000,4.127500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.178250,0.000000,4.127500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.654250,0.000000,4.127500> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.416250,0.000000,3.937000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<28.416250,0.000000,9.398000>}
//3R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.991300,-1.536000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.413700,-1.536000,3.810000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<31.991300,-1.536000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.991300,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.413700,-1.536000,2.540000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<31.991300,-1.536000,2.540000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<33.566100,-1.536000,3.175000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<31.838900,-1.536000,3.175000>}
//3R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.176200,-1.536000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.753800,-1.536000,2.540000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<36.753800,-1.536000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.176200,-1.536000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.753800,-1.536000,3.810000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<36.753800,-1.536000,3.810000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<36.601400,-1.536000,3.175000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<38.328600,-1.536000,3.175000>}
//3VD1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.592500,-1.536000,6.946900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.592500,-1.536000,11.468100>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,90.000000,0> translate<41.592500,-1.536000,11.468100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.782500,-1.536000,6.946900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.782500,-1.536000,11.468100>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,90.000000,0> translate<37.782500,-1.536000,11.468100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.782500,-1.536000,6.946900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.592500,-1.536000,6.946900>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.782500,-1.536000,6.946900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.782500,-1.536000,11.468100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.592500,-1.536000,11.468100>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.782500,-1.536000,11.468100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.687500,-1.536000,9.400500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.687500,-1.536000,8.377500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-45.648369,0> translate<39.687500,-1.536000,8.377500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.687500,-1.536000,8.377500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.687500,-1.536000,9.400500>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,45.648369,0> translate<38.687500,-1.536000,9.400500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.687500,-1.536000,9.400500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.687500,-1.536000,9.400500>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.687500,-1.536000,9.400500> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-90.000000,0> translate<39.687500,-1.536000,6.680200>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-90.000000,0> translate<39.687500,-1.536000,11.734800>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-90.000000,0> translate<39.687500,-1.536000,8.132500>}
//4C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.539500,0.000000,33.826250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.539500,0.000000,31.896250>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<52.539500,0.000000,31.896250> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.965500,0.000000,33.826250>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.965500,0.000000,31.896250>}
box{<0,0,-0.050800><1.930000,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.965500,0.000000,31.896250> }
box{<-0.375050,0,-0.850000><0.375050,0.036000,0.850000> rotate<0,-270.000000,0> translate<51.751600,0.000000,34.188000>}
box{<-0.375050,0,-0.850000><0.375050,0.036000,0.850000> rotate<0,-270.000000,0> translate<51.753400,0.000000,31.534500>}
//4R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.916837,0.000000,38.675387>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.100981,0.000000,39.840550>}
box{<0,0,-0.076200><1.422401,0.036000,0.076200> rotate<0,54.996348,0> translate<37.100981,0.000000,39.840550> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.876516,0.000000,37.946947>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.060659,0.000000,39.112109>}
box{<0,0,-0.076200><1.422401,0.036000,0.076200> rotate<0,54.996348,0> translate<36.060659,0.000000,39.112109> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-305.000000,0> translate<36.493409,0.000000,39.601169>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-305.000000,0> translate<37.484088,0.000000,38.186328>}
//4R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.374300,0.000000,34.004250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.374300,0.000000,31.718250>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.374300,0.000000,31.718250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.050700,0.000000,34.004250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.050700,0.000000,31.718250>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.050700,0.000000,31.718250> }
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-90.000000,0> translate<49.212500,0.000000,31.451550>}
box{<-0.292100,0,-0.914400><0.292100,0.036000,0.914400> rotate<0,-90.000000,0> translate<49.212500,0.000000,34.270950>}
//4R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,34.531300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,35.953700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<47.625000,0.000000,35.953700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,34.531300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,35.953700>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,90.000000,0> translate<46.355000,0.000000,35.953700> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<46.990000,0.000000,36.106100>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-270.000000,0> translate<46.990000,0.000000,34.378900>}
//4R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.882550,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.304950,0.000000,36.830000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<50.882550,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.882550,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.304950,0.000000,38.100000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<50.882550,0.000000,38.100000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<52.457350,0.000000,37.465000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<50.730150,0.000000,37.465000>}
//4R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.660050,0.000000,40.957500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.082450,0.000000,40.957500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<48.660050,0.000000,40.957500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.660050,0.000000,42.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.082450,0.000000,42.227500>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<48.660050,0.000000,42.227500> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<50.234850,0.000000,41.592500>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-180.000000,0> translate<48.507650,0.000000,41.592500>}
//4VT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.154600,0.000000,36.982400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.475400,0.000000,36.982400>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<43.154600,0.000000,36.982400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.475400,0.000000,36.982400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.475400,0.000000,34.137600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.475400,0.000000,34.137600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.475400,0.000000,34.137600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.154600,0.000000,34.137600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<43.154600,0.000000,34.137600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.154600,0.000000,34.137600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.154600,0.000000,36.982400>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<43.154600,0.000000,36.982400> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<42.811700,0.000000,35.560000>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<44.818300,0.000000,36.499800>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<44.818300,0.000000,34.620200>}
//4VT2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.104500,0.000000,40.925500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.104500,0.000000,39.719500>}
box{<0,0,-0.101600><1.206000,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.104500,0.000000,39.719500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.104500,0.000000,39.719500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.400500,0.000000,39.719500>}
box{<0,0,-0.101600><2.704000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.400500,0.000000,39.719500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.400500,0.000000,39.719500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.400500,0.000000,40.925500>}
box{<0,0,-0.101600><1.206000,0.036000,0.101600> rotate<0,90.000000,0> translate<50.400500,0.000000,40.925500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.400500,0.000000,40.925500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.104500,0.000000,40.925500>}
box{<0,0,-0.101600><2.704000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.400500,0.000000,40.925500> }
box{<-0.250000,0,-0.298300><0.250000,0.036000,0.298300> rotate<0,-0.000000,0> translate<50.827500,0.000000,39.370800>}
box{<-0.250000,0,-0.298300><0.250000,0.036000,0.298300> rotate<0,-0.000000,0> translate<52.677500,0.000000,39.370800>}
box{<-0.237500,0,-0.298300><0.237500,0.036000,0.298300> rotate<0,-180.000000,0> translate<51.740000,0.000000,41.274200>}
//4VT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.615100,0.000000,39.662100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.615100,0.000000,40.982900>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.615100,0.000000,40.982900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.615100,0.000000,40.982900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.459900,0.000000,40.982900>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<44.615100,0.000000,40.982900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.459900,0.000000,40.982900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.459900,0.000000,39.662100>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.459900,0.000000,39.662100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.459900,0.000000,39.662100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.615100,0.000000,39.662100>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<44.615100,0.000000,39.662100> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<46.037500,0.000000,39.319200>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<45.097700,0.000000,41.325800>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<46.977300,0.000000,41.325800>}
//HW silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,24.606250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,23.336250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.341250,0.000000,23.336250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,23.336250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,22.701250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.706250,0.000000,22.701250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,22.701250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,22.701250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.436250,0.000000,22.701250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,22.701250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,23.336250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<60.801250,0.000000,23.336250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,25.241250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,25.241250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.436250,0.000000,25.241250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,24.606250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,25.241250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.706250,0.000000,25.241250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,25.241250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,24.606250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.801250,0.000000,24.606250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,23.336250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,24.606250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.801250,0.000000,24.606250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,22.701250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,22.066250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.706250,0.000000,22.701250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,22.066250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,20.796250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.341250,0.000000,20.796250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.341250,0.000000,20.796250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,20.161250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.706250,0.000000,20.161250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.706250,0.000000,20.161250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,20.161250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.436250,0.000000,20.161250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,20.161250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,20.796250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<60.801250,0.000000,20.796250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,20.796250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,22.066250>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<60.801250,0.000000,22.066250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.801250,0.000000,22.066250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.436250,0.000000,22.701250>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<60.801250,0.000000,22.066250> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<62.071250,0.000000,23.971250>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<62.071250,0.000000,21.431250>}
//ISP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,33.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.390000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.390000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,34.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.390000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.390000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.390000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.390000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,37.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<72.390000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,38.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<72.390000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<72.390000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,39.370000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.025000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,33.655000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<76.835000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,36.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<76.835000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.470000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.835000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.025000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,31.750000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.025000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,32.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.835000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,32.385000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.470000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,38.735000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<76.835000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,37.465000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<77.470000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.835000,0.000000,36.830000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<76.200000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<76.200000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<76.200000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<73.660000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<73.660000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<73.660000,0.000000,38.100000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304500,-1.536000,45.148500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.510500,-1.536000,45.148500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.510500,-1.536000,45.148500> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.304500,-1.536000,43.370500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.510500,-1.536000,43.370500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.510500,-1.536000,44.894500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.304500,-1.536000,44.894500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.558500,-1.536000,44.894500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.558500,-1.536000,43.370500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.558500,-1.536000,43.370500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.256500,-1.536000,44.894500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.256500,-1.536000,43.370500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.256500,-1.536000,43.370500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.510500,-1.536000,43.116500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304500,-1.536000,43.116500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.510500,-1.536000,43.116500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.923500,-1.536000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.431500,-1.536000,44.132500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.923500,-1.536000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,-1.536000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.383500,-1.536000,44.132500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.383500,-1.536000,44.132500> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<21.653500,-1.536000,44.132500>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<22.161500,-1.536000,44.132500>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304500,-1.536000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.510500,-1.536000,42.926000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.510500,-1.536000,42.926000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.304500,-1.536000,41.148000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.510500,-1.536000,41.148000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.510500,-1.536000,42.672000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.304500,-1.536000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.558500,-1.536000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.558500,-1.536000,41.148000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.558500,-1.536000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.256500,-1.536000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.256500,-1.536000,41.148000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.256500,-1.536000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.510500,-1.536000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.304500,-1.536000,40.894000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.510500,-1.536000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.923500,-1.536000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.431500,-1.536000,41.910000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.923500,-1.536000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,-1.536000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.383500,-1.536000,41.910000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.383500,-1.536000,41.910000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<21.653500,-1.536000,41.910000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<22.161500,-1.536000,41.910000>}
//JI silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,-1.536000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.525500,-1.536000,28.321000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.525500,-1.536000,28.321000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.319500,-1.536000,26.543000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<13.525500,-1.536000,26.543000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<13.525500,-1.536000,28.067000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.319500,-1.536000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.573500,-1.536000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.573500,-1.536000,26.543000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.573500,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,-1.536000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.271500,-1.536000,26.543000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.271500,-1.536000,26.543000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.525500,-1.536000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.319500,-1.536000,26.289000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.525500,-1.536000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.938500,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.446500,-1.536000,27.305000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.938500,-1.536000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.906500,-1.536000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.398500,-1.536000,27.305000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.398500,-1.536000,27.305000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<14.668500,-1.536000,27.305000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<15.176500,-1.536000,27.305000>}
//JO silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.939500,-1.536000,40.703500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.145500,-1.536000,40.703500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.145500,-1.536000,40.703500> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.939500,-1.536000,38.925500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.145500,-1.536000,38.925500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.145500,-1.536000,40.449500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.939500,-1.536000,40.449500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.193500,-1.536000,40.449500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.193500,-1.536000,38.925500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.193500,-1.536000,38.925500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,-1.536000,40.449500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.891500,-1.536000,38.925500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.891500,-1.536000,38.925500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.145500,-1.536000,38.671500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.939500,-1.536000,38.671500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.145500,-1.536000,38.671500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.558500,-1.536000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.066500,-1.536000,39.687500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.558500,-1.536000,39.687500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.526500,-1.536000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.018500,-1.536000,39.687500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.018500,-1.536000,39.687500> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<22.288500,-1.536000,39.687500>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<22.796500,-1.536000,39.687500>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,43.878500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,41.846500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<78.740000,0.000000,41.846500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,41.592500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.374000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,41.846500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,41.592500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.406000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,44.132500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.374000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,43.878500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,44.132500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<73.406000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,43.878500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.120000,0.000000,43.878500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.374000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,41.846500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<71.120000,0.000000,41.846500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,41.846500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.120000,0.000000,43.878500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<71.120000,0.000000,43.878500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,41.846500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<73.660000,0.000000,41.846500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,41.592500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.914000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,41.846500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,41.592500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.946000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,41.846500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<76.200000,0.000000,41.846500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,41.846500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,41.592500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<78.486000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,41.592500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,41.592500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.454000,0.000000,41.592500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,43.878500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.660000,0.000000,43.878500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,43.878500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,44.132500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<75.946000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.200000,0.000000,43.878500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<76.200000,0.000000,43.878500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.740000,0.000000,43.878500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,44.132500>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<78.486000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,44.132500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.914000,0.000000,44.132500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,44.132500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,44.132500>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.454000,0.000000,44.132500> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<77.470000,0.000000,42.862500>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<74.930000,0.000000,42.862500>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-180.000000,0> translate<72.390000,0.000000,42.862500>}
//JR silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,-1.536000,37.655500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,-1.536000,40.449500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.701000,-1.536000,40.449500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<18.923000,-1.536000,37.655500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<18.923000,-1.536000,40.449500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.447000,-1.536000,40.449500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.447000,-1.536000,37.655500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,37.401500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,-1.536000,37.401500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.923000,-1.536000,37.401500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,-1.536000,40.703500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,-1.536000,40.703500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.923000,-1.536000,40.703500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,-1.536000,40.449500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,-1.536000,37.655500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.669000,-1.536000,37.655500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,-1.536000,38.036500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,-1.536000,37.528500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.685000,-1.536000,37.528500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,-1.536000,40.068500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,-1.536000,40.576500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.685000,-1.536000,40.576500> }
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<19.685000,-1.536000,39.306500>}
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<19.685000,-1.536000,38.798500>}
//JS silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,30.543500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,30.543500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.573000,-1.536000,30.543500> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.367000,-1.536000,28.765500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.573000,-1.536000,28.765500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.573000,-1.536000,30.289500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.367000,-1.536000,30.289500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,-1.536000,30.289500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,-1.536000,28.765500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.621000,-1.536000,28.765500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,-1.536000,30.289500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,-1.536000,28.765500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.319000,-1.536000,28.765500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,-1.536000,28.511500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,-1.536000,28.511500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.573000,-1.536000,28.511500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,-1.536000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,29.527500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.986000,-1.536000,29.527500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,-1.536000,29.527500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,-1.536000,29.527500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.446000,-1.536000,29.527500> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<13.716000,-1.536000,29.527500>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<14.224000,-1.536000,29.527500>}
//JV silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,41.719500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,38.925500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.626000,0.000000,38.925500> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<53.848000,0.000000,41.719500>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<53.848000,0.000000,38.925500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<55.372000,0.000000,38.925500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<55.372000,0.000000,41.719500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,41.973500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,41.973500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.848000,0.000000,41.973500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,38.671500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,38.671500>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.848000,0.000000,38.671500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,38.925500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,41.719500>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.594000,0.000000,41.719500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,41.338500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,41.846500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,41.846500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,39.306500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,38.798500>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,38.798500> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<54.610000,0.000000,40.068500>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<54.610000,0.000000,40.576500>}
//JX silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.354750,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.354750,0.000000,39.243000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.354750,0.000000,39.243000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.576750,0.000000,42.037000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.576750,0.000000,39.243000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.100750,0.000000,39.243000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.100750,0.000000,42.037000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.100750,0.000000,42.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.576750,0.000000,42.291000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.576750,0.000000,42.291000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.100750,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.576750,0.000000,38.989000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.576750,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.322750,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.322750,0.000000,42.037000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.322750,0.000000,42.037000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.338750,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.338750,0.000000,42.164000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.338750,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.338750,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.338750,0.000000,39.116000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.338750,0.000000,39.116000> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<43.338750,0.000000,40.386000>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<43.338750,0.000000,40.894000>}
//RES silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.670000,-1.536000,45.561250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.490000,-1.536000,45.561250>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.670000,-1.536000,45.561250> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.670000,-1.536000,46.831250>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.490000,-1.536000,46.831250>}
box{<0,0,-0.076200><0.820000,0.036000,0.076200> rotate<0,0.000000,0> translate<73.670000,-1.536000,46.831250> }
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<74.811400,-1.536000,46.194750>}
box{<-0.325000,0,-0.700000><0.325000,0.036000,0.700000> rotate<0,-0.000000,0> translate<73.338200,-1.536000,46.194750>}
//RJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.957800,-1.536000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.957800,-1.536000,33.032700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<17.957800,-1.536000,33.032700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.332200,-1.536000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.332200,-1.536000,33.032700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<16.332200,-1.536000,33.032700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<17.145000,-1.536000,33.388300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<17.145000,-1.536000,30.746700>}
//RJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,26.371550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.382700,0.000000,26.371550>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,26.371550> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,24.745950>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.382700,0.000000,24.745950>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,24.745950> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<39.738300,0.000000,25.558750>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<37.096700,0.000000,25.558750>}
//RJ3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.749966,0.000000,35.379503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.105984,0.000000,34.023484>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,44.997030,0> translate<59.749966,0.000000,35.379503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.600494,0.000000,34.230031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.956513,0.000000,32.874012>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,44.997030,0> translate<58.600494,0.000000,34.230031> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-135.000000,0> translate<60.782694,0.000000,33.197303>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-135.000000,0> translate<58.914803,0.000000,35.065194>}
//RJ4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.360450,0.000000,40.722791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.986753,0.000000,39.706563>}
box{<0,0,-0.076200><1.917702,0.036000,0.076200> rotate<0,31.997917,0> translate<58.360450,0.000000,40.722791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.499016,0.000000,39.344203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.125316,0.000000,38.327978>}
box{<0,0,-0.076200><1.917698,0.036000,0.076200> rotate<0,31.997887,0> translate<57.499016,0.000000,39.344203> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-148.000000,0> translate<59.857600,0.000000,38.828831>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-148.000000,0> translate<57.617397,0.000000,40.228666>}
//RJ5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.932863,-1.536000,43.494038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.032809,-1.536000,41.923150>}
box{<0,0,-0.076200><1.917699,0.036000,0.076200> rotate<0,54.996380,0> translate<15.932863,-1.536000,43.494038> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.264478,-1.536000,44.426444>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.364425,-1.536000,42.855556>}
box{<0,0,-0.076200><1.917699,0.036000,0.076200> rotate<0,54.996380,0> translate<17.264478,-1.536000,44.426444> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-125.000000,0> translate<17.902581,-1.536000,42.098063>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-125.000000,0> translate<16.387422,-1.536000,44.261934>}
//RJ6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.547500,-1.536000,7.442200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.465200,-1.536000,7.442200>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<62.547500,-1.536000,7.442200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.547500,-1.536000,9.067800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.465200,-1.536000,9.067800>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<62.547500,-1.536000,9.067800> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<64.820800,-1.536000,8.255000>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-180.000000,0> translate<62.179200,-1.536000,8.255000>}
//RJ7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.217800,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.217800,0.000000,41.897300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<66.217800,0.000000,41.897300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.592200,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.592200,0.000000,41.897300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.592200,0.000000,41.897300> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<65.405000,0.000000,41.541700>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-90.000000,0> translate<65.405000,0.000000,44.183300>}
//RJ8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,10.655300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.862300,-1.536000,10.655300>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<15.862300,-1.536000,10.655300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,-1.536000,9.029700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.862300,-1.536000,9.029700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,0.000000,0> translate<15.862300,-1.536000,9.029700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<15.506700,-1.536000,9.842500>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-0.000000,0> translate<18.148300,-1.536000,9.842500>}
//RJ9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.710300,-1.536000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.710300,-1.536000,16.522700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<69.710300,-1.536000,16.522700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.084700,-1.536000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.084700,-1.536000,16.522700>}
box{<0,0,-0.076200><1.917700,0.036000,0.076200> rotate<0,90.000000,0> translate<68.084700,-1.536000,16.522700> }
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<68.897500,-1.536000,16.878300>}
box{<-0.368300,0,-0.876300><0.368300,0.036000,0.876300> rotate<0,-270.000000,0> translate<68.897500,-1.536000,14.236700>}
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,6.477000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.358000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,6.223000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.358000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,6.223000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.882000,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,6.477000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,12.573000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.882000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,12.827000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.358000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,12.827000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.358000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,6.985000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.660000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,6.477000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<68.072000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,6.477000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.580000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,12.573000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<73.660000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,12.573000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,12.573000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.072000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,12.573000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.580000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,10.795000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<69.850000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,10.795000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<69.850000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,8.255000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<69.850000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,8.255000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<72.390000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.168000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,10.795000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<73.914000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,10.795000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<73.914000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.168000,0.000000,8.255000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<73.914000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,10.795000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,90.000000,0> translate<68.326000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.072000,0.000000,8.382000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<68.072000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.072000,0.000000,10.795000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<68.072000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,7.366000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.072000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,11.684000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,10.795000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,11.684000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.168000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,7.366000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,8.255000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,10.795000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,11.684000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,8.382000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,7.366000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,6.477000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,6.477000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.882000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,12.573000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,12.573000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.882000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.961000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.961000,0.000000,8.255000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.961000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.406000,0.000000,10.795000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.406000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.628000,0.000000,11.938000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.628000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,11.938000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.850000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.628000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.739000,0.000000,11.684000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,-15.944344,0> translate<70.739000,0.000000,11.684000> }
difference{
cylinder{<71.120000,0,9.525000><71.120000,0.036000,9.525000>1.854200 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,9.525000><71.120000,0.135000,9.525000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<68.961000,0,11.684000><68.961000,0.036000,11.684000>0.584200 translate<0,0.000000,0>}
cylinder{<68.961000,-0.1,11.684000><68.961000,0.135000,11.684000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<69.088000,0,7.366000><69.088000,0.036000,7.366000>0.584200 translate<0,0.000000,0>}
cylinder{<69.088000,-0.1,7.366000><69.088000,0.135000,7.366000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<73.279000,0,7.366000><73.279000,0.036000,7.366000>0.584200 translate<0,0.000000,0>}
cylinder{<73.279000,-0.1,7.366000><73.279000,0.135000,7.366000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<73.279000,0,11.684000><73.279000,0.036000,11.684000>0.584200 translate<0,0.000000,0>}
cylinder{<73.279000,-0.1,11.684000><73.279000,0.135000,11.684000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<71.120000,0,9.525000><71.120000,0.036000,9.525000>0.660400 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,9.525000><71.120000,0.135000,9.525000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<71.120000,0,9.525000><71.120000,0.036000,9.525000>0.330200 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,9.525000><71.120000,0.135000,9.525000>0.177800 translate<0,0.000000,0>}}
//S2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,24.638000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.882000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,24.892000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.358000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,24.892000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.358000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.580000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,18.542000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<70.358000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,18.288000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.358000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,18.288000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.882000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,24.130000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<68.072000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,24.638000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<73.660000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,24.638000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,18.542000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<68.072000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,18.542000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<68.580000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,18.542000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.660000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.660000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,18.542000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<72.136000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,20.320000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<69.850000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,20.320000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<72.390000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<72.390000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,22.860000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,0.000000,0> translate<69.850000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<69.850000,0.000000,22.860000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,90.000000,0> translate<69.850000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.072000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,20.320000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<68.072000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,20.320000>}
box{<0,0,-0.025400><2.540000,0.036000,0.025400> rotate<0,-90.000000,0> translate<68.326000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.326000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<68.072000,0.000000,22.860000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<68.072000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,20.320000>}
box{<0,0,-0.025400><2.413000,0.036000,0.025400> rotate<0,-90.000000,0> translate<73.914000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.168000,0.000000,22.733000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<73.914000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.914000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.168000,0.000000,20.320000>}
box{<0,0,-0.025400><0.254000,0.036000,0.025400> rotate<0,0.000000,0> translate<73.914000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,23.749000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.168000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,19.431000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,20.320000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,19.431000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.072000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,23.749000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,22.860000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,20.320000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.072000,0.000000,19.431000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.072000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,22.733000>}
box{<0,0,-0.076200><2.413000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,23.749000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.168000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,24.638000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.882000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,24.638000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.882000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.136000,0.000000,18.542000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.882000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.358000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,18.542000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.279000,0.000000,22.860000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.279000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,20.320000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.834000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,19.177000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<69.850000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.628000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.390000,0.000000,19.177000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<71.628000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.501000,0.000000,19.431000>}
box{<0,0,-0.076200><0.924574,0.036000,0.076200> rotate<0,-15.944344,0> translate<70.612000,0.000000,19.177000> }
difference{
cylinder{<71.120000,0,21.590000><71.120000,0.036000,21.590000>1.854200 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,21.590000><71.120000,0.135000,21.590000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<73.279000,0,19.431000><73.279000,0.036000,19.431000>0.584200 translate<0,0.000000,0>}
cylinder{<73.279000,-0.1,19.431000><73.279000,0.135000,19.431000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<73.152000,0,23.749000><73.152000,0.036000,23.749000>0.584200 translate<0,0.000000,0>}
cylinder{<73.152000,-0.1,23.749000><73.152000,0.135000,23.749000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<68.961000,0,23.749000><68.961000,0.036000,23.749000>0.584200 translate<0,0.000000,0>}
cylinder{<68.961000,-0.1,23.749000><68.961000,0.135000,23.749000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<68.961000,0,19.431000><68.961000,0.036000,19.431000>0.584200 translate<0,0.000000,0>}
cylinder{<68.961000,-0.1,19.431000><68.961000,0.135000,19.431000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<71.120000,0,21.590000><71.120000,0.036000,21.590000>0.660400 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,21.590000><71.120000,0.135000,21.590000>0.609600 translate<0,0.000000,0>}}
difference{
cylinder{<71.120000,0,21.590000><71.120000,0.036000,21.590000>0.330200 translate<0,0.000000,0>}
cylinder{<71.120000,-0.1,21.590000><71.120000,0.135000,21.590000>0.177800 translate<0,0.000000,0>}}
//U$1 silk screen
//U$2 silk screen
//USB silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,19.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,19.870000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.327500,0.000000,19.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,19.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,8.070000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<0.327500,0.000000,8.070000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,8.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,8.070000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.327500,0.000000,8.070000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,8.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,19.870000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.077500,0.000000,19.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.457500,0.000000,19.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,19.870000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.327500,0.000000,19.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.392500,0.000000,8.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,8.070000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.392500,0.000000,8.070000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.077500,0.000000,19.870000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.392500,0.000000,19.870000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.392500,0.000000,19.870000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.327500,0.000000,8.070000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.457500,0.000000,8.070000>}
box{<0,0,-0.127000><8.130000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.327500,0.000000,8.070000> }
//X2 silk screen
//Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.828500,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.828500,0.000000,32.639000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,-90.000000,0> translate<24.828500,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<29.400500,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<29.400500,0.000000,32.639000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,-90.000000,0> translate<29.400500,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.336500,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.336500,0.000000,32.639000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.336500,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.892500,0.000000,38.481000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.892500,0.000000,38.481000> }
object{ARC(1.778000,0.152400,180.000000,360.000000,0.036000) translate<27.114500,0.000000,32.639000>}
object{ARC(2.286000,0.406400,180.000000,360.000000,0.036000) translate<27.114500,0.000000,32.639000>}
object{ARC(2.286000,0.406400,0.000000,180.000000,0.036000) translate<27.114500,0.000000,38.481000>}
object{ARC(1.778000,0.152400,0.000000,180.000000,0.036000) translate<27.114500,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,35.306000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.003500,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,35.306000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.225500,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,35.814000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.225500,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,35.814000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.225500,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,34.925000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.114500,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,34.925000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.225500,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.003500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,36.195000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.114500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.225500,0.000000,36.195000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.225500,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.114500,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.114500,0.000000,36.830000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.114500,0.000000,36.830000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  HWPROGUSB(-39.995000,0,-26.187500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
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
