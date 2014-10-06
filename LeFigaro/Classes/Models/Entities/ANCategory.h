#import "_ANCategory.h"
#import "ANJSONSerializable.h"

@interface ANCategory : _ANCategory <ANJSONSerializable>

/**
 Sub categories of this category.
 */
@property (strong, nonatomic) NSArray *subCategories;

/**
 Returns asynchronously list of all categories.
 @param block The block to execute. The block should have the following argument signature: (NSArray *objects, NSError *error)
 */
+ (void)getAllCategoriesInBackground:(ANArrayResultBlock)block;

@end
