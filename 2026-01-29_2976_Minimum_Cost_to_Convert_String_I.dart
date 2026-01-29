# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 2976 - Minimum Cost to Convert String I
Submission: https://leetcode.com/problems/minimum-cost-to-convert-string-i/solutions/7583074/easy-by-codeauragirl-hdld
Solution (Dart):

```
class Solution {
  int minimumCost(
    String source,
    String target,
    List<String> original,
    List<String> changed,
    List<int> cost,
  ) {
    int ans = 0;
    const int INF = 1 << 60;

    // dist[u][v] = min cost to change ('a'+u) to ('a'+v)
    List<List<int>> dist =
        List.generate(26, (_) => List.filled(26, INF));

    for (int i = 0; i < cost.length; i++) {
      int u = original[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      int v = changed[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      dist[u][v] = dist[u][v] < cost[i] ? dist[u][v] : cost[i];
    }

    // Floyd-Warshall
    for (int k = 0; k < 26; k++) {
      for (int i = 0; i < 26; i++) {
        if (dist[i][k] == INF) continue;
        for (int j = 0; j < 26; j++) {
          if (dist[k][j] == INF) continue;
          int nd = dist[i][k] + dist[k][j];
          if (nd < dist[i][j]) {
            dist[i][j] = nd;
          }
        }
      }
    }

    for (int i = 0; i < source.length; i++) {
      if (source[i] == target[i]) continue;

      int u = source.codeUnitAt(i) - 'a'.codeUnitAt(0);
      int v = target.codeUnitAt(i) - 'a'.codeUnitAt(0);

      if (dist[u][v] == INF) return -1;
      ans += dist[u][v];
    }

    return ans;
  }
}
```

If you like my solution, please give it a rating. Thank you.
