// Inherit the parent event
event_inherited();

on_drop = function()
{	
	var _next = instance_find(o_NextSlideLockedTextOnly, 0);
	if (_next != noone)
	{
		var _colType = rectangle_in_rectangle(_next.bbox_left, _next.bbox_top, _next.bbox_right, _next.bbox_bottom, bbox_left, bbox_top, bbox_right, bbox_bottom);
		if (_colType == 1)
		{
			_next.unlock();
		}
	}
}
