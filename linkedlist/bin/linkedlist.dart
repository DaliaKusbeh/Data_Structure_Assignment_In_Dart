import 'dart:io';

void main() {
  LinkedList list = LinkedList();
  int choice;

  do {
    print("\nLinkedList Operations:\n");
    print("1. Create a linked list");
    print("2. Print in reverse");
    print("3. Find the middle node");
    print("4. Reverse the linked list");
    print("5. Remove all occurrences of a value");
    print("6. Print the linked list");
    print("7. Exit");

    stdout.write("Enter your choice: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        int numNodes;
        stdout.write("Enter the number of nodes: ");
        numNodes = int.parse(stdin.readLineSync()!);
        for (int i = 0; i < numNodes; i++) {
          stdout.write("Enter data for node $i: ");
          int data = int.parse(stdin.readLineSync()!);
          Node newNode = Node(data);
          newNode.next = list.head;
          list.head = newNode;
        }
        // list.printListInLine();
        break;
      case 2:
        list.printReverseInLine(list.head);
        print("\n\t\t\t\t-----------------------------------------------\n");
        break;
      case 3:
        Node? middleNode = list.findMiddleNode();
        if (middleNode != null) {
          stdout.write("Middle node: ${middleNode.data}\n");
        } else {
          stdout.write("List is empty\n");
        }
        print("\n\t\t\t\t-----------------------------------------------\n");
        break;
      case 4:
        list.reverse();
        // list.printListInLine();
        print("\n\t\t\t\t-----------------------------------------------\n");
        break;
      case 5:
        stdout.write("Enter the value to remove: ");
        int value = int.parse(stdin.readLineSync()!);
        list.removeAllOccurrences(value);
        // list.printListInLine();
        print("\n\t\t\t\t-----------------------------------------------\n");
        break;
      case 6:
        list.printListInLine();
        print("\n\t\t\t\t-----------------------------------------------\n");
        break;
      case 7:
        stdout.write("Exiting...\n");
        break;
      default:
        stdout.write("Invalid choice\n");
        print("\n\t\t\t\t-----------------------------------------------\n");
    }
  } while (choice != 7);
}

class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void printListInLine() {
    Node? current = head;
    stdout.write("Your List : [ ");
    while (current != null) {
      stdout.write(" ${current.data} ");
      current = current.next;
    }
    stdout.write(" ]\n");
    print("\n\t\t\t\t-----------------------------------------------\n");
  }

  void printReverseInLine(Node? node) {
    if (node == null) return;
    // printReverseInLine(node.next);
    stdout.write(" ${node.data} ");
  }

  Node? findMiddleNode() {
    if (head == null) return null;
    Node? slow = head, fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow;
  }

  void reverse() {
    Node? current = head;
    Node? previous = null;
    Node? next;
    while (current != null) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    head = previous;
  }

  void removeAllOccurrences(int value) {
    while (head != null && head!.data == value) {
      head = head!.next;
    }
    Node? current = head;
    Node? prev = null;
    while (current != null) {
      if (current.data == value) {
        prev!.next = current.next;
      } else {
        prev = current;
      }
      current = current.next;
    }
  }
}
