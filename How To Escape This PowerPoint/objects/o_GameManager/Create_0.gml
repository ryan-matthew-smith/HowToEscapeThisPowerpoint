global.hasBird = false;


check_for_slide_completion = function()
{
	switch(room)
	{
		case Room6:
			var _next = instance_find(o_NextSlideLocked, 0);
			var _2 = instance_find(o_2, 0);
			var _can = instance_find(o_Can, 0);
			var _col = instance_find(o_CollisionC, 0);
			var _blocked = collision_rectangle(_col.bbox_left, _col.bbox_top, _col.bbox_right, _col.bbox_bottom, p_Holdable, false, false);
			if (_can.in_place && !_blocked)
			{
				_next.unlock();
				if (_2.in_place)
				{
					global.hasBird = true;
				}
			}
			else 
			{
				_next.lock();
			}
		break;
	}
}

room_goto(Room6);