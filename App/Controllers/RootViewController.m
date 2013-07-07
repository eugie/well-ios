#import "RootViewController.h"
#import "AchievementsViewController.h"
#import "LeaderboardViewController.h"
#import "CharacterSheetViewController.h"
#import "Requester.h"
#import "LoginViewController.h"
#import "AFHTTPClient.h"

@interface RootViewController ()

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *characterSheetViewController;
@property (strong, nonatomic) UINavigationController *achievementsViewController;
@property (strong, nonatomic) UINavigationController *leaderboardViewController;
@property (strong, nonatomic) Requester *requester;
@property (strong, nonatomic) AFHTTPClient *httpClient;
@property (assign, nonatomic) BOOL loginPresented;

@end

@implementation RootViewController

- (id)initWithRequester:(Requester *)requester httpClient:(AFHTTPClient *)httpClient {
    self = [super init];
    if (self) {
        self.tabBarController = [[UITabBarController alloc] init];
        self.requester = requester;
        self.httpClient = httpClient;
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (!self.loginPresented) {
        LoginViewController *loginViewController = [[LoginViewController alloc] initWithHTTPClient:self.httpClient];
        [self presentViewController:loginViewController animated:NO completion:^{
            self.loginPresented = YES;
        }];
    }
}

#pragma mark - Private

- (void)buildViewControllers {
    CharacterSheetViewController *csvc = [[CharacterSheetViewController alloc] initWithRequester:self.requester];
    self.characterSheetViewController = [[UINavigationController alloc] initWithRootViewController:csvc];
    self.characterSheetViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Character Sheet" image:[UIImage imageNamed:@"character-tab-icon"] tag:0];

    AchievementsViewController *avc = [[AchievementsViewController alloc] initWithRequester:self.requester];
    self.achievementsViewController = [[UINavigationController alloc] initWithRootViewController:avc];
    self.achievementsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Achievements" image:[UIImage imageNamed:@"achievements-tab-icon"] tag:1];

    LeaderboardViewController *lvc = [[LeaderboardViewController alloc] initWithRequester:self.requester];
    self.leaderboardViewController = [[UINavigationController alloc] initWithRootViewController:lvc];
    self.leaderboardViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Leaderboard" image:[UIImage imageNamed:@"leaderboard-tab-icon"] tag:0];
}

@end
