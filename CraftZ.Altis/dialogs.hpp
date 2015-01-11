#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)




class invMenu
{    

	idd = 4999;
	onLoad="uiNamespace setVariable ['invMenu',_this select 0]";
	movingEnable = false;
	enableSimulation = true;

	class controls
	{

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by RyroNZ, v1.063, #Jeguza)
		////////////////////////////////////////////////////////

		class invMenu_frame: RscPicture
			{
			idc = 6000;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 40.54 * GUI_GRID_W + GUI_GRID_X;
			y = 0.09 * GUI_GRID_H + GUI_GRID_Y;
			w = 22.5 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;
		};
		class InvMenu_icon: RscPicture
		{
			idc = 6001;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 41.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class InvMenu_Text: RscStructuredText
		{
			idc = 6002;
			text = "blah blah blah items"; //--- ToDo: Localize;
			x = 46.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
		};
		class InvMenu_action: RscButtonMenu
		{
			idc = 6003;
			text = "Use"; //--- ToDo: Localize;
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			x = 50.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;

		};
		class InvMenu_cancel: RscButtonMenu
		{
			text = "Cancel";
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			x = 56.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			action = "closeDialog 0"
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};


};