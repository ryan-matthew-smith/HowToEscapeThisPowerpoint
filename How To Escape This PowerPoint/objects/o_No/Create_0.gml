event_inherited();

depth = -2000;
initialized = false;



on_click = function()
{
	stretch();
	if (global.hasHamster == true)
	{
		audio_play_sound(sfx_Sad, 100, false);
		global.hasHamster = false;
	}
}