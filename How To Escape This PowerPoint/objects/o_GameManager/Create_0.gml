global.hasBird = false;
global.hasHamster = false;

unlock_slide = function()
{
	var _next = instance_find(o_NextSlideLocked, 0);
	_next.unlock();
}

lock_slide = function()
{
	var _next = instance_find(o_NextSlideLocked, 0);
	_next.lock();
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
	}
}

//room_goto(Room9);