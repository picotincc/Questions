### 🎃数据结构

#### 二叉树

- 高度为`k`的二叉树，最多有`2^k-1`个nodes。

- 第`i`层最多有`2^(i-1)`个nodes。

- 叶节点个数为`m`，二叉树的最小高度为`Math.ceil(log2m) + 1`。

- Full Binary Tree

  - Every node has 0 or 2 children
  - The number of leaf nodes if the number of internal nodes plus 1

  > 国内的定义似乎就是国外的 **Perfect Binary Tree**

- Complete Binary Tree

  - all levels except last level are filled
  - nodes on the last level are as left as possible

- Binary Search Tree

  - left node < root < right node
  - all nodes on the left subtree is smaller than the root
  - all nodes on the right subtree is bigger than the root
  - no duplicate nodes
  - O(logn)

- Balanced Binary Tree (AVL Tree)

  - the difference between heights of left and right subtrees is 1 or less

- Black Red Tree

  - every node is either red or black
  - root is black
  - if a node is red, both of his children are black

- Tree Traversal

  - Inorder: left - root - right
  - Preorder: root - left - right
  - Postorder: left - right - root
  - Breadth First or Level Order Traversal: 宽度优先 **（BFS）**

#### 堆

- Min Binary Heap
  - root is the smallest in the tree
  - recursively true for all nodes in the heap
- Max Binary Heap is similar to Min Binary Heap
- Build Heap: O(n)
- Heap Sort: O(nlogn)

#### 栈

- Last In First Out
- pop, push, peek, isEmpty
- Used for Redo/Undo, Infix & Postfix Expression

#### 队列

- First In First out
- Operations
  - Enqueue: add an item to the queue
  - Dequeue: remove an item from the queue
  - Front: get the front item from the queue
  - Rear: get the last item from the queue
- Priority Queue
  - Every item has a priority
  - Higher priority is dequeued ealier
  - Older item is dequeued ealier if priority is the sam



#### Hashing

- Hash Function
  - A function that converts a big number or string to a small integer that can be used as index in hash table
  - Collision Handling: Chaining, Open Addressing
  - Open Addressing: If collision happens, find the next **first empty** slot.






### 🎃进程与线程

#### 进程

- A process has a self-contained execution environment. It has a complete, private set of run-time resources suck as text region, data region and stack region.
- A process is an excution of an application
- Communication between processes
  - pipes, message queue
  - RPC
  - socket
  - signal：used to synchronize processes
  - shared memory

#### 线程

- A process can have many threads, threads are used for concurrent jobs
- The memory space in the process is shared by the threads
- Some resources need a mutex to prevent several threads read and write to them at the same time.
- Some resources can hold no more than n threads, so it use Semaphore to prevent conflict
- Mutex is a special situation of Semaphore (n=1)




### 🎃多态 Polymorphism

- Program and Code and perform in different ways without modifying the code
- Ways to implement Polymorphism
  - Extend
  - Interface
  - Override




