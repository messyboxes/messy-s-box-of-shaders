shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;
uniform float frequency = 60;
uniform float blur: hint_range(0.0, 10) = 0.0;

void fragment() {
	vec2 new_uv = SCREEN_UV;
	//new_uv.x += fract(new_uv.y * 2.0  + TIME* 10.0) * 0.004;
	//vec3 new_colors = textureLod(existing_screen_texture, new_uv,0.0).rgb;
	vec4 new_colors = texture(existing_screen_texture, SCREEN_UV, blur);
	COLOR = new_colors;
}

