
import { NativeModules } from 'react-native';

const { RNNativeSubscription } = NativeModules;

var RNNativeSubscriptionModule = {
    isSubscribedForProductID: (productID) => {
        return RNNativeSubscription.isSubscribedForProductID(productID);   
    }
};

export default RNNativeSubscriptionModule;
