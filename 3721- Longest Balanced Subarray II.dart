# CodeAuraGirl – LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3721 - Longest Balanced Subarray II  
Submission: https://leetcode.com/problems/longest-balanced-subarray-ii/solutions/7575995/easy-by-codeauragirl-f7f8/
Solution (Dart):

class Solution {
  int longestBalanced(List<int> a) {
    int sz = a.length;
    List<int> sum = List.filled(sz * 4, 0);
    List<int> mn = List.filled(sz * 4, 0);
    List<int> mx = List.filled(sz * 4, 0);

    void update(int idx, int v, int l, int r, int n) {
      if (l == r) {
        sum[n] = v;
        mn[n] = v;
        mx[n] = v;
        return;
      }
      int mid = (l + r) >> 1;
      if (idx <= mid) {
        update(idx, v, l, mid, n * 2);
      } else {
        update(idx, v, mid + 1, r, n * 2 + 1);
      }
      sum[n] = sum[n * 2] + sum[n * 2 + 1];
      mn[n] = _min(mn[n * 2], sum[n * 2] + mn[n * 2 + 1]);
      mx[n] = _max(mx[n * 2], sum[n * 2] + mx[n * 2 + 1]);
    }

    int query(int l, int r, int n, int s) {
      if (l == r) return l;
      int mid = (l + r) >> 1;
      int need = sum[1] - s;
      if (need >= mn[n * 2] && need <= mx[n * 2]) {
        return query(l, mid, n * 2, s);
      } else {
        return query(mid + 1, r, n * 2 + 1, s + sum[n * 2]);
      }
    }

    List<int> p = List.filled(100001, 0);
    int ans = 0;

    for (int i = 0; i < sz; i++) {
      int x = a[i];
      if (p[x] > 0) {
        update(p[x] - 1, 0, 0, sz - 1, 1);
      }
      p[x] = i + 1;
      update(i, (x % 2) * 2 - 1, 0, sz - 1, 1);

      int cur;
      if (sum[1] == 0) {
        cur = i + 1;
      } else {
        int q = query(0, sz - 1, 1, 0);
        cur = i - q;
      }
      if (cur > ans) ans = cur;
    }

    return ans;
  }

  int _min(int a, int b) => a < b ? a : b;
  int _max(int a, int b) => a > b ? a : b;
}

If you like my solution, please give it a rating. Thank you 🚀
