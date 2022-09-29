
#import "RNNativeSubscription.h"

@implementation RNNativeSubscription

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(isSubscribedForProductID:(NSString*)productID :(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    if(productID == nil) {
        resolve(@{@"status": @"error", @"message": @"Please provide the productID whose subscription status needs to be checked."});
    }

    RMStoreKeychainPersistence *_persistor = [[RMStoreKeychainPersistence alloc] init];
    [RMStore defaultStore].transactionPersistor = _persistor;
        
    [[RMStore defaultStore] refreshReceiptOnSuccess:^{
        RMStoreAppReceiptVerifier *verificator = [RMStoreAppReceiptVerifier new];
        if ([verificator verifyAppReceipt])
        {
            BOOL isSubscribed = [[RMAppReceipt bundleReceipt] containsActiveAutoRenewableSubscriptionOfProductIdentifier:productID forDate: [NSDate date]];
            
            NSLog(@"is_subscribed: %@", (isSubscribed) ? @"YES" : @"NO");
            resolve(@{@"status": @"success", "is_subscribed": isSubscribed});
        }
    } failure:^(NSError *error) {
       resolve(@{@"status": @"error", @"message": [error localizedDescription]});
    }];
}

@end
  