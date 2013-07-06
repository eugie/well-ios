#import "LeaderboardViewController.h"
#import "Requester.h"

@interface LeaderboardViewController ()

@property (strong, nonatomic) Requester *requester;

@end

@implementation LeaderboardViewController

- (id)initWithRequester:(Requester *)requester {
    self = [super init];
    if (self) {
        self.requester = requester;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
