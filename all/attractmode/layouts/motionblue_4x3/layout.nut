////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// 10/11/2016 updated by DGM for the RetroPie Facebook group 
// Updated and enhanced to now include many new features and options
//
// Updated 9/08/2016 by omegaman                                                                      
// Attract-Mode "Robospin" layout. Thanks to verion for cleaning cab skins and to malfacine's for glogos                             
// Notes: Lots of changes...  
////////////////////////////////////////////////////////////////////////////////////////////////////////   

class UserConfig {
</ label="--------  Main theme layout  --------", help="Show or hide additional images", order=1 /> uct1="select below";
   </ label="Select background color", help="Select background color", options="blue,gray,green,orange,red,static_blue,static_gray,static_green,static_orange,static_red", order=2 /> enable_background="blue";
   </ label="Select cabinet  color", help="Select cabinet color", options="blue,gray,green,orange,red", order=3 /> enable_cab="blue";
   </ label="Select listbox, wheel, vert_wheel", help="Select wheel type or listbox", options="vert_wheel", order=4 /> enable_list_type="vert_wheel";
   </ label="Select spinwheel art", help="The artwork to spin", options="marquee,wheel", order=5 /> orbit_art="wheel";
   </ label="Wheel transition time", help="Time in milliseconds for wheel spin.", order=6 /> transition_ms="35";  
</ label=" ", help=" ", options=" ", order=7 /> divider1="";
</ label="--------    Extra images     --------", help="Show or hide additional images", order=8 /> uct2="select below";
   </ label="Enable box art", help="Select box art", options="Yes,No", order=9 /> enable_gboxart="No"; 
   </ label="Enable cartridge art", help="Select cartridge art", options="Yes,No", order=10 /> enable_gcartart="No"; 
</ label=" ", help=" ", options=" ", order=15 /> divider2="";
</ label="--------    Game info box    --------", help="Show or hide game info box", order=11 /> uct5="select below";
   </ label="Enable game information", help="Show game information", options="Yes,No", order=12 /> enable_ginfo="Yes";
   </ label="Enable text frame", help="Show text frame", options="Yes,No", order=13 /> enable_frame="Yes"; 
   </ label="Enable system logo", help="Show system logo", options="Yes,No", order=14 /> enable_logo="Yes"; 
</ label=" ", help=" ", options=" ", order=15 /> divider5="";
</ label="--------    Miscellaneous    --------", help="Miscellaneous options", order=16 /> uct6="select below";
   </ label="Enable random text colors", help=" Select random text colors.", options="Yes,No", order=17 /> enable_colors="Yes";
   </ label="Enable monitor static effect", help="Show static effect when snap is null", options="Yes,No", order=18 /> enable_static="Yes"; 
}  

local my_config = fe.get_config();
local flx = fe.layout.width=640;
local fly = fe.layout.height=480;
local flw = fe.layout.width;
local flh = fe.layout.height;
//fe.layout.font="Roboto";

// modules
fe.load_module("fade");
fe.load_module( "animate" );



// Load background image
if ( my_config["enable_background"] == "blue" )
{
local bgsolid = fe.add_image( "backgrounds/motion_blue.mp4", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "gray" )
{
local bgsolid = fe.add_image( "backgrounds/motion_gray.mp4", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "green" )
{
local bgsolid = fe.add_image( "backgrounds/motion_green.mp4", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "orange" )
{
local bgsolid = fe.add_image( "backgrounds/motion_orange.mp4", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "red" )
{
local bgsolid = fe.add_image( "backgrounds/motion_red.mp4", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "static_blue" )
{
local bgsolid = fe.add_image( "backgrounds/bkg_static_blue.png", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "static_gray" )
{
local bgsolid = fe.add_image( "backgrounds/bkg_static_gray.png", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "static_green" )
{
local bgsolid = fe.add_image( "backgrounds/bkg_static_green.png", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "static_orange" )
{
local bgsolid = fe.add_image( "backgrounds/bkg_static_orange.png", 0, 0, flw, flh );
bgsolid.alpha=255;
}

if ( my_config["enable_background"] == "static_red" )
{
local bgsolid = fe.add_image( "backgrounds/bkg_static_red.png", 0, 0, flw, flh );
bgsolid.alpha=255;
}

// Video Preview or static video if none available
// remember to make both sections the same dimensions and size
if ( my_config["enable_static"] == "Yes" )
{
//adjust the values below for the static preview video snap
   const SNAPBG_ALPHA = 200;
   local snapbg=null;
   snapbg = fe.add_image( "static.mp4", flx*0.265, fly*0.085, flw*0.46, flh*0.56 );
   snapbg.trigger = Transition.EndNavigation;
   snapbg.skew_y = 0;
   snapbg.skew_x = 0;
   snapbg.pinch_y = 0;
   snapbg.pinch_x = 0;
   snapbg.rotation = 0;
   snapbg.set_rgb( 155, 155, 155 );
   snapbg.alpha = SNAPBG_ALPHA;
}
 else
 {
 local temp = fe.add_text("", flx*0.265, fly*0.85, flw*0.46, flh*0.56 );
 temp.bg_alpha = SNAPBG_ALPHA;
 }

//create surface for snap
local surface_snap = fe.add_surface( 640, 480 );
local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
snap.trigger = Transition.EndNavigation;
snap.preserve_aspect_ratio = false;

//now position and pinch surface of snap
//adjust the below values for the game video preview snap
surface_snap.set_pos(flx*0.265, fly*0.09, flw*0.46, flh*0.555);
surface_snap.skew_y = 0;
surface_snap.skew_x = 0;
surface_snap.pinch_y = 0;
surface_snap.pinch_x = 0;
surface_snap.rotation = 0;



// Load cabinet image
if ( my_config["enable_cab"] == "blue" )
{
local cabsolid = fe.add_image( "backgrounds/bkg_blue.png", 0, 0, flw, flh );
cabsolid.alpha=255;
}

if ( my_config["enable_cab"] == "gray" )
{
local cabsolid = fe.add_image( "backgrounds/bkg_gray.png", 0, 0, flw, flh );
cabsolid.alpha=255;
}

if ( my_config["enable_cab"] == "green" )
{
local cabsolid = fe.add_image( "backgrounds/bkg_green.png", 0, 0, flw, flh );
cabsolid.alpha=255;
}

if ( my_config["enable_cab"] == "orange" )
{
local cabsolid = fe.add_image( "backgrounds/bkg_orange.png", 0, 0, flw, flh );
cabsolid.alpha=255;
}

if ( my_config["enable_cab"] == "red" )
{
local cabsolid = fe.add_image( "backgrounds/bkg_red.png", 0, 0, flw, flh );
cabsolid.alpha=255;
}

// Show the system logo wheel at the top of the screen
if ( my_config["enable_logo"] == "Yes" )
{
local logo = fe.add_image("/home/pi/.attract/menu-art/wheel/[DisplayName]", flx*0.43, fly*0.001 flw*0.15, flh*0.1 );
}

// Box art to dipslay, uses the emulator.cfg path for boxart image location
if ( my_config["enable_gboxart"] == "Yes" )
::OBJECTS <- {
 boxart = fe.add_artwork("boxart", flx*-2, fly*0.38, flw*0.2, flh*0.35 ),
}

//Animation for Global & Expert Mode
local move_transition1 = {
  when = Transition.ToNewSelection ,property = "x", start = flx*-2, end = flx*0.005, time = 1500, tween = Tween.Back
}
 
if ( my_config["enable_gboxart"] == "Yes" )
{
//Animation
animation.add( PropertyAnimation( OBJECTS.boxart, move_transition1 ) );
}

// Cartridge art to display, uses the emulator.cfg path for cartart for cartridge image location
if ( my_config["enable_gcartart"] == "Yes" )
::OBJECTS <- {
 cartart = fe.add_artwork("cartart", flx*2, fly*0.52, flw*0.15, flh*0.2 ),
}

//Animation for Global & Expert Mode
local move_transition1 = {
  when = Transition.ToNewSelection ,property = "x", start = flx*2, end = flx*0.12, time = 1500, tween = Tween.Back
}

if ( my_config["enable_gcartart"] == "Yes" )
{
//Animation
animation.add( PropertyAnimation( OBJECTS.cartart, move_transition1 ) );
}

// The following section sets up what type and wheel and displays the users choice

//vertical wheel with three wheels shown horizontal
if ( my_config["enable_list_type"] == "vert_wheel" )
{
fe.load_module( "conveyor" );
local wheel_x = [ -flx*0.45, -flx*0.3, -flx*0.2, -flx*0.04, flx*0.12 flx*0.28, flx*0.44, flx*0.6, flx*0.76 flx*0.92, flx*1.08, flx*1.24 ];
local wheel_y = [ fly*0.78, fly*0.78, fly*0.78, fly*0.78, fly*0.78, fly*0.78, fly*0.76, fly*0.78, fly*0.78, fly*0.78, fly*0.78, fly*0.78, ]; 
local wheel_w = [ flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, flw*0.13, ];
local wheel_a = [  80,  80,  80,  80,  80,  80, 255,  80,  80,  80,  80,  80, ];
local wheel_h = [  flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122, flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122,  flh*0.122, ];
local wheel_r = [  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ];
local num_arts = 12;

class WheelEntry extends ConveyorSlot
{
	constructor()
	{
		base.constructor( ::fe.add_artwork( my_config["orbit_art"] ) );
	}

	function on_progress( progress, var )
	{
		local p = progress / 0.1;
		local slot = p.tointeger();
		p -= slot;
		
		slot++;

		if ( slot < 0 ) slot=0;
		if ( slot >=10 ) slot=10;

		m_obj.x = wheel_x[slot] + p * ( wheel_x[slot+1] - wheel_x[slot] );
		m_obj.y = wheel_y[slot] + p * ( wheel_y[slot+1] - wheel_y[slot] );
		m_obj.width = wheel_w[slot] + p * ( wheel_w[slot+1] - wheel_w[slot] );
		m_obj.height = wheel_h[slot] + p * ( wheel_h[slot+1] - wheel_h[slot] );
		m_obj.rotation = wheel_r[slot] + p * ( wheel_r[slot+1] - wheel_r[slot] );
		m_obj.alpha = wheel_a[slot] + p * ( wheel_a[slot+1] - wheel_a[slot] );
	}
};

local wheel_entries = [];
for ( local i=0; i<num_arts/2; i++ )
	wheel_entries.push( WheelEntry() );

local remaining = num_arts - wheel_entries.len();

// we do it this way so that the last wheelentry created is the middle one showing the current
// selection (putting it at the top of the draw order)
for ( local i=0; i<remaining; i++ )
	wheel_entries.insert( num_arts/2, WheelEntry() );

local conveyor = Conveyor();
conveyor.set_slots( wheel_entries );
conveyor.transition_ms = 50;
try { conveyor.transition_ms = my_config["transition_ms"].tointeger(); } catch ( e ) { }
}


// Game information to show inside text box frame
if ( my_config["enable_ginfo"] == "Yes" )
{

//add frame to make text standout 
if ( my_config["enable_frame"] == "Yes" )
{
local frame = fe.add_image( "frame.png", 0, fly*0.94, flw, flh*0.06 );
frame.alpha = 255;
}

//Year text info
local texty = fe.add_text("[Year]", flx*0.18, fly*0.937, flw*0.13, flh*0.055 );
texty.set_rgb( 255, 255, 255 );
//texty.style = Style.Bold;
//texty.align = Align.Left;

//Title text info
local textt = fe.add_text( "[Title]", flx*0.315, fly*0.955, flw*0.6, flh*0.025  );
textt.set_rgb( 225, 255, 255 );
//textt.style = Style.Bold;
textt.align = Align.Left;
textt.rotation = 0;
textt.word_wrap = true;

//Emulator text info
local textemu = fe.add_text( "[Emulator]", flx*0.715, fly*0.955, flw*0.6, flh*0.025  );
textemu.set_rgb( 225, 255, 255 );
//textemu.style = Style.Bold;
textemu.align = Align.Left;
textemu.rotation = 0;
textemu.word_wrap = true;

//display filter info
local filter = fe.add_text( "[ListFilterName]: [ListEntry]-[ListSize]  [PlayedCount]", flx*0.7, fly*0.962, flw*0.3, flh*0.02 );
filter.set_rgb( 255, 255, 255 );
//filter.style = Style.Italic;
filter.align = Align.Right;
filter.rotation = 0;

//category icons 

local glogo1 = fe.add_image("glogos/unknown1.png", flx*0.12, fly*0.945, flw*0.045, flh*0.05);
glogo1.trigger = Transition.EndNavigation;

class GenreImage1
{
    mode = 1;       //0 = first match, 1 = last match, 2 = random
    supported = {
        //filename : [ match1, match2 ]
        "action": [ "action" ],
        "adventure": [ "adventure" ],
        "fighting": [ "fighting", "fighter", "beat'em up" ],
        "platformer": [ "platformer", "platform" ],
        "puzzle": [ "puzzle" ],
        "maze": [ "maze" ],
		"paddle": [ "paddle" ],
		"rhythm": [ "rhythm" ],
		"pinball": [ "pinball" ],
		"racing": [ "racing", "driving" ],
        "rpg": [ "rpg", "role playing", "role-playing" ],
        "shooter": [ "shooter", "shmup" ],
        "sports": [ "sports", "boxing", "golf", "baseball", "football", "soccer" ],
        "strategy": [ "strategy"]
    }

    ref = null;
    constructor( image )
    {
        ref = image;
        fe.add_transition_callback( this, "transition" );
    }
    
    function transition( ttype, var, ttime )
    {
        if ( ttype == Transition.ToNewSelection || ttype == Transition.ToNewList )
        {
            local cat = " " + fe.game_info(Info.Category, var).tolower();
            local matches = [];
            foreach( key, val in supported )
            {
                foreach( nickname in val )
                {
                    if ( cat.find(nickname, 0) ) matches.push(key);
                }
            }
            if ( matches.len() > 0 )
            {
                switch( mode )
                {
                    case 0:
                        ref.file_name = "glogos/" + matches[0] + "1.png";
                        break;
                    case 1:
                        ref.file_name = "glogos/" + matches[matches.len() - 1] + "1.png";
                        break;
                    case 2:
                        local random_num = floor(((rand() % 1000 ) / 1000.0) * ((matches.len() - 1) - (0 - 1)) + 0);
                        ref.file_name = "glogos/" + matches[random_num] + "1.png";
                        break;
                }
            } else
            {
                ref.file_name = "glogos/unknown1.png";
            }
        }
    }
}
GenreImage1(glogo1);


// random number for the RGB levels
if ( my_config["enable_colors"] == "Yes" )
{
function brightrand() {
 return 255-(rand()/255);
}

local red = brightrand();
local green = brightrand();
local blue = brightrand();

// Color Transitions
fe.add_transition_callback( "color_transitions" );
function color_transitions( ttype, var, ttime ) {
 switch ( ttype )
 {
  case Transition.StartLayout:
  case Transition.ToNewSelection:
  red = brightrand();
  green = brightrand();
  blue = brightrand();
  //listbox.set_rgb(red,green,blue);
  texty.set_rgb (red,green,blue);
  textt.set_rgb (red,green,blue);
  break;
 }
 return false;
 }
}}


