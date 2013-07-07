#import <UIKit/UIKit.h>

@class Requester;

@interface AchievementsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (id)initWithRequester:(Requester *)requester;

@end
