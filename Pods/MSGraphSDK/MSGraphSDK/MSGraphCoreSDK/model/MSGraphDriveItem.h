// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphIdentitySet, MSGraphItemReference, MSGraphAudio, MSGraphDeleted, MSGraphFile, MSGraphFileSystemInfo, MSGraphFolder, MSGraphImage, MSGraphGeoCoordinates, MSGraphPhoto, MSGraphRemoteItem, MSGraphSearchResult, MSGraphShared, MSGraphSpecialFolder, MSGraphVideo, MSGraphPackage, MSGraphUser, MSGraphPermission, MSGraphThumbnailSet; 


#import "MSGraphEntity.h"

@interface MSGraphDriveItem : MSGraphEntity

  @property (nonatomic, setter=setCreatedBy:, getter=createdBy) MSGraphIdentitySet* createdBy;
    @property (nonatomic, setter=setCreatedDateTime:, getter=createdDateTime) NSDate* createdDateTime;
    @property (nonatomic, setter=setCTag:, getter=cTag) NSString* cTag;
    @property (nonatomic, setter=setDriveItemDescription:, getter=driveItemDescription) NSString* driveItemDescription;
    @property (nonatomic, setter=setETag:, getter=eTag) NSString* eTag;
    @property (nonatomic, setter=setLastModifiedBy:, getter=lastModifiedBy) MSGraphIdentitySet* lastModifiedBy;
    @property (nonatomic, setter=setLastModifiedDateTime:, getter=lastModifiedDateTime) NSDate* lastModifiedDateTime;
    @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setParentReference:, getter=parentReference) MSGraphItemReference* parentReference;
    @property (nonatomic, setter=setSize:, getter=size) int64_t size;
    @property (nonatomic, setter=setWebDavUrl:, getter=webDavUrl) NSString* webDavUrl;
    @property (nonatomic, setter=setWebUrl:, getter=webUrl) NSString* webUrl;
    @property (nonatomic, setter=setAudio:, getter=audio) MSGraphAudio* audio;
    @property (nonatomic, setter=setDeleted:, getter=deleted) MSGraphDeleted* deleted;
    @property (nonatomic, setter=setFile:, getter=file) MSGraphFile* file;
    @property (nonatomic, setter=setFileSystemInfo:, getter=fileSystemInfo) MSGraphFileSystemInfo* fileSystemInfo;
    @property (nonatomic, setter=setFolder:, getter=folder) MSGraphFolder* folder;
    @property (nonatomic, setter=setImage:, getter=image) MSGraphImage* image;
    @property (nonatomic, setter=setLocation:, getter=location) MSGraphGeoCoordinates* location;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphPhoto* photo;
    @property (nonatomic, setter=setRemoteItem:, getter=remoteItem) MSGraphRemoteItem* remoteItem;
    @property (nonatomic, setter=setSearchResult:, getter=searchResult) MSGraphSearchResult* searchResult;
    @property (nonatomic, setter=setShared:, getter=shared) MSGraphShared* shared;
    @property (nonatomic, setter=setSpecialFolder:, getter=specialFolder) MSGraphSpecialFolder* specialFolder;
    @property (nonatomic, setter=setVideo:, getter=video) MSGraphVideo* video;
    @property (nonatomic, setter=setPackage:, getter=package) MSGraphPackage* package;
    @property (nonatomic, setter=setCreatedByUser:, getter=createdByUser) MSGraphUser* createdByUser;
    @property (nonatomic, setter=setLastModifiedByUser:, getter=lastModifiedByUser) MSGraphUser* lastModifiedByUser;
    @property (nonatomic, setter=setPermissions:, getter=permissions) NSArray* permissions;
    @property (nonatomic, setter=setChildren:, getter=children) NSArray* children;
    @property (nonatomic, setter=setThumbnails:, getter=thumbnails) NSArray* thumbnails;
  
@end
