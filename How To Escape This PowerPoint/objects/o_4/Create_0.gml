// Inherit the parent event
event_inherited();
on_drop_extra = function()
{
	audio_play_sound(choose(sfx_Pop1, sfx_Pop2, sfx_Pop3), 100, false, 1, 0, choose(0.9,1,1.1));
}