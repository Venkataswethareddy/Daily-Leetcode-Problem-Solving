# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3379 - Transformed Array
Submission: https://leetcode.com/problems/transformed-array/solutions/7582938/easy-by-codeauragirl-gn7a
Solution (Dart):

```
class Solution {
  List<int> constructTransformedArray(List<int> nums) {
    int n = nums.length;
    List<int> res = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      int shift = nums[i] % n;
      int idx = (i + shift + n) % n;
      res[i] = nums[idx];
    }

    return res;
  }
}
```

If you like my solution, please give it a rating. Thank you.
