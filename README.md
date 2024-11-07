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
