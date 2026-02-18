1class Solution {
2  int maxDotProduct(List<int> nums1, List<int> nums2) {
3    int n = nums1.length, m = nums2.length;
4    List<List<int>> dp =
5        List.generate(n, (_) => List.filled(m, -1 << 60));
6
7    for (int i = 0; i < n; i++) {
8      for (int j = 0; j < m; j++) {
9        int prod = nums1[i] * nums2[j];
10        int best = prod;
11
12        if (i > 0 && j > 0) {
13          best = _max(best, prod + dp[i - 1][j - 1]);
14        }
15        if (i > 0) best = _max(best, dp[i - 1][j]);
16        if (j > 0) best = _max(best, dp[i][j - 1]);
17
18        dp[i][j] = best;
19      }
20    }
21    return dp[n - 1][m - 1];
22  }
23
24  int _max(int a, int b) => a > b ? a : b;
25}
26