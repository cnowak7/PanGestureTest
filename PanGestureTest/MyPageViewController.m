
#import "MyPageViewController.h"
#import "SubTableViewCell.h"

@interface MyPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, SubTableViewCellDelegate>
{
    NSArray *_viewControllers;
}

@end

@implementation MyPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIStoryboard *mainStoryboard = self.storyboard;
    
    _viewControllers = @[[mainStoryboard instantiateViewControllerWithIdentifier:@"1"],
                         [mainStoryboard instantiateViewControllerWithIdentifier:@"2"],
                         [mainStoryboard instantiateViewControllerWithIdentifier:@"3"]];
    
    [self setViewControllers:@[_viewControllers[1]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    
    self.dataSource = self;
    self.delegate = self;
    for(UIView* view in self.view.subviews)
    {
        if([view isKindOfClass:[UIScrollView class]]){
            UIScrollView* scrollView=(UIScrollView*)view;
            [scrollView setScrollEnabled:NO];
        }
    }
}

- (UIViewController*)viewControllerForPageNumber:(NSUInteger)pageNumber
{
    if (pageNumber < _viewControllers.count)
        return _viewControllers[pageNumber];
    return nil;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [_viewControllers indexOfObject:viewController];
    return [self viewControllerForPageNumber:--currentIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [_viewControllers indexOfObject:viewController];
    return [self viewControllerForPageNumber:++currentIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_viewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return [_viewControllers indexOfObject:pageViewController];
}

-(void)setScrollEnabled:(BOOL)enabled forPageViewController:(UIPageViewController*)pageViewController{
    for(UIView* view in pageViewController.view.subviews){
        if([view isKindOfClass:[UIScrollView class]]){
            UIScrollView* scrollView=(UIScrollView*)view;
            [scrollView setScrollEnabled:enabled];
            return;
        }
    }
}

-(void)enableScrolling:(id)sender
{
    for(UIView* view in self.view.subviews)
    {
        if([view isKindOfClass:[UIScrollView class]]){
            UIScrollView* scrollView=(UIScrollView*)view;
            [scrollView setScrollEnabled:YES];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
