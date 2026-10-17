randomize();
global.hasBird = false;
global.hasHamster = false;
wizard_win_streak = 0;
wizard_win_max = 5;

rps_eval_time_max = 90;
rps_eval_time = 0;
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

display_RPS = function()
{
	var _rock = instance_find(o_Rock, 0);
	var _paper = instance_find(o_Paper, 0);
	var _scissors = instance_find(o_Scissors,0);
	_rock.unlock();
	_paper.unlock();
	_scissors.unlock();
}

hide_RPS = function()
{
	var _rock = instance_find(o_Rock, 0);
	var _paper = instance_find(o_Paper, 0);
	var _scissors = instance_find(o_Scissors,0);
	_rock.lock();
	_paper.lock();
	_scissors.lock();
}

hide_RPS_display = function()
{
	_rps = instance_find(o_RPSDisplay, 0);
	_rpsWiz = instance_find(o_RPSDisplayWiz, 0);
	_rps.active = false;
	_rpsWiz.active = false;
}

reset_RPS = function()
{
	hide_RPS_display();
	var _wiz = instance_find(o_Wizard, 0);
	_wiz.reset();
}

send_throw = function(_my_throw)
{
	hide_RPS();
	_wiz = instance_find(o_Wizard, 0);
	_wizThrow = _wiz.my_throw;
	_rps = instance_find(o_RPSDisplay, 0);
	_rpsWiz = instance_find(o_RPSDisplayWiz, 0);
	_rps.active = true;
	_rps.image_index = _my_throw;
	_rpsWiz.active = true;
	_rpsWiz.image_index = _wizThrow;
	rps_eval_time = rps_eval_time_max;
	var _win = false;
	if (_my_throw == RPS.ROCK && _wizThrow == RPS.SCISSORS)
	{
		wizard_win_streak++;
		_win = true;
	}
	else if (_my_throw == RPS.PAPER && _wizThrow == RPS.ROCK)
	{
		wizard_win_streak++;
		_win = true;
	}
	else if (_my_throw == RPS.SCISSORS && _wizThrow == RPS.PAPER)
	{
		wizard_win_streak++;
		_win = true;
	}
	else if (_my_throw == RPS.ROCK && _wizThrow == RPS.PAPER)
	{
		wizard_win_streak = 0;
		audio_play_sound(sfx_Sad, 100, false);
	}
	else if (_my_throw == RPS.PAPER && _wizThrow == RPS.SCISSORS)
	{
		wizard_win_streak = 0;
		audio_play_sound(sfx_Sad, 100, false);
	}
		else if (_my_throw == RPS.SCISSORS && _wizThrow == RPS.ROCK)
	{
		wizard_win_streak = 0;
		audio_play_sound(sfx_Sad, 100, false);
	}
	if (_win)
	{
		if (wizard_win_streak >= wizard_win_max)
		{
			audio_play_sound(sfx_Happy, 100, false);
		}
		else {
			audio_play_sound(sfx_Win, 100, false);
		}
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
		
		case Room24:
		break;
	}
}

//room_goto(Room24);