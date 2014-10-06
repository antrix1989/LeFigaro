// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCategory.h instead.

#import <CoreData/CoreData.h>


extern const struct ANCategoryAttributes {
	__unsafe_unretained NSString *name;
} ANCategoryAttributes;

extern const struct ANCategoryRelationships {
} ANCategoryRelationships;

extern const struct ANCategoryFetchedProperties {
} ANCategoryFetchedProperties;




@interface ANCategoryID : NSManagedObjectID {}
@end

@interface _ANCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ANCategoryID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _ANCategory (CoreDataGeneratedAccessors)

@end

@interface _ANCategory (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
