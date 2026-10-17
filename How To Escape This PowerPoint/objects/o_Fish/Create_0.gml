// Inherit the parent event
event_inherited();
on_drop_extra = function()
{
	audio_play_sound(choose(sfx_Splash1, sfx_Splash2), 100, false);
}
