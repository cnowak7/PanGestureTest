
#import <UIKit/UIKit.h>
#import "SubTableViewCell.h"

@interface TableViewController : UITableViewController
{
    NSMutableIndexSet *expandedSections;
}

@property (strong, nonatomic) IBOutlet UITableViewCell *ExpandableCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *SubCell;

@end
