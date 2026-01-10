# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 712 - Minimum ASCII Delete Sum for Two Strings
Submission: https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/solutions/7585797/easy-by-codeauragirl-eml3
Solution (Dart):

```
class Solution {
  int minimumDeleteSum(String s1, String s2) {
    int n = s1.length, m = s2.length;
    List<List<int>> dp =
        List.generate(n + 1, (_) => List.filled(m + 1, 0));

    for (int i = 1; i <= n; i++) {
      dp[i][0] = dp[i - 1][0] + s1.codeUnitAt(i - 1);
    }
    for (int j = 1; j <= m; j++) {
      dp[0][j] = dp[0][j - 1] + s2.codeUnitAt(j - 1);
    }

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= m; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] = _min(
            dp[i - 1][j] + s1.codeUnitAt(i - 1),
            dp[i][j - 1] + s2.codeUnitAt(j - 1),
          );
        }
      }
    }
    return dp[n][m];
  }

  int _min(int a, int b) => a < b ? a : b;
}
```

If you like my solution, please give it a rating. Thank you.
