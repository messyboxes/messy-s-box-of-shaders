shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;
uniform float frequency = 60;
uniform float blur: hint_range(0.0, 10) = 0.0;
uniform float difference: hint_range(0.0, 10) = 0.0;
uniform bool edge = false;
uniform float morethin: hint_range(0.0, 10) = 0.0;
uniform bool more = false;
void fragment() {
	vec2 new_uv = SCREEN_UV;
	//new_uv.x += fract(new_uv.y * 2.0  + TIME* 10.0) * 0.004;
	//vec3 new_colors = textureLod(existing_screen_texture, new_uv,0.0).rgb;
	vec3 new_colors0 = texture(existing_screen_texture, SCREEN_UV, blur).rgb;
	vec3 new_colors1 = texture(existing_screen_texture, SCREEN_UV, blur + difference).rgb;
	vec3 new_colors_fin = (new_colors1 - new_colors0) ;
	if (edge) {
		new_colors_fin = vec3(new_colors_fin.x + new_colors_fin.y + new_colors_fin.z) /3.0;
	}
	if (more){
		new_colors_fin = vec3((new_colors_fin.x + new_colors_fin.y + new_colors_fin.z)>morethin ? 1.0:0.0);
	}
	COLOR.rgb = new_colors_fin;
}

