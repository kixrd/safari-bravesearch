#import <Foundation/Foundation.h>
@interface WKWebView : UIView
@property (nonatomic, copy, readonly) NSURL *URL;
-(void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^)(id, NSError *))completionHandler;
@end
// Remove ads
#define JAVASCRIPT_STRINGS	"Array.from(document.querySelectorAll('div[data-type=\"ad\"]')).forEach(e => e.remove());" \
							"Array.from(document.querySelectorAll('.snippet[data-type=\"ad\"]')).forEach(e => e.remove());"
%hook WBSSearchProvider
-(id)initWithDictionary:(id)dictionary usingContext:(id)context {
	if ([dictionary[@"ParsecSearchIdentifier"] isEqualToString:@"google_search"]) {
		dictionary = @{
			@"GroupIdentifierQueryStringKey": @"safari_group",
			@"HomepageURLs": @[
				@"https://search.brave.com/"
			],
			@"HostSuffixes": @[
				@".brave.com"
			],
			@"LocalizedName": @"Brave Search", // shows above suggested results in Safari
			@"ParsecSearchEndpointType": @2,
			@"ParsecSearchIdentifier": @"google_search",
			@"ParsecSearchResultType": @9,
			@"ParsecSearchSuggestionIdentifier": @"google_comp",
			@"PathPrefixes": @[
				@"/search"
			],
			// off/moderate/strict
			@"SafeSearchSuffix": @"&safesearch=moderate",
			@"SafeSearchURLQueryParameters": @{
				@"safesearch": @"moderate"
			},
			@"ScriptingName": @"Google",
			@"SearchEngineID": @2,
			@"SearchEngineIdentifier": @"com.brave.search",
			@"SearchURLTemplate": @"https://search.brave.com/search?q={searchTerms}",
			@"SearchURLTemplateIPad": @"https://search.brave.com/search?q={searchTerms}",
			@"SearchURLTemplateIPhone": @"https://search.brave.com/search?q={searchTerms}",
			@"SearchURLTemplateIPodTouch": @"https://search.brave.com/search?q={searchTerms}",
			@"SearchURLTemplateMac": @"https://search.brave.com/search?q={searchTerms}",
			@"ShortName": @"Google",
			@"SuggestionsURLTemplate": @"https://search.brave.com/api/suggest?q={searchTerms}",
			@"SuggestionsURLTemplateMac": @"https://search.brave.com/api/suggest?q={searchTerms}",
			@"UsesSearchTermsFromFragment": @YES
		};
	}
	return %orig(dictionary, context);
}
%end
%hook WKWebView
-(void)_didFinishNavigation:(id *)arg1 {
	%orig;
	if ([self.URL.absoluteString containsString:@"search.brave.com/"]) {
		[self evaluateJavaScript:[NSString stringWithUTF8String:JAVASCRIPT_STRINGS] completionHandler:nil];
	}
}
%end
