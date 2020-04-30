# SharedInstance

##  create 

```


static LFLGlobalTool *SINGLETON = nil;

static dispatch_once_t onceToken;  //

static bool isFirstAccess = YES;

+ (instancetype)sharedInstance
{
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

```


## destroy

```
+ (void)destroySharedInstance{
    onceToken = 0;
    SINGLETON = nil;
    NSLog(@"destroySharedInstance==%p",SINGLETON);
}

```