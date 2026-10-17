enum RPS
{
	ROCK,
	PAPER,
	SCISSORS
}
thinking_time_max = 90;
thinking_time = thinking_time_max;
is_thinking = true;
my_throw = RPS.ROCK;

reset = function()
{
	thinking_time = thinking_time_max;
	is_thinking = true;
	sprite_index = s_WizardIdle;
}

perform_step = function()
{
	if (is_thinking)
	{
		if (thinking_time > 0)
		{
			thinking_time--;
		}
		else {
			is_thinking = false;
			my_throw = irandom_range(0,2);
			sprite_index = s_WizardTell;
			image_index = my_throw;
			o_GameManager.display_RPS();
		}
	}
}

