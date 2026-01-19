# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1292 - Maximum Side Length of a Square with Sum Less than or Equal to Threshold
Submission: https://leetcode.com/problems/maximum-side-length-of-a-square-with-sum-less-than-or-equal-to-threshold/solutions/7585725/easy-by-codeauragirl-iw3p
Solution (Dart):

```
class Solution {
  int maxSideLength(List<List<int>> mat, int t) {
    int m = mat.length, n = mat[0].length;
    var ps = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    int side = 0;

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        ps[i][j] =
            ps[i - 1][j] +
            ps[i][j - 1] -
            ps[i - 1][j - 1] +
            mat[i - 1][j - 1];

        int k = side + 1;
        if (i >= k && j >= k) {
          int sum =
              ps[i][j] -
              ps[i - k][j] -
              ps[i][j - k] +
              ps[i - k][j - k];
          if (sum <= t) side++;
        }
      }
    }
    return side;
  }
}
```

If you like my solution, please give it a rating. Thank you.
