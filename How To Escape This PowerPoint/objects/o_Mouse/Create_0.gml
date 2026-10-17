// Inherit the parent event
event_inherited();
depth = -1000;

collided = false;
gotCheese = false;

on_pickup_extra = function()
{
	audio_play_sound(choose(sfx_Mouse1, sfx_Mouse2), 100, false, 1, 0, choose(0.9,1,1.1));
}

perform_step_extra = function()
{
	if (place_meeting(x, y, o_Wall))
	{
		if (!collided && !gotCheese)
		{
			collided = true;
			o_GameManager.check_for_slide_completion();
		}
	}
	else if (place_meeting(x, y, o_Cheese))
	{
		if (!gotCheese && !collided)
		{
			gotCheese = true;	
			o_GameManager.check_for_slide_completion();
		}
	}
}

on_drop_extra = function()
{
	audio_play_sound(choose(sfx_Mouse1, sfx_Mouse2), 100, false, 1, 0, choose(0.9,1,1.1));
}
