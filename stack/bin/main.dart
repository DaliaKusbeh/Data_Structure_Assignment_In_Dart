import 'dart:io';

void main() {
  while (true) {
    print("\n\t\t\t\tHello User .. Choose An Option:");
    print("1. Reverse a List");
    print("2. Balance the Parentheses");
    print("3. Exit\n");
    stdout.write("Your choice is : ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        processListReversal();
        break;
      case '2':
        processParenthesesBalancing();
        break;
      case '3':
        print("Thank you .. Goodbye!");
        return;
      default:
        print("Wrong choice. Please choose a correct option.");
        break;
    }
  }
}

void processListReversal() {
  stdout.write("Enter numbers separated by spaces (e.g., 1 2 3 4 5): ");
  List<dynamic> myList =
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e)).toList();
  print("The Original List: $myList");
  print("\nThe Reversed List: [ ${reverseList(myList)} ]");
  print(
      "\t\t---------------------------------------------------------------\t\t");

  askForContinuation();
}

String reverseList(List<dynamic> myList) {
  String reversed = '';
  for (int i = myList.length - 1; i >= 0; i--) {
    reversed += '${myList[i]} ';
  }
  return reversed.trim();
}

void processParenthesesBalancing() {
  stdout.write(
      "Enter test strings separated by spaces (e.g., '(()) (())) ()()()'): ");
  List<String> testStrings = stdin.readLineSync()!.split(' ');
  for (var testString in testStrings) {
    print("Your '$testString' balanced is ${isBalanced(testString)}");
    print(
        "\n\t\t---------------------------------------------------------------\t\t");
  }

  askForContinuation();
}

bool isBalanced(String str) {
  List<String> stack = [];

  for (int i = 0; i < str.length; i++) {
    String currentChar = str[i];

    if (currentChar == '(') {
      stack.add(currentChar);
    } else if (currentChar == ')') {
      if (stack.isEmpty) {
        return false;
      }
      stack.removeLast();
    }
  }

  return stack.isEmpty;
}

void askForContinuation() {
  stdout.write("\nDo you want to go back to the main menu? (yes/no) : ");
  String? continueChoice = stdin.readLineSync()?.toLowerCase();

  if (continueChoice != 'yes') {
    exit(0);
  }
}
