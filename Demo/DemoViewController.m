
#import "AVBufferPlayer.h"
#import "DemoViewController.h"

@implementation DemoViewController
{
	AVBufferPlayer *_player;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
	{
		const int freq1 = 697;
		const int freq2 = 1209;
		const int seconds = 10;
		const int sampleRate = 44100;
		const float gain = 0.5f;

		int frames = seconds * sampleRate;
		float *buffer = (float *)malloc(frames * sizeof(float));

		for (int i = 0; i < frames; i++)
		{
			// DTMF signal
			buffer[i] = gain * (sinf(i*2.0f*M_PI*freq1/sampleRate) + sinf(i*2.0f*M_PI*freq2/sampleRate));

			// Simple 440Hz sine wave
			//buffer[i] = gain * sinf(i*2.0f*M_PI*440.0f/sampleRate)
		}

		_player = [[AVBufferPlayer alloc] initWithBuffer:buffer frames:frames];

		free(buffer);
	}
	return self;
}

- (IBAction)playSound
{
	[_player play];
}

- (IBAction)stopSound
{
	[_player stop];
}

@end
