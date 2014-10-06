#import "ANCategory.h"
#import "ANSubCategory.h"
#import "ANApiGetAllCategoriesRequest.h"

@interface ANCategory ()

@end

@implementation ANCategory

@synthesize subCategories;

#pragma mark - Public

+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block
{
    ANApiGetAllCategoriesRequest *getAllCategoriesRequest = [[JSObjection defaultInjector] getObject:ANApiGetAllCategoriesRequest.class];
    
    [getAllCategoriesRequest getAllCategories:block];
}

#pragma mark - ANJSONSerializable

- (void)readFromDictionary:(NSDictionary *)dictionary
{
    self.name = dictionary[@"category"];

    NSMutableArray *mutableSubCategories = [NSMutableArray new];

    for (NSDictionary *categoryInfo in dictionary[@"subcategories"]) {
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ANSubCategory" inManagedObjectContext:APP_DELEGATE.managedObjectContext];
        ANSubCategory *subCategory = [[ANSubCategory alloc] initWithEntity:entity insertIntoManagedObjectContext:APP_DELEGATE.managedObjectContext];
        [[JSObjection defaultInjector] injectDependencies:subCategory];
        [subCategory readFromDictionary:categoryInfo];

        [mutableSubCategories addObject:subCategory];
    }

    self.subCategories = mutableSubCategories;
}

@end
