event_inherited();

depth = -2000;
initialized = false;
locked = false;
clicked = false;
delay_before_active = 15;
time_after_click = 0;
time_after_click_max = 15;

on_click = function()
{
	if (!locked && !clicked && delay_before_active == 0)
	{
		stretch();
		audio_play_sound(choose(sfx_Back1, sfx_Back2), 100, false, 1, 0, choose(0.9,1,1.1));
		clicked = true;
		time_after_click = time_after_click_max;
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

perform_step = function()
{
	if (!initialized)
	{
		initialized = true;
		o_GameManager.check_for_slide_completion();
	}
	if (delay_before_active > 0)
	{
		delay_before_active--;
	}
	
	if (clicked)
	{
		if (time_after_click > 0)
		{
			time_after_click--;
		}
		else {
			room_goto(RoomLost);
		}
	}
	
	scale_step_elastic(scale_struct);
}