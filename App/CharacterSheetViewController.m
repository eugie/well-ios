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

    self.title = @"Character Sheet";
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, CGRectGetMaxY(self.savvyView.frame) + 10);
}

@end
