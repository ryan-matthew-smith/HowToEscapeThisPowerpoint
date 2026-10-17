event_inherited();

depth = -2000;
initialized = false;



on_click = function()
{
	stretch();
	if (global.hasHamster == false)
	{
		audio_play_sound(sfx_Happy, 100, false);
		global.hasHamster = true;
	}
}