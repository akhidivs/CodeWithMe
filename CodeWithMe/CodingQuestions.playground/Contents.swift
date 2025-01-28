
import Foundation

/*
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  1. Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
  You may assume that each input would have exactly one solution, and you may not use the same element twice.
  You can return the answer in any order.
  
  Example 1:
  
  Input: nums = [2,7,11,15], target = 9
  Output: [0,1]
  Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
  */
 
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
 
 // Use case
 //let array = [2, 7, 9, 1, 0, 3]
 //let target = 10
 //
 //print(twoSum(array, target))
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 
 /*
  2. Given a string s, find the length of the longest substring without repeating characters.
  
  Example 1:
  
  Input: s = "abcabcbb"
  Output: 3
  Explanation: The answer is "abc", with the length of 3.
  */
 
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
 
 // Use case
 //let inputString = "abbcaopqbac"
 //print(longestUniqueSubstring(inputString))
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 
 /*
  3. Write a program to find the longest pallindrome substring in a given string.
  */
 
 func findLongestPallindromeSubstring(input: String) -> String {
 
 var characters = Array(input)
 var maxLength = 1
 var start = 0
 var end = 0
 
 func expandAroundCenter(left: Int, right: Int) -> Int {
 var left = left
 var right = right
 
 while (left >= 0 && right < characters.count && characters[left] == characters[right]) {
 left -= 1
 right += 1
 }
 
 return right - left - 1
 }
 
 for i in 0..<characters.count {
 let len1 = expandAroundCenter(left: i, right: i)
 let len2 = expandAroundCenter(left: i, right: i+1)
 
 let len = max(len1, len2)
 
 if len > maxLength {
 maxLength = len
 start = len1 > len2 ? i - (maxLength/2) : i - (maxLength/2) + 1
 end = i + (maxLength/2)
 }
 }
 
 let begin = input.index(input.startIndex, offsetBy: start)
 let last  = input.index(input.startIndex, offsetBy: end + 1)
 return String(input[begin..<last])
 
 }
 
 
 
 
 //"bipolarralopsystem"
 //let input = "abab"
 //print(findLongestPallindromeSubstring(input: input))
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 
 /*
  4. Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed
  32-bit integer range [-231, 231 - 1], then return 0.
  Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
  
  Example 1:
  
  Input: x = 123
  Output: 321
  
  */
 
 func reverse(_ x: Int) -> Int {
 var result = 0
 var num = x
 while (num != 0) {
 result = result * 10 + num % 10
 num = num / 10
 }
 return result
 }
 
 // Use Case
 //let num = 123
 //print(reverse(num))
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  5. Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
  An input string is valid if:
  1. Open brackets must be closed by the same type of brackets.
  2. Open brackets must be closed in the correct order.
  3. Every close bracket has a corresponding open bracket of the same type.
  
  Example 1:
  
  Input: s = "()[]{}"
  Output: true
  */
 
 public final class Stack<T: Equatable> {
 
 private class StackNode<T> {
 var data: T
 var next: StackNode?
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
 
 public func push(_ data: T) {
 let newNode = StackNode(data: data)
 newNode.next = top
 top = newNode
 }
 
 public func pop() -> T? {
 let data = top?.data
 top = top?.next
 return data
 }
 
 }
 
 
 var tokens: [[Character]] = [["{", "}"], ["[", "]"], ["(", ")"]]
 var stack = Stack<Character>()
 
 private func isOpeningParenthesis(_ c: Character) -> Bool {
 for token in tokens {
 if token[0] == c {
 return true
 }
 }
 return false
 }
 
 private func matches(_ c: Character, _ stackTop: Character?) -> Bool {
 guard let top = stackTop else { return false }
 for token in tokens {
 if token[0] == top && token[1] == c {
 return true
 }
 }
 return false
 }
 
 func isValid(_ s: String) -> Bool {
 var charArray = Array(s)
 for c in charArray {
 if isOpeningParenthesis(c) {
 stack.push(c)
 } else if stack.isEmpty() || !matches(c, stack.pop()) {
 return false
 }
 }
 return stack.isEmpty() ? true : false
 }
 
 // Use case
 //let inputString = "{[(())]{[()]}}"
 //print(isValid(inputString))
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  6. You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list. You may assume the two numbers do not contain any leading zero, except the number 0 itself.
  */
 
 
 //Definition for singly-linked list.
 
 public class ListNode {
 public var val: Int
 public var next: ListNode?
 public init() { self.val = 0; self.next = nil; }
 public init(_ val: Int) { self.val = val; self.next = nil; }
 public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
 
 func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
 var resultNode: ListNode?
 var currentNode: ListNode?
 var sum: Int = 0
 var carry: Int = 0
 var l1 = l1
 var l2 = l2
 
 while l1 != nil || l2 != nil || carry != 0 {
 sum = carry
 
 if l1 != nil {
 sum += l1!.val
 l1 = l1?.next
 }
 
 if l2 != nil {
 sum += l2!.val
 l2 = l2?.next
 }
 
 let newNode = ListNode(sum % 10)
 carry = sum / 10
 
 
 if resultNode == nil {
 resultNode = newNode
 currentNode = resultNode
 } else {
 currentNode?.next = newNode
 currentNode = currentNode?.next
 }
 }
 return resultNode
 }
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  7. Sort an array of integers using **Merge Sort**
  */
 
 // merges two subarrays of array
 // first array is from [left, middle]
 // second array is from [middle + 1, right]
 private func merge(array: inout [Int],
 left: Int,
 middle: Int,
 right: Int) {
 
 var leftArray = [Int]()
 var rightArray = [Int]()
 var n1 = middle - left + 1
 var n2 = right - middle
 
 for i in 0..<n1 {
 leftArray.append(array[left + i])
 }
 
 for j in 0..<n2 {
 rightArray.append(array[middle + 1 + j])
 }
 
 print(leftArray, rightArray)
 
 var i = 0
 var j = 0
 
 var k = left
 
 while (i < n1 && j < n2) {
 if leftArray[i] <= rightArray[j] {
 array[k] = leftArray[i]
 i += 1
 } else {
 array[k] = rightArray[j]
 j += 1
 }
 k += 1
 }
 
 while (i < n1) {
 array[k] = leftArray[i]
 i += 1
 k += 1
 }
 
 while (j < n2) {
 array[k] = rightArray[j]
 j += 1
 k += 1
 }
 
 }
 
 private func mergeSort(array: inout [Int], left: Int, right: Int) {
 
 if (left < right) {
 let middle = left + (right - left)/2
 
 mergeSort(array: &array, left: left, right: middle)
 mergeSort(array: &array, left: middle + 1, right: right)
 
 merge(array: &array, left: left, middle: middle, right: right)
 }
 }
 
 
 
 
 // Use case
 //var inputArray = [1, 9, 5, 7, 3, 6]
 //mergeSort(array: &inputArray, left: 0, right: inputArray.count - 1)
 //print(inputArray)
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 
 /*
  8. Sort an array of integers using **Bubble Sort**
  */
 
 private func bubbleSort(array: inout [Int]) {
 
 let len = array.count - 1
 
 for i in 0..<len {
 for j in 0..<(len - i) {
 if array[j] > array[j+1] {
 let temp = array[j + 1]
 array[j+1] = array[j]
 array[j] = temp
 }
 }
 }
 }
 
 // Use case
 //var inputArray = [3, 7, 1, 2, 4, 8,6]
 //bubbleSort(array: &inputArray)
 //print(inputArray)
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  9. Given an array of time intervals where arr[i] = [starti, endi], the task is to merge all the overlapping intervals into one and output the result which should have only mutually exclusive intervals.
  
  Example 1:
  inputArray = [[1,4], [3, 7], [5, 9], [11, 13], [12, 10]]
  Output: [[1,9], [10,13]]
  */
 
 func sortIntervals(input: [[Int]]) -> [[Int]] {
 
 var result = [[Int]]()
 result = input.map { x in
 return [min(x[0], x[1]), max(x[0], x[1])]
 }
 
 result = result.sorted(by: { x, y in
 x[0] < y[0]
 })
 return result
 }
 
 private func mergeOverlappingIntervals(input: [[Int]]) -> [[Int]] {
 
 let sortedInput = sortIntervals(input: input)
 
 var mergedIntervals: [[Int]] = [sortedInput.first ?? [0, 0]]
 
 for i in 1..<sortedInput.count {
 let lastMerged = mergedIntervals.last ?? [0, 0]
 
 // check for overlap
 if sortedInput[i][0] >= lastMerged[0] && sortedInput[i][0] <= lastMerged[1] {
 let min = min(sortedInput[i][0], lastMerged[0])
 let max = max(sortedInput[i][1], lastMerged[1])
 mergedIntervals[mergedIntervals.count - 1] = [min, max]
 } else {
 mergedIntervals.append(sortedInput[i])
 }
 }
 
 return mergedIntervals
 
 }
 
 // Use case
 
 //let overlappingInput =  [[6, 8], [1,9], [2, 4], [4, 7], [9,12]]
 //let sortedIntervals = mergeOverlappingIntervals(input: overlappingInput)
 //print(sortedIntervals)
 
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  10. Rotate array to right N times.
  A = [3, 8, 9, 7, 6]
  K = 3
  The function should return [9, 7, 6, 3, 8].
  
  Three rotations were made:
  
  [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
  [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
  [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
  
  */
 
 
 private func rotateArray(_ array: inout [Int], times: Int) {
 let length = array.count
 var originalArray = array
 
 for i in 0..<length {
 var newIndex = i + times
 if newIndex >= length {
 newIndex = newIndex % length
 }
 array[newIndex] = originalArray[i] // 3, 4
 }
 }
 
 // Use case
 //var input = [3, 8, 9, 7, 6]
 //rotateArray(&input, times: 10)
 //print(input)
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  11. Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that
  i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
  Notice that the solution set must not contain duplicate triplets.
  
  Example 1:
  
  Input: nums = [-1,0,1,2,-1,-4]
  Output: [[-1,-1,2],[-1,0,1]]
  */
 
 
 private func threeSum(_ input: [Int], sum: Int) -> [[Int]] {
 
 let length = input.count
 var result = [[Int]]()
 
 for i in 0..<length {
 
 let requiredSum = sum - input[i]
 var hashTable = [Int: Int]()
 
 for j in i+1..<length {
 
 let complementNum = requiredSum - input[j]
 if hashTable[complementNum] != nil {
 let elementSet = [input[i], input[j], complementNum]
 result.append(elementSet)
 }
 hashTable[input[j]] = j
 }
 }
 
 return result
 }
 
 
 // Use case
 //let input = [-1, 0, 1, 2, -1, -4]
 //let sum = 0
 //print(threeSum(input, sum: sum))
 
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  12. Given a positive integer n, the task is to find the nth Fibonacci number.
  
  Example:
  n = 5
  Output: 5
  
  1, 1, 2, 3, 5 ---> 5 is the 5th fibonacci number in this sequence
  */
 
 
 // Time Complexity: O(2^n)
 private func fib(_ n: Int) -> Int {
 
 if n <= 1 {
 return n
 }
 
 let x = fib(n-1)
 let y = fib(n-2)
 
 return x + y
 
 }
 
 
 // Using Memoization -> Time complexity: O(n)
 private func fibUsingMemoization(n: Int, mem: inout [Int]) -> Int {
 
 if n <= 1 { return n }
 if mem[n] != -1 { return mem[n]}
 
 let x = fibUsingMemoization(n: n-1, mem: &mem)
 let y = fibUsingMemoization(n: n-2, mem: &mem)
 
 mem[n] = x + y
 
 return mem[n]
 }
 
 private func fibonacci(_ n: Int) -> Int {
 
 var ans = Array(repeating: -1, count: n+1)
 return fibUsingMemoization(n: n, mem: &ans)
 }
 
 
 // Reducing space complexity to constant using D.P
 private func fibAgain(_ n: Int) -> Int {
 
 var prevPrev = 0
 var prev = 1
 var current = 0
 
 for _ in 2..<(n+1) {
 current = prev + prevPrev
 prevPrev = prev
 prev = current
 }
 
 return current
 }
 
 // Use case
 //print(fibAgain(5))
 
 
 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  13. Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
  You have the following three operations permitted on a word:
  
  - Insert a character
  - Delete a character
  - Replace a character
  
  Example 1:
  Input: word1 = "intention", word2 = "execution"
  Output: 5
  Explanation:
  intention -> inention (remove 't')
  inention -> enention (replace 'i' with 'e')
  enention -> exention (replace 'n' with 'x')
  exention -> exection (replace 'n' with 'c')
  exection -> execution (insert 'u')
  */
 
 
 
 
 private func minOperation(s1: String, s2: String, m: Int, n: Int) -> Int {
 
 var cache = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: m+1)
 let word1 = Array(s1)
 let word2 = Array(s2)
 
 for i in 0..<(m+1) {
 cache[i][n] = m - i
 }
 
 for j in 0..<(n+1) {
 cache[m][j] = n - j
 }
 
 for i in stride(from: m-1, to: -1, by: -1) {
 for j in stride(from: n-1, to: -1, by: -1) {
 if word1[i] == word2[j] {
 cache[i][j] = cache[i+1][j+1]
 } else {
 cache[i][j] = 1 + min(cache[i+1][j], cache[i][j+1], cache[i+1][j+1])
 }
 }
 }
 return cache[0][0]
 }
 
 
 // Use case
 //print(minOperation(s1: "horse", s2: "rose", m: 5, n: 4))
 
*/







 //----------------------------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------------------------
 
 /*
  14. You are given a binary tree, and the task is to replace each node’s value with the sum of all elements present in its left and
  right subtree. Empty nodes are assumed to have a value of 0.
  
  Example 1:
  
  Original Binary Tree:
                                  1
                          2               3
                            4        5         6
                                  7     8
  
  Modified Binary Tree:
  
                                  35
                          4               26
                            0        15        0
                                  0      0






//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

/*
 15. Given two clock times (in HH:MM:SS format), change one time to other time in minimum number of operations. Here one operation is meant by shifting the hour, minute or second clock hand by 1 unit in either directions. The program follows all the basic rules of a clock for eg.: changing second’s hand from 59 to 0 will make 1 unit change for minute hand also. But this will be considered as only one operation.
 
 Example 1:
 Input : original_time = "10:10:10",
              new_time = "05:02:58"
 Output : 24
 Operations = 5 + 7 + 12 = 24
 */

private func minClockOperation(t1: String, t2: String) -> Int {
  
  let originalTime = t1.components(separatedBy: ":")
  let h1 = Int(originalTime[0])
  let m1 = Int(originalTime[1])
  let s1 = Int(originalTime[2])
  
  let newTime = t2.components(separatedBy: ":")
  let h2 = Int(newTime[0])
  let m2 = Int(newTime[1])
  let s2 = Int(newTime[2])
  
  let d1 = Int(h1! * 3600) + Int(m1! * 60) + s1!
  let d2 = Int(h2! * 3600) + Int(m2! * 60) + s2!
  
  let difference1 = abs(d1 - d2)
  let difference2 = 24 * 3600 - max(d1, d2) + min(d1, d2)
  
  let finalDifference = min(difference1, difference2)
  
  var h = finalDifference/3600
  let hRem = finalDifference % 3600
  
  if hRem > 1830 {
    h += 1
  }
  
  var m = hRem/60
  let mRem = hRem % 60
  
  if mRem > 30 {
    m += 1
  }
  
  let s = min(mRem, 60 - mRem)
  
  return h + m + s
}


// Use case
//print(minClockOperation(t1: "10:09:00", t2: "10:10:18"))


//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------

/*
 16. Write a program to find the square root of a given number.
 */





/*
 17. Given a number n , find the smallest number that has the same set of digits as n and is greater than n . If n is the greatest possible number with its set of digits, then print “not possible”.
 
 Example 1:
 n = 534976
 Output: 536479
 
 Example 2:
 n = 782910
 Output: 789012
 */

private func smallestGreaterNumber(_ num: Int) -> Int {
  var sortedDigits = [Int]()
  
  var number = num
  var lastDigit = number % 10
  number = number/10
  sortedDigits.append(lastDigit)
  
  var secondLastDigit = number % 10
  
  if lastDigit > secondLastDigit {
    number += lastDigit * Int(pow(10.0, 1)) + secondLastDigit
    return number
  }
  
  while (secondLastDigit > lastDigit) {
    sortedDigits.append(secondLastDigit)
    lastDigit = secondLastDigit
    number = number / 10
    secondLastDigit = number % 10
  }
  
  sortedDigits.sorted(by: { $0 < $1 })
  
  let len = sortedDigits.count - 1
  number += secondLastDigit * (pow(10.0, len) as NSDecimalNumber).intValue
  print(number)
  
  for i in stride(from: len , to: -1, by: -1) {
    number += sortedDigits[len - i] * (pow(10, i - 1) as NSDecimalNumber).intValue
  }
  
  print(sortedDigits)
  return number
}


// Use case
print(smallestGreaterNumber(534976))
*/





