if (room == Room24)
{
	if (rps_eval_time > 0)
	{
		rps_eval_time--;
	}
	else if (rps_eval_time == 0)
	{
		rps_eval_time--;
		if (wizard_win_streak < wizard_win_max) 
		{
			reset_RPS();
		}
		else {
			unlock_slide();
			hide_RPS_display();
		}

	}
}