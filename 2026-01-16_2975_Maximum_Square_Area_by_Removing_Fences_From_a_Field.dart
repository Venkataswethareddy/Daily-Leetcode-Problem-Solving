# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 2975 - Maximum Square Area by Removing Fences From a Field
Submission: https://leetcode.com/problems/maximum-square-area-by-removing-fences-from-a-field/solutions/7585754/easy-by-codeauragirl-nakz
Solution (Dart):

```
class Solution {
  int maximizeSquareArea(
      int m, int n, List<int> h, List<int> v) {

    final hb = [...h, 1, m]..sort();
    final edges = <int>{};

    for (int i = 0; i < hb.length; i++) {
      for (int j = i + 1; j < hb.length; j++) {
        edges.add(hb[j] - hb[i]);
      }
    }

    final vb = [...v, 1, n]..sort();
    int best = -1;

    for (int i = 0; i < vb.length; i++) {
      for (int j = i + 1; j < vb.length; j++) {
        int d = vb[j] - vb[i];
        if (edges.contains(d) && d > best) {
          best = d;
        }
      }
    }

    if (best == -1) return -1;
    return (best * best) % 1000000007;
  }
}
```

If you like my solution, please give it a rating. Thank you.
