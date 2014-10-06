#import "ANSubCategory.h"
#import "ANGetAllArticlesForSubCategoryRequest.h"

@interface ANSubCategory ()

@property (strong, nonatomic) ANGetAllArticlesForSubCategoryRequest *getAllArticlesForSubCategoryRequest;

@end

@implementation ANSubCategory

objection_requires(@"getAllArticlesForSubCategoryRequest")

@synthesize getAllArticlesForSubCategoryRequest;

#pragma mark - Public

- (void)getAllArticlesInBackground:(ANArrayResultBlock)block
{
    [self.getAllArticlesForSubCategoryRequest getAllArticlesForSubCategory:self withBlock:block];
}

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.name = dictionary[@"name"];
    self.remoteID = dictionary[@"id"];
}

@end
