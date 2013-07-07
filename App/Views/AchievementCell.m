#import "AchievementCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation AchievementCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.colorView = [[UIView alloc] init];
        self.colorView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper-background"]];
        self.colorView.layer.borderWidth = 1;

        [self.contentView addSubview:self.colorView];

        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.colorView.frame = CGRectInset(self.contentView.bounds, 5, 5);
}

- (void)setColor:(UIColor *)color {
    self.textLabel.textColor = color;
    self.detailTextLabel.textColor = color;
    self.colorView.layer.borderColor = color.CGColor;
}

@end
