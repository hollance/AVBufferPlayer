
#import "DemoViewController.h"

@implementation DemoViewController

- (id)initWithCoder:(NSCoder*)decoder
{
	if ((self = [super initWithCoder:decoder]))
	{
		const int freq1 = 697;
		const int freq2 = 1209;
		const int seconds = 10;
		const int sampleRate = 44100;
		const float gain = 0.5f;

		int frames = seconds * sampleRate;
		float* buffer = (float*)malloc(frames*sizeof(float));

		for (int i = 0; i < frames; i++)
		{
			// DTMF signal
			buffer[i] = gain * (sinf(i*2*M_PI*freq1/sampleRate) + sinf(i*2*M_PI*freq2/sampleRate));

			// Simple 440Hz sine wave
			//buffer[i] = gain * sinf(i*2*M_PI*440/sampleRate)
		}

		player = [[AVBufferPlayer alloc] initWithBuffer:buffer frames:frames];
		free(buffer);
	}
	return self;
}

- (void)dealloc
{
	[player release];
	[super dealloc];
}

- (IBAction)playSound
{
	[player play];
}

- (IBAction)stopSound
{
	[player stop];
}

@end
