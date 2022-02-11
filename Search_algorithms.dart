import 'dart:math';

class SearchAlgorithms {
  /* 
  Binary Search which is D&C algorithm 
  it tackes Array of int and int target
  and returns the index of the target

  O(Log(n))
  */
  binarySearch(List<int> yourList, int target) {
    late int startPtr = 0;
    late int endPtr = yourList.length - 1;
    late int midPtr;

    while (startPtr <= endPtr) {
      midPtr = ((endPtr + startPtr) / 2).floor();

      if (target == yourList[midPtr]) {
        return midPtr;
      } else if (target > yourList[midPtr]) {
        startPtr = midPtr + 1;
      } else if (target < yourList[midPtr]) {
        endPtr = midPtr - 1;
      } else {
        print('No match');
        return null;
      }
    }
  }

// Linear search it tackes array of int and target in
//it retuns the index of the target in this array
// O(n)
  LinearSearch(List<int> arr, int target) {
    for (int i = 0; i < arr.length; i++) {
      if (target == arr[i]) {
        return i;
      }
    }
    print('no match');
    return null;
  }

  /*
    Jumb search tackes sorted array 
    returns int number which is the index of the target
    O((n)^0.5)
  */
  JumpSearch(List<int> myList, int Target) {
    int mainListLength = myList.length;
    int block = (sqrt(mainListLength)).floor();
    int counter = 0;

    int? specialLinearSearch(int start, int end, int target) {
      List<int> subArray = [];

      // Adding the section I will aplly linear search on it
      for (int i = 0; i < (end - start + 1); i++) {
        subArray.add(myList[start + i]);
      }
      print(subArray.toString());
      for (int i = 0; i < subArray.length; i++) {
        if (target == subArray[i]) {
          return i;
        }
      }
      return null;
    }

    while (counter * block <= mainListLength) {
      print(counter.toString());
      // For applying linear search
      if (myList[counter * block] == Target) {
        return (counter * block);
      }

      if (myList[counter * block] < Target) {
        counter++;
      } else if (myList[counter * block] > Target) {
        int? subIndex = specialLinearSearch(
            ((counter - 1) * block), (counter * block), Target);

        if (subIndex != null) {
          print(subIndex.toString());
          print(((counter - 1) * block).toString());
          return subIndex + ((counter - 1) * block);
        } else {
          print('sub index = null');
        }
      }
    }

    print('no match');
  }
}
