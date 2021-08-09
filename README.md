# LFLRouter

### 不需要 Load 注册的`URL Router`

> 核心思路：load注册转化为函数映射，不需要启动便注册全部router能力，也不会影响App启动速度

## Example

```objc

    NSString *testString = @"LFL://usr/openuserinfo?name=lfl&type=test";
    [[LFLRouter sharedManger] configModuleWithKey:@"openuserinfo" value:@"LFLAccountTool"]; // 此处为map映射【组件和类名不统一情况使用，一般不需要】

    NSLog(@"Router Result %@",[[LFLRouter sharedManger] openURLString:testString]);

```
## Installation

LFLRouter is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby

  pod 'LFLRouter', :git => 'https://github.com/DevDragonLi/LFLRouter.git'

```

## 核心API如下

>  scheme://描述/打开方式/保留字段/功能标识？参数1=值1&参数2=值2

```
/** AnyClass Object Funcation
 *  Example: input a URL ,return AnyClass Object immediate
 */
+ (nullable id)openURLString:(nullable NSString *)URLString;

/** AnyClass Object Funcation
 *  Example: input a URL ,return AnyClass Object wait result in Block
 */
+ (void)openURLString:(nullable NSString *)URLString
           parameters:(void (^)(void))parameters;

```

### 端组件资源交互

- Example：`Account`组件和`Setting`组件 
	- `Account`组件负责托管头像
	- `Setting`组件负责显示头像

- 需要交互传递图片资源场景
	- `Account`需提供能力使得`Setting`组件可以通过指定 scheme  `URL`获取头像数据
	- `Setting `可以变更`Account `组件头像数据

- 资源数据交互
	- 获取
	- 传递
		- 正常图片资源传递【本地Image资源等】
		- 其他数据类型	

### 获取头像数据：返回字典或者Image Object 

```
    [LFLRouter openURLString:@"LFL://XXX/headerImageInfo"]
    
```

### 组件图片资源传递【本地Image资源等】

-  Account组件
	-  需要有本地`AccountHeaderImage`实现函数响应

- Setting组件获取如下

```
  NSString *openString = [NSString stringWithFormat:@"LFL://XXX/%@",@{@"AccountHeaderImage":[UIImage new]}];
  
 [LFLRouter openURLString:openString] ;   // 返回对应的数据给Setting组件
    
```

### 端与H5交互

> 如果是远端和本地交互，则只建议基本数据类型：String，Bool，Dictionary，Array等。

- 推荐用于简单界面为主。
	- 如果是资源类型可以传递scheme URL包装图片`URL` 
	- 本地函数做支持即可


## Author

> Dragonli_52171@163.com

## License

LFLRouter is available under the MIT license. See the LICENSE file for more info.