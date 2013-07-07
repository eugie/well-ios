#import "AchievementsViewController.h"
#import "Requester.h"
#import "AchievementCell.h"

@interface AchievementsViewController ()

@property (strong, nonatomic) Requester *requester;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *achievements;

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

    self.achievements = [NSArray array];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fuzzy-background"]];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[AchievementCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.requester getPath:@"/achievements"
                     params:nil
                    success:^(NSArray *response) {
                        self.achievements = response;
                        [self.tableView reloadData];
                    }
                    failure:^(NSError *error) {}];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.tableView.frame = self.view.bounds;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.achievements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSDictionary *achievement = self.achievements[indexPath.row];
    cell.textLabel.text = achievement[@"title"];
    cell.detailTextLabel.text = achievement[@"description"];
    [((AchievementCell *)cell) setColor:[self colorForAchievement:achievement]];
}

#pragma mark - Private

- (UIColor *)colorForAchievement:(NSDictionary *)achievement {
    if (![achievement[@"earned"] boolValue]) {
        return [UIColor grayColor];
    } else if ([achievement[@"attribute"] isEqualToString:@"strength"]) {
        return [UIColor colorWithRed:61/255.0 green:180/255.0 blue:249/255.0 alpha:1];
    } else if ([achievement[@"attribute"] isEqualToString:@"swiftness"]) {
        return [UIColor colorWithRed:233/255.0 green:23/255.0 blue:63/255.0 alpha:1];
    } else {
        return [UIColor colorWithRed:234/255.0 green:177/255.0 blue:64/255.0 alpha:1];
    }
}


@end
