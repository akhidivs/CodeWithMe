

// Stack type
// LIFO structure
// top - properties
// push, pop, peek - main operations
// isEmpty - check if stack is empty

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


//MARK: Use cases

let stackOfNames = Stack<String>()
stackOfNames.push("A")
stackOfNames.push("B")
stackOfNames.push("C")
print(stackOfNames.peek())
stackOfNames.pop()
stackOfNames.pop()
print(stackOfNames.peek())
stackOfNames.pop()
print(stackOfNames.peek())





// MARK: Queue using 2 stacks

public class MyQueue<T: Equatable> {
  
  private var stackNewestOnTop = Stack<T>()
  private var stackOldestOnTop = Stack<T>()
  
  private func shiftsDataWhenNecessary() {
    if stackOldestOnTop.isEmpty() {
      while !stackNewestOnTop.isEmpty() {
        if let elementToTransfer = stackNewestOnTop.pop() {
          stackOldestOnTop.push(elementToTransfer)
        }
      }
    }
  }
  
  public func isEmpty() -> Bool {
    return stackOldestOnTop.isEmpty()
  }
  
  public func peek() -> T? {
    shiftsDataWhenNecessary()
    return stackOldestOnTop.peek()
  }
  
  public func enque(_ data: T) {
    stackNewestOnTop.push(data)
  }
  
  public func deque() -> T? {
    shiftsDataWhenNecessary()
    return stackOldestOnTop.pop()
  }
}


// Use cases of queue

let queueOfAudience = MyQueue<String>()
queueOfAudience.enque("A")
queueOfAudience.enque("B")
queueOfAudience.enque("C")
print(queueOfAudience.peek())
queueOfAudience.deque()
queueOfAudience.deque()
print(queueOfAudience.peek())
queueOfAudience.deque()
print(queueOfAudience.peek())



