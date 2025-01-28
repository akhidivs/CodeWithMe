import UIKit

public class Node<T> {
  
  public var next: Node?
  public var data: T
  
  public init(data: T) {
    self.data = data
  }
  
}

public final class LinkedList<T: Equatable> {
  
  private var head: Node<T>?
  
  public init(head: Node<T>) {
    self.head = head
  }
  
  //MARK: append method adds element to the end of linked list
  public func append(data: T) {
    
    guard let head = self.head else {
      self.head = Node(data: data)
      return
    }
    
    var current: Node = head
    while (current.next != nil) {
      current = current.next!
    }
    current.next = Node(data: data)
  }
  
  //MARK: prepend method adds element in the begining of linked list
  public func prepend(data: T) {
    
    guard let head = self.head else {
      self.head = Node(data: data)
      return
    }
    
    let newHead = Node(data: data)
    newHead.next = head
    self.head = newHead
    
  }
  
  //MARK: delete node with given data
  public func delete(with data: T) {
    
    guard let head = self.head else {
      return
    }
    
    if head.data == data {
      self.head = head.next
      return
    }
    
    var current: Node = head
    while (current.next != nil) {
      if current.next?.data == data {
        current.next = current.next?.next
        return
      }
      current = current.next!
    }
  }
  
  
  //MARK: Utilities Method
  public func show() {
    
    guard let head = self.head else {
      print("The Linked List is empty. Please create one.")
      return
    }
    
    var current: Node = head
    print("\n*** Linked List ***")
    
    while (current.next != nil) {
      print("-->\(current.data)", terminator: "")
      current = current.next!
    }
    print("-->\(current.data)", terminator: "")
    
  }
  
}



//MARK: Use Cases

// Create a LinkedList and append few elements using **append**
let head = Node<Int>(data: 8)
var myLinkedList = LinkedList<Int>(head: head)
myLinkedList.append(data: 7)
myLinkedList.append(data: 5)
myLinkedList.append(data: 3)
myLinkedList.append(data: 1)
myLinkedList.show()

// Prepend element by replacing head
myLinkedList.prepend(data: 9)
myLinkedList.show()

// Delete node with given data
myLinkedList.delete(with: 1)
myLinkedList.show()
myLinkedList.delete(with: 5)
myLinkedList.show()
myLinkedList.delete(with: 9)
myLinkedList.show()

