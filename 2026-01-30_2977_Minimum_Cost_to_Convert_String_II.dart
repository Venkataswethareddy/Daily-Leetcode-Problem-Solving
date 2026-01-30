# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 2977 - Minimum Cost to Convert String II
Submission: https://leetcode.com/problems/minimum-cost-to-convert-string-ii/solutions/7583058/easy-by-codeauragirl-wte5
Solution (Dart):

```
class Solution {
  int minimumCost(String s, String t,
      List<String> o, List<String> c, List<int> cost) {

    final id = <String,int>{};
    final all = <String>[];
    void add(String x){
      if(!id.containsKey(x)){
        id[x] = all.length;
        all.add(x);
      }
    }
    o.forEach(add); c.forEach(add);

    const INF = 1 << 60;
    int n = all.length;
    var d = List.generate(n,
        (i)=>List.generate(n,(j)=>i==j?0:INF));

    for(int i=0;i<o.length;i++){
      int u=id[o[i]]!, v=id[c[i]]!;
      d[u][v] = d[u][v] < cost[i] ? d[u][v] : cost[i];
    }

    for(int k=0;k<n;k++)
      for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
          if(d[i][k]+d[k][j]<d[i][j])
            d[i][j]=d[i][k]+d[k][j];

    var dp = List.filled(s.length+1, INF);
    dp[0]=0;
    var lens = all.map((e)=>e.length).toSet();

    for(int i=0;i<s.length;i++){
      if(dp[i]>=INF) continue;
      if(s[i]==t[i] && dp[i]<dp[i+1]) dp[i+1]=dp[i];
      for(int l in lens){
        int j=i+l;
        if(j>s.length) continue;
        var u=id[s.substring(i,j)];
        var v=id[t.substring(i,j)];
        if(u!=null && v!=null && dp[i]+d[u][v]<dp[j]){
          dp[j]=dp[i]+d[u][v];
        }
      }
    }
    return dp[s.length]>=INF ? -1 : dp[s.length];
  }
}
```

If you like my solution, please give it a rating. Thank you.
