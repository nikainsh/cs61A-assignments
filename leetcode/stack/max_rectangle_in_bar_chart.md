# Hot100:第84题 柱状图中最大的矩形

首先，思路是对每一个高度进行枚举，只要知道它左右侧第一个更低的高度对应的横坐标，即可算出它对应的最大矩形，最后在所有矩形中取最大值。

对于**左右侧第一个更低的高度**这类问题，易知应该使用单调栈。

下面就是代码实现。这部分还有一个小trick，可以不做**左->右 + 右->左**两次遍历，而是仅用一次遍历即可求出两侧分别对应的list。

```python
class Solution(object):
    def largestRectangleArea(self, heights):
        """
        :type heights: List[int]
        :rtype: int
        """
        n = len(heights)
        leftmin, rightmin = [0]*n, [n]*n
        mono_stack = [] # 这个单调栈维护的是一部分从左到右递增的列
        for i in range(n):
            while mono_stack and heights[mono_stack[-1]] >= heights[i]: # 如果当前列更低，那么为了维护单调性需要将栈顶元素弹出
                rightmin[mono_stack[-1]] = i # 栈中的那些列被弹出就代表它们遇到了右侧的比自己低的列
                mono_stack.pop()
            leftmin[i] = mono_stack[-1] if mono_stack else -1
            mono_stack.append(i)
        ans = max((rightmin[i]-leftmin[i]-1)*heights[i] for i in range(n)) if n else 0 #这里注意边界条件：存放的左右最小值都是不包含的列， 所以宽度为right-left-1
        return ans