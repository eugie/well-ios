#import "CharacterSheetViewController.h"
#import "Requester.h"

@interface CharacterSheetViewController ()

@property (strong, nonatomic) Requester *requester;
@property (strong, nonatomic) NSDictionary *characterProperties;

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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.requester getPath:@"/character_sheet"
                     params:nil
                    success:^(NSDictionary *characterProperties) {
                        self.characterProperties = characterProperties;
                        [self refreshCharacterBars];
                    }
                    failure:^(NSError *error) {}];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, CGRectGetMaxY(self.savvyView.frame) + 10);
}

#pragma mark - Private

- (void)refreshCharacterBars {
    CGFloat barWidth = self.strengthView.frame.size.width;
    CGRect bounds = self.strengthView.bounds;
    
    bounds.size.width = barWidth * [self.characterProperties[@"strength"] floatValue];
    self.strengthLevel.frame = bounds;

    bounds.size.width = barWidth * [self.characterProperties[@"swiftness"] floatValue];
    self.quicknessLevel.frame = bounds;

    bounds.size.width = barWidth * [self.characterProperties[@"savviness"] floatValue];
    self.savvyLevel.frame = bounds;
}

@end
