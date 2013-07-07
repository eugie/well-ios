#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (IBAction)didTapLoginButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
