#include "godotRateIt.h"
#import "app_delegate.h"
#import <StoreKit/StoreKit.h>;

#if VERSION_MAJOR == 3
#define CLASS_DB ClassDB
#else
#define CLASS_DB ctTypeDB
#endif


GodotRateIt::GodotRateIt() {
}

GodotRateIt::~GodotRateIt() {
}

void GodotRateIt::ask_and_rate(const String &message, const String &positive_button_text, const String &negative_button_text, const String &app_id) {
    if (@available(iOS 10.3, *)) {
        [SKStoreReviewController requestReview];
        return;
    }
    NSString *str;
    float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (ver >= 7.0 && ver < 7.1) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", &app_id];
    } else if (ver >= 8.0) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", &app_id];
    } else {
        str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", &app_id];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

void GodotRateIt::_bind_methods() {
    CLASS_DB::bind_method("ask_and_rate",&GodotRateIt::ask_and_rate);
}
