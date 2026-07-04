# Hot100 第23题：每日温度

这道题使用了**单调栈**的思想：在栈的基础操作上，加入对单调性的维护。

代码如下：

```python
class Solution(object):
    def dailyTemperatures(self, temperatures):
        """
        :type temperatures: List[int]
        :rtype: List[int]
        """
        answer = [0] * len(temperatures)
        stack = []
        for t in range(len(temperatures)):
            if stack and temperatures[stack[-1]] < temperatures[t]:
                while stack and temperatures[stack[-1]] < temperatures[t]:
                    answer[stack[-1]] = t - stack[-1]
                    stack.pop()
            stack.append(t)
        return answer