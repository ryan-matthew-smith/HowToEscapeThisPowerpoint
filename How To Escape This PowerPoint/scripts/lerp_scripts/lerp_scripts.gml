/// @function		lerp_create()
/// @description	Creates linear interpolation variables in a struct
/// @param			_start	The starting value.
/// @param			_target	The target ending value.
/// @param			_incr	The amount incremented each step. Range of 0 to 1.
/// @param {real}	_prog	The starting progress of the interpolate. Range of 0 to 1.
function lerp_create(_start,_target,_incr,_prog = 0){
	var _struct =
	{
		lerp_value : _start, // current value
		lerp_start : _start,
		lerp_target : _target,
		lerp_incr : _incr, // amount to increment by. Range of 0 - 1.
		lerp_prog : _prog
	}
	return _struct;
}

/// @function		lerp_change()
/// @description	Changes lerp variables in a struct
/// @param			_struct	The linear interpolation struct to change.
/// @param			_start
/// @param			_target
/// @param			_incr
/// @param {real}	_prog
function lerp_change(_struct,_start = _struct.lerp_start,_target = _struct.lerp_target,_incr = _struct.lerp_incr,_prog = 0){
	with (_struct)
	{
		lerp_value = _start;
		lerp_start = _start;
		lerp_target = _target;
		lerp_incr = _incr;
		lerp_prog = _prog;
	}
}

/// @function		lerp_step()
/// @description	Progresses a lerp struct
/// @param			_struct
function lerp_step(_struct,_incr = _struct.lerp_incr){
	with (_struct)
	{
		if (lerp_value != lerp_target)
		{
			lerp_prog = clamp(lerp_prog + lerp_incr,0,1);
			lerp_value = lerp_start + ((lerp_target - lerp_start) * lerp_prog);
		}
	}
}

/// @function		lerp_is_complete()
///	@description	Returns true if a lerp value is at target.
/// @param			_struct
function lerp_is_complete(_struct){
	with (_struct)
	{
		if (lerp_value == lerp_target) return true;
	}
}
