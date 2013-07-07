#import <UIKit/UIKit.h>

@class Requester, AFHTTPClient;

@interface RootViewController : UIViewController

- (id)initWithRequester:(Requester *)requester httpClient:(AFHTTPClient *)httpClient;

@end
