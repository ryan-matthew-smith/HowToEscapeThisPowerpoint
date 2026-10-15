event_inherited();
holdable = true;
in_place = false;

apply_pickup_scale = function()
{
	image_xscale = 1.1;
	image_yscale = 1.1;
}

apply_drop_scale = function()
{
	image_xscale = 1;
	image_yscale = 1;
}

on_pickup = function()
{
	apply_pickup_scale();
	squash();
}

on_drop_extra = function()
{
	
}

on_drop = function()
{
	apply_drop_scale();
	stretch();
	on_drop_extra();
}