#import "_ANArticle.h"
#import "ANJSONSerializable.h"

@interface ANArticle : _ANArticle <ANJSONSerializable>

/**
 Loads model's data in background.
 @param block The block to execute. The block should have the following argument signature: (BOOL succeeded, NSError *error)
 */
- (void)loadWithBlock:(ANBooleanResultBlock)block;

@end
