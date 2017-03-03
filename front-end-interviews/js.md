# JS相关问题

<!-- toc -->

- [请解释事件代理event delegation](#%E8%AF%B7%E8%A7%A3%E9%87%8A%E4%BA%8B%E4%BB%B6%E4%BB%A3%E7%90%86event-delegation)
- [请解释JavaScript中的this是如何工作的？](#%E8%AF%B7%E8%A7%A3%E9%87%8Ajavascript%E4%B8%AD%E7%9A%84this%E6%98%AF%E5%A6%82%E4%BD%95%E5%B7%A5%E4%BD%9C%E7%9A%84)
- [请解释原型继承prototypal inheritance的原理](#%E8%AF%B7%E8%A7%A3%E9%87%8A%E5%8E%9F%E5%9E%8B%E7%BB%A7%E6%89%BFprototypal-inheritance%E7%9A%84%E5%8E%9F%E7%90%86)
- [你怎么看AMD和CommonJs?](#%E4%BD%A0%E6%80%8E%E4%B9%88%E7%9C%8Bamd%E5%92%8Ccommonjs)
- [请解释为什么接下来这段代码不是IIFE(立即调用的函数表达式)？要做什么改动使它变成IIFE？](#%E8%AF%B7%E8%A7%A3%E9%87%8A%E4%B8%BA%E4%BB%80%E4%B9%88%E6%8E%A5%E4%B8%8B%E6%9D%A5%E8%BF%99%E6%AE%B5%E4%BB%A3%E7%A0%81%E4%B8%8D%E6%98%AFiife%E7%AB%8B%E5%8D%B3%E8%B0%83%E7%94%A8%E7%9A%84%E5%87%BD%E6%95%B0%E8%A1%A8%E8%BE%BE%E5%BC%8F%E8%A6%81%E5%81%9A%E4%BB%80%E4%B9%88%E6%94%B9%E5%8A%A8%E4%BD%BF%E5%AE%83%E5%8F%98%E6%88%90iife)
- [描述null和undefined的区别](#%E6%8F%8F%E8%BF%B0null%E5%92%8Cundefined%E7%9A%84%E5%8C%BA%E5%88%AB)
- [什么是闭包，如何使用它，为什么要使用它？](#%E4%BB%80%E4%B9%88%E6%98%AF%E9%97%AD%E5%8C%85%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8%E5%AE%83%E4%B8%BA%E4%BB%80%E4%B9%88%E8%A6%81%E4%BD%BF%E7%94%A8%E5%AE%83)
- [请举出一个匿名函数的典型用例？](#%E8%AF%B7%E4%B8%BE%E5%87%BA%E4%B8%80%E4%B8%AA%E5%8C%BF%E5%90%8D%E5%87%BD%E6%95%B0%E7%9A%84%E5%85%B8%E5%9E%8B%E7%94%A8%E4%BE%8B)
- [你是如何组织自己的代码， 模块模式还是经典继承？](#%E4%BD%A0%E6%98%AF%E5%A6%82%E4%BD%95%E7%BB%84%E7%BB%87%E8%87%AA%E5%B7%B1%E7%9A%84%E4%BB%A3%E7%A0%81-%E6%A8%A1%E5%9D%97%E6%A8%A1%E5%BC%8F%E8%BF%98%E6%98%AF%E7%BB%8F%E5%85%B8%E7%BB%A7%E6%89%BF)
- [请指出 JavaScript 宿主对象 (host objects) 和原生对象 (native objects) 的区别？](#%E8%AF%B7%E6%8C%87%E5%87%BA-javascript-%E5%AE%BF%E4%B8%BB%E5%AF%B9%E8%B1%A1-host-objects-%E5%92%8C%E5%8E%9F%E7%94%9F%E5%AF%B9%E8%B1%A1-native-objects-%E7%9A%84%E5%8C%BA%E5%88%AB)
- [请指出以下代码的区别：`function Person(){}`、`var person = Person()`、`var person = new Person()`？](#%E8%AF%B7%E6%8C%87%E5%87%BA%E4%BB%A5%E4%B8%8B%E4%BB%A3%E7%A0%81%E7%9A%84%E5%8C%BA%E5%88%ABfunction-personvar-person--personvar-person--new-person)
- [.call和.apply的区别是什么？](#call%E5%92%8Capply%E7%9A%84%E5%8C%BA%E5%88%AB%E6%98%AF%E4%BB%80%E4%B9%88)
- [请解释Function.prototype.bind？](#%E8%AF%B7%E8%A7%A3%E9%87%8Afunctionprototypebind)
- [什么时候你会使用document.write()](#%E4%BB%80%E4%B9%88%E6%97%B6%E5%80%99%E4%BD%A0%E4%BC%9A%E4%BD%BF%E7%94%A8documentwrite)
- [Ajax的工作原理](#ajax%E7%9A%84%E5%B7%A5%E4%BD%9C%E5%8E%9F%E7%90%86)
- [请解释JSONP的工作原理，以及它为什么不是真正的Ajax](#%E8%AF%B7%E8%A7%A3%E9%87%8Ajsonp%E7%9A%84%E5%B7%A5%E4%BD%9C%E5%8E%9F%E7%90%86%E4%BB%A5%E5%8F%8A%E5%AE%83%E4%B8%BA%E4%BB%80%E4%B9%88%E4%B8%8D%E6%98%AF%E7%9C%9F%E6%AD%A3%E7%9A%84ajax)
- [请解释变量声明提示(hoisting)](#%E8%AF%B7%E8%A7%A3%E9%87%8A%E5%8F%98%E9%87%8F%E5%A3%B0%E6%98%8E%E6%8F%90%E7%A4%BAhoisting)
- [请描述事件冒泡机制event bubbling](#%E8%AF%B7%E6%8F%8F%E8%BF%B0%E4%BA%8B%E4%BB%B6%E5%86%92%E6%B3%A1%E6%9C%BA%E5%88%B6event-bubbling)
- [attribute和property的区别是什么？](#attribute%E5%92%8Cproperty%E7%9A%84%E5%8C%BA%E5%88%AB%E6%98%AF%E4%BB%80%E4%B9%88)
- [为什么扩展JavaScript内置对象不是好的做法？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E6%89%A9%E5%B1%95javascript%E5%86%85%E7%BD%AE%E5%AF%B9%E8%B1%A1%E4%B8%8D%E6%98%AF%E5%A5%BD%E7%9A%84%E5%81%9A%E6%B3%95)
- [请指出document load 和 document DOMContentLoaded 两个事件 的区别](#%E8%AF%B7%E6%8C%87%E5%87%BAdocument-load-%E5%92%8C-document-domcontentloaded-%E4%B8%A4%E4%B8%AA%E4%BA%8B%E4%BB%B6-%E7%9A%84%E5%8C%BA%E5%88%AB)
- [== 和 ===有什么不同？](#-%E5%92%8C-%E6%9C%89%E4%BB%80%E4%B9%88%E4%B8%8D%E5%90%8C)
- [请解释JavaScript的同源策略same-origin policy](#%E8%AF%B7%E8%A7%A3%E9%87%8Ajavascript%E7%9A%84%E5%90%8C%E6%BA%90%E7%AD%96%E7%95%A5same-origin-policy)
- [如何实现如下代码？](#%E5%A6%82%E4%BD%95%E5%AE%9E%E7%8E%B0%E5%A6%82%E4%B8%8B%E4%BB%A3%E7%A0%81)

<!-- tocstop -->

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

同源策略限制了一个 **源(origin)** 中加载文本或脚本与来自其它 **源(origin)** 中资源的交互方式。同源指的是协议、域名、端口相同，同源策略是一种安全协议。

## 如何实现如下代码？

```
[1,2,3,4,5].duplicator(); // [1,2,3,4,5,1,2,3,4,5]
```
