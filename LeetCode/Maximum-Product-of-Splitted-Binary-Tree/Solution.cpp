1/**
2 * Definition for a binary tree node.
3 * struct TreeNode {
4 *     int val;
5 *     TreeNode *left;
6 *     TreeNode *right;
7 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
8 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
9 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
10 * };
11 */
12class Solution {
13 public:
14  int maxProduct(TreeNode* root) {
15    constexpr int kMod = 1'000'000'007;
16    long ans = 0;
17    vector<int> allSums;
18    const long totalSum = treeSum(root, allSums);
19
20    for (const long sum : allSums)
21      ans = max(ans, sum * (totalSum - sum));
22
23    return ans % kMod;
24  }
25
26 private:
27  int treeSum(TreeNode* root, vector<int>& allSums) {
28    if (root == nullptr)
29      return 0;
30
31    const int leftSum = treeSum(root->left, allSums);
32    const int rightSum = treeSum(root->right, allSums);
33    const int sum = root->val + leftSum + rightSum;
34    allSums.push_back(sum);
35    return sum;
36  }
37};