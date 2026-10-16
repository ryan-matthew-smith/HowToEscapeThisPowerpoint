event_inherited();

depth = -2000;
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
			if (next_room == noone) 
			{
				room_goto_previous();
			}
			else {
				room_goto(next_room);
			}
		}
	}
	
	scale_step_elastic(scale_struct);
}

if (room == Room7 && global.hasBird) instance_destroy();