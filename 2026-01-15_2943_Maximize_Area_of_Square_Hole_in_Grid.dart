# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 2943 - Maximize Area of Square Hole in Grid
Submission: https://leetcode.com/problems/maximize-area-of-square-hole-in-grid/solutions/7585765/easy-by-codeauragirl-d0fv
Solution (Dart):

```
class Solution{
 int maximizeSquareHoleArea(int n,int m,List<int> h,List<int> v){
  int f(List<int> a){
   a.sort();
   int r=1,i=0;
   while(i<a.length){
    int c=1;
    while(i+1<a.length && a[i]+1==a[i+1]){i++;c++;}
    i++;
    if(c>r) r=c;
   }
   return r;
  }
  int k=(f(h)<f(v)?f(h):f(v))+1;
  return k*k;
 }
}
```

If you like my solution, please give it a rating. Thank you.
