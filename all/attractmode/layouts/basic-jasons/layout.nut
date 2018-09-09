//
// Attract-Mode Front-End - "Basic" sample layout
//
class UserConfig {^M
   </ label="Select background art", help="Choice of blue, retro , den or flyer for background", options="blue,retro,den1,den2,den3,den4,flyer", order=1 /> enable_bg="blue";   ^M
   </ label="Select cab skin", help="Select a cab skin image", options="robo,moon", order=2 /> enable_cab="robo";^M
   </ label="Select spinwheel art", help="The artwork to spin", options="marquee, wheel", order=3 /> orbit_art="wheel";^M
   </ label="Transition Time", help="Time in milliseconds for wheel spin.", order=4 /> transition_ms="35";  ^M
   </ label="Select listbox, wheel, vert_wheel", help="Select wheel art type", options="listbox, wheel, vert_wheel", order=5 /> enable_list_type="wheel";^M
   </ label="Enable snap bloom shader effect", help="Bloom effect uses shader", options="Yes,No", order=6 /> enable_bloom="No";^M
   </ label="Enable crt shader effect", help="CRT effect uses shader)", options="Yes,No", order=7 /> enable_crt="No";^M
   </ label="Enable random Text Colors", help=" Select random text colors.", options="yes,no", order=8 /> enable_colors="yes";^M
   </ label="Enable system logos", help="Select system logos", options="Yes,No", order=9 /> enable_slogos="Yes"; ^M
   </ label="Enable MFR game logos", help="Select game logos", options="Yes,No", order=10 /> enable_mlogos="Yes"; ^M
   </ label="Enable game marquees", help="Show game marquees", options="Yes,No", order=11 /> enable_marquee="Yes";^M
   </ label="Enable lighted marquee effect", help="show lighted Marquee", options="Yes,No", order=12 /> enable_Lmarquee="No";^M
   </ label="Select pointer", help="Select animated pointer", options="rocket,hand,none", order=13 /> enable_pointer="rocket"; ^M
   </ label="Enable text frame", help="Show text frame", options="yes,no", order=14 /> enable_frame="yes"; ^M
   </ label="Enble background Scanline", help="Show scanline effect", options="light,medium,dark", order=15 /> enable_scanline="light";^M
   </ label="Monitor static effect", help="Show static effect when snap is null", options="yes,no", order=16 /> enable_static="yes"; ^M
}  
fe.layout.width=640;
fe.layout.height=480;

local t = fe.add_artwork( "snap", 348, 152, 262, 262 );
t.trigger = Transition.EndNavigation;

t = fe.add_artwork( "marquee", 348, 64, 262, 72 );
t.trigger = Transition.EndNavigation;

local lb = fe.add_listbox( 32, 64, 262, 352 );
lb.charsize = 16;
lb.set_selbg_rgb( 255, 255, 255 );
lb.set_sel_rgb( 0, 0, 0 );
lb.sel_style = Style.Bold;

fe.add_image( "bg.png", 0, 0 );

local l = fe.add_text( "[DisplayName]", 0, 15, 640, 30 );
l.set_rgb( 200, 200, 70 );
l.style = Style.Bold;

// The following function tells the frontend to use our title
// text and listbox (created above) for any menus (exit menu,
// etc...
//
fe.overlay.set_custom_controls( l, lb );

// Left side:

l = fe.add_text( "[Title]", 30, 424, 320, 16 );
l.set_rgb( 200, 200, 70 );
l.align = Align.Left;

l = fe.add_text( "[Year] [Manufacturer]", 30, 441, 320, 16 );
l.set_rgb( 200, 200, 70 );
l.align = Align.Left;

l = fe.add_text( "[Category]", 30, 458, 320, 16 );
l.set_rgb( 200, 200, 70 );
l.align = Align.Left;

// Right side:

l = fe.add_text( "[ListEntry]/[ListSize]", 320, 424, 290, 16 );
l.set_rgb( 200, 200, 70 );
l.align = Align.Right;

l = fe.add_text( "[FilterName]", 320, 441, 290, 16 );
l.set_rgb( 200, 200, 70 );
l.align = Align.Right;
