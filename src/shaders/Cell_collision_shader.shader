shader_type canvas_item;

void vertex() {
	VERTEX.y += -2.0 * cos(TIME);
}