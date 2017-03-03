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
