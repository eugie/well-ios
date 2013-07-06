#import "RootViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIViewController *characterSheetViewController;
@property (strong, nonatomic) UIViewController *achievementsViewController;
@property (strong, nonatomic) UIViewController *leaderboardViewController;

@end

@implementation RootViewController

- (id)init {
    self = [super init];
    if (self) {
        self.tabBarController = [[UITabBarController alloc] init];
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
    self.characterSheetViewController = [[UIViewController alloc] init];
    self.characterSheetViewController.title = @"Character Sheet";

    self.achievementsViewController = [[UIViewController alloc] init];
    self.achievementsViewController.title = @"Achievements";

    self.leaderboardViewController = [[UIViewController alloc] init];
    self.leaderboardViewController.title = @"Leaderboard";
}

@end
