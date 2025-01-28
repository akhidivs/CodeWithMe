# CodeWithMe

Welcome to my Swift Interview solution repository! Here, you'll find well structured and efficient solutions to a variety of programming problems commonly asked in technical interviews. Each solution is implemented in Swift, showcasing clean code practices, optimized logic, and readability.

I created this repository to help others and myself practice and review essential coding concepts. Whether you're prepping for an interview or brushing up on Swift, I hope you find these solutions helpful.

**Happy Coding!**




### 1. Two Sum
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

**Example 1:**

Input: nums = [2,7,11,15], target = 9

Output: [0,1]

Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

```
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var hashSet: [Int: Int] = [Int: Int]()
  for i in 0..<nums.count {
    let complement = target - nums[i]
    if let compIndex = hashSet[complement] {
      return [i, compIndex]
    }
    hashSet[nums[i]] = i
  }
  return []
}
```

**Time Complexity:** O(n)

--------------------------------------------------

### 2. Longest Substring Without Repeating Characters
Given a string s, find the length of the longest substring without repeating characters.

**Example 1:**

Input: s = "abcabcbb"

Output: 3

Explanation: The answer is "abc", with the length of 3.

```
func longestUniqueSubstring(_ s: String) -> Int {
  var left = 0
  var right = 0
  var visitedNodes: [Character: Bool] = [Character: Bool]()
  var charArray = Array(s)
  var maxLength = 0
  
  if s.count == 0 {
    return 0
  }
  
  if s.count == 1 {
    return 1
  }
  
  while (right < s.count) {
  
    while (visitedNodes[charArray[right]] ?? false) {
      visitedNodes[charArray[left]] = false
      left += 1
    }
  
    visitedNodes[charArray[right]] = true
    maxLength = max(maxLength, right - left + 1)
    right += 1
  }
  
  return maxLength
}
```

**Time Complexity:** O(n)

--------------------------------------------------

### 3. Write a program to find the longest pallindrome substring in a given string.

**Example 1:**

Input: s = "abaab"

Output: baab

Explanation: The answer baab is the longest possible pallindromic substring.

```
func longestPallindromeSubstring(inputString: String) -> String {
    
    var charArray = Array(inputString)
    var maxLength = 1
    var start = 0
    var end = 0
    
    func expandAroundCenter(left: Int, right: Int) -> Int {
        var left = left
        var right = right
        
        while (left >= 0 && right < inputString.count && charArray[left] == charArray[right]) {
            left -= 1
            right += 1
        }
        
        return right - left - 1
    }
    
    for i in 0..<charArray.count {
        
        let oddLen = expandAroundCenter(left: i, right: i)
        let evenLen = expandAroundCenter(left: i, right: i+1)
        
        let len = max(oddLen, evenLen)
        
        if len > maxLength {
            maxLength = len
            start = oddLen > evenLen ? (i - maxLength/2) : (i - maxLength/2 + 1)
            end = i + maxLength/2
        }
    }
    
    let begin = inputString.index(inputString.startIndex, offsetBy: start)
    let last = inputString.index(inputString.startIndex, offsetBy: end + 1)
    
    return String(inputString[begin..<last])
}
```

**Time Complexity:** O(n^2)
--------------------------------------------------
### 4. Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.
Example 1:
Input: s = "()[]{}"
Output: true
Explanation: All the brackets are well-formed.
```
public final class Stack<T: Equatable> {
  
  private class StackNode<T> {
    
    var data: T
    var nextNode: StackNode?
    init(data: T) {
      self.data = data
    }
  }
  
  private var top: StackNode<T>?
  
  public func isEmpty() -> Bool {
    return top == nil
  }
  
  public func peek() -> T? {
    return top?.data
  }
  
  public func push(element: T) {
    let newNode = StackNode(data: element)
    newNode.nextNode = top
    top = newNode
  }
  
  public func pop() -> T? {
    let data = top?.data
    top = top?.nextNode
    return data
  }
  
}
private var tokens: [[Character]] = [["(", ")"], ["[", "]"], ["{", "}"]]
private var stack = Stack<Character>()
private func isOpeningParathesis(char: Character) -> Bool {
  for token in tokens {
    if char == token[0] {
      return true
    }
  }
  return false
}
private func matches(_ char: Character, _ stackTop: Character?) -> Bool {
  guard let stackTop = stackTop else { return false }
  for token in tokens {
    if char == token[1] && stackTop == token[0] {
      return true
    }
  }
  return false
}
private func isValidString(string: String) -> Bool {
  let charArray = Array(string)
  for char in charArray {
    if isOpeningParathesis(char: char) {
      stack.push(element: char)
    } else if stack.isEmpty() || !matches(char, stack.pop()) {
      return false
    }
  }
  
  return stack.isEmpty()
}
```
**Time Complexity:** O(n)
