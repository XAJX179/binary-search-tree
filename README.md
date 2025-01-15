# Table of contents

<!--toc:start-->
- [Table of contents](#table-of-contents)
  - [Binary Search Tree](#binary-search-tree)
  - [📦 Structure](#-structure)
  - [🛠 Features](#-features)
    - [breadth-first-search](#breadth-first-search)
<!--toc:end-->

## Binary Search Tree

BST is a data structure consisting of nodes containing data with left and right
pointers both of which points either to a other node or nil and when BST is
balanced meaning its root is almost a middle value and for each node its left
subtree/node is of smaller value and right subtree/node is bigger, it looks
like a tree.

---

## 📦 Structure

```plaintext
├── lib
│   ├── binary_search_tree
│   │   ├── helpers
│   │   │   └── helpers.rb
│   │   ├── node.rb
│   │   └── tree.rb
│   └── binary_search_tree.rb
└── main.rb // just a file i used for testing my trees
```

---

## 🛠 Features

- `#insert(value)` - inserts a new node with given value into the tree.
- `#delete(value)` - deletes a node with given value from the tree.
- `#find(value)` - finds returns the node in the tree with the given value.
- `#level_order` - breadth-first-search tree traversal.

---

### breadth-first-search

- `#inorder` -  traverse the tree in preorder DLR.
- `#preorder` - traverse the tree in inorder LDR.
- `#postorder` - traverse the tree in postorder LRD.

---

- `#height(node)` - returns the height of the given node (number of edges in
longest path from the node to a leaf node)
- `#depth(target)` - returns the depth of the target node (number of edge in
path from the node to the tree's root)
- `#balanced?` - returns `true` if the tree is balanced.
- `#rebalance` - rebalances tree.
