#import "LeaderboardViewController.h"
#import "Requester.h"

@interface LeaderboardViewController ()

@property (strong, nonatomic) Requester *requester;
@property (strong, nonatomic) UITableView *tableView;

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

    self.title = @"Leaderboard";

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.tableView.frame = self.view.bounds;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];

    NSArray *names = @[@"Gavin Morgan", @"Eugenia Dellapenna", @"Ben Christel", @"Eldars Loginovs", @"Jeff Risberg"];

    cell.textLabel.text = [NSString stringWithFormat:@"#%d | %@", indexPath.row+1, names[indexPath.row]];
    return cell;
}

@end
