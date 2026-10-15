/*
// Sine Wave Variables
	output = Output value
	progress =  Progress from 0 to 2pi
	amplitude = Intensity of wave
	wave_length = Time between a full wave (both up and down crests = 2 pi)
	
// Example
	output = amplitude * sin(progress);
	progress += (2pi / wave_length);
	if (progress >= (2*pi)) progress = 0;
*/

/// @function		sine_wave_create()
/// @description	Creates sine wave variables in a struct
/// @param			_amp
/// @param			_length
/// @param {bool}	_randstart
function sine_wave_create(_amp, _length, _randstart = false, _start = 0) {
	var prog;
	if (_randstart) _prog = irandom(2*pi);
	else _prog = _start;
	
	var _struct =
	{
		output : 0,
		progress_start : _start,
		progress : _prog,
		amplitude : _amp,
		wave_length : _length
	}
	with (_struct) {ouput = amplitude * sin(progress);}
	
	return _struct;
}

/// @function		sine_wave_step()
/// @description	Progresses a sine wave
/// @param			_struct
function sine_wave_step(_struct) {
	with (_struct)
	{
		output = amplitude * sin(progress);
		progress += (2*pi / wave_length);
		if (progress >= (2*pi)) progress -= (2*pi);
	}
}

/// @function		sine_wave_set()
/// @description	Manually sets progress of a sine wave and optional direction
/// @param			_struct
/// @param			_start
/// @param {real}	_dir
function sine_wave_set(_struct, _start, _dir = 1) {
	with (_struct)
	{
		progress = _start;
		if (_dir == -1) progress += pi;
	}
}

/// @function		sine_wave_reset()
/// @description	Resets a sine wave struct
/// @param			_struct
function sine_wave_reset(_struct) {
	with (_struct)
	{
		progress = progress_start;
		output = 0;
	}
}