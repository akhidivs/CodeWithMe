
// Queue type
// FIFO structure
// head, tail - properties
// enque, deque, peek - operations
// isEmpty - check if stack is empty

public final class Queue<T: Equatable> {
  
  private final class QueueNode<T> {
    var data: T
    var next: QueueNode?
    init(data: T) {
      self.data = data
    }
  }
  
  private var head: QueueNode<T>?
  private var tail: QueueNode<T>?
  
  public func isEmpty() -> Bool {
    return head == nil
  }
  
  public func peek() -> T? {
    return head?.data
  }
  
  public func enque(_ data: T) {
    let newNode = QueueNode(data: data)
    tail?.next = newNode
    tail = newNode
    if (head == nil) {
      head = newNode
    }
  }
  
  public func deque() -> T? {
    let data = head?.data
    head = head?.next
    if head == nil {
      tail = nil
    }
    return data
  }
  
}


// Use cases of queue

let queueOfAudience = Queue<String>()
queueOfAudience.enque("A")
queueOfAudience.enque("B")
queueOfAudience.enque("C")
print(queueOfAudience.peek())
queueOfAudience.deque()
queueOfAudience.deque()
print(queueOfAudience.peek())
queueOfAudience.deque()
print(queueOfAudience.peek())

