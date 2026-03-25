// # CodeAuraGirl - LeetCode Daily Solutions
// LeetCode ID: https://leetcode.com/u/CodeAuraGirl/
//
// Problem 3546 - Equal Sum Grid Partition I
// Submission: https://leetcode.com/problems/equal-sum-grid-partition-i/solutions/7690983/dart-easy-by-codeauragirl-416c
// Date: 2026-03-25
// Language: Dart

class Solution{
  bool canPartitionGrid(List<List<int>> g){
    int m=g.length,n=g[0].length;int tot=0;
    for(var r in g)for(var v in r)tot+=v;
    if(tot%2!=0)return false;
    int t=tot~/2,s=0;
    for(int i=0;i<m-1;i++){for(var v in g[i])s+=v;if(s==t)return true;}
    s=0;
    for(int j=0;j<n-1;j++){
      for(int i=0;i<m;i++)s+=g[i][j];
      if(s==t)return true;
    }
    return false;
  }
}



// If you like my solution, please give it a rating. Thank you.

