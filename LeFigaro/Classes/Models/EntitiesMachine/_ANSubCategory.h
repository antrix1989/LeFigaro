// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANSubCategory.h instead.

#import <CoreData/CoreData.h>


extern const struct ANSubCategoryAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *remoteID;
} ANSubCategoryAttributes;

extern const struct ANSubCategoryRelationships {
} ANSubCategoryRelationships;

extern const struct ANSubCategoryFetchedProperties {
} ANSubCategoryFetchedProperties;





@interface ANSubCategoryID : NSManagedObjectID {}
@end

@interface _ANSubCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ANSubCategoryID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* remoteID;



//- (BOOL)validateRemoteID:(id*)value_ error:(NSError**)error_;






@end

@interface _ANSubCategory (CoreDataGeneratedAccessors)

@end

@interface _ANSubCategory (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveRemoteID;
- (void)setPrimitiveRemoteID:(NSString*)value;




@end
