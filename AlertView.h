#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^DismissBlock)(NSInteger buttonIndex);

@interface AlertView : NSObject<UIAlertViewDelegate>

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle
        otherButtonTitles:(NSArray*)otherButtonTitles
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

@end
