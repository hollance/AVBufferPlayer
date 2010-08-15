
#import "AVBufferPlayer.h"

@interface DemoViewController : UIViewController
{
	AVBufferPlayer* player;
}

- (IBAction)playSound;
- (IBAction)stopSound;

@end
