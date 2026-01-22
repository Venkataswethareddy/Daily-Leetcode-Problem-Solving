# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3315 - Construct the Minimum Bitwise Array II
Submission: https://leetcode.com/problems/construct-the-minimum-bitwise-array-ii/solutions/7585695/easy-by-codeauragirl-9cgz
Solution (Dart):

```
class Solution {
  List<int> minBitwiseArray(List<int> nums) {
    List<int> ans = [];

    for (final num in nums) {
      ans.add(num == 2 ? -1 : num - _getLeadingOneOfLastGroupOfOnes(num));
    }

    return ans;
  }

  int _getLeadingOneOfLastGroupOfOnes(int num) {
    int leadingOne = 1;
    while ((num & leadingOne) > 0) {
      leadingOne <<= 1;
    }
    return leadingOne >> 1;
  }
 }
```

If you like my solution, please give it a rating. Thank you.
