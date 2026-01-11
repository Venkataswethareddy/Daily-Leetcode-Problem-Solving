# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 85 - Maximal Rectangle
Submission: https://leetcode.com/problems/maximal-rectangle/solutions/7585794/easy-by-codeauragirl-gacl
Solution (Dart):

```
class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    if (matrix.isEmpty || matrix[0].isEmpty) return 0;
    int n = matrix[0].length;
    List<int> h = List.filled(n, 0);
    int ans = 0;

    for (var row in matrix) {
      for (int i = 0; i < n; i++) {
        h[i] = row[i] == '1' ? h[i] + 1 : 0;
      }
      ans = _max(ans, _largestRectangleArea(h));
    }
    return ans;
  }

  int _largestRectangleArea(List<int> h) {
    List<int> st = [];
    int res = 0;
    List<int> a = List.from(h)..add(0);

    for (int i = 0; i < a.length; i++) {
      while (st.isNotEmpty && a[st.last] > a[i]) {
        int height = a[st.removeLast()];
        int width = st.isEmpty ? i : i - st.last - 1;
        res = _max(res, height * width);
      }
      st.add(i);
    }
    return res;
  }

  int _max(int a, int b) => a > b ? a : b;
}
```

If you like my solution, please give it a rating. Thank you.
