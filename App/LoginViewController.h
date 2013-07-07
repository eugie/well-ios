#import <UIKit/UIKit.h>

@class AFHTTPClient;

@interface LoginViewController : UIViewController <UIWebViewDelegate>

- (id)initWithHTTPClient:(AFHTTPClient *)httpClient;

@end
