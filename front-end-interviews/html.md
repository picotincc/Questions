# HTML相关问题

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

## 请解释<script> <script async> <script defer>的区别

- script:  阻止文档渲染，相关脚本会立即下载并执行
- script async: html5新特性，兼容性不乐观，不会阻塞页面渲染等待该脚本的下载和执行
- script defer:  推迟脚本的执行，直到文档解析完成

## 为什么通常推荐将 CSS <link> 放置在 <head></head> 之间，而将 JS <script> 放置在 </body> 之前？你知道相关解释吗？

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