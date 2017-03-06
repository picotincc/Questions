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

**清除浮动** ：1. 父元素设置`overflow: auto` 2. 内部加一个无大小div设置`clear: both ; zoom: 1` 3. 父元素加一个无内容无大小after元素设置`clear: both`

## 描述z-index和叠加上下文是如何形成的

z-index 属性设置元素的堆叠顺序。拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面。

元素可拥有负的 z-index 属性值。

Z-index 仅能在定位元素上奏效（例如 position:absolute;）！

该属性设置一个定位元素沿 z 轴的位置，z 轴定义为垂直延伸到显示区的轴。如果为正数，则离用户更近，为负数则表示离用户更远

## 请描述 BFC(Block Formatting Context) 及其如何工作

BFC:块级格式上下文。定义：

浮动元素和绝对定位元素，非块级盒子的块级容器（例如 inline-blocks, table-cells, 和 table-captions），以及overflow值不为“visiable”的块级盒子，都会为他们的内容创建新的块级格式化上下文。

在一个块级格式化上下文里，盒子从包含块的顶端开始垂直地一个接一个地排列，两个盒子之间的垂直的间隙是由他们的margin 值所决定的。两个相邻的块级盒子的垂直外边距会发生叠加。

在块级格式化上下文中，每一个盒子的左外边缘（margin-left）会触碰到容器的左边缘(border-left)（对于从右到左的格式来说，则触碰到右边缘），即使存在浮动也是如此，除非这个盒子创建一个新的块级格式化上下文。

## 列举不同的清除浮动的技巧，并指出它们各自适用的使用场景

```
<div class="outer over-flow"> //这里添加了一个class
    <div class="div1">1</div>
    <div class="div2">2</div>
    <div class="div3">3</div>
    <!--<div class="clear"></div>-->
</div>
```

- 使用空标签清除浮动，在所有浮动标签后面添加一个空标签 定义 css clear:both，弊端增加了无意义标签

  ```
  .clear{clear:both; height: 0; line-height: 0; font-size: 0}
  ```

- 使用overflow, 包含浮动元素的父标签添加css属性overflow:auto, zoom:1用于兼容IE6, 不能使用visible

  ```
  .over-flow{
      overflow: auto; zoom: 1; //zoom: 1; 是在处理兼容性问题
  }
  ```

- 使用after伪类对象清除浮动

  这种方法清除浮动是现在网上最拉风的一种清除浮动，他就是利用:after和:before来在元素内部插入两个元素块，从面达到清除浮动的效果。其实现原理类似于clear:both方法，只是区别在于:clear在html插入一个div.clear标签，而outer利用其伪类clear:after在元素内部增加一个类似于div.clear的效果。下面来看看其具体的使用方法：

  ```
   .outer {zoom:1;}    /*==for IE6/7 Maxthon2==*/
   .outer :after {clear:both;content:'.';display:block;width: 0;height: 0;visibility:hidden;}/*==for FF/chrome/opera/IE8==*/
  ```

  其中clear:both;指清除所有浮动；content: '.';display:block;对于FF/chrome/opera/IE8不能缺少，其中content（）可以取值也可以为空。visibility:hidden;的作用是允许浏览器渲染它，但是不显示出来，这样才能实现清楚浮动。

##  请解释 CSS sprites，以及你要如何在页面或网站中实现它

CSS Sprites其实就是把网页中一些背景图片整合到一张图片文件中，再利用CSS的“background-image”，“background- repeat”，“background-position”的组合进行背景定位，background-position可以用数字能精确的定位出[背景图片](http://baike.baidu.com/view/950110.htm)的位置。

CSS Sprites为一些大型的网站节约了带宽，让提高了用户的加载速度和用户体验，不需要加载更多的图片。

## 你最喜欢的图片替换方法是什么，你如何选择使用

## 你会如何解决特定浏览器的样式问题

- normalize.less

## 如何为有功能限制的浏览器提供网页

- 渐进增强  优雅降级
- Media Query
- CSS hack
- 条件判断 ` 除IE外都可识别 `

## 有哪些的隐藏内容的方法 (如果同时还要保证屏幕阅读器可用呢)？

- display: none
- overflow: hidden
- visibility: hidden

## 你用过媒体查询，或针对移动端的布局/CSS 吗

- 媒体查询： 