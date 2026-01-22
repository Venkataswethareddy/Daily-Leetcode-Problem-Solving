# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3507 - Minimum Pair Removal to Sort Array I
Submission: https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/solutions/7585678/easy-by-codeauragirl-nj73
Solution (Dart):

```
class Solution {
  int minimumPairRemoval(List<int> nums) {
    int ans = 0;

    while (_hasInversion(nums)) {
      List<int> pairSums = [];

      for (int i = 0; i < nums.length - 1; i++) {
        pairSums.add(nums[i] + nums[i + 1]);
      }

      int minPairSum = pairSums.reduce((a, b) => a < b ? a : b);
      int minPairIndex = pairSums.indexOf(minPairSum);

      nums[minPairIndex] = minPairSum;
      nums.removeAt(minPairIndex + 1);
      ans++;
    }

    return ans;
  }

  bool _hasInversion(List<int> nums) {
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] > nums[i + 1]) {
        return true;
      }
    }
    return false;
  }
}
```

If you like my solution, please give it a rating. Thank you.
