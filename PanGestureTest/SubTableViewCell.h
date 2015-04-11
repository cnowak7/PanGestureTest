
#import <UIKit/UIKit.h>

@protocol SubTableViewCellDelegate <NSObject>
//    -(void)enableScrolling:(id)sender;
@end

@interface SubTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id <SubTableViewCellDelegate> delegate;
@property (nonatomic, weak) IBOutlet UIButton *button1;
@property (nonatomic, weak) IBOutlet UIButton *button2;
@property (nonatomic, weak) IBOutlet UIView *myContentView;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic, assign) CGPoint panStartPoint;
@property (nonatomic, assign) CGFloat startingRightLayoutConstraintConstant;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewRightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewLeftConstraint;

@end
