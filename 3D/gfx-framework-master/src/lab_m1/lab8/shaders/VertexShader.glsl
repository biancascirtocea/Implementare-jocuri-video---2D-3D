#version 330

// Input
layout(location = 0) in vec3 v_position;
layout(location = 1) in vec3 v_normal;
layout(location = 2) in vec2 v_texture_coord;

// Uniform properties
uniform mat4 Model;
uniform mat4 View;
uniform mat4 Projection;

// Output values to fragment shader
out vec3 world_position;
out vec3 world_normal;

void main()
{
    vec4 world_pos = Model * vec4(v_position, 1.0);
    world_position = world_pos.xyz;
    
    world_normal = mat3(transpose(inverse(Model))) * v_normal;

    // Compute clip space vertex position
    gl_Position = Projection * View * world_pos;
}
