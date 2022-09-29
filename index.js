
import { NativeModules } from 'react-native';

const { RNNativeSubscription } = NativeModules;

var RNNativeSubscriptionModule = {
    isSubscribedForProductID: (productID) => {
        return RNNativeSubscription.isSubscribedForProductID(productID);   
    },
    hasPurchasedSubscriptionForProductID: (productID) => {
        return RNNativeSubscription.hasPurchasedSubscriptionForProductID(productID);   
    }
};

export default RNNativeSubscriptionModule;
