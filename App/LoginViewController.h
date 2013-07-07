#import <UIKit/UIKit.h>

@class AFHTTPClient;

@interface LoginViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (id)initWithHTTPClient:(AFHTTPClient *)httpClient;

@end
