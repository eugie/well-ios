#import "AchievementsViewController.h"
#import "Requester.h"

@interface AchievementsViewController ()

@property (strong, nonatomic) Requester *requester;
@property (strong, nonatomic) UITableView *tableView;

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

    self.title = @"Achievements";

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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"You got a gold star! 🌟";
    return cell;
}


@end
