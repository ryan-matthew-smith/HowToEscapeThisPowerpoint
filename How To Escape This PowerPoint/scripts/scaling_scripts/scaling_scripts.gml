/// @func	scale_create()
/// @desc	Creates a set of variables to control scaling values for drawing and returns them in a struct.
/// @param {real}	_duration
function scale_create(_duration = 60) {
#region
	var _struct = 
	{
		scale_scalex : 1,
		scale_scaley : 1,
		scale_scalex_start : 1,
		scale_scaley_start : 1,
		scale_scalex_goal : 1,
		scale_scaley_goal : 1,
		scale_time : 0,
		scale_duration : _duration
	}
	return _struct;
#endregion
}

/// @func	scale_set_duration()
/// @desc	Sets the duration of the supplied scale struct.
/// @param	_struct
/// @param	_duration
function scale_set_duration(_struct, _duration) {
	_struct.scale_duration = _duration;	
}

/// @func	scale_step_elastic()
/// @desc	Progresses the scale variables of the supplied struct back towards the defaults. Use this function to return the
///			sprite to normal after using scale_apply()
/// @param	_struct
function scale_step_elastic(_struct) {
#region
	with (_struct)
	{
		if (scale_time < scale_duration)
		{
			scale_scalex = ease_out_elastic(scale_time,scale_scalex_start,scale_scalex_goal,scale_duration);
			scale_scaley = ease_out_elastic(scale_time,scale_scaley_start,scale_scaley_goal,scale_duration);
			scale_time += 1;
		}
	}
#endregion
}

/// @func	scale_step_sine()
/// @desc	Progresses the scale variables of the supplied struct back towards the defaults. Use this function to return the
///			sprite to normal after using scale_apply()
/// @param	_struct
function scale_step_sine(_struct) {
#region
	with (_struct)
	{
		if (scale_time < scale_duration)
		{
			scale_scalex = ease_out_sine(scale_time,scale_scalex_start,scale_scalex_goal,scale_duration);
			scale_scaley = ease_out_sine(scale_time,scale_scaley_start,scale_scaley_goal,scale_duration);
			scale_time += 1;
		}
	}
#endregion
}

/// @func	scale_step_cubic()
/// @desc	Progresses the scale variables of the supplied struct back towards the defaults. Use this function to return the
///			sprite to normal after using scale_apply()
/// @param	_struct
function scale_step_cubic(_struct) {
#region
	with (_struct)
	{
		if (scale_time < scale_duration)
		{
			scale_scalex = ease_out_cubic(scale_time,scale_scalex_start,scale_scalex_goal,scale_duration);
			scale_scaley = ease_out_cubic(scale_time,scale_scaley_start,scale_scaley_goal,scale_duration);
			scale_time += 1;
		}
	}
#endregion
}

/// @func	scale_draw()
/// @desc	Draws the default sprites for an object using the scale variables in the provided struct.
/// @param	_struct
/// @param	_x
/// @param	_y
function scale_draw(_struct, _x, _y) {
#region
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale*_struct.scale_scalex,image_yscale*_struct.scale_scaley,
	image_angle,image_blend,image_alpha);
#endregion
}

/// @func	scale_draw_ext()
/// @desc	Draws the designated sprites for an object using the scale variables in the provided struct.
/// @param	_struct
/// @param	_sprite_index
/// @param	_image_index
/// @param	_x
/// @param	_y
/// @param	_image_xscale
/// @param	_image_yscale
/// @param	_image_angle
/// @param	_image_blend
/// @param	_image_alpha
function scale_draw_ext(_struct, _sprite_index, _image_index, _x, _y, _image_xscale, _image_yscale, _image_angle, _image_blend, _image_alpha) {
#region
	draw_sprite_ext(_sprite_index,_image_index,_x,_y,_image_xscale*_struct.scale_scalex,_image_yscale*_struct.scale_scaley,
	_image_angle,_image_blend,_image_alpha);
#endregion
}

/// @func	scale_apply()
/// @desc	Applies the scaling values to a scale struct.
/// @param	_struct
/// @param	_scale_x
/// @param	_scale_y
function scale_apply(_struct, _scale_x, _scale_y) {
#region
	with (_struct)
	{
		scale_time = 0;
		scale_scalex = _scale_x;
		scale_scaley = _scale_y;
		scale_scalex_start = scale_scalex;
		scale_scaley_start = scale_scaley;
	}
#endregion
}

/// @func	scale_set_goal
/// @desc	Applies the goal scaling values to a scale struct.
/// @param	_struct
/// @param	_scale_x
/// @param	_scale_y
function scale_set_goal(_struct, _scale_x, _scale_y) {
#region
	with (_struct)
	{
		scale_time = 0;
		scale_scalex_goal = _scale_x;
		scale_scaley_goal = _scale_y;
	}
#endregion
}
