# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3510 - Minimum Pair Removal to Sort Array II
Submission: https://leetcode.com/problems/minimum-pair-removal-to-sort-array-ii/solutions/7585655/easy-by-codeauragirl-5n4f
Solution (Dart):

```
class Solution {
  int minimumPairRemoval(List<int> nums) {
    int n = nums.length;
    if (n <= 1) return 0;

    int size = 1;
    while (size < n) size <<= 1;

    final INF = 1 << 60;
    List<int> seg = List.filled(size * 2 - 1, INF);
    List<int> L = List.filled(size * 2 - 1, 0);
    List<int> R = List.filled(size * 2 - 1, 0);
    List<int> sum = List.filled(n, 0);
    List<List<int>> ptr = List.generate(n, (_) => [-1, -1]);

    int bad = 0;
    sum[0] = nums[0];
    ptr[0] = [-1, size - 1];

    for (int i = 1; i < n; i++) {
      if (nums[i] < nums[i - 1]) bad++;
      int si = size + i - 2;
      L[si] = i - 1;
      R[si] = i;
      seg[si] = nums[i - 1] + nums[i];
      sum[i] = nums[i];
      ptr[i] = [si, si + 1];
    }
    ptr[n - 1][1] = -1;

    for (int i = size - 2; i >= 0; i--) {
      seg[i] = seg[2 * i + 1] < seg[2 * i + 2] ? seg[2 * i + 1] : seg[2 * i + 2];
    }

    int res = 0;
    while (bad > 0) {
      int i = 0;
      while (2 * i + 1 < seg.length) {
        int l = 2 * i + 1, r = 2 * i + 2;
        i = seg[l] <= seg[r] ? l : r;
      }
      int a = L[i], b = R[i];
      int la = sum[a], rb = sum[b];
      if (la > rb) bad--;

      sum[a] = la + rb;
      int ns = sum[a];

      int lp = ptr[a][0], rp = ptr[b][1];
      ptr[a][1] = rp;

      if (lp != -1) {
        int x = L[lp];
        if (sum[x] > la && sum[x] <= ns) bad--;
        else if (sum[x] <= la && sum[x] > ns) bad++;
        _update(seg, lp, sum[x] + ns);
      }
      if (rp != -1) {
        int y = R[rp];
        if (rb > sum[y] && ns <= sum[y]) bad--;
        else if (rb <= sum[y] && ns > sum[y]) bad++;
        _update(seg, rp, ns + sum[y]);
        L[rp] = a;
      }
      _update(seg, i, INF);
      res++;
    }
    return res;
  }

  void _update(List<int> seg, int i0, int v) {
    int i = i0;
    if (seg[i] == v) return;
    seg[i] = v;
    while (i != 0) {
      i = (i - 1) >> 1;
      seg[i] = seg[2 * i + 1] < seg[2 * i + 2] ? seg[2 * i + 1] : seg[2 * i + 2];
    }
  }
}
```

If you like my solution, please give it a rating. Thank you.
