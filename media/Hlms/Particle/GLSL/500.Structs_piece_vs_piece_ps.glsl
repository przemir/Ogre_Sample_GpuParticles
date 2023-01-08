
@piece( custom_vs_uniformDeclaration )

@property( syntax == glsl )
	#define ogre_T11 binding = 11
	#define ogre_T12 binding = 12
	#define ogre_T13 binding = 13
	#define ogre_T14 binding = 14
@end

@property(particleWorldEnabled)
	@insertpiece(ParticleWorldStructures)

	layout(std430, ogre_T14) readonly restrict buffer particleDataListBuf
	{
		Particle particleDataList[];
	};
	layout(std430, ogre_T11) readonly restrict buffer emitterCoreDataBuf
	{
		EmitterCoreData emitterCoreData[];
	};
	layout(std430, ogre_T12) readonly restrict buffer bucketGroupDataBuf
	{
		BucketGroup bucketGroupData[];
	};

	const float2 QuadCorners[] =
	{
		float2(0, 0),
		float2(1, 0),
		float2(1, 1),
		float2(0, 1),
	};
@end

@property(particle_enabled)
	struct Particle
	{
		float3 pos;
		float rot;
		float4 colour;
		float2 size;
		float spriteNumber;
		// float anything;
	};


	layout(std430, ogre_T14) readonly restrict buffer particleDataListBuf
	{
		Particle particleDataList[];
	};

	struct EmitterInstanceData {
		float4x4 emitterLocation;
		float elapsedTime;

		uint particleArrayStartIndex;

		/// Particles count without new particles
		uint particlesCount;

		uint newParticles;

		uint MaxParticles;
		uint randomIteration;
	};


	layout(std430, ogre_T13) readonly restrict buffer emitterInstanceDataBuf
	{
		EmitterInstanceData emitterInstanceData[];
	};

	const float2 QuadCorners[] =
	{
		float2(0, 0),
		float2(1, 0),
		float2(1, 1),
		float2(0, 1),
	};
@end

@end


@piece( custom_passBuffer )

    float4x4 particleInvViewProj;
    float4x4 particleCameraViewMatrix;
    
    // float3 particleCameraPos;
    // float3 particleCameraRight;
    // float3 particleCameraUp;
    // float3 particleCameraForward;
    
@end