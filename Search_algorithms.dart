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
  int? JumpSearch(List arr, int target) {
    // initialize pointers
    int leadPtr = 0;
    int lagPtr = 0;
    // calc jump
    num jump = pow(arr.length, 0.5);
    // loop on array
    while (leadPtr < (arr.length)) {
      //base case
      if (arr[leadPtr] == target) {
        return leadPtr;
      }
      // jump
      else if (target > arr[leadPtr]) {
        lagPtr = leadPtr + 1;
        leadPtr += jump.floor() - 1;
      }
      // check if we got the range that our target is belong
      else if (arr[leadPtr] > target) {
        // linear search in range lead and lag pointers
        for (int i = lagPtr; i < leadPtr; i++) {
          if (arr[i] == target) {
            return i;
          }
        }
      }
    }

    // for wrong target
    print('not found');
    return null;
  }

// exponential search
// input ==> sorted array
// Time complexity ==> O(lg n)
//return index
  exponentialSearch(List<int> sortedList, int target) {
    if (sortedList[0] == target) return 0;
    int i = 1;
    while (i < sortedList.length) {
      if (sortedList[i] == target) return i;
      // find subArray
      if (sortedList[i] < target) {
        if (i * 2 > (sortedList.length - 1)) {
          i = sortedList.length - 1;
        } else {
          i = i * 2;
        }
      } else if (sortedList[i] > target) {
        // binary search in subArray
        int startPointer = (i / 2).floor();
        int endPointer = i;
        int midPointer;
        while (startPointer < endPointer) {
          midPointer = ((startPointer + endPointer) / 2).floor();
          if (sortedList[midPointer] == target)
            return midPointer;
          else if (sortedList[midPointer] > target)
            endPointer = midPointer - 1;
          else if (sortedList[midPointer] < target)
            startPointer = midPointer + 1;
          else {
            print('not found or array not sorted ');
          }
        }
      }
    }
  }
}
