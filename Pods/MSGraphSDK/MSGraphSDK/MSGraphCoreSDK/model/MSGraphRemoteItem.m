// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphRemoteItem()
{
    MSGraphFile* _file;
    MSGraphFileSystemInfo* _fileSystemInfo;
    MSGraphFolder* _folder;
    NSString* _remoteItemId;
    NSString* _name;
    MSGraphItemReference* _parentReference;
    int64_t _size;
}
@end

@implementation MSGraphRemoteItem

- (MSGraphFile*) file
{
    if(!_file){
        _file = [[MSGraphFile alloc] initWithDictionary: self.dictionary[@"file"]];
    }
    return _file;
}
- (void) setFile: (MSGraphFile*) val
{
    _file = val;
    self.dictionary[@"file"] = val;
}
- (MSGraphFileSystemInfo*) fileSystemInfo
{
    if(!_fileSystemInfo){
        _fileSystemInfo = [[MSGraphFileSystemInfo alloc] initWithDictionary: self.dictionary[@"fileSystemInfo"]];
    }
    return _fileSystemInfo;
}
- (void) setFileSystemInfo: (MSGraphFileSystemInfo*) val
{
    _fileSystemInfo = val;
    self.dictionary[@"fileSystemInfo"] = val;
}
- (MSGraphFolder*) folder
{
    if(!_folder){
        _folder = [[MSGraphFolder alloc] initWithDictionary: self.dictionary[@"folder"]];
    }
    return _folder;
}
- (void) setFolder: (MSGraphFolder*) val
{
    _folder = val;
    self.dictionary[@"folder"] = val;
}
- (NSString*) remoteItemId
{
    return self.dictionary[@"id"];
}
- (void) setRemoteItemId: (NSString*) val
{
    self.dictionary[@"id"] = val;
}
- (NSString*) name
{
    return self.dictionary[@"name"];
}
- (void) setName: (NSString*) val
{
    self.dictionary[@"name"] = val;
}
- (MSGraphItemReference*) parentReference
{
    if(!_parentReference){
        _parentReference = [[MSGraphItemReference alloc] initWithDictionary: self.dictionary[@"parentReference"]];
    }
    return _parentReference;
}
- (void) setParentReference: (MSGraphItemReference*) val
{
    _parentReference = val;
    self.dictionary[@"parentReference"] = val;
}
- (int64_t) size
{
    _size = [self.dictionary[@"size"] longLongValue];
    return _size;
}
- (void) setSize: (int64_t) val
{
    _size = val;
    self.dictionary[@"size"] = @(val);
}
@end
