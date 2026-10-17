// Inherit the parent event
event_inherited();
depth = -1000;
first_pickup = true;
on_pickup_extra = function()
{
	if (first_pickup)
	{
		first_pickup = false;
		audio_play_sound(sfx_Ooh, 100, false);
	}
}

on_drop_extra = function()
{
	audio_play_sound(sfx_Bounce, 100, false);
}