// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDriveItem()
{
    MSGraphIdentitySet* _createdBy;
    NSDate* _createdDateTime;
    NSString* _cTag;
    NSString* _driveItemDescription;
    NSString* _eTag;
    MSGraphIdentitySet* _lastModifiedBy;
    NSDate* _lastModifiedDateTime;
    NSString* _name;
    MSGraphItemReference* _parentReference;
    int64_t _size;
    NSString* _webDavUrl;
    NSString* _webUrl;
    MSGraphAudio* _audio;
    MSGraphDeleted* _deleted;
    MSGraphFile* _file;
    MSGraphFileSystemInfo* _fileSystemInfo;
    MSGraphFolder* _folder;
    MSGraphImage* _image;
    MSGraphGeoCoordinates* _location;
    MSGraphPhoto* _photo;
    MSGraphRemoteItem* _remoteItem;
    MSGraphSearchResult* _searchResult;
    MSGraphShared* _shared;
    MSGraphSpecialFolder* _specialFolder;
    MSGraphVideo* _video;
    MSGraphPackage* _package;
    MSGraphUser* _createdByUser;
    MSGraphUser* _lastModifiedByUser;
    NSArray* _permissions;
    NSArray* _children;
    NSArray* _thumbnails;
}
@end

@implementation MSGraphDriveItem

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.driveItem";
    }
    return self;
}
- (MSGraphIdentitySet*) createdBy
{
    if(!_createdBy){
        _createdBy = [[MSGraphIdentitySet alloc] initWithDictionary: self.dictionary[@"createdBy"]];
    }
    return _createdBy;
}
- (void) setCreatedBy: (MSGraphIdentitySet*) val
{
    _createdBy = val;
    self.dictionary[@"createdBy"] = val;
}
- (NSDate*) createdDateTime
{
    if(!_createdDateTime){
        _createdDateTime = [NSDate ms_dateFromString: self.dictionary[@"createdDateTime"]];
    }
    return _createdDateTime;
}
- (void) setCreatedDateTime: (NSDate*) val
{
    _createdDateTime = val;
    self.dictionary[@"createdDateTime"] = val;
}
- (NSString*) cTag
{
    return self.dictionary[@"cTag"];
}
- (void) setCTag: (NSString*) val
{
    self.dictionary[@"cTag"] = val;
}
- (NSString*) driveItemDescription
{
    return self.dictionary[@"description"];
}
- (void) setDriveItemDescription: (NSString*) val
{
    self.dictionary[@"description"] = val;
}
- (NSString*) eTag
{
    return self.dictionary[@"eTag"];
}
- (void) setETag: (NSString*) val
{
    self.dictionary[@"eTag"] = val;
}
- (MSGraphIdentitySet*) lastModifiedBy
{
    if(!_lastModifiedBy){
        _lastModifiedBy = [[MSGraphIdentitySet alloc] initWithDictionary: self.dictionary[@"lastModifiedBy"]];
    }
    return _lastModifiedBy;
}
- (void) setLastModifiedBy: (MSGraphIdentitySet*) val
{
    _lastModifiedBy = val;
    self.dictionary[@"lastModifiedBy"] = val;
}
- (NSDate*) lastModifiedDateTime
{
    if(!_lastModifiedDateTime){
        _lastModifiedDateTime = [NSDate ms_dateFromString: self.dictionary[@"lastModifiedDateTime"]];
    }
    return _lastModifiedDateTime;
}
- (void) setLastModifiedDateTime: (NSDate*) val
{
    _lastModifiedDateTime = val;
    self.dictionary[@"lastModifiedDateTime"] = val;
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
- (NSString*) webDavUrl
{
    return self.dictionary[@"webDavUrl"];
}
- (void) setWebDavUrl: (NSString*) val
{
    self.dictionary[@"webDavUrl"] = val;
}
- (NSString*) webUrl
{
    return self.dictionary[@"webUrl"];
}
- (void) setWebUrl: (NSString*) val
{
    self.dictionary[@"webUrl"] = val;
}
- (MSGraphAudio*) audio
{
    if(!_audio){
        _audio = [[MSGraphAudio alloc] initWithDictionary: self.dictionary[@"audio"]];
    }
    return _audio;
}
- (void) setAudio: (MSGraphAudio*) val
{
    _audio = val;
    self.dictionary[@"audio"] = val;
}
- (MSGraphDeleted*) deleted
{
    if(!_deleted){
        _deleted = [[MSGraphDeleted alloc] initWithDictionary: self.dictionary[@"deleted"]];
    }
    return _deleted;
}
- (void) setDeleted: (MSGraphDeleted*) val
{
    _deleted = val;
    self.dictionary[@"deleted"] = val;
}
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
- (MSGraphImage*) image
{
    if(!_image){
        _image = [[MSGraphImage alloc] initWithDictionary: self.dictionary[@"image"]];
    }
    return _image;
}
- (void) setImage: (MSGraphImage*) val
{
    _image = val;
    self.dictionary[@"image"] = val;
}
- (MSGraphGeoCoordinates*) location
{
    if(!_location){
        _location = [[MSGraphGeoCoordinates alloc] initWithDictionary: self.dictionary[@"location"]];
    }
    return _location;
}
- (void) setLocation: (MSGraphGeoCoordinates*) val
{
    _location = val;
    self.dictionary[@"location"] = val;
}
- (MSGraphPhoto*) photo
{
    if(!_photo){
        _photo = [[MSGraphPhoto alloc] initWithDictionary: self.dictionary[@"photo"]];
    }
    return _photo;
}
- (void) setPhoto: (MSGraphPhoto*) val
{
    _photo = val;
    self.dictionary[@"photo"] = val;
}
- (MSGraphRemoteItem*) remoteItem
{
    if(!_remoteItem){
        _remoteItem = [[MSGraphRemoteItem alloc] initWithDictionary: self.dictionary[@"remoteItem"]];
    }
    return _remoteItem;
}
- (void) setRemoteItem: (MSGraphRemoteItem*) val
{
    _remoteItem = val;
    self.dictionary[@"remoteItem"] = val;
}
- (MSGraphSearchResult*) searchResult
{
    if(!_searchResult){
        _searchResult = [[MSGraphSearchResult alloc] initWithDictionary: self.dictionary[@"searchResult"]];
    }
    return _searchResult;
}
- (void) setSearchResult: (MSGraphSearchResult*) val
{
    _searchResult = val;
    self.dictionary[@"searchResult"] = val;
}
- (MSGraphShared*) shared
{
    if(!_shared){
        _shared = [[MSGraphShared alloc] initWithDictionary: self.dictionary[@"shared"]];
    }
    return _shared;
}
- (void) setShared: (MSGraphShared*) val
{
    _shared = val;
    self.dictionary[@"shared"] = val;
}
- (MSGraphSpecialFolder*) specialFolder
{
    if(!_specialFolder){
        _specialFolder = [[MSGraphSpecialFolder alloc] initWithDictionary: self.dictionary[@"specialFolder"]];
    }
    return _specialFolder;
}
- (void) setSpecialFolder: (MSGraphSpecialFolder*) val
{
    _specialFolder = val;
    self.dictionary[@"specialFolder"] = val;
}
- (MSGraphVideo*) video
{
    if(!_video){
        _video = [[MSGraphVideo alloc] initWithDictionary: self.dictionary[@"video"]];
    }
    return _video;
}
- (void) setVideo: (MSGraphVideo*) val
{
    _video = val;
    self.dictionary[@"video"] = val;
}
- (MSGraphPackage*) package
{
    if(!_package){
        _package = [[MSGraphPackage alloc] initWithDictionary: self.dictionary[@"package"]];
    }
    return _package;
}
- (void) setPackage: (MSGraphPackage*) val
{
    _package = val;
    self.dictionary[@"package"] = val;
}
- (MSGraphUser*) createdByUser
{
    if(!_createdByUser){
        _createdByUser = [[MSGraphUser alloc] initWithDictionary: self.dictionary[@"createdByUser"]];
    }
    return _createdByUser;
}
- (void) setCreatedByUser: (MSGraphUser*) val
{
    _createdByUser = val;
    self.dictionary[@"createdByUser"] = val;
}
- (MSGraphUser*) lastModifiedByUser
{
    if(!_lastModifiedByUser){
        _lastModifiedByUser = [[MSGraphUser alloc] initWithDictionary: self.dictionary[@"lastModifiedByUser"]];
    }
    return _lastModifiedByUser;
}
- (void) setLastModifiedByUser: (MSGraphUser*) val
{
    _lastModifiedByUser = val;
    self.dictionary[@"lastModifiedByUser"] = val;
}
- (NSArray*) permissions
{
    if(!_permissions){
        
    NSMutableArray *permissionsResult = [NSMutableArray array];
    NSArray *permissions = self.dictionary[@"permissions"];

    if ([permissions isKindOfClass:[NSArray class]]){
        for (id permission in permissions){
            [permissionsResult addObject:[[MSGraphPermission alloc] initWithDictionary: permission]];
        }
    }

    _permissions = permissionsResult;
        
    }
    return _permissions;
}
- (void) setPermissions: (NSArray*) val
{
    _permissions = val;
    self.dictionary[@"permissions"] = val;
}
- (NSArray*) children
{
    if(!_children){
        
    NSMutableArray *childrenResult = [NSMutableArray array];
    NSArray *children = self.dictionary[@"children"];

    if ([children isKindOfClass:[NSArray class]]){
        for (id driveItem in children){
            [childrenResult addObject:[[MSGraphDriveItem alloc] initWithDictionary: driveItem]];
        }
    }

    _children = childrenResult;
        
    }
    return _children;
}
- (void) setChildren: (NSArray*) val
{
    _children = val;
    self.dictionary[@"children"] = val;
}
- (NSArray*) thumbnails
{
    if(!_thumbnails){
        
    NSMutableArray *thumbnailsResult = [NSMutableArray array];
    NSArray *thumbnails = self.dictionary[@"thumbnails"];

    if ([thumbnails isKindOfClass:[NSArray class]]){
        for (id thumbnailSet in thumbnails){
            [thumbnailsResult addObject:[[MSGraphThumbnailSet alloc] initWithDictionary: thumbnailSet]];
        }
    }

    _thumbnails = thumbnailsResult;
        
    }
    return _thumbnails;
}
- (void) setThumbnails: (NSArray*) val
{
    _thumbnails = val;
    self.dictionary[@"thumbnails"] = val;
}

@end
