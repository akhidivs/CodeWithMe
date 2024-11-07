# CodeWithMe

Welcome to my Swift Interview solution repository! Here, you'll find well structured and efficient solutions to a variety of programming problems commonly asked in technical interviews. Each solution is implemented in Swift, showcasing clean code practices, optimized logic, and readability.

I created this repository to help others and myself practice and review essential coding concepts. Whether you're prepping for an interview or brushing up on Swift, I hope you find these solutions helpful.

**Happy Coding!**

### Problem 1 (2Sum)
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
