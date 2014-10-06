// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANSubCategory.m instead.

#import "_ANSubCategory.h"

const struct ANSubCategoryAttributes ANSubCategoryAttributes = {
	.name = @"name",
	.remoteID = @"remoteID",
};

const struct ANSubCategoryRelationships ANSubCategoryRelationships = {
};

const struct ANSubCategoryFetchedProperties ANSubCategoryFetchedProperties = {
};

@implementation ANSubCategoryID
@end

@implementation _ANSubCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ANSubCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ANSubCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ANSubCategory" inManagedObjectContext:moc_];
}

- (ANSubCategoryID*)objectID {
	return (ANSubCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic remoteID;











@end
