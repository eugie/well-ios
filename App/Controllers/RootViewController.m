#import "RootViewController.h"
#import "AchievementsViewController.h"
#import "LeaderboardViewController.h"
#import "CharacterSheetViewController.h"
#import "Requester.h"

@interface RootViewController ()

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) CharacterSheetViewController *characterSheetViewController;
@property (strong, nonatomic) AchievementsViewController *achievementsViewController;
@property (strong, nonatomic) LeaderboardViewController *leaderboardViewController;
@property (strong, nonatomic) Requester *requester;

@end

@implementation RootViewController

- (id)initWithRequester:(Requester *)requester {
    self = [super init];
    if (self) {
        self.tabBarController = [[UITabBarController alloc] init];
        self.requester = requester;
    }
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.frame = [[UIScreen mainScreen] bounds];
    [self.view addSubview:self.tabBarController.view];

    [self buildViewControllers];
    
    self.tabBarController.viewControllers = @[self.characterSheetViewController,
                                              self.achievementsViewController,
                                              self.leaderboardViewController];
}

#pragma mark - Private

- (void)buildViewControllers {
    self.characterSheetViewController = [[CharacterSheetViewController alloc] initWithRequester:self.requester];
    self.characterSheetViewController.title = @"Character Sheet";

    self.achievementsViewController = [[AchievementsViewController alloc] initWithRequester:self.requester];
    self.achievementsViewController.title = @"Achievements";

    self.leaderboardViewController = [[LeaderboardViewController alloc] initWithRequester:self.requester];
    self.leaderboardViewController.title = @"Leaderboard";
}

@end
