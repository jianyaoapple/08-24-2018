//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong,nonatomic) NSArray* imageNames;
@property (strong,nonatomic) NSMutableArray *images;

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;

-(NSArray*)imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"mark4"];
    
    return _imageNames;
}


-(NSMutableArray*) images{
    if(!_images) {
        _images = [[NSMutableArray alloc] initWithCapacity:3];
        for(NSString * name in self.imageNames){
            [_images addObject: [UIImage imageNamed:name]];
        }
    }
    return _images;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}

-(NSUInteger) getTotalImages{
    return [self.images count];
}

-(NSString*) getImageNameByIndex:(NSInteger)idx {
    return self.imageNames[(int)idx];
}

-(UIImage*) getImageByIndex:(NSInteger)idx {
    return self.images[(int)idx];
}

@end
