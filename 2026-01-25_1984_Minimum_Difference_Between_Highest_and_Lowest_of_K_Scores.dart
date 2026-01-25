# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1984 - Minimum Difference Between Highest and Lowest of K Scores
Submission: https://leetcode.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/solutions/7585629/easy-by-codeauragirl-r2z2
Solution (Dart):

```
class Solution {
  int minimumDifference(List<int> nums, int k) {
    nums.sort();
    int ans = 1 << 60;
    for (int i = 0; i + k - 1 < nums.length; i++) {
      int d = nums[i + k - 1] - nums[i];
      if (d < ans) ans = d;
    }
    return ans;
  }
}
```

If you like my solution, please give it a rating. Thank you.
