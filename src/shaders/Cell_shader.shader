shader_type canvas_item;

vec2 scale(vec2 uv, float x_scale, float y_scale) {
	uv -= 0.5;
	uv *= vec2(x_scale, y_scale);
	uv += 0.5;
	return uv;
}

void vertex() {
	float x_scale = 0.5 * cos(TIME) + 1.2;
	//float y_scale = 2.0 * abs(cos(TIME));
	float y_scale = 1.0;
	UV = scale(UV, x_scale, y_scale);
}
