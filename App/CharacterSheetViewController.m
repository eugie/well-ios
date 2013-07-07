#import "CharacterSheetViewController.h"
#import "Requester.h"

@interface CharacterSheetViewController ()

@property (strong, nonatomic) Requester *requester;

@end

@implementation CharacterSheetViewController

- (id)initWithRequester:(Requester *)requester {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.requester = requester;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Character Sheet";
}

@end
