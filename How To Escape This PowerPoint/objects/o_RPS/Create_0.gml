event_inherited();

depth = -2000;
initialized = false;
locked = true;
clicked = false;
time_after_click = 0;
time_after_click_max = 15;
my_throw = RPS.ROCK;

on_click = function()
{
	if (!locked)
	{
		stretch();
		audio_play_sound(choose(sfx_Pop1, sfx_Pop2, sfx_Pop3), 100, false, 1, 0, choose(0.9,1,1.1));
		time_after_click = time_after_click_max;
		o_GameManager.send_throw(my_throw);
	}
}

unlock = function()
{
	locked = false;
}

lock = function()
{
	locked = true;
}