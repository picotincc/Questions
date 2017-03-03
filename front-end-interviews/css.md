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
