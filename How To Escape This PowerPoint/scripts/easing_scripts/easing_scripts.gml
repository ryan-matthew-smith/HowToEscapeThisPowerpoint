function ease_linear(_timeCurrent,_valueStart,_valueEnd,_timeMax){
	#region
	return (_valueEnd - _valueStart) * (_timeCurrent / _timeMax) + _valueStart;
	#endregion
}

function ease_out_back(_timeCurrent,_valueStart,_valueEnd,_timeMax){
	#region 
	var _s = 1.70158; // constant

	_timeCurrent = _timeCurrent/_timeMax - 1;
	return (_valueEnd - _valueStart) * (_timeCurrent * _timeCurrent * ((_s + 1) * _timeCurrent + _s) + 1) + _valueStart;
	#endregion
}

function ease_out_elastic(_timeCurrent,_valueStart,_valueEnd,_timeMax){
	#region
	var _c = (_valueEnd - _valueStart);
	var _s = 1.70158;
	var _p = 0;
	var _a = _c;

	if (_timeCurrent == 0 || _a == 0)
	{
	    return _valueStart;
	}

	_timeCurrent /= _timeMax;

	if (_timeCurrent == 1)
	{
	    return _valueStart + _c;
	}

	if (_p == 0)
	{
	    _p = _timeMax * 0.3;
	}

	if (_a < abs(_c)) 
	{ 
	    _a = _c;
	    _s = _p * 0.25; 
	}
	else 
	{
	    _s = _p / (2 * pi) * arcsin (_c / _a);
	}

	return _a * power(2, -10 * _timeCurrent) * sin((_timeCurrent * _timeMax - _s) * (2 * pi) / _p ) + _c + _valueStart;
	#endregion
}

function ease_out_bounce(_timeCurrent,_valueStart,_valueEnd,_timeMax){
	#region
	var _c = (_valueEnd - _valueStart)
	_timeCurrent /= _timeMax;

	if (_timeCurrent < 1/2.75)
	{
	    return _c * 7.5625 * _timeCurrent * _timeCurrent + _valueStart;
	}
	else
	if (_timeCurrent < 2/2.75)
	{
	    _timeCurrent -= 1.5/2.75;
	    return _c * (7.5625 * _timeCurrent * _timeCurrent + 0.75) + _valueStart;
	}
	else
	if (_timeCurrent < 2.5/2.75)
	{
	    _timeCurrent -= 2.25/2.75;
	    return _c * (7.5625 * _timeCurrent * _timeCurrent + 0.9375) + _valueStart;
	}
	else
	{
	    _timeCurrent -= 2.625/2.75;
	    return _c * (7.5625 * _timeCurrent * _timeCurrent + 0.984375) + _valueStart;
	}
	#endregion
}

function ease_out_cubic(_timeCurrent,_valueStart,_valueEnd,_timeMax){
	return (_valueEnd - _valueStart) * (power((_timeCurrent/_timeMax) - 1, 3) + 1) + _valueStart;
}

function ease_out_sine(_timeCurrent,_valueStart, _valueEnd,_timeMax){
	return (_valueEnd - _valueStart) * sin((_timeCurrent/_timeMax) * (pi / 2)) + _valueStart;
}

function ease_in_out_sine(_timeCurrent,_valueStart, _valueEnd,_timeMax){
	return (_valueEnd - _valueStart) * 0.5 * (1 - cos(pi * (_timeCurrent/_timeMax))) + _valueStart;
}