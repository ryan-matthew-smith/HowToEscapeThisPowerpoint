move_speed_x = 0;
move_speed_y = 0;
move_speed_max = 8;
move_direction = 0;
move_dir_update_max = 15;
move_dir_update = irandom_range(0,move_dir_update_max);
move_accel = 0.05;


dance_timer_max = 20;
dance_timer = dance_timer_max;
dance_progress = 0;
dance_progress_max = 6;

perform_step = function()
{
	if (global.hasHamster)
	{	

		move_direction = point_direction(x, y, mouse_x, mouse_y);

		
		var _moveXLen = 0;
		var _moveYLen = 0;
		var _dist = point_distance(x, y, mouse_x, mouse_y);
		if (_dist > 300)
		{
			_moveXLen = lengthdir_x(move_speed_max, move_direction);
			_moveYLen = lengthdir_y(move_speed_max, move_direction);
		}
		move_speed_x = lerp(move_speed_x, _moveXLen, move_accel);
		move_speed_y = lerp(move_speed_y, _moveYLen, move_accel);

		if (!place_meeting(x + move_speed_x, y, o_Hamster))
		{
			x += move_speed_x;
		}
		else {
			while (!place_meeting(x + sign(move_speed_x), y, o_Hamster))
			{
				x += sign(move_speed_x);
			}
			move_speed_x = -move_speed_x/2;
		}
		if (!place_meeting(x, y + move_speed_y, o_Hamster))
		{
			y += move_speed_y;
		}
		else {
			while (!place_meeting(x, y + sign(move_speed_y), o_Hamster))
			{
				y += sign(move_speed_y);
			}
			move_speed_y = -move_speed_y/2;
		}


		
		perform_dance_sequence();
	}
	if (room == Room17T)
	{
		instance_destroy();
	}
}

perform_dance_sequence = function()
{
	if (dance_timer > 0)
	{
		dance_timer--;
	}
	else {
		dance_progress++;
		if (dance_progress > dance_progress_max)
		{
			dance_progress = 0;
		}
		dance_timer = dance_timer_max;
		
		switch(dance_progress)
		{
			case 0:
				sprite_index = s_HamsterIdle;
			break;
			case 1:
				sprite_index = s_HamsterLeft;
			break;
			case 2:
				sprite_index = s_HamsterRight;
			break;
			case 3:
				sprite_index = s_HamsterLeft;
			break;
			case 4:
				sprite_index = s_HamsterDown;
			break;
			case 5:
				sprite_index = s_HamsterUp;
			break;
			case 6:
				sprite_index = s_HamsterDown;
			break;
		}
	}
}