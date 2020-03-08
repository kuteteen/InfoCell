#import "InfoCellView.h"
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>

@implementation UIImage (ResizeCategory)
- (UIImage *)imageWithSize:(CGSize)newSize {
  UIGraphicsImageRenderer *renderer =
      [[UIGraphicsImageRenderer alloc] initWithSize:newSize];
  UIImage *image = [renderer
      imageWithActions:^(UIGraphicsImageRendererContext *_Nonnull myContext) {
        [self drawInRect:(CGRect){.origin = CGPointZero, .size = newSize}];
      }];
  return image;
}
@end

@interface AAUIAppleAccountViewController : PSListController
@end

@interface PSSpecifier : NSObject
@property(nonatomic, retain) NSString *identifier;
- (id)propertyForKey:(id)arg1;
- (void)performButtonAction;
- (void)performConfirmationAction;
- (void)performConfirmationCancelAction;
- (void)performControllerLoadAction;
@end

@interface PSUIPrefsListController : PSListController
@end

@interface PSUIAppleAccountCell : PSTableCell
+ (long long)cellStyle;
- (CGSize)sizeThatFits:(CGSize)arg1;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)arg1;
@end
