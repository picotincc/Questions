# JS相关问题

## 请解释事件代理event delegation

父元素代理处理子元素的事件   事件冒泡机制

## 请解释JavaScript中的this是如何工作的？

每个函数的附加参数this和arguments, 4种调用模式初始化this不一样

- 方法调用模式：当一个函数被保存为一个对象的属性时，称它为一个方法。当一个方法被调用时，this被绑定到改对象，通常是.和["funcName"]，this到对象的绑定发生在调用的时候
- 函数调用模式：当一个函数并非一个对象的属性时，就是函数调用，this绑定到全局对象
- 构造器调用模式：一个函数，如果创建的目的是用new来调用，构造器函数大写约定，如果在一个函数前带上new来调用，那么背地里将会创建一个连接到该函数的prototype成员的新对象，this绑定到这个新对象
- Apply调用模式：apply接受2个参数，第一个是this，第二个是参数数组

## 请解释原型继承prototypal inheritance的原理 

## 你怎么看AMD和CommonJs?

commonjs: nodejs, require, exports,同步加载, 通常应用在node服务器端

- 所有代码都运行在模块作用域，不会污染全局作用域。
- 模块可以多次加载，但是只会在第一次加载时运行一次，然后运行结果就被缓存了，以后再加载，就直接读取缓存结果。要想让模块再次运行，必须清除缓存。
- 模块加载的顺序，按照其在代码中出现的顺序。

AMD： 异步加载, define，通常应用在浏览器端, 回调函数

```javascript
require(['math'], function (math) {
　　　　math.add(2, 3);
});
```

## 请解释为什么接下来这段代码不是IIFE(立即调用的函数表达式)？要做什么改动使它变成IIFE？

```
function foo(){}();
(function foo(){})();
```

## 描述null和undefined的区别

null: 表示一个无的对象，typeof null === object, 转为数值时为0

undefined: 表示一个无的原始值 typeof undefined === undefined 转为数值时为NaN

（1）变量被声明了，但没有赋值时，就等于undefined。

（2) 调用函数时，应该提供的参数没有提供，该参数等于undefined。

（3）对象没有赋值的属性，该属性的值为undefined。

（4）函数没有返回值时，默认返回undefined。

## 什么是闭包，如何使用它，为什么要使用它？

能够读取其他函数内部变量的函数，内部函数读取外部函数的局部变量

- 读取函数内部的变量
- 让这些变量的值始终保存在内存中

## 请举出一个匿名函数的典型用例？

```
(function(x, y){
    alert(x + y);  
})(2, 3);
```

创建闭包时使用到

## 你是如何组织自己的代码， 模块模式还是经典继承？

模块模式：import和export

## 请指出 JavaScript 宿主对象 (host objects) 和原生对象 (native objects) 的区别？

宿主对象不是引擎的原生对象，而是由宿主框架通过某种机制注册到JavaScript引擎中的对象。宿主环境，网页的运行环境，操作系统和浏览器

- 宿主对象是指`DOM`和`BOM`。
- 原生对象是`Object、Function、Array、String、Boolean、Number、Date、RegExp、Error、Math`等对象。

## 请指出以下代码的区别：`function Person(){}`、`var person = Person()`、`var person = new Person()`？

```
function Person(){}
```

## .call和.apply的区别是什么？

apply第二个参数是一个数组

call的参数

## 请解释Function.prototype.bind？

创建一个新函数，对它的this赋值

## 什么时候你会使用document.write()

- 直接修改文档流
- 加载需要配合JS脚本使用的外部CSS文件
- 在新的窗口写入新的 页面数据时

## Ajax的工作原理

`Ajax`通过`XmlHttpRequest`对象来向服务器发异步请求，从服务器获得数据，然后用`javascript`来操作`DOM`更新页面。

## 请解释JSONP的工作原理，以及它为什么不是真正的Ajax

通过`JSON`与``相结合的办法，可以绕过同源策略从外部服务器直接取得可执行的`JavaScript`函数。

客户端定义一个函数，比如`jsonpCallback`，然后创建``，`src`为`url + ?jsonp=jsonpCallback`这样的形式，之后服务器会生成一个和传递过来`jsonpCallback`一样名字的参数，并把需要传递的数据当做参数传入，比如`jsonpCallback(json)`，然后返回给客户端，此时客户端就执行了这个服务器端返回的`jsonpCallback(json)`回调。

通俗的说，就是客户端定义一个函数然后请求，服务器端返回的`javascript`内容就是调用这个函数，需要的数据都当做参数传入这个函数了。

- 优点 - 兼容性好，简单易用，支持浏览器与服务器双向通信
- 缺点 - 只支持GET请求；存在脚本注入以及跨站请求伪造等安全问题

补充一点，`JSONP`不使用`XMLHttpRequest`对象加载资源，不属于真正意义上的`AJAX`。

## 请解释变量声明提示(hoisting)

变量的声明提到函数的top处，赋值不会

## 请描述事件冒泡机制event bubbling

事件冒泡(event bubbling)，事件最开始时由触发的那个元素身上发生，然后沿着`DOM`树向上传播，直到`document`对象。如果想阻止事件起泡，可以使用`e.stopPropagation()`。

## attribute和property的区别是什么？

- property是DOM中的属性，是JavaScript里的对象；
- attribute是HTML标签上的特性，它的值只能够是字符串；

## 为什么扩展JavaScript内置对象不是好的做法？

## 请指出document load 和 document DOMContentLoaded 两个事件 的区别

触发的时机不一样，先触发DOMContentLoaded事件，后触发load事件

DOM文档加载的步骤为：

        1.解析HTML结构。

        2.加载外部脚本和样式表文件。

        3.解析并执行脚本代码。

        4.DOM树构建完成。//DOMContentLoaded

        5.加载图片等外部文件。

        6.页面加载完毕。//load

        在第4步，会触发DOMContentLoaded事件；在第6步，触发load事件。

## == 和 ===有什么不同？

弱等于和强等于

```
1 == "1" //true
1 === "1" //false
0 == false //true
0 === false //false
```

## 请解释JavaScript的同源策略same-origin policy

同源策略限制了一个**源(origin)**中加载文本或脚本与来自其它**源(origin)**中资源的交互方式。同源指的是协议、域名、端口相同，同源策略是一种安全协议。

## 如何实现如下代码？

```
[1,2,3,4,5].duplicator(); // [1,2,3,4,5,1,2,3,4,5]
```

```
const arr = [ 1, 2, 3, 4, 5 ];

Array.prototype.duplicator = function () {
    const newArr = this.concat(this);
    return newArr;
};
```

## 什么是三元表达式？

```
a ? b : c
```

## 什么是 use strict?好处和坏处

ES5 的第二种运行模式 严格模式

好处：

- 消除Javascript语法的一些不合理、不严谨之处，减少一些怪异行为;
- 消除代码运行的一些不安全之处，保证代码运行的安全；
- 提高编译器效率，增加运行速度；
- 为未来新版本的Javascript做好铺垫。

注：经过测试 IE6,7,8,9 均不支持严格模式。

坏处：

   JS文件的压缩合并导致严格模式不能适用

## 请实现一个遍历至 100 的 for loop 循环， //在能被 3 整除时输出 "fizz"，在能被 5 整除时输出 "buzz"， //在能同时被 3 和 5 整除时输出 "fizzbuzz"。

```
for (var i = 1; i <= 100; i++) 
{ 
	if (i % 3 === 0) 
	{ 
		if (i % 5 === 0) 
		{ 
			alert('fizzbuzz' + i); 
			continue; 
		} 
		alert('fizz' + i); 
		continue; 
	} 
	else if (i % 5 === 0) 
	{ 
		if (i % 3 === 0) 
		{ 
			alert('fizzbuzz' + i); 
			continue; 
		} 
		alert('buzz' + i); 
		continue; 
	} 
}
```

## 为何通常会认为保留网站现有的全局作用域 (global scope) 不去改变它，是较好的选择？

防止污染全局变量，防止覆盖全局函数

## 为何你会使用 `load` 之类的事件 (event)？此事件有缺点吗？你是否知道其他替代品，以及为何使用它们？

window.onload 函数互相覆盖的问题

## 请解释什么是单页应用 (single page app), 以及如何使其对搜索引擎友好 (SEO-friendly)。

- 服务端渲染
- a链接 h1标签
- 让搜索引擎抓取ajax内容

##  使用 Promises 而非回调 (callbacks) 优缺点是什么？

- 链式写法，不用写层层嵌套，包含了异常处理
- 多次触发事件不适用，执行进度不知道，不能取消执行