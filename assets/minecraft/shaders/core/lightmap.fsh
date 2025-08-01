#version 150

uniform float AmbientLightFactor;
uniform float SkyFactor;
uniform float BlockFactor;
uniform int UseBrightLightmap;
uniform vec3 SkyLightColor;
uniform float NightVisionFactor;
uniform float DarknessScale;
uniform float DarkenWorldFactor;
uniform float BrightnessFactor;

// Define our light and daylight multipliers.
float LightSourceMultiplier = 1.25;
float DaylightMultiplier = 1.45;
float DarknessMultiplier = 0.8;
float ColorBrightnessMultiplier = 0.75;

in vec2 texCoord;
out vec4 fragColor;

float get_brightness(float level) {
    float curved_level = level / (4.0 - 3.0 * level);
    return mix(curved_level, 1.0, AmbientLightFactor);
}

vec3 notGamma(vec3 x) {
    vec3 nx = 1.0 - x;
    return 1.0 - nx * nx * nx * nx;
}

float calculate_daylight_factor(float skyFactor) {
    // SkyFactor is higher during the day. Use smoothstep to map it to 0.0 (night) to 1.0 (day).
    return smoothstep(0.2, 0.8, skyFactor);
}

void main() {
    // Compute brightness values for block and sky light levels.
    float block_brightness = get_brightness(floor(texCoord.x * 16) / 15) * BlockFactor;

    // Apply the light source multiplier to block light brightness.
    block_brightness *= LightSourceMultiplier;

    float sky_brightness = get_brightness(floor(texCoord.y * 16) / 15) * SkyFactor;

    // Calculate the DaylightFactor based on the sky brightness.
    float DaylightFactor = calculate_daylight_factor(SkyFactor);

    // Apply the daylight multiplier to skylight brightness during the day.
    sky_brightness *= mix(1.0, DaylightMultiplier, DaylightFactor);

    // Smooth fade to pitch black for very low light levels.
    float combined_brightness = block_brightness + sky_brightness;
    float fade_factor = smoothstep(0.0, DarknessMultiplier, combined_brightness);

    // Default light color computation.
    vec3 color = vec3(
        block_brightness,
        block_brightness * ((block_brightness * 0.6 + 0.4) * 0.6 + 0.4),
        block_brightness * (block_brightness * block_brightness * 0.6 + 0.4)
    );

    if (UseBrightLightmap != 0) {
        color = mix(color, vec3(0.99, 1.12, 1.0), 0.25);
        color = clamp(color, 0.0, 1.0);
    } else {
        // Add the adjusted skylight brightness.
        color += SkyLightColor * sky_brightness;
        color = mix(color, vec3(0.75), 0.04);

        // Darkening adjustments for non-daytime settings.
        vec3 darkened_color = color * vec3(0.7, 0.6, 0.6);
        color = mix(color, darkened_color, DarkenWorldFactor * (1.0 - DaylightFactor));
    }

    if (NightVisionFactor > 0.0) {
        // Scale up uniformly until 1.0 is hit by one of the colors.
        float min_component = min(color.r, min(color.g, color.b));
        if (min_component < 1.0) {
            vec3 bright_color = color / min_component;
            color = mix(color, bright_color, NightVisionFactor);
        }
    }

    if (UseBrightLightmap == 0) {
        // Apply darkness scale adjustment.
        color = clamp(color - vec3(DarknessScale * (1.0 - DaylightFactor)), 0.0, 1.0);
    }

    // Apply fade effect.
    color = mix(vec3(0.0), color, fade_factor);

    // Apply gamma correction and brightness adjustments.
    vec3 notGamma = notGamma(color);
    color = mix(color, notGamma, BrightnessFactor);
    color = mix(color, vec3(ColorBrightnessMultiplier), 0.04);
    color = clamp(color, 0.0, 1.0);

    fragColor = vec4(color, 1.0);
}
