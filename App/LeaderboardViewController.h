#import <UIKit/UIKit.h>

@class Requester;

@interface LeaderboardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (id)initWithRequester:(Requester *)requester;

@end
