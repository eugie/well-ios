#import "AchievementCell.h"
#import <QuartzCore/QuartzCore.h>

@interface AchievementCell ()

@property (strong, nonatomic) UIView *colorView;
@property (strong, nonatomic) UIImageView *achievementImageView;

@end

@implementation AchievementCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.colorView = [[UIView alloc] init];
        self.colorView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper-background"]];
        self.colorView.layer.borderWidth = 1;

        [self.contentView addSubview:self.colorView];

        self.achievementImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.achievementImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.achievementImageView];

        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.colorView.frame = CGRectInset(self.contentView.bounds, 5, 5);

    CGFloat xOrigin = CGRectGetMaxX(self.contentView.frame) - self.achievementImageView.frame.size.width - 10;
    CGFloat yOrigin = (self.contentView.frame.size.height - self.achievementImageView.frame.size.height) / 2;

    CGRect frame = CGRectMake(xOrigin, yOrigin, self.achievementImageView.frame.size.width, self.achievementImageView.frame.size.height);
    self.achievementImageView.frame = frame;
}

- (void)setColor:(UIColor *)color {
    self.textLabel.textColor = color;
    self.detailTextLabel.textColor = color;
    self.colorView.layer.borderColor = color.CGColor;
}

- (void)setAchievementImage:(NSUInteger)imageNumber {
    NSString *imageName = [NSString stringWithFormat:@"%d", imageNumber];
    self.achievementImageView.image = [UIImage imageNamed:imageName];
}

@end
