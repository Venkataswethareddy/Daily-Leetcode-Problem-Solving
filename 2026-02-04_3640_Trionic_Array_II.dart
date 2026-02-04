# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3640 - Trionic Array II
Submission: https://leetcode.com/problems/trionic-array-ii/solutions/7582966/easy-by-codeauragirl-d9za
Solution (Dart):

```
class Solution {
  int maxSumTrionic(List<int> a) {
    int n=a.length, i=1;
    int ans=-(1<<60);
    while(i<n-2){
      int l=i,r=i,mid=a[i];
      while(r+1<n && a[r+1]<a[r]) mid+=a[++r];
      if(r==l){ i++; continue; }

      int s=0,L=-(1<<60);
      while(l>0 && a[l-1]<a[l]){
        s+=a[--l]; if(s>L) L=s;
      }
      if(l==i){ i++; continue; }

      s=0; int R=-(1<<60);
      while(r+1<n && a[r+1]>a[r]){
        s+=a[++r]; if(s>R) R=s;
      }
      if(r==i){ i++; continue; }

      int cur=L+mid+R;
      if(cur>ans) ans=cur;
      i=r;
    }
    return ans;
  }
}
```

If you like my solution, please give it a rating. Thank you.
