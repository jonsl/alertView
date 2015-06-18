#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^DismissBlock)(UIAlertView* alertView, NSInteger buttonIndex);

@interface AlertView : NSObject<UIAlertViewDelegate>

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle
        otherButtonTitles:(NSArray*)otherButtonTitles
           alertViewStyle:(UIAlertViewStyle)alertViewStyle
                onDismiss:(DismissBlock)dismissBlock;  // cancel button will be buttonIndex==0

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle
                onDismiss:(DismissBlock)dismissBlock;

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle;

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message;

@property (nonatomic, strong) UIAlertView* view;

@end
