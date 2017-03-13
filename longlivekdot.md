[TOC]

### 🎃浏览器输入url之后发生了什么

- 输入：优先考虑搜索历史和书签等内容给出建议，Chrome浏览器甚至会提前建立TCP链接

- 按下回车：开始解析url，分析输入的是url还是搜索关键字。

- 如果是url，判断使用了哪种协议，检查HSTS列表，判断该请求是否只能用HTTPS协议。

- 进行DNS查询，先查浏览器缓存，再查host文件，最后查DNS服务器。

- 有了IP地址之后，通过Socket API发送数据，选择采用TCP或UDP协议。先到传输层，封装成TCP Segment，再到网络层，封装成TCP packet（加入ip地址），最后到链路层，加入MAC地址

- 被封装的TCP请求通过wifi或以太网或蜂窝数据网络发出。

- 服务器“处理”请求，服务器接收到获取请求，然后处理并返回一个响应。

- 服务器发回一个HTML响应

- 浏览器开始渲染HTML，并请求外部资源。

- 渲染过程：解析html构建dom树 -> 解析CSS构建CSSOM树 -> 构建render树（只有可见元素） -> 布局render树 -> 绘制render树

- HTML/**SVG**/XHTML，解析这三种文件会产生一个DOM树

- js的下载和执行会阻塞Dom树的构建，脚本标记为**async**或**defer**之后可以滞后执行。

- 样式表必须**在脚本之前**加载和解析，因为脚本可能会在解析的过程中请求样式信息。


  > 1. 处理 HTML 标记并构建 DOM 树。
  > 2. 处理 CSS 标记并构建 CSSOM 树。
  > 3. 将 DOM 与 CSSOM 合并成一个渲染树。
  > 4. 根据渲染树来布局，以计算每个节点的几何信息。
  > 5. 将各个节点绘制到屏幕上。



### 🎃HTML5

- HTML标准的最新版本，加入了新的元素、属性和行为。
- 应用缓存：在html元素上添加manifest特性。生成一个manifest file，当应用需要离线时，浏览器读取这一文件，下载相应的文件，并将其缓存到本地。
- DOM存储：sessionStorage、localStorage
- `<audio>`和`<video>`标签支持新的多媒体内容的操作。
- Web Worker：在后台线程运行脚本。线程可以执行任务而不干扰用户界面。生成操作系统级别的线程，且无法访问非线程安全的组件和DOM。






### 🎃响应式设计

- 媒体查询
- 在网页头部加上viewport标签
- 不使用绝对宽度，使用栅格布局或rem（移动端）
- 字体大小使用em或rem
- 自适应与响应式：
  - 自适应：自动适应不同尺寸的屏幕，布局一般不变。
  - 响应式：根据不同尺寸的屏幕，调整布局。



### 🎃清除浮动

- 添加空的div，css设为`clear: both`
- 在父元素上使用`overflow: hidden`或`overflow: auto`，可以把父元素撑开。
- 使用`:after`伪元素，给父元素加个`:after`，然后这个`:after`里面设置`clear: both`
- 在IE下，为了触发hasLayout，要加上`zoom: 1`。






### 🎃Javascript 单线程、异步请求、异步编程

- 单线程：浏览器进程中只有一个js的**执行线程**，同一时刻只有一段代码在执行。因为js是浏览器脚本语言，强调与用户的实时互动，所以只能单线程。（不允许有两个线程同时操作dom）
- 异步机制：js的**执行线程**发送异步请求，这时浏览器会开一条新的HTTP请求线程（不进入主线程、进入**任务队列**）来执行请求。js线程继续执行线程队列中剩下的其他任务。然后在未来的某一时刻事件触发线程监视到之前之前的HTTP请求已完成，就会把完成事件插入到js执行队列的尾部等待js处理。
- 异步编程的四种办法：
  - 回调函数：简单，容易理解和部署。但不利于代码的维护，各个部分高度耦合。
  - 事件监听：有利于实现模块化。但整个程序都要变成事件驱动型，运行流程会变得很不清晰。
  - 发布/订阅（观察者模式）：f1向”信号中心“发布信号，f2订阅”信号中心“的该信号。
  - Promise对象：回调函数变成了链式写法，且有一整套的配套方案，功能强大（then,fail,all,race）
- setTimeout()将事件插入"任务队列"，必须等到当前代码（执行栈）执行完，主线程才会去执行它指定的回调函数。要是当前代码耗时很长，有可能要等很久，所以并没有办法保证，回调函数一定会在setTimeout()指定的时间执行。




### 🎃跨域问题

- 设置document.domain，使得主域名但不同子域名下的页面可以相互操作。

  - 只能通过iframe进行页面嵌套才能实现页面互操作。
  - 只能从子域设置到主域。

- 有src的标签

  - 所有具有src属性的HTML标签都是可以跨域的，包括img，script
  - 只能用于GET方法

- JSONP

  - `<script>`是可以跨域的，且可以在跨域脚本中直接回调当前脚本的函数。
  - 需要创建一个DOM对象并且添加到DOM树，且只能用于GET方法

- navigation对象

  - iframe之间是共享navigator对象的，用它来传递信息
  - IE6/7

- 跨域资源共享CORS

  - 服务器设置`Access-Control-Allow-Origin`HTTP响应头之后，浏览器将会允许跨域请求
  - 浏览器需要支持HTML5。可以支持POST，PUT等方法。

- window.postMessage

  - HTML5允许窗口之间发送消息
  - 浏览器需要支持HTML5，获取窗口句柄后才能相互通信。

  ```javascript
  // URL: http://a.com/foo
  var win = window.open('http://b.com/bar');
  win.postMessage('hello, bar.', 'http://b.com')

  // URL: http://b.com/bar
  window.addEventListener('message', function(event){
    console.log(event.data)
  })
  ```

  ​

### 🎃XMLHttpRequest新老版本的对比

- 老版本：只能传递纯文本数据，没有进度信息，同域限制

- 新版本：可通过FormData管理表单数据、传递二进制文件，有进度信息，可跨域。

- 写一个XMLHttpRequest：

  ```javascript
  if(window.XMLHttpRequest) {
    var request = new XMLHttpRequest()
  } else if (window.ActiveXObject("Microsoft.XMLHTTP")) {
    var request = new ActiveXObject("Microsoft.XMLHTTP")
  }

  request.open("GET", url, true)

  request.onreadystatechange = function() {
    if (request.readyState == 4) {
      if (request.status == 200 || request.status == 302) {
        console.log(request.responseText)
      }
    }
  }

  request.send()

  // readyState的5种状态：
  // 0 - UNSENT : open()尚未调用
  // 1 - OPENED : open()已调用
  // 2 - HEADERS_RECEIVED : send()已调用，收到response的header
  // 3 - LOADING : 正在接收response的body
  // 4 - DONE : 响应完成
  ```

  ​




### 🎃事件代理

- 父节点代理子节点的事件，通过事件冒泡机制实现。
- 当事件被抛到更上层的父节点时候，通过检查事件的目标对象（target）来判断并获取事件源。
- 事件捕获：顶层对象发出一个事件流，随着DOM树的节点向目标元素流去，过程中事件的相应监听函数不会被触发，直到捕获到目标之后，才会触发对应的监听函数。



### 🎃HTTP缓存

##### ETag

- 服务器返回响应式，在HTTP头部塞入ETag字段。（通常是文件内容的Hash值或某个其他指纹）
- ETag可实现高效的资源更新检查：资源未发生变化时不会传送任何数据。
- 客户端在下一次请求时将ETag发送给服务器，如果指纹仍然相同，则表示资源没有发生变化，可以跳过下载

##### Cache-Control

- 定义浏览器如何缓存以及缓存多久。

- Cache-Control是在HTTP/1.1中定义的，取代了之前的Expires等。

- no-cache：先与服务器确认ETag是否一致，如果一致则利用缓存，反之重新获取。

- no-store：不使用缓存。（个人隐私数据或银行业务数据）

- max-age：缓存时间。

- public&private：public不是必须的，private表示只有浏览器可以缓存，中间件（CDN）不能对该资源进行缓存。（CDN：内容分发网络，采用缓存机制，将缓存服务器分布到用户访问相对集中的地区或网络中，使用户就近取得资源）

- 废弃和更新缓存中的资源：

  > 对整个网站采用no-cache机制，然后，在css和js文件的url中，加入文件的fingerprint信息，这样，文件内容发生变化之后，url也会发生变化，浏览器就知道要去重新向服务器请求资源了。文件内容不发生变化时，max-age可以设置一个很长的时间，然后对一些涉及安全内容的js文件，Cache-Control设为private。
  >
  > 即：组合使用ETag，Cache-Control和唯一网址来实现一举多得：较长的过期时间、控制可以缓存的位置、随需更新。


##### Expires

在expires规定的时间内，直接读取缓存。如果与Cache-Control同时设置的话，**优先级低于**Cache-Contro



##### 强缓存与协商缓存

- 强缓存：如果命中强缓存，直接读取资源，不发送http请求
- 协商缓存：当强缓存没命中时，会发送请求给服务器，通过http header内的信息验证是否命中协商缓存，如果命中，则从浏览器读取，如果没有命中，则服务器返回资源。
- 强缓存的实现方法：Expires和Cache-Control的max-age
- 协商缓存的实现方法：【Last-Modified, If-Modified-Since】和【ETag, If-None-Match】。以ETag为例，response的header里，会塞入ETag，浏览器下次请求的时候，request的header里把上一次response的ETag值塞到If-None-Match字段，然后服务器会进行比对。



##### CDN缓存

一种服务器端缓存，也叫网关缓存、反向代理缓存。浏览器先向CDN网关发起WEB请求，网关服务器后面对应着一台或多台负载均衡源服务器，会根据它们的负载请求，动态地请求转发到合适的源服务器上。



##### 基于依赖关系表的静态资源管理系统与模块化框架设计

- 将静态资源按模块进行分类，生成一张map（资源表），map中是资源名称与资源url的映射。

- 实现按需加载资源的接口，一个负责收集静态资源，一个负责加载功能组件，一个负责加载脚本。

- 资源表上新增了一个字段，取名为 `pkg`，就是资源合并生成的新资源。记录打包后的文件所包含的独立资源。

  > 在查表的时候，如果一个静态资源有pkg字段，那么就去加载pkg字段所指向的打包文件，否则加载资源本身。

```json
{
    "res" : {
        "widget/a/a.css" : "/widget/a/a_1688c82.css",
        "widget/a/a.js"  : "/widget/a/a_ac3123s.js",
        "widget/b/b.css" : "/widget/b/b_52923ed.css",
        "widget/b/b.js"  : "/widget/b/b_a5cd123.js",
        "widget/c/c.css" : "/widget/c/c_03cab13.css",
        "widget/c/c.js"  : "/widget/c/c_bf0ae3f.js",
        "jquery.js"      : "/jquery_9151577.js",
        "bootstrap.css"  : "/bootstrap_f5ba12d.css",
        "bootstrap.js"   : "/bootstrap_a0b3ef9.js"
    },
    "pkg" : {
        "p0" : {
            "url" : "/pkg/lib_cef213d.js",
            "has" : [ "jquery.js", "bootstrap.js" ]
        },
        "p1" : {
            "url" : "/pkg/lib_afec33f.css",
            "has" : [ "bootstrap.css" ]
        },
        "p2" : {
            "url" : "/pkg/widgets_22feac1.js",
            "has" : [
                "widget/a/a.js",
                "widget/b/b.js",
                "widget/c/c.js"
            ]
        },
        "p3" : {
            "url" : "/pkg/widgets_af23ce5.css",
            "has" : [
                "widget/a/a.css",
                "widget/b/b.css",
                "widget/c/c.css"
            ]
        }
    }
}
```




### 🎃性能优化

- 制定合理的缓存策略
  - 服务器在返回的头部提供ETag。
  - 组合使用ETag，Cache-Control、唯一网址。
  - 对于更新频繁的资源文件，将其独立开来。保证可以从缓存中读取的资源最大化。

- 防止CSS阻塞渲染

  - 默认情况下CSS是阻塞渲染的，可以通过媒体类型和媒体查询将CSS资源标记为不阻塞的

  - 浏览器会下载所有的CSS资源，无论阻塞还是不阻塞，不阻塞的下载优先级比较低。（所以性能优化在此处仅跟渲染引擎有关）

  - Flash of Unstyled Content (FOUC) : 内容样式短暂失效。指不阻塞CSS的情况下渲染出来的页面。

  - 媒体查询解决阻塞渲染：

    ```css
    <link href="style.css" rel="stylesheet">
    <link href="print.css" rel="stylesheet" media="print">
    <link href="other.css" rel="stylesheet" media="(min-width: 40em)">
    ```

    第一个阻塞，第二个只在打印内容时阻塞，第三个只在符合条件后才阻塞。

- `script`标签添加`async`属性（下载完就执行）或`defer`属性（渲染完再执行），将脚本标记为异步，则不会阻塞DOM构建。

- img**不会**阻塞页面的首次渲染。关键渲染路径，通常是指HTML，CSS和JavaScript

- 关键渲染路径的优化：

  - 首选异步加载JavaScript资源
  - 延迟解析对首次渲染无关紧要的JavaScript脚本
  - 将CSS置于head标签内，以便浏览器尽早发出css请求。
  - 避免css import，这回增加关键路径的往返次数：只有在解析到`@import a.css`时才会去请求a.css。
  - 内敛阻塞渲染的css，这样会减少一次css请求。

- 优化JavaScript的执行

  - 动画效果使用requestAnimationFrame，避免使用setTimeout和setInterval
  - 将长时间运行的JavaScript从主线程移到Web Worker

- HTTP/2

  - 支持header字段压缩
  - 支持为请求设置优先级
  - 使用二进制消息分帧。
  - 三个概念：数据流、消息、帧。

  > - 所有通信都在一个TCP连接上完成，此连接可以承载多个双向数据流。
  > - 每个数据流都有一个唯一的标识符和可选的优先级信息。
  > - 每条消息都是一条HTTP请求或HTTP响应，包含一个或多个帧。
  > - 帧是最小的通信单位，里面装的可能是HTTP标头，也可能是payload。
  > - 来自不同数据流的帧可以交错发送。




### 🎃按需加载

- `import()`：一种类似`require`的运行时加载。
- webpack + react-router
  - Route标签中，getComponent替换component，用于异步加载。
  - 将资源分类打包，分成不同的chunk。
  - 使用`require.ensure`，在运行时按需加载需要的资源。







### 🎃计算机网络

##### HTTP协议

- Transfer-Encoding: chunked
  - 表明request或response的content-length是未知的，消息体由数量为定的块组成。
  - 以最后一个大小为0的块作为传输结束的标志。
  - 启用Keep-live模式后，两种判断传输完成的方法：1. 传输长度满足Content-Length（静态页面或图片）2. chunked模式（动态页面）
- 会话跟踪：session的实现依赖于Cookie，sessionID放到cookie中传给client。
- 如何防范跨站攻击（CSRF）
  - 关键操作只接受POST请求
  - 验证码
  - 检测Referer
  - Token：足够随机，一次性，保密性。
- 如何防范跨站脚本攻击（XSS）：过滤用户输入。




##### TCP协议

- 建立连接时：3次握手

  1. Client发送连接请求报文`(SYN=1, seq=client_isn)`

  2. Server接收连接请求，回复ACK报文，然后为连接分配资源。

     `(SYN=1, seq=server_isn) （ack=client_isn+1）`

  3. Client接收ACK报文，也向Server发送ACK报文，然后为连接分配资源。

     `(SYN=0, seq=client_isn+1) (ack=server_isn+1)`

- 断开连接时：4次握手（下面假设是client发起连接中断）

  1. Client发起中断请求，发送FIN报文。
  2. Server收到FIN报文后，回复ACK报文。（可能数据还没传完，所以先ACK。Client进入FIN_WAIT状态）
  3. Server传完数据后，回复FIN报文。
  4. Client收到Server的FIN报文后，向Server发送ACK报文，然后进入TIME_WAIT状态。经过2MSL时间后，Client进入CLOSED状态。（MSL：最大报文生存时间）



##### Socket编程

- Socket是一种门面模式，它把复杂的TCP/IP协议隐藏在Socket接口后面，用来和应用层通信。
- 是网络间不同计算机上的**进程通信**的一种方法。




### 🍪React-Redux

##### Provider
- 在原应用组件上包裹一层，使原来整个应用成为Provider的子组件
- 接受Redux的store作为props，**通过context**传递给子组件。（Context相当于一个独立的空间，父组件通过getChildContext()向该空间写值。子组件通过this.context.xxx读取）

##### Connect
- 返回一个wrapContent的function，内部对store上的state、action、原组件上的props进行**merge**，传递给原组件。
- **监听**store tree的变化。通过store.subscribe(listener)注册一个监听器。在Connect组件didMount时注册，willUnmount时注销。
- Connect组件中维护了一个**this.state.storeState**，store发生变化时，Connect更新自己的state，内部的子组件得到重新render。
- mapStateToPros, mapDispatchToProps的返回值都是需要merge进props的state和action （出现同名，后者优先）



### 🍪Redux

##### store的概念

通过createStore(reducer)创建。（闭包思想）
```javascript
export default function createStore(reducer, initialState) {
  // 这些都是闭包变量
  var currentReducer = reducer
  var currentState = initialState
  var listeners = []
  var isDispatching = false;

  // 返回当前的state
  function getState() {
    return currentState
  }

  // 注册listener，同时返回一个取消事件注册的方法
  function subscribe(listener) {
    listeners.push(listener)
    var isSubscribed = true

    return function unsubscribe() {
      if (!isSubscribed) {
	     return
      }
      isSubscribed = false
      var index = listeners.indexOf(listener)
      listeners.splice(index, 1)
    }
  }

  ...
  
  return {
    dispatch,
    subscribe, // store更新后的回调函数
    getState,
    replaceReducer
  }
}
```

subscribe的方法的返回值是一个**unsubscribe**方法。redux采用观察者模式，当store tree更新后，**依次执行**subscribe里面的所有listener。

##### bindActionCreator

对dispatch进行一层封装，函数式编程思想，将多参数模式，转化为单参数模式。

```javascript
function bindActionCreator(actionCreator, dispatch) {
  return (...args) => dispatch(actionCreator(...args))
}

export default function bindActionCreators(actionCreators, dispatch) {
  if (typeof actionCreators === 'function') {
    return bindActionCreator(actionCreators, dispatch)
  }
  return mapValues(actionCreators, actionCreator =>
    bindAQctionCreator(actionCreator, dispatch)
  )
}
```

##### Middleware
像 redux-thunk 或 redux-promise 这样支持异步的 middleware 都包装了 store 的 dispatch() 方法，以此来让你 dispatch 一些除了 action 以外的其他内容，例如：函数或者 Promise。你所使用的任何 middleware 都可以以自己的方式解析你 dispatch 的任何内容，并继续传递 actions 给下一个 middleware。

当 middleware 链中的最后一个 middleware 开始 dispatch action 时，这个 action 必须是一个普通对象。这是 同步式的 Redux 数据流 开始的地方（译注：这里应该是指，你可以使用任意多异步的 middleware 去做你想做的事情，但是需要使用普通对象作为最后一个被 dispatch 的 action ，来将处理流程带回同步方式）。



### 6️⃣Class

```javascript
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}
```

- 类的所有方法都定义在类的prototype上

  ```javascript
  Point.toString === Point.prototype.toString

  Point === Point.prototype.constructor
  // prototype对象的constructor属性，直接指向类本身
  ```

- 类的属性名，可以采用表达式

  ```javascript
  let methodName = "getArea";
  class Square{
    constructor(length) {
      // ...
    }

    [methodName]() {
      // ...
    }
  }
  ```

- 可以通过类的实例的`__proto__`属性，为Class添加方法

  ```javascript
  var p1 = new Point(2,3);
  var p2 = new Point(3,2);

  p1.__proto__.printName = function () { return 'Oops' };

  p1.printName() // "Oops"
  p2.printName() // "Oops"

  var p3 = new Point(4,2);
  p3.printName() // "Oops"
  ```

- 使用Symbol可以实现类的**私有方法**

  ```javascript
  const bar = Symbol('bar');
  const snaf = Symbol('snaf');

  export default class myClass{

    // 公有方法
    foo(baz) {
      this[bar](baz);
    }

    // 私有方法
    [bar](baz) {
      return this[snaf] = baz;
    }

    // ...
  };

  // export暴露的只有myClass，Symbol是取不到的。
  ```

- 类中的this问题：

  ```javascript
  class Logger {
    printName(name = 'there') {
      this.print(`Hello ${name}`);
    }

    print(text) {
      console.log(text);
    }
  }

  const logger = new Logger();
  const { printName } = logger;
  printName(); // 会报错，因为单独使用时，this指向运行时所在的环境。

  //解决办法：
  // 1. 在constructor里面bind
  class Logger {
    constructor() {
      this.printName = this.printName.bind(this);
    }

    // ...
  }

  // 2. 箭头函数
  class Logger {
    constructor() {
      this.printName = (name = 'there') => {
        this.print(`Hello ${name}`)
      }
    }
  }

  // 3. Proxy
  // 申明一个修改原Class的get行为的Proxy，在这个Proxy种，对target进行this的绑定。
  ```

- Class的继承：`super`用来调用父类的方法。子类必须在constructor内部调用`super()`。因为子类没有this对象，而是继承父类的this对象。如果不调用，子类得不到this对象。

- Class的static方法，不会被实例继承，只能通过调用类来使用。

  ```javascript
  class Foo {
    static classMethod() {
      return 'hello';
    }
  }

  Foo.classMethod() // 'hello'

  var foo = new Foo();
  foo.classMethod()
  // TypeError: foo.classMethod is not a function
  ```

- ES6中，Class没有静态属性这种说法。





### 6️⃣Module

- CommonJS：运行时加载。

  ```javascript
  // CommonJS模块
  let { stat, exists, readFile } = require('fs');

  // 等同于
  let _fs = require('fs');
  let stat = _fs.stat;
  let exists = _fs.exists;
  let readfile = _fs.readfile;

  // 会加载fs的所有方法。无法做静态优化。
  ```

- `import`：

  - 编译时加载。在编译阶段执行import语句。
  - 按需加载。只import大括号内需要的东西。
  - 具有**提升效果**。
  - 是**Singleton**模式。对同一个模块多次import，只会执行一次。

- `export`：输出一个function或变量时，要加`{}`

  ```javascript
  export function f() {};
  // or
  function f() {}
  export {f}

  //如果直接export f 会报错。
  ```

- ES6的模块加载与CommonJS的区别：

  - CommonJS输出的是值的**拷贝**，模块内部的变化不会影响这个值。且CommonJS会对输出的值做**缓存**。

  - ES6输出的是值的**引用**，相当于UNIX的**符号链接**。不做缓存，是动态引用。

  - Node加载ES6模块的路径问题：

    ```javascript
    import './foo';
    // 依次寻找
    //   ./foo.js
    //   ./foo/package.json
    //   ./foo/index.js

    import 'baz';
    // 依次寻找
    //   ./node_modules/baz.js
    //   ./node_modules/baz/package.json
    //   ./node_modules/baz/index.js
    // 寻找上一级目录
    //   ../node_modules/baz.js
    //   ../node_modules/baz/package.json
    //   ../node_modules/baz/index.js
    // 再上一级目录
    ```

- CommonJS模块加载原理：

  - CommonJS中，一个模块就是一个脚本文件。

  - `require`命令第一次加载该脚本，会在内存中生成一个对象：

    ```json
    {
      id: '...',
      exports: { ... },   // 模块输出的各个接口
      loaded: true,       // 脚本是否执行完毕
      ...
    }
    ```

  - 后面无论加载多少次，都是从系统缓存里读取。

### 6️⃣Generator

- 状态机的概念，内部封装多个状态。
- 执行Generator函数会返回一个遍历器对象，遍历器可以依次遍历Generator函数内部的各个状态。
- Generator可以没有yield语句，这时就变成了一个单纯的暂缓执行函数。
- Generator作为遍历器生成函数，可以直接复制给`[Symbol.iterator]`


##### 使用Generator实现协程

- 异步任务的封装

  ```javascript
  var fetch = require('node-fetch');

  function* gen(){
    var url = 'https://api.github.com/users/github';
    var result = yield fetch(url);
    console.log(result.bio);
  }

  // 执行：

  var g = gen();
  var result = g.next();

  result.value.then(function(data){
    return data.json();
  }).then(function(data){
    g.next(data);
  });
  ```

  上面代码中，首先执行 Generator 函数，**获取遍历器对象**，然后使用`next`方法（第二行），执行异步任务的**第一阶段**。由于`Fetch`模块返回的是一个**Promise对象**，因此要用`then`方法调用下一个`next`方法。



### 6️⃣Thunk函数

- 一种“传名调用”的实现策略。

  - 传名调用：参数在被使用的时候才会计算。
  - 传值调用：参数传入的时候，就会被计算。

  ```javascript
  // 正常版本的readFile（多参数版本）
  fs.readFile(fileName, callback);

  // Thunk版本的readFile（单参数版本）
  var Thunk = function (fileName) {
    return function (callback) {
      return fs.readFile(fileName, callback);
    };
  };

  var readFileThunk = Thunk(fileName);
  readFileThunk(callback);
  ```

  `fs`模块的`readFile`方法是一个多参数函数，两个参数分别为文件名和回调函数。经过转换器处理，它变成了一个**单参数函数**，只接受回调函数作为参数。这个单参数版本，就叫做**Thunk函数**。



### 6️⃣async函数

- 用async替代*，用await替代yield，其他和Generator一样

- 是Generator的语法糖，不用手动执行next()，和普通函数一样执行。

- 返回值是一个promise。

  ```javascript
  async function f() {
    return 'hello world';
  }

  f().then(v => console.log(v))
  // "hello world"


  // 例子2：
  async function getTitle(url) {
    let response = await fetch(url);
    let html = await response.text();
    return html.match(/<title>([\s\S]+)<\/title>/i)[1];
  }
  getTitle('https://tc39.github.io/ecma262/').then(console.log)
  // "ECMAScript 2017 Language Specification"
  ```

- await命令后面是一个Promise对象。如果不是，会被转成一个立即resolve的Promise对象。

- async函数的实现原理：Generator函数和自动执行器。

  ```javascript
  function spawn(genF) {
    return new Promise(function(resolve, reject) {
      var gen = genF();
      function step(nextF) {
        try {
          var next = nextF();
        } catch(e) {
          return reject(e);
        }
        if(next.done) {
          return resolve(next.value);
        }
        Promise.resolve(next.value).then(function(v) {
          step(function() { return gen.next(v); });
        }, function(e) {
          step(function() { return gen.throw(e); });
        });
      }
      step(function() { return gen.next(undefined); });
    });
  }
  ```

  ​




### 6️⃣Iterator

- 三类数据结构原生具备Iterator接口：数组、某些类似数组的对象、Set和Map结构。
- [Symbol.iterator]，是一个预定义好的、类型为Symbol的特殊值，所以放在方括号内。数据结构只要带有这个属性，就是可遍历的。这个属性本质上是一个function，执行后得到遍历器。

```javascript
let arr = ['a', 'b', 'c']
let iter = arr[Symbol.iterator]()

iter.next() // { value: 'a', done: false}
iter.next() // { value: 'b', done: false}
iter.next() // { value: 'c', done: false}
iter.next() // { value: undefined, done: true}
```

- 用Iterator实现指针结构。

```javascript
function Obj (value) {
  this.value = value;
  this.next = null;
}

Obj.prototype[Symbol.iterator] = function() {
  let iterator = {
    next: next
  }
  
  let current = this
  
  function next() {
    if(current){
      let value = current.value
      current = current.next
      return {value, done: false}
    }else{
      return {done: true}
    }
  }
  
  return iterator
}

let one = new Obj(1)
let two = new Obj(2)
let three = new Obj(3)

one.next = two
two.next = three

for (let i of one){
  console.log(i)
}
```

- 解构赋值，扩展运算符，会默认调用对象的Iterator接口。所以，任何可遍历的对象，都可以变成数组。

```javascript
let arr = [...iterable]
```





### 6️⃣for…of...

- 和for...in一样简洁，但for...in主要为遍历对象而设计，不适用于遍历数组
- 可以break，continue和return，forEach做不到。
- 通用于数组，set，map

### 6️⃣Promise

- Promise新建后就会立即执行
- then方法接受两个回调函数作为参数，第一个resolve时使用，第二个reject时使用，第二个可以省略。
- catch方法等于then(null,func)
- Promise.all([p1,p2,p3,...])，全部resolve的话，所有结果组成数组传递给then，其中一个rejected，就跳出了。
- Promise.reace([p1,p2,p3,...])，p1、p2、p3之中有一个实例率先改变状态，p的状态就跟着改变。那个率先改变的Promise实例的返回值，就传递给p的回调函数。
- Promise.resolve()，将现有对象变为Promise对象。且状态为resolved。



### 6️⃣Reflect

- 将Object对象的一些明显**属于语言内部的方法**，放到Reflect对象上。
- 修改某些Object方法的返回结果，让其变得**更合理**（原来会报错的方法，现在会返回false，就不需要try catch了）
- 让object的操作都变成**函数行为**。比如name in obj和delete obj[name]，让他们变成函数行为Reflect.deleteProperty(obj,name)
- 不管Proxy怎么修改默认行为，你总可以在Reflect上**获取默认行为**。




### 6️⃣Set & Map

- WeakSet的成员只能是对象。弱引用对象，无法遍历。WeakMap只接受对象作为key，同样弱引用，当键被回收后，键值对自动移除。**有助于防止内存泄露**
- Map，一种更完善的hash结构。任何类型都可以成为key或value。
- Map中，key直接和内存地址绑定，内存地址不一样，key就不一样。可以解决同名属性碰撞问题。
- Map可以遍历，keys(), values(), entries(), forEach()


```javascript
for ( let [key, value] of map.entries()) {
  ...
}
// 等同于
for ( let [key, value] of map) {
  ...
}
```



### 6️⃣Proxy

一种JavaScript的函数重载。
```javascript
var proxy = new Proxy({}, {
  get: function(target, property) {
    return 35;
  }
});

proxy.time // 35
proxy.name // 35
proxy.title // 35
```
Proxy代理的情况下，this指向Proxy代理。



### 🏁\_\_proto\_\_ & prototype

`__proto__`: 一种属性，每个对象都有这个属性，指向该对象的原型对象

`prototype`: 只有function才有。用来存储要被继承的属性和方法。是function的一个属性，里面包含一个对象。`DOG.prototype = {species: '犬科'}`

`Object.prototype.__proto__ === null`: Object.prototype是原型链的顶端

`Function.prototype === Function.__proto__`: 都指向Function.prototype(JS标准的内置对象)

`Function.prototype.__proto__ = Object.prototype`: JS标准的内置对象的原型是Object.prototype



### 🏁Built-In Type Methods

Briefly, there is a String (capital S) object wrapper form, typically called a "native," that pairs with the primitive string type; it's this object wrapper that defines the toUpperCase() method on its prototype.



### 🏁Truthy & Falsy

The specific list of "falsy" values in JavaScript is as follows:

- "" (empty string)
- 0, -0, NaN (invalid number)
- null, undefined
- false

Any value that's not on this "falsy" list is "truthy."



### 🏁Hoisting

Wherever a var appears inside a scope, that declaration is taken to belong to the entire scope and accessible everywhere throughout.

Metaphorically, this behavior is called hoisting, when a var declaration is conceptually "moved" to the top of its enclosing scope.



### 🏁Function Scope and Block Scope

``var`` will be hoisted in block scope, but ``let`` won't



### 🏁Switch Case

If you omit break from a case, and that case matches or runs, execution will continue with the next case's statements regardless of that case matching. This so called "fall through" is sometimes useful/desired
```javascript
switch (a) {
    case 2:
    case 10:
        // some cool stuff
        break;
    case 42:
        // other stuff
        break;
    default:
        // fallback
}
```
if a is either 2 or 10, it will execute the "some cool stuffff" code statements.



### 🏁Modules

The most common usage of **closure** in JavaScript is the **module** pattern. Modules let you define **private** implementation details (variables, functions) that are hidden from the outside world, as well as a public API that is accessible from the outside.



### 🏁Prototypes

When you reference a property on an object, if that property doesn't exist, JavaScript will automatically use that object's internal prototype reference to find another object to look for the property on. You could think of this almost as a fallback if the property is missing.

The most common way this feature is used -- and I would argue, abused -- is to try to emulate/fake a "class" mechanism with "inheritance."



### 🏁NaN

**NaN** value is the only one that would make x !== x be true.





### 🔨正则表达式

- `*`：0次或多次

- `+`：1次或多次

- `?`：0次或1次，如果紧跟在任何量词`*`、`+`、`?`、`{}`的后面，将会使量词变为非贪婪的，匹配尽量少的字符。

  ```javascript
  regx1 = /\d+/
  regx1.exec("123abc") = [ '123', index: 0, input: '123abc' ]

  regx2 = /\d+?/
  regx2.exec("123abc") = [ '1', index: 0, input: '123abc' ]
  ```

- `.`：匹配除换行符之外的任何单个字符。

- `(x)`：匹配x并记住x，括号被称为捕获括号。

  ```javascript
  'bar,foo'.replace(/(...),(...)/,'$2,$1') = 'foo,bar'
  ```

- `(?:foo)`：匹配foo但不记住foo，单纯的将foo括起来，作为一个整体

- `Jack(?=Sprat)`：匹配Jack当且仅当Jack后面跟着Sprat。（正向肯定查找）

- `[]`：字符集和，匹配方括号中的任意字符，包括转义序列，即`.`和`*`等在方括号中不用转义。





### 🔨var,let,const的一点小细节

- `for…of`循环中，`const`和`let`每次循环都会生成一个新的绑定，`var`只生成一个。

- 普通for循环中，`const`不能用来申明循环的下标。

- 暂时性死区：只要块级作用域内存在`let`命令，它所声明的变量就“绑定”（binding）这个区域，不再受外部的影响。

  ```javascript
  var tmp = 123;

  if (true) {
    tmp = 'abc'; // ReferenceError
    let tmp;
  }

  // 存在全局变量tmp，但是块级作用域内let又声明了一个局部变量tmp，导致后者绑定这个块级作用域，所以在let声明变量前，对tmp赋值会报错。
  ```





### 🔨debounce、throttle、requestAnimationFrame

- debounce：把触发非常频繁的事件（比如按键）合并成一次执行。

  - 典型例子：autocomplete，等用户停止输入之后再发送请求。

  - 实现：

    ```javascript
    function debounce(fn, delta) {
      var timeoutID = null;
     
      return function() {
        clearTimeout(timeoutID);

        // 保存函数调用时的上下文和参数
        var context = this；
        var args = arguments;
        
        timeoutID = setTimeout(function() {
          fn.apply(context, args);
        }, delta);
      };
    }
    ```

    ​

- throttle：保证每 X 毫秒恒定的执行次数。

  - 典型列子：页面底部的载入更多。

  - 与debounce的区别：_.throttle(func,300) 300ms内，func至少执行一次。

  - 实现：

    ```javascript
    function throttle(fn,threshhold){
      var last  		//记录上次运行时间
      var timeoutID  	//定时器
      
      threshhold || (threshhold = 250)
      
      return function(){
        
        var context = this
        var args = arguments
        
        var now = Date.now()
        
        if(last && now < last + threshhold){
          clearTimeout(timeoutId)
          
          timeoutId = setTimeout(function(){
            last = now
            fn.apply(context,args)
          },threshhold)     
        }else{
          last = now
          fn.apply(context,args)
        }
      }
    }
    ```

    ​

- requestAnimationFrame：可替代 throttle ，函数需要重新计算和渲染屏幕上的元素时，想保证动画或变化的平滑性，可以用它。但需要手动控制动画的开始和结束。



### 🔨解决setTimeout的this问题

```javascript
myArray = ['zero', 'one', 'two'];
myArray.myMethod = function (sProperty) {
    alert(arguments.length > 0 ? this[sProperty] : this);
};

myArray.myMethod(); // prints "zero,one,two"
myArray.myMethod(1); // prints "one"


setTimeout(myArray.myMethod, 1000); // prints "[object Window]" after 1 second
setTimeout(myArray.myMethod, 1500, '1'); // prints "undefined" after 1.5 seconds
```

在不使用bind的情况下，setTimeout里面的这个function，this默认指向window。

解决办法：

```javascript
setTimeout(function(){myArray.myMethod()}, 2000); // prints "zero,one,two" after 2 seconds
setTimeout(function(){myArray.myMethod('1')}, 2500); // prints "one" after 2.5 seconds

// or use arrow function

setTimeout(() => {myArray.myMethod()}, 2000); // prints "zero,one,two" after 2 seconds
setTimeout(() => {myArray.myMethod('1')}, 2500); // prints "one" after 2.5 seconds

// 或者使用Proxy重写window的setTimeout函数
var __nativeST__ = window.setTimeout, 
 
window.setTimeout = function (vCallback, nDelay /*, argumentToPass1, argumentToPass2, etc. */) {
  var oThis = this, 
      aArgs = Array.prototype.slice.call(arguments, 2);
  return __nativeST__(vCallback instanceof Function ? function () {
    vCallback.apply(oThis, aArgs);
  } : vCallback, nDelay);
};
```

#### 其他的this问题：

- 非strict模式下，this只跟**调用者**有关。是谁在调用，就指向谁。

- 箭头函数中，this只跟**定义时**的上下文有关，跟被谁调用无关。

  - 特殊情况：

    ```javascript
    var obj = {
      bar: function(){
        var x = () => this
        return x
      }
    }

    var fn = obj.bar()

    console.log(fn() === obj) // true

    var fn2 = obj.bar

    console.log(fu2()() === window) // true
    ```

- function作为一个object的方法（属性）时，this**指向这个object**。且如果这个function被多个object引用时，this指向**最后一个**。

- 原型链上的this：

  ```javascript
  var o = {f: function() { return this.a + this.b; }};
  var p = Object.create(o);
  p.a = 1;
  p.b = 4;

  console.log(p.f()); 
  // 5
  // 虽然f方法在原型o上，但this依旧指向p
  ```

  ​



JavaScript模块引用

组件化，模块化

canvas

按需加载

深拷贝