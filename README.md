# Questions

## ES6
 - Generator函数
 - 如何实现一个Pormise


## React
 - 生命周期方法：7种

# CSS相关问题

<!-- toc -->

- [CSS中类和ID的区别](#css%E4%B8%AD%E7%B1%BB%E5%92%8Cid%E7%9A%84%E5%8C%BA%E5%88%AB)
- [请问 "resetting" 和 "normalizing" CSS 之间的区别？你会如何选择，为什么？](#%E8%AF%B7%E9%97%AE-resetting-%E5%92%8C-normalizing-css-%E4%B9%8B%E9%97%B4%E7%9A%84%E5%8C%BA%E5%88%AB%E4%BD%A0%E4%BC%9A%E5%A6%82%E4%BD%95%E9%80%89%E6%8B%A9%E4%B8%BA%E4%BB%80%E4%B9%88)
- [请解释浮动Floats及其工作原理](#%E8%AF%B7%E8%A7%A3%E9%87%8A%E6%B5%AE%E5%8A%A8floats%E5%8F%8A%E5%85%B6%E5%B7%A5%E4%BD%9C%E5%8E%9F%E7%90%86)
- [描述z-index和叠加上下文是如何形成的](#%E6%8F%8F%E8%BF%B0z-index%E5%92%8C%E5%8F%A0%E5%8A%A0%E4%B8%8A%E4%B8%8B%E6%96%87%E6%98%AF%E5%A6%82%E4%BD%95%E5%BD%A2%E6%88%90%E7%9A%84)

<!-- tocstop -->

## CSS中类和ID的区别

id的权重比类更大，类可以重复使用，id唯一

## 请问 "resetting" 和 "normalizing" CSS 之间的区别？你会如何选择，为什么？

reset.css能够重置浏览器的默认属性。normalize.css保护有用的浏览器默认样式而不是完全去掉它们。 我的答案是选择normalize.css。因为

- 保护有用的浏览器默认样式而不是完全去掉它们
- 一般化的样式：为大部分HTML元素提供
- 修复浏览器自身的bug并保证各浏览器的一致性
- 优化CSS可用性：用一些小技巧

## 请解释浮动Floats及其工作原理

浮动元素不在普通流中
可向左或像右移动

当遇到包含框或者其他浮动框的边缘时停止移动

因为以上属性，浮动框可能遮盖住正常流中的元素

## 描述z-index和叠加上下文是如何形成的

z-index 属性设置元素的堆叠顺序。拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面。

元素可拥有负的 z-index 属性值。

Z-index 仅能在定位元素上奏效（例如 position:absolute;）！

该属性设置一个定位元素沿 z 轴的位置，z 轴定义为垂直延伸到显示区的轴。如果为正数，则离用户更近，为负数则表示离用户更远

# 一些学科性基础问题（体系结构，数据结构，算法基础）

<!-- toc -->

- [MVC、MVP、MVVM对比](#mvcmvpmvvm%E5%AF%B9%E6%AF%94)
- [单向数据绑定和双向数据绑定](#%E5%8D%95%E5%90%91%E6%95%B0%E6%8D%AE%E7%BB%91%E5%AE%9A%E5%92%8C%E5%8F%8C%E5%90%91%E6%95%B0%E6%8D%AE%E7%BB%91%E5%AE%9A)

<!-- tocstop -->

## MVC、MVP、MVVM对比

- MVC
  - 优点

    把业务逻辑和展示逻辑分离，模块化程度高。且当应用逻辑需要变更的时候，不需要变更业务逻辑和展示逻辑，只需要Controller换成另外一个Controller就行了（Swappable Controller）。

    观察者模式可以做到多视图同时更新。

  - 缺点

    Controller测试困难。因为视图同步操作是由View自己执行，而View只能在有UI的环境下运行。在没有UI环境下对Controller进行单元测试的时候，应用逻辑正确性是无法验证的：Model更新的时候，无法对View的更新操作进行断言。

    View无法组件化。View是强依赖特定的Model的，如果需要把这个View抽出来作为一个另外一个应用程序可复用的组件就困难了。因为不同程序的的Domain Model是不一样的

- MVP(Model,View,Presenter)

  View触发Presenter，Presenter修改Model，Model完成修改之后，Presenter通过观察者模式获取变更，再通过View提供的接口修改View。

  - 优点

    便于测试。Presenter对View是通过接口进行，在对Presenter进行不依赖UI环境的单元测试的时候。可以通过Mock一个View对象，这个对象只需要实现了View的接口即可。然后依赖注入到Presenter中，单元测试的时候就可以完整的测试Presenter应用逻辑的正确性。

    View可以进行组件化。在MVP当中，View不依赖Model。这样就可以让View从特定的业务场景中脱离出来，可以说View可以做到对业务完全无知。

  - 缺点

    Presenter比较笨重，维护起来会比较困难。

- MVVM(Model,View,ViewModal)

  双向数据绑定的架构模式，ViewModal里面有个binder，用来绑定Model和View中的对应数据。

  - 优点

    提高可维护性。解决了MVP大量的手动View和Model同步的问题，提供双向绑定机制。提高了代码的可维护性。

    简化测试。因为同步逻辑是交由Binder做的，View跟着Model同时变更，所以只需要保证Model的正确性，View就正确。大大减少了对View同步更新的测试。

  - 缺点

    过于简单的图形界面不适用，或说牛刀杀鸡。

    对于大型的图形应用程序，视图状态较多，ViewModel的构建和维护的成本都会比较高。

    数据绑定的声明是指令式地写在View的模版当中的，这些内容是没办法去打断点debug的。

## 单向数据绑定和双向数据绑定

- 单向：数据流动方向可以跟踪，便于跟踪数据变化。但是写起来比较麻烦，需要手动编写Event。

- 双向：操作简洁（没有CRUD操作），简化测试。但是脏值检查在model体积增大时，效率低下。

# HTML相关问题

<!-- toc -->

- [doctype文档类型的作用是什么？](#doctype%E6%96%87%E6%A1%A3%E7%B1%BB%E5%9E%8B%E7%9A%84%E4%BD%9C%E7%94%A8%E6%98%AF%E4%BB%80%E4%B9%88)
- [浏览器标准模式（standards mode）、几乎标准模式（almost standards mode）和怪异模式（quirks mode）之间的区别是什么？](#%E6%B5%8F%E8%A7%88%E5%99%A8%E6%A0%87%E5%87%86%E6%A8%A1%E5%BC%8Fstandards-mode%E5%87%A0%E4%B9%8E%E6%A0%87%E5%87%86%E6%A8%A1%E5%BC%8Falmost-standards-mode%E5%92%8C%E6%80%AA%E5%BC%82%E6%A8%A1%E5%BC%8Fquirks-mode%E4%B9%8B%E9%97%B4%E7%9A%84%E5%8C%BA%E5%88%AB%E6%98%AF%E4%BB%80%E4%B9%88)
- [HTML和XHTML有什么区别？](#html%E5%92%8Cxhtml%E6%9C%89%E4%BB%80%E4%B9%88%E5%8C%BA%E5%88%AB)
- [如果页面使用application/xhtml+xml会有什么问题？](#%E5%A6%82%E6%9E%9C%E9%A1%B5%E9%9D%A2%E4%BD%BF%E7%94%A8applicationxhtmlxml%E4%BC%9A%E6%9C%89%E4%BB%80%E4%B9%88%E9%97%AE%E9%A2%98)
- [如果网页内容要支持多语言，你会怎么做？](#%E5%A6%82%E6%9E%9C%E7%BD%91%E9%A1%B5%E5%86%85%E5%AE%B9%E8%A6%81%E6%94%AF%E6%8C%81%E5%A4%9A%E8%AF%AD%E8%A8%80%E4%BD%A0%E4%BC%9A%E6%80%8E%E4%B9%88%E5%81%9A)
- [在设计和开发多语言网站时，有哪些问题你必须考虑？](#%E5%9C%A8%E8%AE%BE%E8%AE%A1%E5%92%8C%E5%BC%80%E5%8F%91%E5%A4%9A%E8%AF%AD%E8%A8%80%E7%BD%91%E7%AB%99%E6%97%B6%E6%9C%89%E5%93%AA%E4%BA%9B%E9%97%AE%E9%A2%98%E4%BD%A0%E5%BF%85%E9%A1%BB%E8%80%83%E8%99%91)
- [使用data-属性的好处？](#%E4%BD%BF%E7%94%A8data-%E5%B1%9E%E6%80%A7%E7%9A%84%E5%A5%BD%E5%A4%84)
- [如果把 HTML5看作一个开放平台，那它的构建模块有哪些？](#%E5%A6%82%E6%9E%9C%E6%8A%8A-html5%E7%9C%8B%E4%BD%9C%E4%B8%80%E4%B8%AA%E5%BC%80%E6%94%BE%E5%B9%B3%E5%8F%B0%E9%82%A3%E5%AE%83%E7%9A%84%E6%9E%84%E5%BB%BA%E6%A8%A1%E5%9D%97%E6%9C%89%E5%93%AA%E4%BA%9B)
- [请描述cookie、sessionStorage和localStorage的区别](#%E8%AF%B7%E6%8F%8F%E8%BF%B0cookiesessionstorage%E5%92%8Clocalstorage%E7%9A%84%E5%8C%BA%E5%88%AB)
- [请解释script,script async,script defer的区别](#%E8%AF%B7%E8%A7%A3%E9%87%8Ascriptscript-asyncscript-defer%E7%9A%84%E5%8C%BA%E5%88%AB)
- [为什么通常推荐将 CSS `` 放置在 `` 之间，而将 JS `` 放置在 `` 之前？你知道相关解释吗？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E9%80%9A%E5%B8%B8%E6%8E%A8%E8%8D%90%E5%B0%86-css--%E6%94%BE%E7%BD%AE%E5%9C%A8--%E4%B9%8B%E9%97%B4%E8%80%8C%E5%B0%86-js--%E6%94%BE%E7%BD%AE%E5%9C%A8--%E4%B9%8B%E5%89%8D%E4%BD%A0%E7%9F%A5%E9%81%93%E7%9B%B8%E5%85%B3%E8%A7%A3%E9%87%8A%E5%90%97)
- [什么是渐进式渲染？](#%E4%BB%80%E4%B9%88%E6%98%AF%E6%B8%90%E8%BF%9B%E5%BC%8F%E6%B8%B2%E6%9F%93)
- [你用过哪些不同的HTML模板语言？](#%E4%BD%A0%E7%94%A8%E8%BF%87%E5%93%AA%E4%BA%9B%E4%B8%8D%E5%90%8C%E7%9A%84html%E6%A8%A1%E6%9D%BF%E8%AF%AD%E8%A8%80)

<!-- tocstop -->

## doctype文档类型的作用是什么？

声明网页的类型

HTML5

`<!DOCTYPE html>`

## 浏览器标准模式（standards mode）、几乎标准模式（almost standards mode）和怪异模式（quirks mode）之间的区别是什么？

- 标准模式：HTML和CSS的规范描述
- 几乎标准模式：实现少数怪异行为
- 怪异模式：排版会模拟 Navigator 4 与 Internet Explorer 5 的非标准行为。为了支持在网络标准被广泛采用前，就已经建好的网站，这么做是必要的。

## HTML和XHTML有什么区别？

XHTML是HTML4.0向xml2.0的过度，但XML的解析语法过于苛刻，被html5取代

如果你的文档声明的是xhtml的话，该网页就会提示你许多你没有注意到的代码错误，尽管这些错误有时会被浏览器自动纠正，不会造成事实上的的呈现错误。而html的文档声明网页提示的错误要少很多。 

## 如果页面使用application/xhtml+xml会有什么问题？

xhtml系列的文档类型

必须支持xhtml元素语法

要求比较严格，必须有head、body标签且每个元素必须是关闭的。

一些老的浏览器不支持，实际上，任何最新的浏览器都将支持application/xhtml+xml媒体类型。大多数浏览器也接受以application/xml发送的XHTML文档。

## 如果网页内容要支持多语言，你会怎么做？

- 根据路由切换页面
- i18n 维护语言字符表，页面上所有的文字都存在配置文件中，展示时读取根据key读取value

## 在设计和开发多语言网站时，有哪些问题你必须考虑？

- 应用字符集：Unicode 涵盖东西方文字
- 语言书写习惯和导航结构
- 静态：为每一种语言准备一套页面
- 动态：动态生成页面
- 数据库支持多语言

## 使用data-属性的好处？

- 数据存放，解决自定义属性混乱无管理的现状
- 用法`data-age=24`  `element.dataset.age`
- 驼峰命名

## 如果把 HTML5看作一个开放平台，那它的构建模块有哪些？

- HTML
- DOM
- CSS
- JavaScript
- Web APIs
  - 事件机制
  - 客户端存储 Web Storage
  - 文件系统
  - WebSocket
  - XMLHttpRequest
  - 键盘响应
  - Audio Canvas
  - History
- HTTP
- URI

## 请描述cookie、sessionStorage和localStorage的区别

- cookie: 大小4K左右，每次都会随http请求发送至服务器，可设置失效时间
- sessionStorage:  仅在当前会话下有效，关闭页面或浏览器之后就被清除，仅在客户端保存
- localStorage:  永久保存除非被清除

## 请解释script,script async,script defer的区别

- script:  阻止文档渲染，相关脚本会立即下载并执行
- script async: html5新特性，兼容性不乐观，不会阻塞页面渲染等待该脚本的下载和执行
- script defer:  推迟脚本的执行，直到文档解析完成

## 为什么通常推荐将 CSS `<link>` 放置在 `<head></head>` 之间，而将 JS `<script>` 放置在 `</body>` 之前？你知道相关解释吗？

css放在head中， 是因为浏览器解析html文档是自上而下的，如果放底部的话，页面结构出来了，css还没开始渲染，可能会看到只有结构的页面。CSS 应当写在 head 中，以避免页面元素由于样式确实造成瞬间的白页或者给用户闪烁感。

而js放在``之前，是因为JS可能会改变DOM树，也可能依赖css样式。如果放在前面，那么DOM和css可能还未加载，这样容易报错。还有一个，我觉得是加载速度的问题，js放前面，页面会先去加载他，拖慢了时间，使用户在一定时间内看不到网页内容。

1. 个别特殊JS，比如用于调试的基础脚本（部署时未必有）、性能日志之类，必须放在尽量最前的位置。
2. 外部样式表（link[rel=stylesheet]）
3. 本页样式（style）
4. 基础库，比如loader，各种shim/polyfill，jQuery之类的
   注意，有些开发者从性能优化的角度倾向于加defer或者放到页面的最底部。不过不是所有的脚本都能这样做。比如html5-shim脚本必须在body之前加载。再如history api的兼容实现等都不应defer，因为你不能确保用户在页面ready之前没有back/forward动作。再如jQuery，defer是可以，但也意味着你所有依赖jQuery的功能都需要defer，考虑到这些静态文件通常都是有缓存的，所以不defer也未必不是一个可以接受的折衷。
5. 少量本页script


##  什么是渐进式渲染？

渐进式渲染是指浏览器不用等待所有页面资源都渲染好之后再呈现给用户看，而是边下载边渲染，所以用户打开一个网页的时候往往不能第一时间看到所有的内容，但是能够看到一个大概的样子，后续的内容浏览器会慢慢补上形成一个完整的页面。

## 你用过哪些不同的HTML模板语言？

- jade

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

# 常见问题

<!-- toc -->

- [你昨天/本周学到了什么？](#%E4%BD%A0%E6%98%A8%E5%A4%A9%E6%9C%AC%E5%91%A8%E5%AD%A6%E5%88%B0%E4%BA%86%E4%BB%80%E4%B9%88)
- [编写代码的哪些方面能够使你兴奋或感兴趣？](#%E7%BC%96%E5%86%99%E4%BB%A3%E7%A0%81%E7%9A%84%E5%93%AA%E4%BA%9B%E6%96%B9%E9%9D%A2%E8%83%BD%E5%A4%9F%E4%BD%BF%E4%BD%A0%E5%85%B4%E5%A5%8B%E6%88%96%E6%84%9F%E5%85%B4%E8%B6%A3)
- [最近的技术挑战？如何解决？](#%E6%9C%80%E8%BF%91%E7%9A%84%E6%8A%80%E6%9C%AF%E6%8C%91%E6%88%98%E5%A6%82%E4%BD%95%E8%A7%A3%E5%86%B3)
- [开发网页应用时，如何考虑其UI、安全性、高性能、SEO、可维护性以及技术因素？](#%E5%BC%80%E5%8F%91%E7%BD%91%E9%A1%B5%E5%BA%94%E7%94%A8%E6%97%B6%E5%A6%82%E4%BD%95%E8%80%83%E8%99%91%E5%85%B6ui%E5%AE%89%E5%85%A8%E6%80%A7%E9%AB%98%E6%80%A7%E8%83%BDseo%E5%8F%AF%E7%BB%B4%E6%8A%A4%E6%80%A7%E4%BB%A5%E5%8F%8A%E6%8A%80%E6%9C%AF%E5%9B%A0%E7%B4%A0)
- [谈谈你喜欢的开发环境](#%E8%B0%88%E8%B0%88%E4%BD%A0%E5%96%9C%E6%AC%A2%E7%9A%84%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
- [你最熟悉的一套版本控制系统](#%E4%BD%A0%E6%9C%80%E7%86%9F%E6%82%89%E7%9A%84%E4%B8%80%E5%A5%97%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6%E7%B3%BB%E7%BB%9F)
- [描述当你 制作一个网页的工作流程](#%E6%8F%8F%E8%BF%B0%E5%BD%93%E4%BD%A0-%E5%88%B6%E4%BD%9C%E4%B8%80%E4%B8%AA%E7%BD%91%E9%A1%B5%E7%9A%84%E5%B7%A5%E4%BD%9C%E6%B5%81%E7%A8%8B)
- [假若你有5个不同的样式文件（stylesheets）,整合进网站的最好方式是？](#%E5%81%87%E8%8B%A5%E4%BD%A0%E6%9C%895%E4%B8%AA%E4%B8%8D%E5%90%8C%E7%9A%84%E6%A0%B7%E5%BC%8F%E6%96%87%E4%BB%B6stylesheets%E6%95%B4%E5%90%88%E8%BF%9B%E7%BD%91%E7%AB%99%E7%9A%84%E6%9C%80%E5%A5%BD%E6%96%B9%E5%BC%8F%E6%98%AF)
- [你能描述渐进增强 (progressive enhancement) 和优雅降级 (graceful degradation) 之间的不同吗](#%E4%BD%A0%E8%83%BD%E6%8F%8F%E8%BF%B0%E6%B8%90%E8%BF%9B%E5%A2%9E%E5%BC%BA-progressive-enhancement-%E5%92%8C%E4%BC%98%E9%9B%85%E9%99%8D%E7%BA%A7-graceful-degradation-%E4%B9%8B%E9%97%B4%E7%9A%84%E4%B8%8D%E5%90%8C%E5%90%97)
- [你如何对网站的文件和资源进行优化？](#%E4%BD%A0%E5%A6%82%E4%BD%95%E5%AF%B9%E7%BD%91%E7%AB%99%E7%9A%84%E6%96%87%E4%BB%B6%E5%92%8C%E8%B5%84%E6%BA%90%E8%BF%9B%E8%A1%8C%E4%BC%98%E5%8C%96)
- [浏览器同一时间可以从 一个域名下载多少资源](#%E6%B5%8F%E8%A7%88%E5%99%A8%E5%90%8C%E4%B8%80%E6%97%B6%E9%97%B4%E5%8F%AF%E4%BB%A5%E4%BB%8E-%E4%B8%80%E4%B8%AA%E5%9F%9F%E5%90%8D%E4%B8%8B%E8%BD%BD%E5%A4%9A%E5%B0%91%E8%B5%84%E6%BA%90)
- [请说出三种减少页面加载时间的方法。(加载时间指感知的时间或者实际加载时间)](#%E8%AF%B7%E8%AF%B4%E5%87%BA%E4%B8%89%E7%A7%8D%E5%87%8F%E5%B0%91%E9%A1%B5%E9%9D%A2%E5%8A%A0%E8%BD%BD%E6%97%B6%E9%97%B4%E7%9A%84%E6%96%B9%E6%B3%95%E5%8A%A0%E8%BD%BD%E6%97%B6%E9%97%B4%E6%8C%87%E6%84%9F%E7%9F%A5%E7%9A%84%E6%97%B6%E9%97%B4%E6%88%96%E8%80%85%E5%AE%9E%E9%99%85%E5%8A%A0%E8%BD%BD%E6%97%B6%E9%97%B4)
- [如果你参与到一个项目中，发现他们使用 Tab 来缩进代码，但是你喜欢空格，你会怎么做？](#%E5%A6%82%E6%9E%9C%E4%BD%A0%E5%8F%82%E4%B8%8E%E5%88%B0%E4%B8%80%E4%B8%AA%E9%A1%B9%E7%9B%AE%E4%B8%AD%E5%8F%91%E7%8E%B0%E4%BB%96%E4%BB%AC%E4%BD%BF%E7%94%A8-tab-%E6%9D%A5%E7%BC%A9%E8%BF%9B%E4%BB%A3%E7%A0%81%E4%BD%86%E6%98%AF%E4%BD%A0%E5%96%9C%E6%AC%A2%E7%A9%BA%E6%A0%BC%E4%BD%A0%E4%BC%9A%E6%80%8E%E4%B9%88%E5%81%9A)
- [写一个简单的幻灯效果页面。](#%E5%86%99%E4%B8%80%E4%B8%AA%E7%AE%80%E5%8D%95%E7%9A%84%E5%B9%BB%E7%81%AF%E6%95%88%E6%9E%9C%E9%A1%B5%E9%9D%A2)
- [如果今年打算掌握一门新技术，是什么？](#%E5%A6%82%E6%9E%9C%E4%BB%8A%E5%B9%B4%E6%89%93%E7%AE%97%E6%8E%8C%E6%8F%A1%E4%B8%80%E9%97%A8%E6%96%B0%E6%8A%80%E6%9C%AF%E6%98%AF%E4%BB%80%E4%B9%88)
- [请谈谈你对网页标准和标准制定机构重要性的理解](#%E8%AF%B7%E8%B0%88%E8%B0%88%E4%BD%A0%E5%AF%B9%E7%BD%91%E9%A1%B5%E6%A0%87%E5%87%86%E5%92%8C%E6%A0%87%E5%87%86%E5%88%B6%E5%AE%9A%E6%9C%BA%E6%9E%84%E9%87%8D%E8%A6%81%E6%80%A7%E7%9A%84%E7%90%86%E8%A7%A3)
- [什么是FOUC(无样式内容闪烁)？你如何来避免？](#%E4%BB%80%E4%B9%88%E6%98%AFfouc%E6%97%A0%E6%A0%B7%E5%BC%8F%E5%86%85%E5%AE%B9%E9%97%AA%E7%83%81%E4%BD%A0%E5%A6%82%E4%BD%95%E6%9D%A5%E9%81%BF%E5%85%8D)
- [AIRA和屏幕阅读器，如何实现无障碍阅读](#aira%E5%92%8C%E5%B1%8F%E5%B9%95%E9%98%85%E8%AF%BB%E5%99%A8%E5%A6%82%E4%BD%95%E5%AE%9E%E7%8E%B0%E6%97%A0%E9%9A%9C%E7%A2%8D%E9%98%85%E8%AF%BB)
- [请解释css动画和javascript动画的优缺点](#%E8%AF%B7%E8%A7%A3%E9%87%8Acss%E5%8A%A8%E7%94%BB%E5%92%8Cjavascript%E5%8A%A8%E7%94%BB%E7%9A%84%E4%BC%98%E7%BC%BA%E7%82%B9)
- [什么是跨域资源共享（CORS）？他用于解决什么问题？](#%E4%BB%80%E4%B9%88%E6%98%AF%E8%B7%A8%E5%9F%9F%E8%B5%84%E6%BA%90%E5%85%B1%E4%BA%ABcors%E4%BB%96%E7%94%A8%E4%BA%8E%E8%A7%A3%E5%86%B3%E4%BB%80%E4%B9%88%E9%97%AE%E9%A2%98)

<!-- tocstop -->

## 你昨天/本周学到了什么？

无可奉告

## 编写代码的哪些方面能够使你兴奋或感兴趣？

编码风格的一致性，能够写出高复用性、高扩展性、可修改性的代码

## 最近的技术挑战？如何解决？

词云

## 开发网页应用时，如何考虑其UI、安全性、高性能、SEO、可维护性以及技术因素？

- UI: 设计，使用成熟的组件库
- 安全性：客户端存储、js压缩丑化。使用HTTPS，避免HTTPS和HTTP的混合资源。
- 高性能：缓存、静态资源打包压缩版本控制、减少http请求
- SEO: 服务端渲染、title、description、meta关键词
- 可维护性：代码架构、简单的文档和注释、编码风格的统一

## 谈谈你喜欢的开发环境

git、atom、webpack、less

## 你最熟悉的一套版本控制系统

git

## 描述当你 制作一个网页的工作流程

- 明确页面跳转的流程，是否有遗漏的页面
- 看情况搭开发环境
- 页面：布局-切图静态页面-js事件-测试

## 假若你有5个不同的样式文件（stylesheets）,整合进网站的最好方式是？

合并压缩

## 你能描述渐进增强 (progressive enhancement) 和优雅降级 (graceful degradation) 之间的不同吗

- 渐进增强：先支持旧版低级浏览器的功能，再去支持现代浏览器的功能
- 优雅降级：先支持现代浏览器的功能，再去低版浏览器上去修复和调试

## 你如何对网站的文件和资源进行优化？

- 文件合并，图片合并，小图片转base64，iconfont
- 静态资源打包合并压缩 js css
- cdn托管静态资源
- 缓存max-age

## 浏览器同一时间可以从 一个域名下载多少资源

chrome 6

## 请说出三种减少页面加载时间的方法。(加载时间指感知的时间或者实际加载时间)

- 打包压缩静态资源，js和css
- js脚本放在body末尾
- 图片合并，懒加载
- 网址后加斜杠

##  如果你参与到一个项目中，发现他们使用 Tab 来缩进代码，但是你喜欢空格，你会怎么做？

tab  2个空格和四个空格  IDE设置即可

## 写一个简单的幻灯效果页面。



##  如果今年打算掌握一门新技术，是什么？

node后台

## 请谈谈你对网页标准和标准制定机构重要性的理解

网页标准和标准制定机构都是为了能让web发展的更‘健康’，首先约束浏览器开发者遵循统一的标准，其次约束网站开发者，这样降低开发难度，开发成本，SEO也会更好做，也不会因为滥用代码导致各种BUG、安全问题，最终提高网站易用性。

## 什么是FOUC(无样式内容闪烁)？你如何来避免？

使用@import方法导入CSS时，例如：` @import "../fouc.css";此方式由于IE会先加载整个HTML文档的DOM，然后再去导入外部的CSS文件，因此，在页面DOM加载完成到CSS导入完成中间会有一段时间页面上的内容是没有样式的，这段时间的长短跟网速，电脑速度都有关系。`

解决方法：避免使用@import方法导入CSS，且将样式表链接都放在head中即可避免此问题。

## AIRA和屏幕阅读器，如何实现无障碍阅读

WAI-ARIA指无障碍网页应用。主要针对的是视觉缺陷，失聪，行动不便的残疾人以及假装残疾的测试人员。尤其像盲人，眼睛看不到，其浏览网页则需要借助辅助设备，如**屏幕阅读器**，屏幕阅读机可以大声朗读或者输出盲文。

而ARIA就是可以让**屏幕阅读器**准确识别网页中的内容，变化，状态的技术规范，可以让盲人这类用户也能无障碍阅读！

## 请解释css动画和javascript动画的优缺点

CSS3的动画的优点： 在性能上会稍微好一些，浏览器会对CSS3的动画做一些优化（比如专门新建一个图层用来跑动画） 代码相对简单 

但其缺点也很明显： 在动画控制上不够灵活 兼容性不好 部分动画功能无法实现（如滚动动画，视差滚动等） 

JavaScript的动画正好弥补了这两个缺点，控制能力很强，可以单帧的控制、变换，同时写得好完全可以兼容IE6，并且功能强大。但想想CSS动画的transform矩阵是C++级的计算，必然要比javascript级的计算要快。另外对库的依赖也是一个很让人头疼的问题。 

## 什么是跨域资源共享（CORS）？他用于解决什么问题？

CORS是一个W3C标准，全称是"跨域资源共享"（Cross-origin resource sharing）。

它允许浏览器向跨源服务器，发出[`XMLHttpRequest`](http://www.ruanyifeng.com/blog/2012/09/xmlhttprequest_level_2.html)请求，从而克服了AJAX只能[同源](http://www.ruanyifeng.com/blog/2016/04/same-origin-policy.html)使用的限制。

http://www.ruanyifeng.com/blog/2016/04/cors.html

# Web前端面试题

<!-- toc -->



<!-- tocstop -->

##

