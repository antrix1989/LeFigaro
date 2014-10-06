// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANArticle.h instead.

#import <CoreData/CoreData.h>


extern const struct ANArticleAttributes {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *imageUrl;
	__unsafe_unretained NSString *remoteID;
	__unsafe_unretained NSString *subtitle;
	__unsafe_unretained NSString *title;
} ANArticleAttributes;

extern const struct ANArticleRelationships {
} ANArticleRelationships;

extern const struct ANArticleFetchedProperties {
} ANArticleFetchedProperties;










@interface ANArticleID : NSManagedObjectID {}
@end

@interface _ANArticle : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ANArticleID*)objectID;





@property (nonatomic, strong) NSString* author;



//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageUrl;



//- (BOOL)validateImageUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteID;



//- (BOOL)validateRemoteID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* subtitle;



//- (BOOL)validateSubtitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _ANArticle (CoreDataGeneratedAccessors)

@end

@interface _ANArticle (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSString*)value;




- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveImageUrl;
- (void)setPrimitiveImageUrl:(NSString*)value;




- (NSString*)primitiveRemoteID;
- (void)setPrimitiveRemoteID:(NSString*)value;




- (NSString*)primitiveSubtitle;
- (void)setPrimitiveSubtitle:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
