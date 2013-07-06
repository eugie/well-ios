#import "AchievementsViewController.h"
#import "Requester.h"

@interface AchievementsViewController ()

@property (strong, nonatomic) Requester *requester;

@end

@implementation AchievementsViewController

- (id)initWithRequester:(Requester *)requester
{
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
