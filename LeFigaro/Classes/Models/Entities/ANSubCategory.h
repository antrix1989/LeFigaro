#import "_ANSubCategory.h"
#import "ANJSONSerializable.h"

@interface ANSubCategory : _ANSubCategory <ANJSONSerializable>

/**
 Returns asynchronously list of all articles for this sub category.
 @param block The block to execute. The block should have the following argument signature: (NSArray *objects, NSError *error)
 */
- (void)getAllArticlesInBackground:(ANArrayResultBlock)block;

@end
