depth = -5000;
mouse_pos_buffer = 32;
held_object = noone;
held_object_diff_x = 0;
held_object_diff_y = 0;

perform_step = function()
{
	x = clamp(mouse_x, mouse_pos_buffer, room_width-mouse_pos_buffer);
	y = clamp(mouse_y, mouse_pos_buffer, room_height - mouse_pos_buffer);
	
	if (mouse_check_button_pressed(mb_left))
	{
		if (held_object == noone)
		{
			// prioritize nextslide button
			var _nextSlide = collision_point(x, y, o_NextSlide, false, false);
			if (_nextSlide != noone)
			{
				click(_nextSlide);
			}
			else {
				var _obj = collision_point(x, y, p_Clickable, false, false);
				if (_obj != noone)
				{
					click(_obj);
				}
			}

		}
		else {
			held_object.on_drop();
			held_object = noone;
		}
	}
	
	if (held_object != noone)
	{
		held_object.x = x - held_object_diff_x;
		held_object.y = y - held_object_diff_y;
	}
}

click = function(_obj)
{
	if (_obj.holdable)
	{
		_obj.on_pickup();
		held_object = _obj;
		held_object_diff_x = x - _obj.x;
		held_object_diff_y = y - _obj.y;
	}
	else {
		_obj.on_click();
	}
}