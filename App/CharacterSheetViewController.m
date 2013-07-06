#import "CharacterSheetViewController.h"
#import "Requester.h"

@interface CharacterSheetViewController ()

@property (strong, nonatomic) Requester *requester;

@end

@implementation CharacterSheetViewController

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
