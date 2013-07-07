#import "LoginViewController.h"
#import "AFHTTPClient.h"

@interface LoginViewController ()

@property (strong, nonatomic) AFHTTPClient *httpClient;
@property (strong, nonatomic) NSURLRequest *request;
@property (assign, nonatomic) BOOL loadedOnce;

@end

@implementation LoginViewController

- (id)initWithHTTPClient:(AFHTTPClient *)httpClient {
    self = [super init];
    if (self) {
        self.httpClient = httpClient;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.webView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fuzzy-background"]];
    
    self.request = [self.httpClient requestWithMethod:@"get" path:@"/" parameters:nil];
    [self.webView loadRequest:self.request];
}

#pragma mark - <UIWebViewDelegate>

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if ([webView.request.URL.path isEqualToString:@"/oauth/authorize"]) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

@end
