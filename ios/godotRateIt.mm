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
    do_ios_rate(app_id);
}

void GodotRateIt::rate(const String &url_prefix, const String &url_prefix_fallback, const String &id_format, const String &app_id) {
    do_ios_rate(app_id);
}

void GodotRateIt::do_ios_rate(const String &app_id) {
    if (@available(iOS 10.3, *)) {
        [SKStoreReviewController requestReview];
        return;
    }

    NSString *app_id_nsstring = [[[NSString alloc] initWithUTF8String:app_id.utf8().get_data()] autorelease];
    NSString *str;

    float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (ver >= 7.0 && ver < 7.1) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id=%@", app_id_nsstring];
    } else if (ver >= 8.0) {
        str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", app_id_nsstring];
    } else {
        str = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/Webcts/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", app_id_nsstring];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

}

void GodotRateIt::_bind_methods() {
    CLASS_DB::bind_method("ask_and_rate", &GodotRateIt::ask_and_rate);
    CLASS_DB::bind_method("rate", &GodotRateIt::rate);
}
