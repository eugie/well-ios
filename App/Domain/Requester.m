#import "Requester.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface Requester ()

@property (strong, nonatomic) AFHTTPClient *httpClient;

@end

@implementation Requester

- (id)initWithHTTPClient:(AFHTTPClient *)httpClient {
    self = [super init];
    if (self) {
        self.httpClient = httpClient;
    }
    return self;
}

- (void)getPath:(NSString *)path
         params:(NSDictionary *)params
    withSuccess:(SuccessBlock)success
        failure:(FailureBlock)failure {
    NSURLRequest *request = [self.httpClient requestWithMethod:@"get" path:path parameters:params];
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        success(JSON);
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        failure(error);
                                                    }];

    [operation start];
}

@end
