#import <UIKit/UIKit.h>

@class Requester;

@interface CharacterSheetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *strengthView;
@property (weak, nonatomic) IBOutlet UIView *quicknessView;
@property (weak, nonatomic) IBOutlet UIView *savvyView;

@property (weak, nonatomic) IBOutlet UIView *strengthLevel;
@property (weak, nonatomic) IBOutlet UIView *quicknessLevel;
@property (weak, nonatomic) IBOutlet UIView *savvyLevel;

- (id)initWithRequester:(Requester *)requester;

@end
