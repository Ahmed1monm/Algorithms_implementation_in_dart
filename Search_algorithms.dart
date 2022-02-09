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
}
