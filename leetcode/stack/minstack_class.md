# Hot100 第21题：最小栈

栈可以用list方便的模拟各种操作；
难点在于题目要求常数时间返回当前栈中的最小元素——
解决方法是用空间换时间，维护一个“最小值栈”，末尾元素对应当前“普通栈”里的最小元素
```python
class MinStack(object):

    def __init__(self):
        self.stack = []
        self.minstack = []

    def push(self, value):
        """
        :type value: int
        :rtype: None
        """
        self.stack.append(value)
        if not self.minstack:
            self.minstack.append(value)
        else:
            self.minstack.append(min(value, self.minstack[-1]))

    def pop(self):
        """
        :rtype: None
        """
        self.stack.pop()
        self.minstack.pop()

    def top(self):
        """
        :rtype: int
        """
        return self.stack[-1]

    def getMin(self):
        """
        :rtype: int
        """
        return self.minstack[-1]