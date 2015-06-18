#include "AlertView.h"
#import <objc/runtime.h>


@interface AlertView()

@property (nonatomic, strong) id dismissTag;

@end

@implementation AlertView
@dynamic dismissTag;

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle
        otherButtonTitles:(NSArray*)otherButtonTitles
           alertViewStyle:(UIAlertViewStyle)alertViewStyle
                onDismiss:(DismissBlock)dismissBlock {
    AlertView* alertView = [[AlertView alloc] init];
    alertView.view = [[UIAlertView alloc] initWithTitle:title
                                                message:message
                                               delegate:self
                                      cancelButtonTitle:cancelButtonTitle
                                      otherButtonTitles:nil];

    objc_setAssociatedObject(alertView.view, @selector(dismissTag), dismissBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);

    for (NSString* buttonTitle in otherButtonTitles) {
        [alertView.view addButtonWithTitle:buttonTitle];
    }
    alertView.view.alertViewStyle = alertViewStyle;

    [alertView.view show];
}

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle
                onDismiss:(DismissBlock)dismissBlock {
    [AlertView alertViewWithTitle:title
                          message:message
                cancelButtonTitle:cancelButtonTitle
                otherButtonTitles:nil
                   alertViewStyle:UIAlertViewStyleDefault
                        onDismiss:dismissBlock];
}

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message
        cancelButtonTitle:(NSString*)cancelButtonTitle {
    [AlertView alertViewWithTitle:title
                          message:message
                cancelButtonTitle:cancelButtonTitle
                otherButtonTitles:nil
                   alertViewStyle:UIAlertViewStyleDefault
                        onDismiss:nil];
}

+(void)alertViewWithTitle:(NSString*)title
                  message:(NSString*)message {
    [AlertView alertViewWithTitle:title
                          message:message
                cancelButtonTitle:@""];
}

+(void)alertView:(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    DismissBlock dismissBlock = objc_getAssociatedObject(alertView, @selector(dismissTag));
    if (dismissBlock) {
        dismissBlock(alertView, buttonIndex); // cancel button is button 0
    }
}

@end
