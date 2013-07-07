#import <Foundation/Foundation.h>

@class AFHTTPClient;

typedef void(^SuccessBlock)(id response);
typedef void(^FailureBlock)(NSError *error);

@interface Requester : NSObject

- (id)initWithHTTPClient:(AFHTTPClient *)httpClient;

- (void)getPath:(NSString *)path
         params:(NSDictionary *)params
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;

@end
