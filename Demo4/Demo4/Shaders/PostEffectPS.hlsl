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
	FxaaFloat2 pos = float2(0.0,0.0);
	FxaaFloat4 fxaaConsolePosPos = float4(0,0,0,0);
	FxaaTex tex = { samplerState, sceneTexture };
	FxaaTex fxaaConsole360TexExpBiasNegOne = { samplerState, sceneTexture };
	FxaaTex fxaaConsole360TexExpBiasNegTwo = { samplerState, sceneTexture };
	FxaaFloat2 fxaaQualityRcpFrame = float2(1.0 / (1280.0), 1.0 / (720.0));
	FxaaFloat4 fxaaConsoleRcpFrameOpt = float4(0, 0, 0, 0);
	FxaaFloat4 fxaaConsoleRcpFrameOpt2 = float4(0, 0, 0, 0);
	FxaaFloat4 fxaaConsole360RcpFrameOpt2 = float4(0, 0, 0, 0);
	FxaaFloat fxaaQualitySubpix = float(1.0);
	FxaaFloat fxaaQualityEdgeThreshold = float(0.063);
	FxaaFloat fxaaQualityEdgeThresholdMin = float(0.0312);
	FxaaFloat fxaaConsoleEdgeSharpness = float(4.0);
	FxaaFloat fxaaConsoleEdgeThreshold = float(0.125);
	FxaaFloat fxaaConsoleEdgeThresholdMin = float(0.05);
	FxaaFloat4 fxaaConsole360ConstDir = float4(1.0, -1.0, 0.25, -0.25);


	//return float3( 0.0, 0.0, 0.0 ); wrong

	return sceneTexture.Sample(samplerState , input.texcoord).rgb;
}
