# Hot100 第226题：翻转二叉树

思路上，比较直接的递归就可以解决；
代码实现上，复健要点：invertTree作为一个类内定义的方法，在调用时需要通过一个对象实例；此处递归调用没有实例，所以前面要加self。
时间复杂度为O(N),此处N是二叉树结点数目；空间复杂度为递归栈深度，这里是二叉树高度，平均情况为O(logN),最坏是O(N)
```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def invertTree(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: Optional[TreeNode]
        """
        if root is None:
            return root
        tmp = root.left
        root.left = root.right
        root.right = tmp
        self.invertTree(root.left)
        self.invertTree(root.right)
        return root