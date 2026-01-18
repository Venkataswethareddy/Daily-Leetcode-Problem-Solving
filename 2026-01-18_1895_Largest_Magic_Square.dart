# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 1895 - Largest Magic Square
Submission: https://leetcode.com/problems/largest-magic-square/solutions/7585733/easy-by-codeauragirl-1ryj
Solution (Dart):

```
class Solution {
  int largestMagicSquare(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<List<int>> row = List.generate(m, (_) => List.filled(n + 1, 0));
    List<List<int>> col = List.generate(m + 1, (_) => List.filled(n, 0));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        row[i][j + 1] = row[i][j] + grid[i][j];
        col[i + 1][j] = col[i][j] + grid[i][j];
      }
    }

    int maxSide = m < n ? m : n;
    for (int side = maxSide; side >= 2; side--) {
      for (int i = 0; i + side <= m; i++) {
        for (int j = 0; j + side <= n; j++) {
          if (_isMagic(grid, row, col, i, j, side)) {
            return side;
          }
        }
      }
    }
    return 1;
  }

  bool _isMagic(
    List<List<int>> grid,
    List<List<int>> row,
    List<List<int>> col,
    int r,
    int c,
    int side,
  ) {
    int target = row[r][c + side] - row[r][c];
    int d1 = 0, d2 = 0;

    for (int k = 0; k < side; k++) {
      d1 += grid[r + k][c + k];
      d2 += grid[r + side - 1 - k][c + k];

      if (row[r + k][c + side] - row[r + k][c] != target) return false;
      if (col[r + side][c + k] - col[r][c + k] != target) return false;
    }
    return d1 == target && d2 == target;
  }
}
```

If you like my solution, please give it a rating. Thank you.
