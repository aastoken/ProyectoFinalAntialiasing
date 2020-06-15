#include "PostEffectShared.hlsl"
#include "Utils.hlsl"
#include "Fxaa3_11.h"

#define FXAA_PC 1

static const float2 RenderTargetSize = float2( 1280.0, 720.0 );
static const float2 PixelSize = 1.0 / RenderTargetSize; // Size of a pixel in texcoords (UV coordinates)

Texture2D sceneTexture : register( t0 );
Texture2D depthTexture : register( t1 );
SamplerState samplerState : register( s0 );

float3 main( OutputVS input ) : SV_TARGET
{
	//return float3( 0.0, 0.0, 0.0 ); wrong

	return sceneTexture.Sample(samplerState , input.texcoord).rgb;
}
