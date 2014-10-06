#import "ANSubCategory.h"
#import "ANApiRequest.h"

@interface ANSubCategory ()

@property (strong, nonatomic) ANApiRequest *apiClient;

@end

@implementation ANSubCategory

objection_requires(@"apiClient")

@synthesize apiClient;

#pragma mark - Public

- (void)getAllArticlesInBackground:(ANArrayResultBlock)block
{
    [self.apiClient getAllArticlesForSubCategory:self withBlock:block];
}

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.name = dictionary[@"name"];
    self.remoteID = dictionary[@"id"];
}

@end
