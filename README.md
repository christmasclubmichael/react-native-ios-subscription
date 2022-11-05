# react-native-ios-subscription
React native module for checking subscription status

## Getting started

`$ npm install react-native-native-subscription --save`

### Mostly automatic installation

`$ react-native link react-native-native-subscription`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-native-subscription` and add `RNNativeSubscription.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNNativeSubscription.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import RNNativeSubscription from 'react-native-native-subscription';

RNNativeSubscription.hasPurchasedSubscriptionForProductID(
  productID,
).then((hasPurchaseResponse: any) => {
  console.log('hasPurchaseResponse: ', hasPurchaseResponse);
  if (hasPurchaseResponse['status'] == 'success') {
    let hasPurchase =
      hasPurchaseResponse['has_purchase'] == 'YES' ? true : false;

    if (hasPurchase) {
      RNNativeSubscription.isSubscribedForProductID(productID).then(
        (subscriptionResponse: any) => {
          console.log('subscriptionResponse: ', subscriptionResponse);
          if (subscriptionResponse['status'] == 'success') {
            let isSubscribed =
              subscriptionResponse['is_subscribed'] == 'YES'
                ? true
                : false;
            console.log('isSubscribed: ', isSubscribed);

            if (isSubscribed) {
              // execute code for subscribed user
            } else {
              // execute code to show user subscription plan 
              // The user was subscribed earlier, but the plan got expired/not renewed
            }
          } else {
            console.log("Failed to check subscriptions status: ", subscriptionResponse['message'])
          }
        },
      );
    }
  } else {
    // The user has never subscribed. Show the subscription plans
  }
})
```
  
