// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCategory.m instead.

#import "_ANCategory.h"

const struct ANCategoryAttributes ANCategoryAttributes = {
	.name = @"name",
};

const struct ANCategoryRelationships ANCategoryRelationships = {
};

const struct ANCategoryFetchedProperties ANCategoryFetchedProperties = {
};

@implementation ANCategoryID
@end

@implementation _ANCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ANCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ANCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ANCategory" inManagedObjectContext:moc_];
}

- (ANCategoryID*)objectID {
	return (ANCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;











@end
