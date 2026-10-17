global.hasBird = false;
global.hasHamster = false;

unlock_slide = function()
{
	var _next = instance_find(o_NextSlideLocked, 0);
	if (_next.locked == true)
	{
		audio_play_sound(sfx_Win,100,false);
		_next.unlock();
	}
}

lock_slide = function()
{
	var _next = instance_find(o_NextSlideLocked, 0);
	_next.lock();
}

unlock_prev_slide = function()
{
	var _prev = instance_find(o_PrevSlideLocked, 0);
	if (_prev.locked = true)
	{
		audio_play_sound(sfx_Sad, 100, false);
		_prev.unlock();
	}
}

unlock_retry_slide = function()
{
	var _retry = instance_find(o_RetryLocked, 0);
	if (_retry.locked)
	{
		audio_play_sound(sfx_Sad, 100, false);
		_retry.unlock();
	}
}

check_for_slide_completion = function()
{
	switch(room)
	{
		case Room6:
			var _2 = instance_find(o_2, 0);
			var _can = instance_find(o_Can, 0);
			var _col = instance_find(o_CollisionC, 0);
			if (_2 != noone && _can != noone && _col != noone)
			{
				var _blocked = collision_rectangle(_col.bbox_left, _col.bbox_top, _col.bbox_right, _col.bbox_bottom, p_Holdable, false, false);
				if (_can.in_place && !_blocked)
				{
					unlock_slide();
					if (_2.in_place)
					{
						global.hasBird = true;
						audio_play_sound(sfx_Bird, 100, false);
					}
				}
				else 
				{
					lock_slide();
				}
				}
		break;
		
		case Room7:
			if (global.hasBird)
			{
				unlock_slide();
			}
		break;
		
		case Room19:
		case Room20:
		case Room21:
			var _mouse = instance_find(o_Mouse, 0);
			if (_mouse != noone)
			{
				if (_mouse.collided && !_mouse.gotCheese)
				{
					unlock_retry_slide();
					var _cheese = instance_find(o_Cheese, 0);
					if (_cheese != noone)
					{
						if (o_Cursor.held_object == _cheese)
						{
							o_Cursor.held_object = noone;
						}
						instance_destroy(_cheese);
					}
				}
				else if (_mouse.gotCheese && !_mouse.collided)
				{
					_mouse.sprite_index = s_MouseWin;
					var _cheese = instance_find(o_Cheese, 0);
					if (_cheese != noone)
					{
						if (o_Cursor.held_object == _cheese)
						{
							o_Cursor.held_object = noone;
						}
						instance_destroy(_cheese);
					}
					unlock_slide();
				}
			}
		break;
	}
}

//room_goto(Room19);