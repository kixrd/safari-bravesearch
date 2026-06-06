#import <Foundation/Foundation.h>

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
			@"SuggestionsURLTemplate": @"https://search.brave.com/api/suggest?q={searchTerms}&rich=true",
			@"SuggestionsURLTemplateMac": @"https://search.brave.com/api/suggest?q={searchTerms}&rich=true",
			@"UsesSearchTermsFromFragment": @YES
		};
	}

	return %orig(dictionary, context);
}
%end
