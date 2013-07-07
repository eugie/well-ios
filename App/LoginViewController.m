#import "LoginViewController.h"
#import "AFHTTPClient.h"

@interface LoginViewController ()

@property (strong, nonatomic) AFHTTPClient *httpClient;
@property (strong, nonatomic) UIWebView *webView;
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

    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.request = [self.httpClient requestWithMethod:@"get" path:@"/" parameters:nil];
    [self.webView loadRequest:self.request];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.webView.frame = self.view.bounds;
}

#pragma mark - <UIWebViewDelegate>

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if ([webView.request.URL.path isEqualToString:@"/oauth/authorize"]) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (!self.loadedOnce) {
        self.loadedOnce = YES;
        [webView loadRequest:self.request];
    }
}

@end
