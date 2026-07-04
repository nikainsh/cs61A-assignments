# Hot100 第22题：字符串解码

思路上没有什么好记录的；
代码实现上：**''.join**可用于将列表的各个元素连接成一个str
```python
class Solution(object):
    def decodeString(self, s):
        """
        :type s: str
        :rtype: str
        """
        stack = []
        tmpstr = []
        tmpn = []
        for ch in s:
            if ch != ']':
                stack.append(ch)
            else:
                while stack[-1] != '[':
                    tmpstr.append(stack[-1])
                    stack.pop()
                stack.pop()
                while stack and stack[-1].isdigit():
                    tmpn.append(stack[-1])
                    stack.pop()
                tmp = int(''.join(tmpn[::-1])) #这里注意整数不是只有个位数...
                tmpn = []
                for _ in range(tmp):
                    for ch in tmpstr[::-1]:
                        stack.append(ch)
                tmpstr = []
        return ''.join(stack)