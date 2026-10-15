global.hasBird = false;


check_for_slide_completion = function()
{
	switch(room)
	{
		case Room6:
			var _2 = instance_find(o_2, 0);
			var _can = instance_find(o_Can, 0);
			if (_2 != noone && _can != noone)
			{
				if (_2.in_place && _can.in_place)
				{
					global.hasBird = true;
				}
			}
		break;
	}
}

room_goto(Room0);