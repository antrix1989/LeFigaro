// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANArticle.m instead.

#import "_ANArticle.h"

const struct ANArticleAttributes ANArticleAttributes = {
	.author = @"author",
	.content = @"content",
	.date = @"date",
	.imageUrl = @"imageUrl",
	.remoteID = @"remoteID",
	.subtitle = @"subtitle",
	.title = @"title",
};

const struct ANArticleRelationships ANArticleRelationships = {
};

const struct ANArticleFetchedProperties ANArticleFetchedProperties = {
};

@implementation ANArticleID
@end

@implementation _ANArticle

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ANArticle" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ANArticle";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ANArticle" inManagedObjectContext:moc_];
}

- (ANArticleID*)objectID {
	return (ANArticleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic author;






@dynamic content;






@dynamic date;






@dynamic imageUrl;






@dynamic remoteID;






@dynamic subtitle;






@dynamic title;











@end
