shader_type canvas_item;
uniform sampler2D existing_screen_texture: hint_screen_texture, filter_linear_mipmap;
uniform float frequency = 60;

void fragment() {
vec2 new_uv0 = SCREEN_UV;
vec2 new_uv1 = SCREEN_UV;
vec2 new_uv2 = SCREEN_UV;
new_uv0.x += sin(frequency + TIME * 4.0)  * 0.006;
new_uv1.x += sin(frequency + 30.0 + TIME * 8.0)  * 0.006;
new_uv2.x += sin(frequency +20.0+ TIME * 5.0)  * 0.006;
new_uv0.y += cos(frequency + TIME * 4.0)  * 0.006;
new_uv1.y += cos(frequency + 30.0 + TIME * 8.0)  * 0.006;
new_uv2.y += cos(frequency +20.0+ TIME * 5.0)  * 0.006;

vec3 new_colors = textureLod(existing_screen_texture, new_uv0,0.0).rgb * vec3(1,0,0);
new_colors += textureLod(existing_screen_texture, new_uv1,0.0).rgb * vec3(0,1,0);
new_colors += textureLod(existing_screen_texture, new_uv2,0.0).rgb * vec3(0,0,1);

COLOR.rgb = new_colors;
}