// Inherit the parent event
event_inherited();

on_drop = function()
{	
	var _text = instance_find(o_Collision, 0);
	if (_text != noone)
	{
		var _colType = rectangle_in_rectangle(_text.bbox_left, _text.bbox_top, _text.bbox_right, _text.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom);
		if (_colType == 1)
		{
			var _next = instance_find(o_NextSlideLocked, 0);
			if (_next != noone)
			{
				_next.unlock();
			}
		}
	}
}
