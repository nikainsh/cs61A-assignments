# Hot100 T104 二叉树最大深度

直接递归即可，这样做的空间复杂度等价于栈的深度，也就是O(height)；若是采用队列反而达到O(n)。
```python
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: int
        """
        if root is None:
            return 0
        return 1 + max(self.maxDepth(root.left), self.maxDepth(root.right))