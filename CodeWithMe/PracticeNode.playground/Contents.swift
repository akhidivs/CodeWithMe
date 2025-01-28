import UIKit

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


isValidString(string: "{{}}{}([])")
