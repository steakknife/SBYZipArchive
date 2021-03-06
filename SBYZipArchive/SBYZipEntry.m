//
//  SBYZipEntry.m
//  SBYZipArchive
//
//  Created by shoby on 2013/12/30.
//  Copyright (c) 2013 shoby. All rights reserved.
//

#import "SBYZipEntry.h"
#import "SBYZipArchive.h"

@interface SBYZipEntry ()
@property (weak, nonatomic, readwrite)   SBYZipArchive *archive;
@property (copy, nonatomic, readwrite)   NSString *fileName;
@property (assign, nonatomic, readwrite) NSUInteger fileSize;
@property (assign, nonatomic, readwrite) NSUInteger offset;
@end

@implementation SBYZipEntry

- (id)initWithArchive:(SBYZipArchive *)archive
             fileName:(NSString *)fileName
             fileSize:(NSUInteger)fileSize
               offset:(NSUInteger)offset
{
    self = [super init];
    if (self) {
        self.archive            = archive;
        self.fileName           = fileName;
        self.fileSize           = fileSize;
        self.offset             = offset;
    }
    return self;
}

- (NSData *)dataWithError:(NSError *__autoreleasing *)error
{
    return [self.archive dataForEntry:self error:error];
}

- (void)unzipToURL:(NSURL *)url success:(void (^)(NSURL *))success failure:(void (^)(NSError *))failure progress:(void (^)(NSUInteger, NSUInteger))progress
{
    [self.archive unzipEntry:self toURL:url success:success failure:failure progress:progress];
}

@end
