shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;
uniform float frequency = 60;


void fragment() {
	vec2 new_uv = SCREEN_UV;
	//new_uv.x += fract(new_uv.y * 2.0  + TIME* 10.0) * 0.004;
	//vec3 new_colors = textureLod(existing_screen_texture, new_uv,0.0).rgb;
	vec3 new_colors = texture(existing_screen_texture, SCREEN_UV,0.0).rgb;
	new_colors = vec3( (new_colors.x +new_colors.y+new_colors.z) / 3.0 );
	COLOR.rgb = new_colors;
}

