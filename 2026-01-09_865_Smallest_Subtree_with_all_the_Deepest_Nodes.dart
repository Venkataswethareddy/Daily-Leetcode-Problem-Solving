# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 865 - Smallest Subtree with all the Deepest Nodes
Submission: https://leetcode.com/problems/smallest-subtree-with-all-the-deepest-nodes/solutions/7588347/easy-by-codeauragirl-ffyx
Solution (Dart):

```
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
struct T {
  TreeNode* lca;
  int depth;
};

class Solution {
 public:
  TreeNode* subtreeWithAllDeepest(TreeNode* root) {
    return dfs(root).lca;
  }

 private:
  T dfs(TreeNode* root) {
    if (root == nullptr)
      return {nullptr, 0};

    const T left = dfs(root->left);
    const T right = dfs(root->right);
    if (left.depth > right.depth)
      return {left.lca, left.depth + 1};
    if (left.depth < right.depth)
      return {right.lca, right.depth + 1};
    return {root, left.depth + 1};
  }
};
```

If you like my solution, please give it a rating. Thank you.
