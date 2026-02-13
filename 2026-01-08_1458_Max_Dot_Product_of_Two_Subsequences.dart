# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1458 - Max Dot Product of Two Subsequences
Submission: https://leetcode.com/problems/max-dot-product-of-two-subsequences/solutions/7588354/easy-by-codeauragirl-x8d6
Solution (Dart):

```
class Solution {
  int maxDotProduct(List<int> nums1, List<int> nums2) {
    int n = nums1.length, m = nums2.length;
    List<List<int>> dp =
        List.generate(n, (_) => List.filled(m, -1 << 60));

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        int prod = nums1[i] * nums2[j];
        int best = prod;

        if (i > 0 && j > 0) {
          best = _max(best, prod + dp[i - 1][j - 1]);
        }
        if (i > 0) best = _max(best, dp[i - 1][j]);
        if (j > 0) best = _max(best, dp[i][j - 1]);

        dp[i][j] = best;
      }
    }
    return dp[n - 1][m - 1];
  }

  int _max(int a, int b) => a > b ? a : b;
}
```

If you like my solution, please give it a rating. Thank you.
