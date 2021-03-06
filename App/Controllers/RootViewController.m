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

    [self buildViewControllers];    
    self.tabBarController.viewControllers = @[self.characterSheetViewController,
                                              self.achievementsViewController,
                                              self.leaderboardViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.view.frame = [[UIScreen mainScreen] bounds];

    if (!self.loginPresented) {
        LoginViewController *loginViewController = [[LoginViewController alloc] initWithHTTPClient:self.httpClient];
        [self presentViewController:loginViewController animated:NO completion:^{
            self.loginPresented = YES;
        }];
    } else {
        self.tabBarController.view.frame = self.view.frame;
        [self.view addSubview:self.tabBarController.view];
    }
}

#pragma mark - Private

- (void)buildViewControllers {
    CharacterSheetViewController *csvc = [[CharacterSheetViewController alloc] initWithRequester:self.requester];
    self.characterSheetViewController = [[UINavigationController alloc] initWithRootViewController:csvc];
    self.characterSheetViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Character Sheet" image:[UIImage imageNamed:@"character-tab-icon"] tag:0];
    [self configureNavigationController:self.characterSheetViewController];

    AchievementsViewController *avc = [[AchievementsViewController alloc] initWithRequester:self.requester];
    self.achievementsViewController = [[UINavigationController alloc] initWithRootViewController:avc];
    self.achievementsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Achievements" image:[UIImage imageNamed:@"achievements-tab-icon"] tag:1];
    [self configureNavigationController:self.achievementsViewController];

    LeaderboardViewController *lvc = [[LeaderboardViewController alloc] initWithRequester:self.requester];
    self.leaderboardViewController = [[UINavigationController alloc] initWithRootViewController:lvc];
    self.leaderboardViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Leaderboard" image:[UIImage imageNamed:@"leaderboard-tab-icon"] tag:2];
    [self configureNavigationController:self.leaderboardViewController];
}

- (void)configureNavigationController:(UINavigationController *)navigationController {
    navigationController.navigationBar.tintColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1];
    navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1],
                                                               UITextAttributeTextShadowColor: [UIColor whiteColor]};
}

@end
