scale_struct = scale_create();
holdable = false;
in_place = false;
on_click = function()
{

}

squash = function()
{
	scale_apply(scale_struct, 0.9, 0.9);
}

stretch = function()
{
	scale_apply(scale_struct, 1.1, 1.1);
}


perform_step_extra = function()
{
	
}

perform_step = function()
{
	scale_step_elastic(scale_struct);
	perform_step_extra();
}

perform_draw = function()
{
	scale_draw(scale_struct, x, y);
}