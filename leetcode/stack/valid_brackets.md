# Hot100 第20题：有效括号

## 初版代码

```python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        if not s:
            return True
        if len(s) %2 == 1:
            return False
        stack = [s[0]]
        s = s[1:]
        while s:
            if s[0] == '{' or s[0] == '(' or s[0] == '[':
                stack.append(s[0])
            else:
                if stack:
                    if (s[0]=='}' and stack[-1]=='{') or (s[0]==')' and stack[-1]=='(') or (s[0]==']' and stack[-1]=='['):
                        stack.pop()
                    else:
                        return False
                else:
                    return False
            s = s[1:]
        if stack:
            return False
        return True
```
明显代码过于冗长，条件分支语句太多；切片操作是O(n)的，这样实际运行时长的复杂度可能达到O(n^2)；

## 优化码风版：

```python
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack = []
        mapping = {')':'(', '}':'{', ']':'['} #使用映射表简化条件分支语句
        for c in s: #直接遍历每个字符即可，不需要切片
            if c in mapping.keys():
                if stack and stack[-1] == mapping[c]:
                    stack.pop()
                else:
                    return False
            else:
                stack.append(c)
        return not stack