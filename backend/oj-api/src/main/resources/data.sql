INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    15,
    '三数之和',
    '3sum',
    'MEDIUM',
    '# 15. 三数之和

给你一个整数数组 `nums` ，判断是否存在三元组 `[nums[i], nums[j], nums[k]]` 满足 `i != j`、`i != k` 且 `j != k` ，同时还满足 `nums[i] + nums[j] + nums[k] == 0` 。请你返回所有和为 `0` 且不重复的三元组。

**注意：**答案中不可以包含重复的三元组。

 

 

**示例 1：**

**输入：**nums = [-1,0,1,2,-1,-4]
**输出：**[[-1,-1,2],[-1,0,1]]
**解释：**
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
注意，输出的顺序和三元组的顺序并不重要。

**示例 2：**

**输入：**nums = [0,1,1]
**输出：**[]
**解释：**唯一可能的三元组和不为 0 。

**示例 3：**

**输入：**nums = [0,0,0]
**输出：**[[0,0,0]]
**解释：**唯一可能的三元组和为 0 。

 

**提示：**

	
- `3 <= nums.length <= 3000`
	
- `-105 <= nums[i] <= 105`',
    2000,
    256,
    '{"name": "threeSum", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "list<list<integer>>", "colsize": 3, "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(15, 'JAVA', 'class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        
    }
}'),
(15, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
    
};'),
(15, 'PYTHON', 'class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        '),
(15, 'TYPESCRIPT', 'function threeSum(nums: number[]): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(15, '{"nums": [-1, 0, 1, 2, -1, -4]}', '[[-1, -1, 2], [-1, 0, 1]]', TRUE, 1),
(15, '{"nums": [0, 1, 1]}', '[]', TRUE, 2),
(15, '{"nums": [0, 0, 0]}', '[[0, 0, 0]]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    2,
    '两数相加',
    'add-two-numbers',
    'MEDIUM',
    '# 2. 两数相加

给你两个 **非空** 的链表，表示两个非负的整数。它们每位数字都是按照 **逆序** 的方式存储的，并且每个节点只能存储 **一位** 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 

**示例 1：**

**输入：**l1 = [2,4,3], l2 = [5,6,4]
**输出：**[7,0,8]
**解释：**342 + 465 = 807.

**示例 2：**

**输入：**l1 = [0], l2 = [0]
**输出：**[0]

**示例 3：**

**输入：**l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
**输出：**[8,9,9,9,0,0,0,1]

 

**提示：**

	
- 每个链表中的节点数在范围 `[1, 100]` 内
	
- `0 <= Node.val <= 9`
	
- 题目数据保证列表表示的数字不含前导零',
    2000,
    256,
    '{"name": "addTwoNumbers", "params": [{"name": "l1", "type": "ListNode", "dealloc": false}, {"name": "l2", "type": "ListNode", "dealloc": false}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(2, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        
    }
}'),
(2, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    
};'),
(2, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: Optional[ListNode]
        :type l2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        '),
(2, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function addTwoNumbers(l1: ListNode | null, l2: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(2, '{"l1": [2, 4, 3], "l2": [5, 6, 4]}', '[7, 0, 8]', TRUE, 1),
(2, '{"l1": [0], "l2": [0]}', '[0]', TRUE, 2),
(2, '{"l1": [9, 9, 9, 9, 9, 9, 9], "l2": [9, 9, 9, 9]}', '[8, 9, 9, 9, 0, 0, 0, 1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    122,
    '买卖股票的最佳时机 II',
    'best-time-to-buy-and-sell-stock-ii',
    'MEDIUM',
    '# 122. 买卖股票的最佳时机 II

给你一个整数数组 `prices` ，其中 `prices[i]` 表示某支股票第 `i` 天的价格。

在每一天，你可以决定是否购买和/或出售股票。你在任何时候 **最多** 只能持有 **一股** 股票。然而，你可以在 **同一天** 多次买卖该股票，但要确保你持有的股票不超过一股。

返回 你能获得的 **最大** 利润 。

 

**示例 1：**

**输入：**prices = [7,1,5,3,6,4]
**输出：**7
**解释：**在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3。
最大总利润为 4 + 3 = 7 。

**示例 2：**

**输入：**prices = [1,2,3,4,5]
**输出：**4
**解释：**在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
最大总利润为 4 。

**示例 3：**

**输入：**prices = [7,6,4,3,1]
**输出：**0
**解释：**在这种情况下, 交易无法获得正利润，所以不参与交易可以获得最大利润，最大利润为 0。

 

**提示：**

	
- `1 <= prices.length <= 3 * 104`
	
- `0 <= prices[i] <= 104`',
    2000,
    256,
    '{"name": "maxProfit", "params": [{"name": "prices", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(122, 'JAVA', 'class Solution {
    public int maxProfit(int[] prices) {
        
    }
}'),
(122, 'JAVASCRIPT', '/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
    
};'),
(122, 'PYTHON', 'class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        '),
(122, 'TYPESCRIPT', 'function maxProfit(prices: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(122, '{"prices": [7, 1, 5, 3, 6, 4]}', '7', TRUE, 1),
(122, '{"prices": [1, 2, 3, 4, 5]}', '4', TRUE, 2),
(122, '{"prices": [7, 6, 4, 3, 1]}', '0', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    121,
    '买卖股票的最佳时机',
    'best-time-to-buy-and-sell-stock',
    'EASY',
    '# 121. 买卖股票的最佳时机

给定一个数组 `prices` ，它的第 `i` 个元素 `prices[i]` 表示一支给定股票第 `i` 天的价格。

你只能选择 **某一天** 买入这只股票，并选择在 **未来的某一个不同的日子** 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 `0` 。

 

**示例 1：**

**输入：**[7,1,5,3,6,4]
**输出：**5
**解释：**在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。

**示例 2：**

**输入：**prices = [7,6,4,3,1]
**输出：**0
**解释：**在这种情况下, 没有交易完成, 所以最大利润为 0。

 

**提示：**

	
- `1 5`
	
- `0 4`',
    2000,
    256,
    '{"name": "maxProfit", "params": [{"name": "prices", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(121, 'JAVA', 'class Solution {
    public int maxProfit(int[] prices) {
        
    }
}'),
(121, 'JAVASCRIPT', '/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
    
};'),
(121, 'PYTHON', 'class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        '),
(121, 'TYPESCRIPT', 'function maxProfit(prices: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(121, '{"input": [7, 1, 5, 3, 6, 4]}', '5', TRUE, 1),
(121, '{"prices": [7, 6, 4, 3, 1]}', '0', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    94,
    '二叉树的中序遍历',
    'binary-tree-inorder-traversal',
    'EASY',
    '# 94. 二叉树的中序遍历

给定一个二叉树的根节点 `root` ，返回 它的 **中序** 遍历 。

 

**示例 1：**

**输入：**root = [1,null,2,3]
**输出：**[1,3,2]

**示例 2：**

**输入：**root = []
**输出：**[]

**示例 3：**

**输入：**root = [1]
**输出：**[1]

 

**提示：**

	
- 树中节点数目在范围 `[0, 100]` 内
	
- `-100 <= Node.val <= 100`

 

**进阶:** 递归算法很简单，你可以通过迭代算法完成吗？',
    2000,
    256,
    '{"name": "inorderTraversal", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "list<integer>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(94, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public List<Integer> inorderTraversal(TreeNode root) {
        
    }
}'),
(94, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[]}
 */
var inorderTraversal = function(root) {
    
};'),
(94, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def inorderTraversal(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: List[int]
        """
        '),
(94, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function inorderTraversal(root: TreeNode | null): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(94, '{"root": [1, null, 2, 3]}', '[1, 3, 2]', TRUE, 1),
(94, '{"root": [1, 2, 3, 4, 5, null, 8, null, null, 6, 7, 9]}', '[]', TRUE, 2),
(94, '{"root": []}', '[1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    102,
    '二叉树的层序遍历',
    'binary-tree-level-order-traversal',
    'MEDIUM',
    '# 102. 二叉树的层序遍历

给你二叉树的根节点 `root` ，返回其节点值的 **层序遍历** 。 （即逐层地，从左到右访问所有节点）。

 

**示例 1：**

**输入：**root = [3,9,20,null,null,15,7]
**输出：**[[3],[9,20],[15,7]]

**示例 2：**

**输入：**root = [1]
**输出：**[[1]]

**示例 3：**

**输入：**root = []
**输出：**[]

 

**提示：**

	
- 树中节点数目在范围 `[0, 2000]` 内
	
- `-1000 <= Node.val <= 1000`',
    2000,
    256,
    '{"name": "levelOrder", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "list<list<integer>>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(102, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
        
    }
}'),
(102, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
var levelOrder = function(root) {
    
};'),
(102, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: List[List[int]]
        """
        '),
(102, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function levelOrder(root: TreeNode | null): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(102, '{"root": [3, 9, 20, null, null, 15, 7]}', '[[3], [9, 20], [15, 7]]', TRUE, 1),
(102, '{"root": [1]}', '[[1]]', TRUE, 2),
(102, '{"root": []}', '[]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    124,
    '二叉树中的最大路径和',
    'binary-tree-maximum-path-sum',
    'HARD',
    '# 124. 二叉树中的最大路径和

二叉树中的** 路径** 被定义为一条节点序列，序列中每对相邻节点之间都存在一条边。同一个节点在一条路径序列中 **至多出现一次** 。该路径** 至少包含一个 **节点，且不一定经过根节点。

**路径和** 是路径中各节点值的总和。

给你一个二叉树的根节点 `root` ，返回其 **最大路径和** 。

 

**示例 1：**

**输入：**root = [1,2,3]
**输出：**6
**解释：**最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6

**示例 2：**

**输入：**root = [-10,9,20,null,null,15,7]
**输出：**42
**解释：**最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42

 

**提示：**

	
- 树中节点数目范围是 `[1, 3 * 104]`
	
- `-1000 <= Node.val <= 1000`',
    2000,
    256,
    '{"name": "maxPathSum", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(124, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int maxPathSum(TreeNode root) {
        
    }
}'),
(124, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var maxPathSum = function(root) {
    
};'),
(124, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def maxPathSum(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: int
        """
        '),
(124, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function maxPathSum(root: TreeNode | null): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(124, '{"root": [1, 2, 3]}', '6', TRUE, 1),
(124, '{"root": [-10, 9, 20, null, null, 15, 7]}', '42', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    199,
    '二叉树的右视图',
    'binary-tree-right-side-view',
    'MEDIUM',
    '# 199. 二叉树的右视图

给定一个二叉树的 **根节点** `root`，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

 

**示例 1：**

输入：root = [1,2,3,null,5,null,4]

**输出：**[1,3,4]

**解释：**

**示例 2：**

输入：root = [1,2,3,4,null,null,null,5]

输出：[1,3,4,5]

**解释：**

**示例 3：**

**输入：**root = [1,null,3]

**输出：**[1,3]

**示例 4：**

输入：root = []

**输出：**[]

 

**提示:**

	
- 二叉树的节点个数的范围是 `[0,100]`
	
- `-100 <= Node.val <= 100`',
    2000,
    256,
    '{"name": "rightSideView", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "list<integer>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(199, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public List<Integer> rightSideView(TreeNode root) {
        
    }
}'),
(199, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[]}
 */
var rightSideView = function(root) {
    
};'),
(199, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def rightSideView(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: List[int]
        """
        '),
(199, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function rightSideView(root: TreeNode | null): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(199, '{"root": [1, 2, 3, null, 5, null, 4]}', '[1, 3]', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    70,
    '爬楼梯',
    'climbing-stairs',
    'EASY',
    '# 70. 爬楼梯

假设你正在爬楼梯。需要 `n` 阶你才能到达楼顶。

每次你可以爬 `1` 或 `2` 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 

**示例 1：**

**输入：**n = 2
**输出：**2
**解释：**有两种方法可以爬到楼顶。
1. 1 阶 + 1 阶
2. 2 阶

**示例 2：**

**输入：**n = 3
**输出：**3
**解释：**有三种方法可以爬到楼顶。
1. 1 阶 + 1 阶 + 1 阶
2. 1 阶 + 2 阶
3. 2 阶 + 1 阶

 

**提示：**

	
- `1 <= n <= 45`',
    2000,
    256,
    '{"name": "climbStairs", "params": [{"name": "n", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(70, 'JAVA', 'class Solution {
    public int climbStairs(int n) {
        
    }
}'),
(70, 'JAVASCRIPT', '/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
    
};'),
(70, 'PYTHON', 'class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        '),
(70, 'TYPESCRIPT', 'function climbStairs(n: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(70, '{"n": 2}', '2', TRUE, 1),
(70, '{"n": 3}', '3', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    322,
    '零钱兑换',
    'coin-change',
    'MEDIUM',
    '# 322. 零钱兑换

给你一个整数数组 `coins` ，表示不同面额的硬币；以及一个整数 `amount` ，表示总金额。

计算并返回可以凑成总金额所需的 **最少的硬币个数** 。如果没有任何一种硬币组合能组成总金额，返回 `-1` 。

你可以认为每种硬币的数量是无限的。

 

**示例 1：**

**输入：**coins = `[1, 2, 5]`, amount = `11`
**输出：**`3` 
**解释：**11 = 5 + 5 + 1

**示例 2：**

**输入：**coins = `[2]`, amount = `3`
**输出：**-1

**示例 3：**

**输入：**coins = [1], amount = 0
**输出：**0

 

**提示：**

	
- `1 <= coins.length <= 12`
	
- `1 <= coins[i] <= 231 - 1`
	
- `0 <= amount <= 104`',
    2000,
    256,
    '{"name": "coinChange", "params": [{"name": "coins", "type": "integer[]"}, {"name": "amount", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(322, 'JAVA', 'class Solution {
    public int coinChange(int[] coins, int amount) {
        
    }
}'),
(322, 'JAVASCRIPT', '/**
 * @param {number[]} coins
 * @param {number} amount
 * @return {number}
 */
var coinChange = function(coins, amount) {
    
};'),
(322, 'PYTHON', 'class Solution(object):
    def coinChange(self, coins, amount):
        """
        :type coins: List[int]
        :type amount: int
        :rtype: int
        """
        '),
(322, 'TYPESCRIPT', 'function coinChange(coins: number[], amount: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(322, '{"coins": [1, 2, 5], "amount": 11}', '3', TRUE, 1),
(322, '{"coins": [2], "amount": 3}', '-1', TRUE, 2),
(322, '{"coins": [1], "amount": 0}', '0', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    39,
    '组合总和',
    'combination-sum',
    'MEDIUM',
    '# 39. 组合总和

给你一个 **无重复元素** 的整数数组 `candidates` 和一个目标整数 `target` ，找出 `candidates` 中可以使数字和为目标数 `target` 的 所有 **不同组合** ，并以列表形式返回。你可以按 **任意顺序** 返回这些组合。

`candidates` 中的 **同一个** 数字可以 **无限制重复被选取** 。如果至少一个数字的被选数量不同，则两种组合是不同的。 

对于给定的输入，保证和为 `target` 的不同组合数少于 `150` 个。

 

**示例 1：**

**输入：**candidates = [2,3,6,7], target = 7
**输出：**[[2,2,3],[7]]
**解释：**
2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
7 也是一个候选， 7 = 7 。
仅有这两种组合。

**示例 2：**

**输入: **candidates = [2,3,5], target = 8
**输出: **[[2,2,2,2],[2,3,3],[3,5]]

**示例 3：**

**输入: **candidates = [2], target = 1
**输出: **[]

 

**提示：**

	
- `1 <= candidates.length <= 30`
	
- `2 <= candidates[i] <= 40`
	
- `candidates` 的所有元素 **互不相同**
	
- `1 <= target <= 40`',
    2000,
    256,
    '{"name": "combinationSum", "params": [{"name": "candidates", "type": "integer[]"}, {"name": "target", "type": "integer"}], "return": {"type": "list<list<integer>>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(39, 'JAVA', 'class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        
    }
}'),
(39, 'JAVASCRIPT', '/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
    
};'),
(39, 'PYTHON', 'class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        '),
(39, 'TYPESCRIPT', 'function combinationSum(candidates: number[], target: number): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(39, '{"candidates": [2, 3, 6, 7], "target": 7}', '[[2, 2, 3], [7]]', TRUE, 1),
(39, '{"candidates": [2, 3, 5], "target": 8}', '[[2, 2, 2, 2], [2, 3, 3], [3, 5]]', TRUE, 2),
(39, '{"candidates": [2], "target": 1}', '[]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    105,
    '从前序与中序遍历序列构造二叉树',
    'construct-binary-tree-from-preorder-and-inorder-traversal',
    'MEDIUM',
    '# 105. 从前序与中序遍历序列构造二叉树

给定两个整数数组 `preorder` 和 `inorder` ，其中 `preorder` 是二叉树的**先序遍历**， `inorder` 是同一棵树的**中序遍历**，请构造二叉树并返回其根节点。

 

**示例 1:**

**输入****:** preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
**输出:** [3,9,20,null,null,15,7]

**示例 2:**

**输入:** preorder = [-1], inorder = [-1]
**输出:** [-1]

 

**提示:**

	
- `1 <= preorder.length <= 3000`
	
- `inorder.length == preorder.length`
	
- `-3000 <= preorder[i], inorder[i] <= 3000`
	
- `preorder` 和 `inorder` 均 **无重复** 元素
	
- `inorder` 均出现在 `preorder`
	
- `preorder` **保证** 为二叉树的前序遍历序列
	
- `inorder` **保证** 为二叉树的中序遍历序列',
    2000,
    256,
    '{"name": "buildTree", "params": [{"name": "preorder", "type": "integer[]"}, {"name": "inorder", "type": "integer[]"}], "return": {"type": "TreeNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(105, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        
    }
}'),
(105, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} preorder
 * @param {number[]} inorder
 * @return {TreeNode}
 */
var buildTree = function(preorder, inorder) {
    
};'),
(105, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def buildTree(self, preorder, inorder):
        """
        :type preorder: List[int]
        :type inorder: List[int]
        :rtype: Optional[TreeNode]
        """
        '),
(105, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(105, '{"preorder": [3, 9, 20, 15, 7], "inorder": [9, 3, 15, 20, 7]}', '[3, 9, 20, null, null, 15, 7]', TRUE, 1),
(105, '{"preorder": [-1], "inorder": [-1]}', '[-1]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    11,
    '盛最多水的容器',
    'container-with-most-water',
    'MEDIUM',
    '# 11. 盛最多水的容器

给定一个长度为 `n` 的整数数组 `height` 。有 `n` 条垂线，第 `i` 条线的两个端点是 `(i, 0)` 和 `(i, height[i])` 。

找出其中的两条线，使得它们与 `x` 轴共同构成的容器可以容纳最多的水。

返回容器可以储存的最大水量。

**说明：**你不能倾斜容器。

 

**示例 1：**

**输入：**[1,8,6,2,5,4,8,3,7]
**输出：**49 
**解释：**图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。

**示例 2：**

**输入：**height = [1,1]
**输出：**1

 

**提示：**

	
- `n == height.length`
	
- `2 <= n <= 105`
	
- `0 <= height[i] <= 104`',
    2000,
    256,
    '{"name": "maxArea", "params": [{"name": "height", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(11, 'JAVA', 'class Solution {
    public int maxArea(int[] height) {
        
    }
}'),
(11, 'JAVASCRIPT', '/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea = function(height) {
    
};'),
(11, 'PYTHON', 'class Solution(object):
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        '),
(11, 'TYPESCRIPT', 'function maxArea(height: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(11, '{"input": [1, 8, 6, 2, 5, 4, 8, 3, 7]}', '49', TRUE, 1),
(11, '{"height": [1, 1]}', '1', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    108,
    '将有序数组转换为二叉搜索树',
    'convert-sorted-array-to-binary-search-tree',
    'EASY',
    '# 108. 将有序数组转换为二叉搜索树

给你一个整数数组 `nums` ，其中元素已经按 **升序** 排列，请你将其转换为一棵 平衡 二叉搜索树。

 

**示例 1：**

**输入：**nums = [-10,-3,0,5,9]
**输出：**[0,-3,9,-10,null,5]
**解释：**[0,-10,5,null,-3,null,9] 也将被视为正确答案：

**示例 2：**

**输入：**nums = [1,3]
**输出：**[3,1]
**解释：**[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。

 

**提示：**

	
- `1 <= nums.length <= 104`
	
- `-104 <= nums[i] <= 104`
	
- `nums` 按 **严格递增** 顺序排列',
    2000,
    256,
    '{"name": "sortedArrayToBST", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "TreeNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(108, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public TreeNode sortedArrayToBST(int[] nums) {
        
    }
}'),
(108, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} nums
 * @return {TreeNode}
 */
var sortedArrayToBST = function(nums) {
    
};'),
(108, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def sortedArrayToBST(self, nums):
        """
        :type nums: List[int]
        :rtype: Optional[TreeNode]
        """
        '),
(108, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function sortedArrayToBST(nums: number[]): TreeNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(108, '{"nums": [-10, -3, 0, 5, 9]}', '[0, -3, 9, -10, null, 5]', TRUE, 1),
(108, '{"nums": [1, 3]}', '[3, 1]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    138,
    '随机链表的复制',
    'copy-list-with-random-pointer',
    'MEDIUM',
    '# 138. 随机链表的复制

给你一个长度为 `n` 的链表，每个节点包含一个额外增加的随机指针 `random` ，该指针可以指向链表中的任何节点或空节点。

构造这个链表的 **深拷贝**。 深拷贝应该正好由 `n` 个 **全新** 节点组成，其中每个新节点的值都设为其对应的原节点的值。新节点的 `next` 指针和 `random` 指针也都应指向复制链表中的新节点，并使原链表和复制链表中的这些指针能够表示相同的链表状态。**复制链表中的指针都不应指向原链表中的节点 **。

例如，如果原链表中有 `X` 和 `Y` 两个节点，其中 `X.random --> Y` 。那么在复制链表中对应的两个节点 `x` 和 `y` ，同样有 `x.random --> y` 。

返回复制链表的头节点。

用一个由 `n` 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 `[val, random_index]` 表示：

	
- `val`：一个表示 `Node.val` 的整数。
	
- `random_index`：随机指针指向的节点索引（范围从 `0` 到 `n-1`）；如果不指向任何节点，则为  `null` 。

你的代码 **只** 接受原链表的头节点 `head` 作为传入参数。

 

**示例 1：**

**输入：**head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
**输出：**[[7,null],[13,0],[11,4],[10,2],[1,0]]

**示例 2：**

**输入：**head = [[1,1],[2,1]]
**输出：**[[1,1],[2,1]]

**示例 3：**

****

**输入：**head = [[3,null],[3,0],[3,null]]
**输出：**[[3,null],[3,0],[3,null]]

 

**提示：**

	
- `0 <= n <= 1000`
	
- `-104 <= Node.val <= 104`
	
- `Node.random` 为 `null` 或指向链表中的节点。',
    2000,
    256,
    '{"name": "copyRandomList", "params": [{"name": "head", "type": "ListNode"}], "return": {"type": "ListNode"}, "languages": ["cpp", "java", "python", "csharp", "javascript", "python3", "golang", "swift", "kotlin", "ruby", "c", "scala", "php", "typescript"], "manual": true, "typescriptCustomType": "class _Node {\n    val: number\n    next: _Node | null\n    random: _Node | null\n\n    constructor(val?: number, next?: _Node, random?: _Node) {\n        this.val = (val===undefined ? 0 : val)\n        this.next = (next===undefined ? null : next)\n        this.random = (random===undefined ? null : random)\n    }\n}\n"}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(138, 'JAVA', '/*
// Definition for a Node.
class Node {
    int val;
    Node next;
    Node random;

    public Node(int val) {
        this.val = val;
        this.next = null;
        this.random = null;
    }
}
*/

class Solution {
    public Node copyRandomList(Node head) {
        
    }
}'),
(138, 'JAVASCRIPT', '/**
 * // Definition for a _Node.
 * function _Node(val, next, random) {
 *    this.val = val;
 *    this.next = next;
 *    this.random = random;
 * };
 */

/**
 * @param {_Node} head
 * @return {_Node}
 */
var copyRandomList = function(head) {
    
};'),
(138, 'PYTHON', '"""
# Definition for a Node.
class Node:
    def __init__(self, x, next=None, random=None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution(object):
    def copyRandomList(self, head):
        """
        :type head: Node
        :rtype: Node
        """
        '),
(138, 'TYPESCRIPT', '/**
 * Definition for _Node.
 * class _Node {
 *     val: number
 *     next: _Node | null
 *     random: _Node | null
 * 
 *     constructor(val?: number, next?: _Node, random?: _Node) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *         this.random = (random===undefined ? null : random)
 *     }
 * }
 */


function copyRandomList(head: _Node | null): _Node | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(138, '{"head": [[7, null], [13, 0], [11, 4], [10, 2], [1, 0]]}', '[[7, null], [13, 0], [11, 4], [10, 2], [1, 0]]', TRUE, 1),
(138, '{"head": [[1, 1], [2, 1]]}', '[[1, 1], [2, 1]]', TRUE, 2),
(138, '{"head": [[3, null], [3, 0], [3, null]]}', '[[3, null], [3, 0], [3, null]]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    207,
    '课程表',
    'course-schedule',
    'MEDIUM',
    '# 207. 课程表

你这个学期必须选修 `numCourses` 门课程，记为 `0` 到 `numCourses - 1` 。

在选修某些课程之前需要一些先修课程。 先修课程按数组 `prerequisites` 给出，其中 `prerequisites[i] = [ai, bi]` ，表示如果要学习课程 `ai` 则 **必须** 先学习课程  `bi` 。

	
- 例如，先修课程对 `[0, 1]` 表示：想要学习课程 `0` ，你需要先完成课程 `1` 。

请你判断是否可能完成所有课程的学习？如果可以，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

**输入：**numCourses = 2, prerequisites = [[1,0]]
**输出：**true
**解释：**总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。

**示例 2：**

**输入：**numCourses = 2, prerequisites = [[1,0],[0,1]]
**输出：**false
**解释：**总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。

 

**提示：**

	
- `1 <= numCourses <= 2000`
	
- `0 <= prerequisites.length <= 5000`
	
- `prerequisites[i].length == 2`
	
- `0 <= ai, bi < numCourses`
	
- `prerequisites[i]` 中的所有课程对 **互不相同**',
    2000,
    256,
    '{"name": "canFinish", "params": [{"name": "numCourses", "type": "integer"}, {"name": "prerequisites", "type": "integer[][]"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(207, 'JAVA', 'class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        
    }
}'),
(207, 'JAVASCRIPT', '/**
 * @param {number} numCourses
 * @param {number[][]} prerequisites
 * @return {boolean}
 */
var canFinish = function(numCourses, prerequisites) {
    
};'),
(207, 'PYTHON', 'class Solution(object):
    def canFinish(self, numCourses, prerequisites):
        """
        :type numCourses: int
        :type prerequisites: List[List[int]]
        :rtype: bool
        """
        '),
(207, 'TYPESCRIPT', 'function canFinish(numCourses: number, prerequisites: number[][]): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(207, '{"numCourses": 2, "prerequisites": [[1, 0]]}', 'true', TRUE, 1),
(207, '{"numCourses": 2, "prerequisites": [[1, 0], [0, 1]]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    739,
    '每日温度',
    'daily-temperatures',
    'MEDIUM',
    '# 739. 每日温度

给定一个整数数组 `temperatures` ，表示每天的温度，返回一个数组 `answer` ，其中 `answer[i]` 是指对于第 `i` 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 `0` 来代替。

 

**示例 1:**

**输入:** temperatures = [73,74,75,71,69,72,76,73]
**输出:** [1,1,4,2,1,1,0,0]

**示例 2:**

**输入:** temperatures = [30,40,50,60]
**输出:** [1,1,1,0]

**示例 3:**

**输入:** temperatures = [30,60,90]
**输出: **[1,1,0]

 

**提示：**

	
- `1 <= temperatures.length <= 105`
	
- `30 <= temperatures[i] <= 100`',
    2000,
    256,
    '{"name": "dailyTemperatures", "params": [{"name": "temperatures", "type": "integer[]"}], "return": {"type": "integer[]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(739, 'JAVA', 'class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        
    }
}'),
(739, 'JAVASCRIPT', '/**
 * @param {number[]} temperatures
 * @return {number[]}
 */
var dailyTemperatures = function(temperatures) {
    
};'),
(739, 'PYTHON', 'class Solution(object):
    def dailyTemperatures(self, temperatures):
        """
        :type temperatures: List[int]
        :rtype: List[int]
        """
        '),
(739, 'TYPESCRIPT', 'function dailyTemperatures(temperatures: number[]): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(739, '{"temperatures": [73, 74, 75, 71, 69, 72, 76, 73]}', '[1, 1, 4, 2, 1, 1, 0, 0]', TRUE, 1),
(739, '{"temperatures": [30, 40, 50, 60]}', '[1, 1, 1, 0]', TRUE, 2),
(739, '{"input": [30, 60, 90]}', '[1, 1, 0]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    394,
    '字符串解码',
    'decode-string',
    'MEDIUM',
    '# 394. 字符串解码

给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: `k[encoded_string]`，表示其中方括号内部的 `encoded_string` 正好重复 `k` 次。注意 `k` 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 `k` ，例如不会出现像 `3a` 或 `2[4]` 的输入。

测试用例保证输出的长度不会超过 `105`。

 

**示例 1：**

**输入：**s = "3[a]2[bc]"
**输出：**"aaabcbc"

**示例 2：**

**输入：**s = "3[a2[c]]"
**输出：**"accaccacc"

**示例 3：**

**输入：**s = "2[abc]3[cd]ef"
**输出：**"abcabccdcdcdef"

**示例 4：**

**输入：**s = "abc3[cd]xyz"
**输出：**"abccdcdcdxyz"

 

**提示：**

	
- `1 <= s.length <= 30`
	
- `s` 由小写英文字母、数字和方括号 `''[]''` 组成
	
- `s` 保证是一个 **有效** 的输入。
	
- `s` 中所有整数的取值范围为 `[1, 300]`',
    2000,
    256,
    '{"name": "decodeString", "params": [{"name": "s", "type": "string"}], "return": {"type": "string"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(394, 'JAVA', 'class Solution {
    public String decodeString(String s) {
        
    }
}'),
(394, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {string}
 */
var decodeString = function(s) {
    
};'),
(394, 'PYTHON', 'class Solution(object):
    def decodeString(self, s):
        """
        :type s: str
        :rtype: str
        """
        '),
(394, 'TYPESCRIPT', 'function decodeString(s: string): string {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(394, '{"s": "3[a]2[bc]"}', 'aaabcbc', TRUE, 1),
(394, '{"s": "3[a2[c]]"}', 'accaccacc', TRUE, 2),
(394, '{"s": "2[abc]3[cd]ef"}', 'abcabccdcdcdef', TRUE, 3),
(394, '{"s": "abc3[cd]xyz"}', 'abccdcdcdxyz', TRUE, 4);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    543,
    '二叉树的直径',
    'diameter-of-binary-tree',
    'EASY',
    '# 543. 二叉树的直径

给你一棵二叉树的根节点，返回该树的 **直径** 。

二叉树的 **直径** 是指树中任意两个节点之间最长路径的 **长度** 。这条路径可能经过也可能不经过根节点 `root` 。

两节点之间路径的 **长度** 由它们之间边数表示。

 

**示例 1：**

**输入：**root = [1,2,3,4,5]
**输出：**3
**解释：**3 ，取路径 [4,2,1,3] 或 [5,2,1,3] 的长度。

**示例 2：**

**输入：**root = [1,2]
**输出：**1

 

**提示：**

	
- 树中节点数目在范围 `[1, 104]` 内
	
- `-100 <= Node.val <= 100`',
    2000,
    256,
    '{"name": "diameterOfBinaryTree", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(543, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int diameterOfBinaryTree(TreeNode root) {
        
    }
}'),
(543, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var diameterOfBinaryTree = function(root) {
    
};'),
(543, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def diameterOfBinaryTree(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: int
        """
        '),
(543, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function diameterOfBinaryTree(root: TreeNode | null): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(543, '{"root": [1, 2, 3, 4, 5]}', '3', TRUE, 1),
(543, '{"root": [1, 2]}', '1', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    72,
    '编辑距离',
    'edit-distance',
    'MEDIUM',
    '# 72. 编辑距离

给你两个单词 `word1` 和 `word2`， 请返回将 `word1` 转换成 `word2` 所使用的最少操作数  。

你可以对一个单词进行如下三种操作：

	
- 插入一个字符
	
- 删除一个字符
	
- 替换一个字符

 

**示例 1：**

**输入：**word1 = "horse", word2 = "ros"
**输出：**3
**解释：**
horse -> rorse (将 ''h'' 替换为 ''r'')
rorse -> rose (删除 ''r'')
rose -> ros (删除 ''e'')

**示例 2：**

**输入：**word1 = "intention", word2 = "execution"
**输出：**5
**解释：**
intention -> inention (删除 ''t'')
inention -> enention (将 ''i'' 替换为 ''e'')
enention -> exention (将 ''n'' 替换为 ''x'')
exention -> exection (将 ''n'' 替换为 ''c'')
exection -> execution (插入 ''u'')

 

**提示：**

	
- `0 <= word1.length, word2.length <= 500`
	
- `word1` 和 `word2` 由小写英文字母组成',
    2000,
    256,
    '{"name": "minDistance", "params": [{"name": "word1", "type": "string"}, {"name": "word2", "type": "string"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(72, 'JAVA', 'class Solution {
    public int minDistance(String word1, String word2) {
        
    }
}'),
(72, 'JAVASCRIPT', '/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(word1, word2) {
    
};'),
(72, 'PYTHON', 'class Solution(object):
    def minDistance(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: int
        """
        '),
(72, 'TYPESCRIPT', 'function minDistance(word1: string, word2: string): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(72, '{"word1": "horse", "word2": "ros"}', '3', TRUE, 1),
(72, '{"word1": "intention", "word2": "execution"}', '5', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    438,
    '找到字符串中所有字母异位词',
    'find-all-anagrams-in-a-string',
    'MEDIUM',
    '# 438. 找到字符串中所有字母异位词

给定两个字符串 `s` 和 `p`，找到 `s`** **中所有 `p`** **的 **异位词 **的子串，返回这些子串的起始索引。不考虑答案输出的顺序。

 

**示例 1:**

**输入: **s = "cbaebabacd", p = "abc"
**输出: **[0,6]
**解释:**
起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。

** 示例 2:**

**输入: **s = "abab", p = "ab"
**输出: **[0,1,2]
**解释:**
起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。

 

**提示:**

	
- `1 <= s.length, p.length <= 3 * 104`
	
- `s` 和 `p` 仅包含小写字母',
    2000,
    256,
    '{"name": "findAnagrams", "params": [{"name": "s", "type": "string"}, {"name": "p", "type": "string"}], "return": {"type": "list<integer>"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(438, 'JAVA', 'class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        
    }
}'),
(438, 'JAVASCRIPT', '/**
 * @param {string} s
 * @param {string} p
 * @return {number[]}
 */
var findAnagrams = function(s, p) {
    
};'),
(438, 'PYTHON', 'class Solution(object):
    def findAnagrams(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: List[int]
        """
        '),
(438, 'TYPESCRIPT', 'function findAnagrams(s: string, p: string): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(438, '{"s": "cbaebabacd", "p": "abc"}', '[0, 6]', TRUE, 1),
(438, '{"s": "abab", "p": "ab"}', '[0, 1, 2]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    34,
    '在排序数组中查找元素的第一个和最后一个位置',
    'find-first-and-last-position-of-element-in-sorted-array',
    'MEDIUM',
    '# 34. 在排序数组中查找元素的第一个和最后一个位置

给你一个按照非递减顺序排列的整数数组 `nums`，和一个目标值 `target`。请你找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 `target`，返回 `[-1, -1]`。

你必须设计并实现时间复杂度为 `O(log n)` 的算法解决此问题。

 

**示例 1：**

**输入：**nums = [`5,7,7,8,8,10]`, target = 8
**输出：**[3,4]

**示例 2：**

**输入：**nums = [`5,7,7,8,8,10]`, target = 6
**输出：**[-1,-1]

**示例 3：**

**输入：**nums = [], target = 0
**输出：**[-1,-1]

 

**提示：**

	
- `0 <= nums.length <= 105`
	
- `-109 <= nums[i] <= 109`
	
- `nums` 是一个非递减数组
	
- `-109 <= target <= 109`',
    2000,
    256,
    '{"name": "searchRange", "params": [{"name": "nums", "type": "integer[]"}, {"name": "target", "type": "integer"}], "return": {"type": "integer[]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(34, 'JAVA', 'class Solution {
    public int[] searchRange(int[] nums, int target) {
        
    }
}'),
(34, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function(nums, target) {
    
};'),
(34, 'PYTHON', 'class Solution(object):
    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        '),
(34, 'TYPESCRIPT', 'function searchRange(nums: number[], target: number): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(34, '{"nums": [5, 7, 7, 8, 8, 10], "target": 8}', '[3, 4]', TRUE, 1),
(34, '{"nums": [5, 7, 7, 8, 8, 10], "target": 6}', '[-1, -1]', TRUE, 2),
(34, '{"nums": [], "target": 0}', '[-1, -1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    295,
    '数据流的中位数',
    'find-median-from-data-stream',
    'HARD',
    '# 295. 数据流的中位数

**中位数**是有序整数列表中的中间值。如果列表的大小是偶数，则没有中间值，中位数是两个中间值的平均值。

	
- 例如 `arr = [2,3,4]` 的中位数是 `3` 。
	
- 例如 `arr = [2,3]` 的中位数是 `(2 + 3) / 2 = 2.5` 。

实现 MedianFinder 类:

	
- 
	
`MedianFinder()` 初始化 `MedianFinder` 对象。

	
	
- 
	
`void addNum(int num)` 将数据流中的整数 `num` 添加到数据结构中。

	
	
- 
	
`double findMedian()` 返回到目前为止所有元素的中位数。与实际答案相差 `10-5` 以内的答案将被接受。

	

**示例 1：**

**输入**
["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
[[], [1], [2], [], [3], []]
**输出**
[null, null, null, 1.5, null, 2.0]

**解释**
MedianFinder medianFinder = new MedianFinder();
medianFinder.addNum(1);    // arr = [1]
medianFinder.addNum(2);    // arr = [1, 2]
medianFinder.findMedian(); // 返回 1.5 ((1 + 2) / 2)
medianFinder.addNum(3);    // arr[1, 2, 3]
medianFinder.findMedian(); // return 2.0

**提示:**

	
- `-105 <= num <= 105`
	
- 在调用 `findMedian` 之前，数据结构中至少有一个元素
	
- 最多 `5 * 104` 次调用 `addNum` 和 `findMedian`',
    2000,
    256,
    '{"classname": "MedianFinder", "constructor": {"params": []}, "methods": [{"params": [{"type": "integer", "name": "num"}], "name": "addNum", "return": {"type": "void"}}, {"params": [], "name": "findMedian", "return": {"type": "double"}}], "return": {"type": "boolean"}, "systemdesign": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(295, 'JAVA', 'class MedianFinder {

    public MedianFinder() {
        
    }
    
    public void addNum(int num) {
        
    }
    
    public double findMedian() {
        
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder obj = new MedianFinder();
 * obj.addNum(num);
 * double param_2 = obj.findMedian();
 */'),
(295, 'JAVASCRIPT', '
var MedianFinder = function() {
    
};

/** 
 * @param {number} num
 * @return {void}
 */
MedianFinder.prototype.addNum = function(num) {
    
};

/**
 * @return {number}
 */
MedianFinder.prototype.findMedian = function() {
    
};

/** 
 * Your MedianFinder object will be instantiated and called as such:
 * var obj = new MedianFinder()
 * obj.addNum(num)
 * var param_2 = obj.findMedian()
 */'),
(295, 'PYTHON', 'class MedianFinder(object):

    def __init__(self):
        

    def addNum(self, num):
        """
        :type num: int
        :rtype: None
        """
        

    def findMedian(self):
        """
        :rtype: float
        """
        


# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder()
# obj.addNum(num)
# param_2 = obj.findMedian()'),
(295, 'TYPESCRIPT', 'class MedianFinder {
    constructor() {
        
    }

    addNum(num: number): void {
        
    }

    findMedian(): number {
        
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * var obj = new MedianFinder()
 * obj.addNum(num)
 * var param_2 = obj.findMedian()
 */');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(295, '{"operations": ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"], "arguments": [[], [1], [2], [], [3], []]}', '[null, null, null, 1.5, null, 2.0]

解释
MedianFinder medianFinder = new MedianFinder();
medianFinder.addNum(1);    // arr = [1]
medianFinder.addNum(2);    // arr = [1, 2]
medianFinder.findMedian(); // 返回 1.5 ((1 + 2) / 2)
medianFinder.addNum(3);    // arr[1, 2, 3]
medianFinder.findMedian(); // return 2.0

提示:', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    153,
    '寻找旋转排序数组中的最小值',
    'find-minimum-in-rotated-sorted-array',
    'MEDIUM',
    '# 153. 寻找旋转排序数组中的最小值

已知一个长度为 `n` 的数组，预先按照升序排列，经由 `1` 到 `n` 次 **旋转** 后，得到输入数组。例如，原数组 `nums = [0,1,2,4,5,6,7]` 在变化后可能得到：

	
- 若旋转 `4` 次，则可以得到 `[4,5,6,7,0,1,2]`
	
- 若旋转 `7` 次，则可以得到 `[0,1,2,4,5,6,7]`

注意，数组 `[a[0], a[1], a[2], ..., a[n-1]]` **旋转一次** 的结果为数组 `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]` 。

给你一个元素值 **互不相同** 的数组 `nums` ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 **最小元素** 。

你必须设计一个时间复杂度为 `O(log n)` 的算法解决此问题。

 

**示例 1：**

**输入：**nums = [3,4,5,1,2]
**输出：**1
**解释：**原数组为 [1,2,3,4,5] ，旋转 3 次得到输入数组。

**示例 2：**

**输入：**nums = [4,5,6,7,0,1,2]
**输出：**0
**解释：**原数组为 [0,1,2,4,5,6,7] ，旋转 4 次得到输入数组。

**示例 3：**

**输入：**nums = [11,13,15,17]
**输出：**11
**解释：**原数组为 [11,13,15,17] ，旋转 4 次得到输入数组。

 

**提示：**

	
- `n == nums.length`
	
- `1 <= n <= 5000`
	
- `-5000 <= nums[i] <= 5000`
	
- `nums` 中的所有整数 **互不相同**
	
- `nums` 原来是一个升序排序的数组，并进行了 `1` 至 `n` 次旋转',
    2000,
    256,
    '{"name": "findMin", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(153, 'JAVA', 'class Solution {
    public int findMin(int[] nums) {
        
    }
}'),
(153, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var findMin = function(nums) {
    
};'),
(153, 'PYTHON', 'class Solution(object):
    def findMin(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(153, 'TYPESCRIPT', 'function findMin(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(153, '{"nums": [3, 4, 5, 1, 2]}', '1', TRUE, 1),
(153, '{"nums": [4, 5, 6, 7, 0, 1, 2]}', '0', TRUE, 2),
(153, '{"nums": [11, 13, 15, 17]}', '11', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    287,
    '寻找重复数',
    'find-the-duplicate-number',
    'MEDIUM',
    '# 287. 寻找重复数

给定一个包含 `n + 1` 个整数的数组 `nums` ，其数字都在 `[1, n]` 范围内（包括 `1` 和 `n`），可知至少存在一个重复的整数。

假设 `nums` 只有 **一个重复的整数** ，返回 **这个重复的数** 。

你设计的解决方案必须 **不修改** 数组 `nums` 且只用常量级 `O(1)` 的额外空间。

 

**示例 1：**

**输入：**nums = [1,3,4,2,2]
**输出：**2

**示例 2：**

**输入：**nums = [3,1,3,4,2]
**输出：**3

**示例 3 :**

**输入：**nums = [3,3,3,3,3]
**输出：**3

 

 

**提示：**

	
- `1 <= n <= 105`
	
- `nums.length == n + 1`
	
- `1 <= nums[i] <= n`
	
- `nums` 中 **只有一个整数** 出现 **两次或多次** ，其余整数均只出现 **一次**

 

进阶：

	
- 如何证明 `nums` 中至少存在一个重复的数字?
	
- 你可以设计一个线性级时间复杂度 `O(n)` 的解决方案吗？',
    2000,
    256,
    '{"name": "findDuplicate", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(287, 'JAVA', 'class Solution {
    public int findDuplicate(int[] nums) {
        
    }
}'),
(287, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var findDuplicate = function(nums) {
    
};'),
(287, 'PYTHON', 'class Solution(object):
    def findDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(287, 'TYPESCRIPT', 'function findDuplicate(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(287, '{"nums": [1, 3, 4, 2, 2]}', '2', TRUE, 1),
(287, '{"nums": [3, 1, 3, 4, 2]}', '3


示例 3 :', TRUE, 2),
(287, '{"nums": [3, 3, 3, 3, 3]}', '3', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    41,
    '缺失的第一个正数',
    'first-missing-positive',
    'HARD',
    '# 41. 缺失的第一个正数

给你一个未排序的整数数组 `nums` ，请你找出其中没有出现的最小的正整数。

请你实现时间复杂度为 `O(n)` 并且只使用常数级别额外空间的解决方案。

 

**示例 1：**

**输入：**nums = [1,2,0]
**输出：**3
**解释：**范围 [1,2] 中的数字都在数组中。

**示例 2：**

**输入：**nums = [3,4,-1,1]
**输出：**2
**解释：**1 在数组中，但 2 没有。

**示例 3：**

**输入：**nums = [7,8,9,11,12]
**输出：**1
**解释：**最小的正数 1 没有出现。

 

**提示：**

	
- `1 <= nums.length <= 105`
	
- `-231 <= nums[i] <= 231 - 1`',
    2000,
    256,
    '{"name": "firstMissingPositive", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(41, 'JAVA', 'class Solution {
    public int firstMissingPositive(int[] nums) {
        
    }
}'),
(41, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var firstMissingPositive = function(nums) {
    
};'),
(41, 'PYTHON', 'class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(41, 'TYPESCRIPT', 'function firstMissingPositive(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(41, '{"nums": [1, 2, 0]}', '3', TRUE, 1),
(41, '{"nums": [3, 4, -1, 1]}', '2', TRUE, 2),
(41, '{"nums": [7, 8, 9, 11, 12]}', '1', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    114,
    '二叉树展开为链表',
    'flatten-binary-tree-to-linked-list',
    'MEDIUM',
    '# 114. 二叉树展开为链表

给你二叉树的根结点 `root` ，请你将它展开为一个单链表：

	
- 展开后的单链表应该同样使用 `TreeNode` ，其中 `right` 子指针指向链表中下一个结点，而左子指针始终为 `null` 。
	
- 展开后的单链表应该与二叉树 **先序遍历** 顺序相同。

 

**示例 1：**

**输入：**root = [1,2,5,3,4,null,6]
**输出：**[1,null,2,null,3,null,4,null,5,null,6]

**示例 2：**

**输入：**root = []
**输出：**[]

**示例 3：**

**输入：**root = [0]
**输出：**[0]

 

**提示：**

	
- 树中结点数在范围 `[0, 2000]` 内
	
- `-100 

 

**进阶：**你可以使用原地算法（`O(1)` 额外空间）展开这棵树吗？',
    2000,
    256,
    '{"name": "flatten", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "void"}, "output": {"paramindex": 0}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(114, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public void flatten(TreeNode root) {
        
    }
}'),
(114, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {void} Do not return anything, modify root in-place instead.
 */
var flatten = function(root) {
    
};'),
(114, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def flatten(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: None Do not return anything, modify root in-place instead.
        """
        '),
(114, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

/**
 Do not return anything, modify root in-place instead.
 */
function flatten(root: TreeNode | null): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(114, '{"root": [1, 2, 5, 3, 4, null, 6]}', '[1, null, 2, null, 3, null, 4, null, 5, null, 6]', TRUE, 1),
(114, '{"root": []}', '[]', TRUE, 2),
(114, '{"root": [0]}', '[0]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    22,
    '括号生成',
    'generate-parentheses',
    'MEDIUM',
    '# 22. 括号生成

数字 `n` 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 **有效的 **括号组合。

 

**示例 1：**

**输入：**n = 3
**输出：**["((()))","(()())","(())()","()(())","()()()"]

**示例 2：**

**输入：**n = 1
**输出：**["()"]

 

**提示：**

	
- `1 <= n <= 8`',
    2000,
    256,
    '{"name": "generateParenthesis", "params": [{"name": "n", "type": "integer"}], "return": {"type": "list<string>"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(22, 'JAVA', 'class Solution {
    public List<String> generateParenthesis(int n) {
        
    }
}'),
(22, 'JAVASCRIPT', '/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
    
};'),
(22, 'PYTHON', 'class Solution(object):
    def generateParenthesis(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
        '),
(22, 'TYPESCRIPT', 'function generateParenthesis(n: number): string[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(22, '{"n": 3}', '["((()))", "(()())", "(())()", "()(())", "()()()"]', TRUE, 1),
(22, '{"n": 1}', '["()"]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    49,
    '字母异位词分组',
    'group-anagrams',
    'MEDIUM',
    '# 49. 字母异位词分组

给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。

 

**示例 1:**

**输入:** strs = ["eat", "tea", "tan", "ate", "nat", "bat"]

**输出: **[["bat"],["nat","tan"],["ate","eat","tea"]]

**解释：**

	
- 在 strs 中没有字符串可以通过重新排列来形成 `"bat"`。
	
- 字符串 `"nat"` 和 `"tan"` 是字母异位词，因为它们可以重新排列以形成彼此。
	
- 字符串 `"ate"` ，`"eat"` 和 `"tea"` 是字母异位词，因为它们可以重新排列以形成彼此。

**示例 2:**

**输入:** strs = [""]

**输出: **[[""]]

**示例 3:**

**输入:** strs = ["a"]

**输出: **[["a"]]

 

**提示：**

	
- `1 <= strs.length <= 104`
	
- `0 <= strs[i].length <= 100`
	
- `strs[i]` 仅包含小写字母',
    2000,
    256,
    '{"name": "groupAnagrams", "params": [{"name": "strs", "type": "string[]"}], "return": {"type": "list<list<string>>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(49, 'JAVA', 'class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        
    }
}'),
(49, 'JAVASCRIPT', '/**
 * @param {string[]} strs
 * @return {string[][]}
 */
var groupAnagrams = function(strs) {
    
};'),
(49, 'PYTHON', 'class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        '),
(49, 'TYPESCRIPT', 'function groupAnagrams(strs: string[]): string[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(49, '{"strs": ["eat", "tea", "tan", "ate", "nat", "bat"]}', '[["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]', TRUE, 1),
(49, '{"strs": [""]}', '[[""]]', TRUE, 2),
(49, '{"strs": ["a"]}', '[["a"]]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    198,
    '打家劫舍',
    'house-robber',
    'MEDIUM',
    '# 198. 打家劫舍

你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，**如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警**。

给定一个代表每个房屋存放金额的非负整数数组，计算你** 不触动警报装置的情况下 **，一夜之内能够偷窃到的最高金额。

 

**示例 1：**

**输入：**[1,2,3,1]
**输出：**4
**解释：**偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。

**示例 2：**

**输入：**[2,7,9,3,1]
**输出：**12
**解释：**偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

 

**提示：**

	
- `1',
    2000,
    256,
    '{"name": "rob", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(198, 'JAVA', 'class Solution {
    public int rob(int[] nums) {
        
    }
}'),
(198, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
    
};'),
(198, 'PYTHON', 'class Solution(object):
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(198, 'TYPESCRIPT', 'function rob(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(198, '{"input": [1, 2, 3, 1]}', '4', TRUE, 1),
(198, '{"input": [2, 7, 9, 3, 1]}', '12', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    208,
    '实现 Trie (前缀树)',
    'implement-trie-prefix-tree',
    'MEDIUM',
    '# 208. 实现 Trie (前缀树)

**Trie**（发音类似 "try"）或者说 **前缀树** 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补全和拼写检查。

请你实现 Trie 类：

	
- `Trie()` 初始化前缀树对象。
	
- `void insert(String word)` 向前缀树中插入字符串 `word` 。
	
- `boolean search(String word)` 如果字符串 `word` 在前缀树中，返回 `true`（即，在检索之前已经插入）；否则，返回 `false` 。
	
- `boolean startsWith(String prefix)` 如果之前已经插入的字符串 `word` 的前缀之一为 `prefix` ，返回 `true` ；否则，返回 `false` 。

 

**示例：**

**输入**
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
**输出**
[null, null, true, false, true, null, true]

**解释**
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // 返回 True
trie.search("app");     // 返回 False
trie.startsWith("app"); // 返回 True
trie.insert("app");
trie.search("app");     // 返回 True

 

**提示：**

	
- `1 <= word.length, prefix.length <= 2000`
	
- `word` 和 `prefix` 仅由小写英文字母组成
	
- `insert`、`search` 和 `startsWith` 调用次数 **总计** 不超过 `3 * 104` 次',
    2000,
    256,
    '{"classname": "Trie", "constructor": {"params": []}, "methods": [{"params": [{"type": "string", "name": "word"}], "name": "insert", "return": {"type": "void"}}, {"params": [{"type": "string", "name": "word"}], "name": "search", "return": {"type": "boolean"}}, {"params": [{"type": "string", "name": "prefix"}], "name": "startsWith", "return": {"type": "boolean"}}], "return": {"type": "boolean"}, "systemdesign": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(208, 'JAVA', 'class Trie {

    public Trie() {
        
    }
    
    public void insert(String word) {
        
    }
    
    public boolean search(String word) {
        
    }
    
    public boolean startsWith(String prefix) {
        
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = new Trie();
 * obj.insert(word);
 * boolean param_2 = obj.search(word);
 * boolean param_3 = obj.startsWith(prefix);
 */'),
(208, 'JAVASCRIPT', '
var Trie = function() {
    
};

/** 
 * @param {string} word
 * @return {void}
 */
Trie.prototype.insert = function(word) {
    
};

/** 
 * @param {string} word
 * @return {boolean}
 */
Trie.prototype.search = function(word) {
    
};

/** 
 * @param {string} prefix
 * @return {boolean}
 */
Trie.prototype.startsWith = function(prefix) {
    
};

/** 
 * Your Trie object will be instantiated and called as such:
 * var obj = new Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */'),
(208, 'PYTHON', 'class Trie(object):

    def __init__(self):
        

    def insert(self, word):
        """
        :type word: str
        :rtype: None
        """
        

    def search(self, word):
        """
        :type word: str
        :rtype: bool
        """
        

    def startsWith(self, prefix):
        """
        :type prefix: str
        :rtype: bool
        """
        


# Your Trie object will be instantiated and called as such:
# obj = Trie()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.startsWith(prefix)'),
(208, 'TYPESCRIPT', 'class Trie {
    constructor() {
        
    }

    insert(word: string): void {
        
    }

    search(word: string): boolean {
        
    }

    startsWith(prefix: string): boolean {
        
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * var obj = new Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(208, '{"operations": ["Trie", "insert", "search", "search", "startsWith", "insert", "search"], "arguments": [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]}', '[null, null, true, false, true, null, true]

解释
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // 返回 True
trie.search("app");     // 返回 False
trie.startsWith("app"); // 返回 True
trie.insert("app");
trie.search("app");     // 返回 True', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    160,
    '相交链表',
    'intersection-of-two-linked-lists',
    'EASY',
    '# 160. 相交链表

给你两个单链表的头节点 `headA` 和 `headB` ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 `null` 。

图示两个链表在节点 `c1` 开始相交**：**

题目数据 **保证** 整个链式结构中不存在环。

**注意**，函数返回结果后，链表必须 **保持其原始结构** 。

**自定义评测：**

**评测系统** 的输入如下（你设计的程序 **不适用** 此输入）：

	
- `intersectVal` - 相交的起始节点的值。如果不存在相交节点，这一值为 `0`
	
- `listA` - 第一个链表
	
- `listB` - 第二个链表
	
- `skipA` - 在 `listA` 中（从头节点开始）跳到交叉节点的节点数
	
- `skipB` - 在 `listB` 中（从头节点开始）跳到交叉节点的节点数

评测系统将根据这些输入创建链式数据结构，并将两个头节点 `headA` 和 `headB` 传递给你的程序。如果程序能够正确返回相交节点，那么你的解决方案将被 **视作正确答案** 。

 

**示例 1：**

**输入：**intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
**输出：**Intersected at ''8''
**解释：**相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
— 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。

 

**示例 2：**

**输入：**intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
**输出：**Intersected at ''2''
**解释：**相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。
在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

**示例 3：**

**输入：**intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
**输出：**No intersection
**解释：**从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
这两个链表不相交，因此返回 null 。

 

**提示：**

	
- `listA` 中节点数目为 `m`
	
- `listB` 中节点数目为 `n`
	
- `1 <= m, n <= 3 * 104`
	
- `1 <= Node.val <= 105`
	
- `0 <= skipA <= m`
	
- `0 <= skipB <= n`
	
- 如果 `listA` 和 `listB` 没有交点，`intersectVal` 为 `0`
	
- 如果 `listA` 和 `listB` 有交点，`intersectVal == listA[skipA] == listB[skipB]`

 

**进阶：**你能否设计一个时间复杂度 `O(m + n)` 、仅用 `O(1)` 内存的解决方案？',
    2000,
    256,
    '{"name": "getIntersectionNode", "params": [{"name": "intersectVal", "type": "integer"}, {"name": "listA", "type": "ListNode"}, {"name": "listB", "type": "ListNode"}, {"name": "skipA", "type": "integer"}, {"name": "skipB", "type": "integer"}], "return": {"type": "ListNode"}, "languages": ["cpp", "java", "python", "c", "csharp", "javascript", "golang", "python3", "swift", "ruby", "kotlin", "scala", "php", "typescript"], "manual": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(160, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        
    }
}'),
(160, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    
};'),
(160, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        '),
(160, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function getIntersectionNode(headA: ListNode | null, headB: ListNode | null): ListNode | null {

};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(160, '{"intersectVal": 8, "listA": [4, 1, 8, 4, 5], "listB": [5, 6, 1, 8, 4, 5], "skipA": 2, "skipB": 3}', 'Intersected at ''8''', TRUE, 1),
(160, '{"intersectVal": 2, "listA": [1, 9, 1, 2, 4], "listB": [3, 2, 4], "skipA": 3, "skipB": 1}', 'Intersected at ''2''', TRUE, 2),
(160, '{"intersectVal": 0, "listA": [2, 6, 4], "listB": [1, 5], "skipA": 3, "skipB": 2}', 'No intersection', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    226,
    '翻转二叉树',
    'invert-binary-tree',
    'EASY',
    '# 226. 翻转二叉树

给你一棵二叉树的根节点 `root` ，翻转这棵二叉树，并返回其根节点。

 

**示例 1：**

**输入：**root = [4,2,7,1,3,6,9]
**输出：**[4,7,2,9,6,3,1]

**示例 2：**

**输入：**root = [2,1,3]
**输出：**[2,3,1]

**示例 3：**

**输入：**root = []
**输出：**[]

 

**提示：**

	
- 树中节点数目范围在 `[0, 100]` 内
	
- `-100 <= Node.val <= 100`',
    2000,
    256,
    '{"name": "invertTree", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "TreeNode"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(226, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public TreeNode invertTree(TreeNode root) {
        
    }
}'),
(226, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var invertTree = function(root) {
    
};'),
(226, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def invertTree(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: Optional[TreeNode]
        """
        '),
(226, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function invertTree(root: TreeNode | null): TreeNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(226, '{"root": [4, 2, 7, 1, 3, 6, 9]}', '[4, 7, 2, 9, 6, 3, 1]', TRUE, 1),
(226, '{"root": [2, 1, 3]}', '[2, 3, 1]', TRUE, 2),
(226, '{"root": []}', '[]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    45,
    '跳跃游戏 II',
    'jump-game-ii',
    'MEDIUM',
    '# 45. 跳跃游戏 II

给定一个长度为 `n` 的 **0 索引**整数数组 `nums`。初始位置在下标 0。

每个元素 `nums[i]` 表示从索引 `i` 向后跳转的最大长度。换句话说，如果你在索引 `i` 处，你可以跳转到任意 `(i + j)` 处：

	
- `0 <= j <= nums[i]` 且
	
- `i + j < n`

返回到达 `n - 1` 的最小跳跃次数。测试用例保证可以到达 `n - 1`。

 

**示例 1:**

**输入:** nums = [2,3,1,1,4]
**输出:** 2
**解释:** 跳到最后一个位置的最小跳跃数是 `2`。
     从下标为 0 跳到下标为 1 的位置，跳 `1` 步，然后跳 `3` 步到达数组的最后一个位置。

**示例 2:**

**输入:** nums = [2,3,0,1,4]
**输出:** 2

 

**提示:**

	
- `1 <= nums.length <= 104`
	
- `0 <= nums[i] <= 1000`
	
- 题目保证可以到达 `n - 1`',
    2000,
    256,
    '{"name": "jump", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(45, 'JAVA', 'class Solution {
    public int jump(int[] nums) {
        
    }
}'),
(45, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var jump = function(nums) {
    
};'),
(45, 'PYTHON', 'class Solution(object):
    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(45, 'TYPESCRIPT', 'function jump(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(45, '{"nums": [2, 3, 1, 1, 4]}', '2', TRUE, 1),
(45, '{"nums": [2, 3, 0, 1, 4]}', '2', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    55,
    '跳跃游戏',
    'jump-game',
    'MEDIUM',
    '# 55. 跳跃游戏

给你一个非负整数数组 `nums` ，你最初位于数组的 **第一个下标** 。数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个下标，如果可以，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

**输入：**nums = [2,3,1,1,4]
**输出：**true
**解释：**可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。

**示例 2：**

**输入：**nums = [3,2,1,0,4]
**输出：**false
**解释：**无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。

 

**提示：**

	
- `1 <= nums.length <= 104`
	
- `0 <= nums[i] <= 105`',
    2000,
    256,
    '{"name": "canJump", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(55, 'JAVA', 'class Solution {
    public boolean canJump(int[] nums) {
        
    }
}'),
(55, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
    
};'),
(55, 'PYTHON', 'class Solution(object):
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        '),
(55, 'TYPESCRIPT', 'function canJump(nums: number[]): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(55, '{"nums": [2, 3, 1, 1, 4]}', 'true', TRUE, 1),
(55, '{"nums": [3, 2, 1, 0, 4]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    215,
    '数组中的第K个最大元素',
    'kth-largest-element-in-an-array',
    'MEDIUM',
    '# 215. 数组中的第K个最大元素

给定整数数组 `nums` 和整数 `k`，请返回数组中第 `**k**` 个最大的元素。

请注意，你需要找的是数组排序后的第 `k` 个最大的元素，而不是第 `k` 个不同的元素。

你必须设计并实现时间复杂度为 `O(n)` 的算法解决此问题。

 

**示例 1:**

**输入:** `[3,2,1,5,6,4],` k = 2
**输出:** 5

**示例 2:**

**输入:** `[3,2,3,1,2,4,5,5,6], `k = 4
**输出:** 4

 

**提示： **

	
- `1 <= k <= nums.length <= 105`
	
- `-104 <= nums[i] <= 104`',
    2000,
    256,
    '{"name": "findKthLargest", "params": [{"name": "nums", "type": "integer[]"}, {"name": "k", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(215, 'JAVA', 'class Solution {
    public int findKthLargest(int[] nums, int k) {
        
    }
}'),
(215, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
    
};'),
(215, 'PYTHON', 'class Solution(object):
    def findKthLargest(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        '),
(215, 'TYPESCRIPT', 'function findKthLargest(nums: number[], k: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(215, '{"nums": [3, 2, 1, 5, 6, 4], "k": 2}', '5', TRUE, 1),
(215, '{"nums": [3, 2, 3, 1, 2, 4, 5, 5, 6], "k": 4}', '4', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    230,
    '二叉搜索树中第 K 小的元素',
    'kth-smallest-element-in-a-bst',
    'MEDIUM',
    '# 230. 二叉搜索树中第 K 小的元素

给定一个二叉搜索树的根节点 `root` ，和一个整数 `k` ，请你设计一个算法查找其中第 `k`** **小的元素（`k` 从 1 开始计数）。

 

**示例 1：**

**输入：**root = [3,1,4,null,2], k = 1
**输出：**1

**示例 2：**

**输入：**root = [5,3,6,2,4,null,null,1], k = 3
**输出：**3

 

 

**提示：**

	
- 树中的节点数为 `n` 。
	
- `1 <= k <= n <= 104`
	
- `0 <= Node.val <= 104`

 

**进阶：**如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 `k` 小的值，你将如何优化算法？',
    2000,
    256,
    '{"name": "kthSmallest", "params": [{"name": "root", "type": "TreeNode"}, {"name": "k", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(230, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int kthSmallest(TreeNode root, int k) {
        
    }
}'),
(230, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} k
 * @return {number}
 */
var kthSmallest = function(root, k) {
    
};'),
(230, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def kthSmallest(self, root, k):
        """
        :type root: Optional[TreeNode]
        :type k: int
        :rtype: int
        """
        '),
(230, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function kthSmallest(root: TreeNode | null, k: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(230, '{"root": [3, 1, 4, null, 2], "k": 1}', '1', TRUE, 1),
(230, '{"root": [5, 3, 6, 2, 4, null, null, 1], "k": 3}', '3', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    84,
    '柱状图中最大的矩形',
    'largest-rectangle-in-histogram',
    'HARD',
    '# 84. 柱状图中最大的矩形

给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

求在该柱状图中，能够勾勒出来的矩形的最大面积。

 

**示例 1:**

**输入：**heights = [2,1,5,6,2,3]
**输出：**10
**解释：**最大的矩形为图中红色区域，面积为 10

**示例 2：**

**输入：** heights = [2,4]
输出： 4

 

**提示：**

	
- `1 5`
	
- `0 4`',
    2000,
    256,
    '{"name": "largestRectangleArea", "params": [{"name": "heights", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(84, 'JAVA', 'class Solution {
    public int largestRectangleArea(int[] heights) {
        
    }
}'),
(84, 'JAVASCRIPT', '/**
 * @param {number[]} heights
 * @return {number}
 */
var largestRectangleArea = function(heights) {
    
};'),
(84, 'PYTHON', 'class Solution(object):
    def largestRectangleArea(self, heights):
        """
        :type heights: List[int]
        :rtype: int
        """
        '),
(84, 'TYPESCRIPT', 'function largestRectangleArea(heights: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(84, '{"heights": [2, 1, 5, 6, 2, 3]}', '10', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    17,
    '电话号码的字母组合',
    'letter-combinations-of-a-phone-number',
    'MEDIUM',
    '# 17. 电话号码的字母组合

给定一个仅包含数字 `2-9` 的字符串，返回所有它能表示的字母组合。答案可以按 **任意顺序** 返回。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 

**示例 1：**

**输入：**digits = "23"
**输出：**["ad","ae","af","bd","be","bf","cd","ce","cf"]

**示例 2：**

**输入：**digits = "2"
**输出：**["a","b","c"]

 

**提示：**

	
- `1 <= digits.length <= 4`
	
- `digits[i]` 是范围 `[''2'', ''9'']` 的一个数字。',
    2000,
    256,
    '{"name": "letterCombinations", "params": [{"name": "digits", "type": "string"}], "return": {"type": "list<string>"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(17, 'JAVA', 'class Solution {
    public List<String> letterCombinations(String digits) {
        
    }
}'),
(17, 'JAVASCRIPT', '/**
 * @param {string} digits
 * @return {string[]}
 */
var letterCombinations = function(digits) {
    
};'),
(17, 'PYTHON', 'class Solution(object):
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        '),
(17, 'TYPESCRIPT', 'function letterCombinations(digits: string): string[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(17, '{"digits": "23"}', '["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]', TRUE, 1),
(17, '{"digits": "2"}', '["a", "b", "c"]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    142,
    '环形链表 II',
    'linked-list-cycle-ii',
    'MEDIUM',
    '# 142. 环形链表 II

给定一个链表的头节点  `head` ，返回链表开始入环的第一个节点。 如果链表无环，则返回 `null`。

如果链表中有某个节点，可以通过连续跟踪 `next` 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 `pos` 来表示链表尾连接到链表中的位置（**索引从 0 开始**）。如果 `pos` 是 `-1`，则在该链表中没有环。**注意：`pos` 不作为参数进行传递**，仅仅是为了标识链表的实际情况。

**不允许修改 **链表。

 

**示例 1：**

**输入：**head = [3,2,0,-4], pos = 1
**输出：**返回索引为 1 的链表节点
**解释：**链表中有一个环，其尾部连接到第二个节点。

**示例 2：**

**输入：**head = [1,2], pos = 0
**输出：**返回索引为 0 的链表节点
**解释：**链表中有一个环，其尾部连接到第一个节点。

**示例 3：**

**输入：**head = [1], pos = -1
**输出：**返回 null
**解释：**链表中没有环。

 

**提示：**

	
- 链表中节点的数目范围在范围 `[0, 104]` 内
	
- `-105 <= Node.val <= 105`
	
- `pos` 的值为 `-1` 或者链表中的一个有效索引

 

**进阶：**你是否可以使用 `O(1)` 空间解决此题？',
    2000,
    256,
    '{"name": "detectCycle", "params": [{"name": "head", "type": "ListNode"}, {"name": "pos", "type": "integer"}], "return": {"type": "ListNode"}, "languages": ["cpp", "java", "python", "c", "csharp", "javascript", "golang", "python3", "swift", "kotlin", "php", "ruby", "scala", "typescript"], "manual": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(142, 'JAVA', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode detectCycle(ListNode head) {
        
    }
}'),
(142, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
    
};'),
(142, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        '),
(142, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function detectCycle(head: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(142, '{"head": [3, 2, 0, -4], "pos": 1}', '返回索引为 1 的链表节点', TRUE, 1),
(142, '{"head": [1, 2], "pos": 0}', '返回索引为 0 的链表节点', TRUE, 2),
(142, '{"head": [1], "pos": -1}', '返回 null', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    141,
    '环形链表',
    'linked-list-cycle',
    'EASY',
    '# 141. 环形链表

给你一个链表的头节点 `head` ，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 `next` 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 `pos` 来表示链表尾连接到链表中的位置（索引从 0 开始）。**注意：`pos` 不作为参数进行传递 **。仅仅是为了标识链表的实际情况。

如果链表中存在环 ，则返回 `true` 。 否则，返回 `false` 。

 

**示例 1：**

**输入：**head = [3,2,0,-4], pos = 1
**输出：**true
**解释：**链表中有一个环，其尾部连接到第二个节点。

**示例 2：**

**输入：**head = [1,2], pos = 0
**输出：**true
**解释：**链表中有一个环，其尾部连接到第一个节点。

**示例 3：**

**输入：**head = [1], pos = -1
**输出：**false
**解释：**链表中没有环。

 

**提示：**

	
- 链表中节点的数目范围是 `[0, 104]`
	
- `-105 <= Node.val <= 105`
	
- `pos` 为 `-1` 或者链表中的一个 **有效索引** 。

 

**进阶：**你能用 `O(1)`（即，常量）内存解决此问题吗？',
    2000,
    256,
    '{"name": "hasCycle", "params": [{"name": "head", "type": "ListNode"}, {"name": "pos", "type": "integer"}], "return": {"type": "boolean"}, "manual": true, "languages": ["cpp", "java", "python", "c", "csharp", "javascript", "ruby", "swift", "golang", "python3", "scala", "kotlin", "php", "typescript"]}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(141, 'JAVA', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public boolean hasCycle(ListNode head) {
        
    }
}'),
(141, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
    
};'),
(141, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def hasCycle(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        '),
(141, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function hasCycle(head: ListNode | null): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(141, '{"head": [3, 2, 0, -4], "pos": 1}', 'true', TRUE, 1),
(141, '{"head": [1, 2], "pos": 0}', 'true', TRUE, 2),
(141, '{"head": [1], "pos": -1}', 'false', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    1143,
    '最长公共子序列',
    'longest-common-subsequence',
    'MEDIUM',
    '# 1143. 最长公共子序列

给定两个字符串 `text1` 和 `text2`，返回这两个字符串的最长 **公共子序列** 的长度。如果不存在 **公共子序列** ，返回 `0` 。

一个字符串的 **子序列** 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

	
- 例如，`"ace"` 是 `"abcde"` 的子序列，但 `"aec"` 不是 `"abcde"` 的子序列。

两个字符串的 **公共子序列** 是这两个字符串所共同拥有的子序列。

 

**示例 1：**

**输入：**text1 = "abcde", text2 = "ace" 
**输出：**3  
**解释：**最长公共子序列是 "ace" ，它的长度为 3 。

**示例 2：**

**输入：**text1 = "abc", text2 = "abc"
**输出：**3
**解释：**最长公共子序列是 "abc" ，它的长度为 3 。

**示例 3：**

**输入：**text1 = "abc", text2 = "def"
**输出：**0
**解释：**两个字符串没有公共子序列，返回 0 。

 

**提示：**

	
- `1',
    2000,
    256,
    '{"name": "longestCommonSubsequence", "params": [{"name": "text1", "type": "string"}, {"type": "string", "name": "text2"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(1143, 'JAVA', 'class Solution {
    public int longestCommonSubsequence(String text1, String text2) {
        
    }
}'),
(1143, 'JAVASCRIPT', '/**
 * @param {string} text1
 * @param {string} text2
 * @return {number}
 */
var longestCommonSubsequence = function(text1, text2) {
    
};'),
(1143, 'PYTHON', 'class Solution(object):
    def longestCommonSubsequence(self, text1, text2):
        """
        :type text1: str
        :type text2: str
        :rtype: int
        """
        '),
(1143, 'TYPESCRIPT', 'function longestCommonSubsequence(text1: string, text2: string): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(1143, '{"text1": "abcde", "text2": "ace"}', '3', TRUE, 1),
(1143, '{"text1": "abc", "text2": "abc"}', '3', TRUE, 2),
(1143, '{"text1": "abc", "text2": "def"}', '0', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    128,
    '最长连续序列',
    'longest-consecutive-sequence',
    'MEDIUM',
    '# 128. 最长连续序列

给定一个未排序的整数数组 `nums` ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

请你设计并实现时间复杂度为 `O(n)` 的算法解决此问题。

 

**示例 1：**

**输入：**nums = [100,4,200,1,3,2]
**输出：**4
**解释：**最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。

**示例 2：**

**输入：**nums = [0,3,7,2,5,8,4,6,0,1]
**输出：**9

**示例 3：**

**输入：**nums = [1,0,1,2]
输出：3

 

**提示：**

	
- `0 <= nums.length <= 105`
	
- `-109 <= nums[i] <= 109`',
    2000,
    256,
    '{"name": "longestConsecutive", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(128, 'JAVA', 'class Solution {
    public int longestConsecutive(int[] nums) {
        
    }
}'),
(128, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var longestConsecutive = function(nums) {
    
};'),
(128, 'PYTHON', 'class Solution(object):
    def longestConsecutive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(128, 'TYPESCRIPT', 'function longestConsecutive(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(128, '{"nums": [100, 4, 200, 1, 3, 2]}', '4', TRUE, 1),
(128, '{"nums": [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]}', '9', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    300,
    '最长递增子序列',
    'longest-increasing-subsequence',
    'MEDIUM',
    '# 300. 最长递增子序列

给你一个整数数组 `nums` ，找到其中最长严格递增子序列的长度。

**子序列 **是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，`[3,6,2,7]` 是数组 `[0,3,1,6,2,2,7]` 的子序列。

 

**示例 1：**

**输入：**nums = [10,9,2,5,3,7,101,18]
**输出：**4
**解释：**最长递增子序列是 [2,3,7,101]，因此长度为 4 。

**示例 2：**

**输入：**nums = [0,1,0,3,2,3]
**输出：**4

**示例 3：**

**输入：**nums = [7,7,7,7,7,7,7]
**输出：**1

 

**提示：**

	
- `1 <= nums.length <= 2500`
	
- `-104 <= nums[i] <= 104`

 

进阶：

	
- 你能将算法的时间复杂度降低到 `O(n log(n))` 吗?',
    2000,
    256,
    '{"name": "lengthOfLIS", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(300, 'JAVA', 'class Solution {
    public int lengthOfLIS(int[] nums) {
        
    }
}'),
(300, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var lengthOfLIS = function(nums) {
    
};'),
(300, 'PYTHON', 'class Solution(object):
    def lengthOfLIS(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(300, 'TYPESCRIPT', 'function lengthOfLIS(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(300, '{"nums": [10, 9, 2, 5, 3, 7, 101, 18]}', '4', TRUE, 1),
(300, '{"nums": [0, 1, 0, 3, 2, 3]}', '4', TRUE, 2),
(300, '{"nums": [7, 7, 7, 7, 7, 7, 7]}', '1', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    5,
    '最长回文子串',
    'longest-palindromic-substring',
    'MEDIUM',
    '# 5. 最长回文子串

给你一个字符串 `s`，找到 `s` 中最长的 回文 子串。

 

**示例 1：**

**输入：**s = "babad"
**输出：**"bab"
**解释：**"aba" 同样是符合题意的答案。

**示例 2：**

**输入：**s = "cbbd"
**输出：**"bb"

 

**提示：**

	
- `1 <= s.length <= 1000`
	
- `s` 仅由数字和英文字母组成',
    2000,
    256,
    '{"name": "longestPalindrome", "params": [{"name": "s", "type": "string"}], "return": {"type": "string"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(5, 'JAVA', 'class Solution {
    public String longestPalindrome(String s) {
        
    }
}'),
(5, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
    
};'),
(5, 'PYTHON', 'class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        '),
(5, 'TYPESCRIPT', 'function longestPalindrome(s: string): string {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(5, '{"s": "babad"}', 'bab', TRUE, 1),
(5, '{"s": "cbbd"}', 'bb', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    3,
    '无重复字符的最长子串',
    'longest-substring-without-repeating-characters',
    'MEDIUM',
    '# 3. 无重复字符的最长子串

给定一个字符串 `s` ，请你找出其中不含有重复字符的 **最长 子串**** **的长度。

 

**示例 1:**

**输入: **s = "abcabcbb"
**输出: **3 
**解释:** 因为无重复字符的最长子串是 `"abc"`，所以其长度为 3。注意 "bca" 和 "cab" 也是正确答案。

**示例 2:**

**输入: **s = "bbbbb"
**输出: **1
**解释: **因为无重复字符的最长子串是 `"b"`，所以其长度为 1。

**示例 3:**

**输入: **s = "pwwkew"
**输出: **3
**解释: **因为无重复字符的最长子串是 `"wke"`，所以其长度为 3。
     请注意，你的答案必须是 **子串 **的长度，`"pwke"` 是一个子序列，不是子串。

 

**提示：**

	
- `0 <= s.length <= 5 * 104`
	
- `s` 由英文字母、数字、符号和空格组成',
    2000,
    256,
    '{"name": "lengthOfLongestSubstring", "params": [{"name": "s", "type": "string"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(3, 'JAVA', 'class Solution {
    public int lengthOfLongestSubstring(String s) {
        
    }
}'),
(3, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
    
};'),
(3, 'PYTHON', 'class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        '),
(3, 'TYPESCRIPT', 'function lengthOfLongestSubstring(s: string): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(3, '{"input": "abcabcbb"}', '3', TRUE, 1),
(3, '{"input": "bbbbb"}', '1', TRUE, 2),
(3, '{"input": "pwwkew"}', '3', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    32,
    '最长有效括号',
    'longest-valid-parentheses',
    'HARD',
    '# 32. 最长有效括号

给你一个只包含 `''(''` 和 `'')''` 的字符串，找出最长有效（格式正确且连续）括号 子串 的长度。

左右括号匹配，即每个左括号都有对应的右括号将其闭合的字符串是格式正确的，比如 `"(()())"`。

 

**示例 1：**

**输入：**s = "(()"
**输出：**2
**解释：**最长有效括号子串是 "()"

**示例 2：**

**输入：**s = ")()())"
**输出：**4
**解释：**最长有效括号子串是 "()()"

**示例 3：**

**输入：**s = ""
**输出：**0

 

**提示：**

	
- `0 <= s.length <= 3 * 104`
	
- `s[i]` 为 `''(''` 或 `'')''`',
    2000,
    256,
    '{"name": "longestValidParentheses", "params": [{"name": "s", "type": "string"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(32, 'JAVA', 'class Solution {
    public int longestValidParentheses(String s) {
        
    }
}'),
(32, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {number}
 */
var longestValidParentheses = function(s) {
    
};'),
(32, 'PYTHON', 'class Solution(object):
    def longestValidParentheses(self, s):
        """
        :type s: str
        :rtype: int
        """
        '),
(32, 'TYPESCRIPT', 'function longestValidParentheses(s: string): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(32, '{"s": "(()"}', '2', TRUE, 1),
(32, '{"s": ")()())"}', '4', TRUE, 2),
(32, '{"s": ""}', '0', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    236,
    '二叉树的最近公共祖先',
    'lowest-common-ancestor-of-a-binary-tree',
    'MEDIUM',
    '# 236. 二叉树的最近公共祖先

给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（**一个节点也可以是它自己的祖先**）。”

 

**示例 1：**

**输入：**root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
**输出：**3
**解释：**节点 `5 `和节点 `1 `的最近公共祖先是节点 `3 。`

**示例 2：**

**输入：**root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
**输出：**5
**解释：**节点 `5 `和节点 `4 `的最近公共祖先是节点 `5 。`因为根据定义最近公共祖先节点可以为节点本身。

**示例 3：**

**输入：**root = [1,2], p = 1, q = 2
**输出：**1

 

**提示：**

	
- 树中节点数目在范围 `[2, 105]` 内。
	
- `-109 9`
	
- 所有 `Node.val` `互不相同` 。
	
- `p != q`
	
- `p` 和 `q` 均存在于给定的二叉树中。',
    2000,
    256,
    '{"name": "lowestCommonAncestor", "params": [{"name": "root", "type": "TreeNode"}, {"name": "p", "type": "integer"}, {"name": "q", "type": "integer"}], "return": {"type": "TreeNode"}, "manual": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(236, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        
    }
}'),
(236, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
var lowestCommonAncestor = function(root, p, q) {
    
};'),
(236, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def lowestCommonAncestor(self, root, p, q):
        """
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: TreeNode
        """
        '),
(236, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function lowestCommonAncestor(root: TreeNode | null, p: TreeNode | null, q: TreeNode | null): TreeNode | null {
	
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(236, '{"root": [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], "p": 5, "q": 1}', '3', TRUE, 1),
(236, '{"root": [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], "p": 5, "q": 4}', '5', TRUE, 2),
(236, '{"root": [1, 2], "p": 1, "q": 2}', '1', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    146,
    'LRU 缓存',
    'lru-cache',
    'MEDIUM',
    '# 146. LRU 缓存

请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。

实现 `LRUCache` 类：

	
- `LRUCache(int capacity)` 以 **正整数** 作为容量 `capacity` 初始化 LRU 缓存
	
- `int get(int key)` 如果关键字 `key` 存在于缓存中，则返回关键字的值，否则返回 `-1` 。
	
- `void put(int key, int value)` 如果关键字 `key` 已经存在，则变更其数据值 `value` ；如果不存在，则向缓存中插入该组 `key-value` 。如果插入操作导致关键字数量超过 `capacity` ，则应该 **逐出** 最久未使用的关键字。

函数 `get` 和 `put` 必须以 `O(1)` 的平均时间复杂度运行。

 

**示例：**

**输入**
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
**输出**
[null, null, null, 1, null, -1, null, -1, 3, 4]

**解释**
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4

 

**提示：**

	
- `1 <= capacity <= 3000`
	
- `0 <= key <= 10000`
	
- `0 <= value <= 105`
	
- 最多调用 `2 * 105` 次 `get` 和 `put`',
    2000,
    256,
    '{"classname": "LRUCache", "maxbytesperline": 200000, "constructor": {"params": [{"type": "integer", "name": "capacity"}]}, "methods": [{"name": "get", "params": [{"type": "integer", "name": "key"}], "return": {"type": "integer"}}, {"name": "put", "params": [{"type": "integer", "name": "key"}, {"type": "integer", "name": "value"}], "return": {"type": "void"}}], "systemdesign": true, "params": [{"name": "inputs", "type": "integer[]"}, {"name": "inputs", "type": "integer[]"}], "return": {"type": "list<String>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(146, 'JAVA', 'class LRUCache {

    public LRUCache(int capacity) {
        
    }
    
    public int get(int key) {
        
    }
    
    public void put(int key, int value) {
        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */'),
(146, 'JAVASCRIPT', '/**
 * @param {number} capacity
 */
var LRUCache = function(capacity) {
    
};

/** 
 * @param {number} key
 * @return {number}
 */
LRUCache.prototype.get = function(key) {
    
};

/** 
 * @param {number} key 
 * @param {number} value
 * @return {void}
 */
LRUCache.prototype.put = function(key, value) {
    
};

/** 
 * Your LRUCache object will be instantiated and called as such:
 * var obj = new LRUCache(capacity)
 * var param_1 = obj.get(key)
 * obj.put(key,value)
 */'),
(146, 'PYTHON', 'class LRUCache(object):

    def __init__(self, capacity):
        """
        :type capacity: int
        """
        

    def get(self, key):
        """
        :type key: int
        :rtype: int
        """
        

    def put(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: None
        """
        


# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)'),
(146, 'TYPESCRIPT', 'class LRUCache {
    constructor(capacity: number) {
        
    }

    get(key: number): number {
        
    }

    put(key: number, value: number): void {
        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * var obj = new LRUCache(capacity)
 * var param_1 = obj.get(key)
 * obj.put(key,value)
 */');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(146, '{"operations": ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"], "arguments": [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]}', '[null, null, null, 1, null, -1, null, -1, 3, 4]

解释
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    169,
    '多数元素',
    'majority-element',
    'EASY',
    '# 169. 多数元素

给定一个大小为 `n` 的数组 `nums` ，返回其中的多数元素。多数元素是指在数组中出现次数 **大于** `⌊ n/2 ⌋` 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 

**示例 1：**

**输入：**nums = [3,2,3]
**输出：**3

**示例 2：**

**输入：**nums = [2,2,1,1,1,2,2]
**输出：**2

 

**提示：**

	
- `n == nums.length`
	
- `1 <= n <= 5 * 104`
	
- `-109 <= nums[i] <= 109`
	
- 输入保证数组中一定有一个多数元素。

 

**进阶：**尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。',
    2000,
    256,
    '{"name": "majorityElement", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(169, 'JAVA', 'class Solution {
    public int majorityElement(int[] nums) {
        
    }
}'),
(169, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(nums) {
    
};'),
(169, 'PYTHON', 'class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(169, 'TYPESCRIPT', 'function majorityElement(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(169, '{"nums": [3, 2, 3]}', '3', TRUE, 1),
(169, '{"nums": [2, 2, 1, 1, 1, 2, 2]}', '2', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    104,
    '二叉树的最大深度',
    'maximum-depth-of-binary-tree',
    'EASY',
    '# 104. 二叉树的最大深度

给定一个二叉树 `root` ，返回其最大深度。

二叉树的 **最大深度** 是指从根节点到最远叶子节点的最长路径上的节点数。

 

**示例 1：**

 

输入：root = [3,9,20,null,null,15,7]
输出：3

**示例 2：**

输入：root = [1,null,2]
输出：2

 

**提示：**

	
- 树中节点的数量在 `[0, 104]` 区间内。
	
- `-100 <= Node.val <= 100`',
    2000,
    256,
    '{"name": "maxDepth", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(104, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int maxDepth(TreeNode root) {
        
    }
}'),
(104, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var maxDepth = function(root) {
    
};'),
(104, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: int
        """
        '),
(104, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function maxDepth(root: TreeNode | null): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(104, '{"root": [3, 9, 20, null, null, 15, 7]}', '3', TRUE, 1),
(104, '{"root": [1, null, 2]}', '2', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    152,
    '乘积最大子数组',
    'maximum-product-subarray',
    'MEDIUM',
    '# 152. 乘积最大子数组

给你一个整数数组 `nums` ，请你找出数组中乘积最大的非空连续 子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

测试用例的答案是一个 **32-位** 整数。

**请注意**，一个只包含一个元素的数组的乘积是这个元素的值。

 

**示例 1:**

**输入:** nums = [2,3,-2,4]
**输出:** `6`
**解释:** 子数组 [2,3] 有最大乘积 6。

**示例 2:**

**输入:** nums = [-2,0,-1]
**输出:** 0
**解释:** 结果不能为 2, 因为 [-2,-1] 不是子数组。

 

**提示:**

	
- `1 <= nums.length <= 2 * 104`
	
- `-10 <= nums[i] <= 10`
	
- `nums` 的任何子数组的乘积都 **保证** 是一个 **32-位** 整数',
    2000,
    256,
    '{"name": "maxProduct", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(152, 'JAVA', 'class Solution {
    public int maxProduct(int[] nums) {
        
    }
}'),
(152, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function(nums) {
    
};'),
(152, 'PYTHON', 'class Solution(object):
    def maxProduct(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(152, 'TYPESCRIPT', 'function maxProduct(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(152, '{"nums": [2, 3, -2, 4]}', '6', TRUE, 1),
(152, '{"nums": [-2, 0, -1]}', '0', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    53,
    '最大子数组和',
    'maximum-subarray',
    'MEDIUM',
    '# 53. 最大子数组和

给你一个整数数组 `nums` ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

**子数组 **是数组中的一个连续部分。

 

**示例 1：**

**输入：**nums = [-2,1,-3,4,-1,2,1,-5,4]
**输出：**6
**解释：**连续子数组 [4,-1,2,1] 的和最大，为 6 。

**示例 2：**

**输入：**nums = [1]
**输出：**1

**示例 3：**

**输入：**nums = [5,4,-1,7,8]
**输出：**23

 

**提示：**

	
- `1 <= nums.length <= 105`
	
- `-104 <= nums[i] <= 104`

 

**进阶：**如果你已经实现复杂度为 `O(n)` 的解法，尝试使用更为精妙的 **分治法** 求解。',
    2000,
    256,
    '{"name": "maxSubArray", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(53, 'JAVA', 'class Solution {
    public int maxSubArray(int[] nums) {
        
    }
}'),
(53, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
    
};'),
(53, 'PYTHON', 'class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(53, 'TYPESCRIPT', 'function maxSubArray(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(53, '{"nums": [-2, 1, -3, 4, -1, 2, 1, -5, 4]}', '6', TRUE, 1),
(53, '{"nums": [1]}', '1', TRUE, 2),
(53, '{"nums": [5, 4, -1, 7, 8]}', '23', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    4,
    '寻找两个正序数组的中位数',
    'median-of-two-sorted-arrays',
    'HARD',
    '# 4. 寻找两个正序数组的中位数

给定两个大小分别为 `m` 和 `n` 的正序（从小到大）数组 `nums1` 和 `nums2`。请你找出并返回这两个正序数组的 **中位数** 。

算法的时间复杂度应该为 `O(log (m+n))` 。

 

**示例 1：**

**输入：**nums1 = [1,3], nums2 = [2]
**输出：**2.00000
**解释：**合并数组 = [1,2,3] ，中位数 2

**示例 2：**

**输入：**nums1 = [1,2], nums2 = [3,4]
**输出：**2.50000
**解释：**合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5

 

 

**提示：**

	
- `nums1.length == m`
	
- `nums2.length == n`
	
- `0 <= m <= 1000`
	
- `0 <= n <= 1000`
	
- `1 <= m + n <= 2000`
	
- `-106 <= nums1[i], nums2[i] <= 106`',
    2000,
    256,
    '{"name": "findMedianSortedArrays", "params": [{"name": "nums1", "type": "integer[]"}, {"name": "nums2", "type": "integer[]"}], "return": {"type": "double"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(4, 'JAVA', 'class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        
    }
}'),
(4, 'JAVASCRIPT', '/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function(nums1, nums2) {
    
};'),
(4, 'PYTHON', 'class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        '),
(4, 'TYPESCRIPT', 'function findMedianSortedArrays(nums1: number[], nums2: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(4, '{"nums1": [1, 3], "nums2": [2]}', '2.0', TRUE, 1),
(4, '{"nums1": [1, 2], "nums2": [3, 4]}', '2.5', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    56,
    '合并区间',
    'merge-intervals',
    'MEDIUM',
    '# 56. 合并区间

以数组 `intervals` 表示若干个区间的集合，其中单个区间为 `intervals[i] = [starti, endi]` 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。

 

**示例 1：**

**输入：**intervals = [[1,3],[2,6],[8,10],[15,18]]
**输出：**[[1,6],[8,10],[15,18]]
**解释：**区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

**示例 2：**

**输入：**intervals = [[1,4],[4,5]]
**输出：**[[1,5]]
**解释：**区间 [1,4] 和 [4,5] 可被视为重叠区间。

**示例 3：**

输入：intervals = [[4,7],[1,4]]
输出：[[1,7]]
解释：区间 [1,4] 和 [4,7] 可被视为重叠区间。

 

**提示：**

	
- `1 <= intervals.length <= 104`
	
- `intervals[i].length == 2`
	
- `0 <= starti <= endi <= 104`',
    2000,
    256,
    '{"name": "merge", "params": [{"name": "intervals", "type": "integer[][]"}], "return": {"type": "integer[][]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(56, 'JAVA', 'class Solution {
    public int[][] merge(int[][] intervals) {
        
    }
}'),
(56, 'JAVASCRIPT', '/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
var merge = function(intervals) {
    
};'),
(56, 'PYTHON', 'class Solution(object):
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """
        '),
(56, 'TYPESCRIPT', 'function merge(intervals: number[][]): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(56, '{"intervals": [[1, 3], [2, 6], [8, 10], [15, 18]]}', '[[1, 6], [8, 10], [15, 18]]', TRUE, 1),
(56, '{"intervals": [[1, 4], [4, 5]]}', '[[1, 5]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    23,
    '合并 K 个升序链表',
    'merge-k-sorted-lists',
    'HARD',
    '# 23. 合并 K 个升序链表

给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

 

**示例 1：**

**输入：**lists = [[1,4,5],[1,3,4],[2,6]]
**输出：**[1,1,2,3,4,4,5,6]
**解释：**链表数组如下：
[
  1->4->5,
  1->3->4,
  2->6
]
将它们合并到一个有序链表中得到。
1->1->2->3->4->4->5->6

**示例 2：**

**输入：**lists = []
**输出：**[]

**示例 3：**

**输入：**lists = [[]]
**输出：**[]

 

**提示：**

	
- `k == lists.length`
	
- `0 <= k <= 10^4`
	
- `0 <= lists[i].length <= 500`
	
- `-10^4 <= lists[i][j] <= 10^4`
	
- `lists[i]` 按 **升序** 排列
	
- `lists[i].length` 的总和不超过 `10^4`',
    2000,
    256,
    '{"name": "mergeKLists", "params": [{"name": "lists", "type": "ListNode[]", "dealloc": false}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(23, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeKLists(ListNode[] lists) {
        
    }
}'),
(23, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
var mergeKLists = function(lists) {
    
};'),
(23, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeKLists(self, lists):
        """
        :type lists: List[Optional[ListNode]]
        :rtype: Optional[ListNode]
        """
        '),
(23, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function mergeKLists(lists: Array<ListNode | null>): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(23, '{"lists": [[1, 4, 5], [1, 3, 4], [2, 6]]}', '[1, 1, 2, 3, 4, 4, 5, 6]', TRUE, 1),
(23, '{"lists": []}', '[]', TRUE, 2),
(23, '{"lists": [[]]}', '[]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    21,
    '合并两个有序链表',
    'merge-two-sorted-lists',
    'EASY',
    '# 21. 合并两个有序链表

将两个升序链表合并为一个新的 **升序** 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

 

**示例 1：**

**输入：**l1 = [1,2,4], l2 = [1,3,4]
**输出：**[1,1,2,3,4,4]

**示例 2：**

**输入：**l1 = [], l2 = []
**输出：**[]

**示例 3：**

**输入：**l1 = [], l2 = [0]
**输出：**[0]

 

**提示：**

	
- 两个链表的节点数目范围是 `[0, 50]`
	
- `-100',
    2000,
    256,
    '{"name": "mergeTwoLists", "params": [{"name": "list1", "type": "ListNode", "dealloc": false}, {"name": "list2", "type": "ListNode", "dealloc": false}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(21, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        
    }
}'),
(21, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} list1
 * @param {ListNode} list2
 * @return {ListNode}
 */
var mergeTwoLists = function(list1, list2) {
    
};'),
(21, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def mergeTwoLists(self, list1, list2):
        """
        :type list1: Optional[ListNode]
        :type list2: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        '),
(21, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function mergeTwoLists(list1: ListNode | null, list2: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(21, '{"list1": [1, 2, 4], "list2": [1, 3, 4]}', '[1, 1, 2, 3, 4, 4]', TRUE, 1),
(21, '{"list1": [], "list2": []}', '[]', TRUE, 2),
(21, '{"list1": [], "list2": [0]}', '[0]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    155,
    '最小栈',
    'min-stack',
    'MEDIUM',
    '# 155. 最小栈

设计一个支持 `push` ，`pop` ，`top` 操作，并能在常数时间内检索到最小元素的栈。

实现 `MinStack` 类:

	
- `MinStack()` 初始化堆栈对象。
	
- `void push(int value)` 将元素 `value` 推入堆栈。
	
- `void pop()` 删除堆栈顶部的元素。
	
- `int top()` 获取堆栈顶部的元素。
	
- `int getMin()` 获取堆栈中的最小元素。

 

**示例 1:**

**输入：**
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

**输出：**
[null,null,null,null,-3,null,0,-2]

**解释：**
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.

 

**提示：**

	
- `-231 <= val <= 231 - 1`
	
- `pop`、`top` 和 `getMin` 操作总是在 **非空栈** 上调用
	
- `push`, `pop`, `top`, and `getMin`最多被调用 `3 * 104` 次',
    2000,
    256,
    '{"classname": "MinStack", "constructor": {"params": []}, "methods": [{"params": [{"type": "integer", "name": "value"}], "return": {"type": "void"}, "name": "push"}, {"params": [], "return": {"type": "void"}, "name": "pop"}, {"params": [], "return": {"type": "integer"}, "name": "top"}, {"params": [], "return": {"type": "integer"}, "name": "getMin"}], "return": {"type": "boolean"}, "systemdesign": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(155, 'JAVA', 'class MinStack {

    public MinStack() {
        
    }
    
    public void push(int value) {
        
    }
    
    public void pop() {
        
    }
    
    public int top() {
        
    }
    
    public int getMin() {
        
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(value);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */'),
(155, 'JAVASCRIPT', '
var MinStack = function() {
    
};

/** 
 * @param {number} value
 * @return {void}
 */
MinStack.prototype.push = function(value) {
    
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
    
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
    
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    
};

/** 
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(value)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */'),
(155, 'PYTHON', 'class MinStack(object):

    def __init__(self):
        

    def push(self, value):
        """
        :type value: int
        :rtype: None
        """
        

    def pop(self):
        """
        :rtype: None
        """
        

    def top(self):
        """
        :rtype: int
        """
        

    def getMin(self):
        """
        :rtype: int
        """
        


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(value)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()'),
(155, 'TYPESCRIPT', 'class MinStack {
    constructor() {
        
    }

    push(value: number): void {
        
    }

    pop(): void {
        
    }

    top(): number {
        
    }

    getMin(): number {
        
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(value)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(155, '{"operations": ["MinStack", "push", "push", "push", "getMin", "pop", "top", "getMin"], "arguments": [[], [-2], [0], [-3], [], [], [], []]}', '[null, null, null, null, -3, null, 0, -2]', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    64,
    '最小路径和',
    'minimum-path-sum',
    'MEDIUM',
    '# 64. 最小路径和

给定一个包含非负整数的 `m x n` 网格 `grid` ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

**说明：**每次只能向下或者向右移动一步。

 

**示例 1：**

**输入：**grid = [[1,3,1],[1,5,1],[4,2,1]]
**输出：**7
**解释：**因为路径 1→3→1→1→1 的总和最小。

**示例 2：**

**输入：**grid = [[1,2,3],[4,5,6]]
**输出：**12

 

**提示：**

	
- `m == grid.length`
	
- `n == grid[i].length`
	
- `1 <= m, n <= 200`
	
- `0 <= grid[i][j] <= 200`',
    2000,
    256,
    '{"name": "minPathSum", "params": [{"name": "grid", "type": "integer[][]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(64, 'JAVA', 'class Solution {
    public int minPathSum(int[][] grid) {
        
    }
}'),
(64, 'JAVASCRIPT', '/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
    
};'),
(64, 'PYTHON', 'class Solution(object):
    def minPathSum(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        '),
(64, 'TYPESCRIPT', 'function minPathSum(grid: number[][]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(64, '{"grid": [[1, 3, 1], [1, 5, 1], [4, 2, 1]]}', '7', TRUE, 1),
(64, '{"grid": [[1, 2, 3], [4, 5, 6]]}', '12', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    76,
    '最小覆盖子串',
    'minimum-window-substring',
    'HARD',
    '# 76. 最小覆盖子串

给定两个字符串 `s` 和 `t`，长度分别是 `m` 和 `n`，返回 s 中的 **最短窗口 子串**，使得该子串包含 `t` 中的每一个字符（**包括重复字符**）。如果没有这样的子串，返回空字符串 `""`。

测试用例保证答案唯一。

 

**示例 1：**

**输入：**s = "ADOBECODEBANC", t = "ABC"
**输出：**"BANC"
**解释：**最小覆盖子串 "BANC" 包含来自字符串 t 的 ''A''、''B'' 和 ''C''。

**示例 2：**

**输入：**s = "a", t = "a"
**输出：**"a"
**解释：**整个字符串 s 是最小覆盖子串。

**示例 3:**

**输入:** s = "a", t = "aa"
**输出:** ""
**解释:** t 中两个字符 ''a'' 均应包含在 s 的子串中，
因此没有符合条件的子字符串，返回空字符串。

 

**提示：**

	
- `m == s.length`
	
- `n == t.length`
	
- `1 <= m, n <= 105`
	
- `s` 和 `t` 由英文字母组成

 

**进阶：**你能设计一个在 `O(m + n)` 时间内解决此问题的算法吗？',
    2000,
    256,
    '{"name": "minWindow", "params": [{"name": "s", "type": "string"}, {"name": "t", "type": "string"}], "return": {"type": "string"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(76, 'JAVA', 'class Solution {
    public String minWindow(String s, String t) {
        
    }
}'),
(76, 'JAVASCRIPT', '/**
 * @param {string} s
 * @param {string} t
 * @return {string}
 */
var minWindow = function(s, t) {
    
};'),
(76, 'PYTHON', 'class Solution(object):
    def minWindow(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: str
        """
        '),
(76, 'TYPESCRIPT', 'function minWindow(s: string, t: string): string {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(76, '{"s": "ADOBECODEBANC", "t": "ABC"}', 'BANC', TRUE, 1),
(76, '{"s": "a", "t": "a"}', 'a', TRUE, 2),
(76, '{"s": "a", "t": "aa"}', '', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    283,
    '移动零',
    'move-zeroes',
    'EASY',
    '# 283. 移动零

给定一个数组 `nums`，编写一个函数将所有 `0` 移动到数组的末尾，同时保持非零元素的相对顺序。

**请注意** ，必须在不复制数组的情况下原地对数组进行操作。

 

**示例 1:**

**输入:** nums = `[0,1,0,3,12]`
**输出:** `[1,3,12,0,0]`

**示例 2:**

**输入:** nums = `[0]`
**输出:** `[0]`

 

**提示**:

	
- `1 <= nums.length <= 104`
	
- `-231 <= nums[i] <= 231 - 1`

 

进阶：你能尽量减少完成的操作次数吗？',
    2000,
    256,
    '{"name": "moveZeroes", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "void"}, "output": {"paramindex": 0}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(283, 'JAVA', 'class Solution {
    public void moveZeroes(int[] nums) {
        
    }
}'),
(283, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    
};'),
(283, 'PYTHON', 'class Solution(object):
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        '),
(283, 'TYPESCRIPT', '/**
 Do not return anything, modify nums in-place instead.
 */
function moveZeroes(nums: number[]): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(283, '{"nums": [0, 1, 0, 3, 12]}', '[1, 3, 12, 0, 0]', TRUE, 1),
(283, '{"nums": [0]}', '[0]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    51,
    'N 皇后',
    'n-queens',
    'HARD',
    '# 51. N 皇后

按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

**n 皇后问题** 研究的是如何将 `n` 个皇后放置在 `n×n` 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 `n` ，返回所有不同的 **n 皇后问题** 的解决方案。

每一种解法包含一个不同的 **n 皇后问题** 的棋子放置方案，该方案中 `''Q''` 和 `''.''` 分别代表了皇后和空位。

 

**示例 1：**

**输入：**n = 4
**输出：**[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
**解释：**如上图所示，4 皇后问题存在两个不同的解法。

**示例 2：**

**输入：**n = 1
**输出：**[["Q"]]

 

**提示：**

	
- `1 <= n <= 9`',
    2000,
    256,
    '{"name": "solveNQueens", "params": [{"name": "n", "type": "integer"}], "return": {"type": "list<list<string>>", "colsize": "param_1", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(51, 'JAVA', 'class Solution {
    public List<List<String>> solveNQueens(int n) {
        
    }
}'),
(51, 'JAVASCRIPT', '/**
 * @param {number} n
 * @return {string[][]}
 */
var solveNQueens = function(n) {
    
};'),
(51, 'PYTHON', 'class Solution(object):
    def solveNQueens(self, n):
        """
        :type n: int
        :rtype: List[List[str]]
        """
        '),
(51, 'TYPESCRIPT', 'function solveNQueens(n: number): string[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(51, '{"n": 4}', '[[".Q..", "...Q", "Q...", "..Q."], ["..Q.", "Q...", "...Q", ".Q.."]]', TRUE, 1),
(51, '{"n": 1}', '[["Q"]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    31,
    '下一个排列',
    'next-permutation',
    'MEDIUM',
    '# 31. 下一个排列

整数数组的一个 **排列**  就是将其所有成员以序列或线性顺序排列。

	
- 例如，`arr = [1,2,3]` ，以下这些都可以视作 `arr` 的排列：`[1,2,3]`、`[1,3,2]`、`[3,1,2]`、`[2,3,1]` 。

整数数组的 **下一个排列** 是指其整数的下一个字典序更大的排列。更正式地，如果数组的所有排列根据其字典顺序从小到大排列在一个容器中，那么数组的 **下一个排列** 就是在这个有序容器中排在它后面的那个排列。如果不存在下一个更大的排列，那么这个数组必须重排为字典序最小的排列（即，其元素按升序排列）。

	
- 例如，`arr = [1,2,3]` 的下一个排列是 `[1,3,2]` 。
	
- 类似地，`arr = [2,3,1]` 的下一个排列是 `[3,1,2]` 。
	
- 而 `arr = [3,2,1]` 的下一个排列是 `[1,2,3]` ，因为 `[3,2,1]` 不存在一个字典序更大的排列。

给你一个整数数组 `nums` ，找出 `nums` 的下一个排列。

必须** 原地 **修改，只允许使用额外常数空间。

 

**示例 1：**

**输入：**nums = [1,2,3]
**输出：**[1,3,2]

**示例 2：**

**输入：**nums = [3,2,1]
**输出：**[1,2,3]

**示例 3：**

**输入：**nums = [1,1,5]
**输出：**[1,5,1]

 

**提示：**

	
- `1 <= nums.length <= 100`
	
- `0 <= nums[i] <= 100`',
    2000,
    256,
    '{"name": "nextPermutation", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "void"}, "output": {"paramindex": 0}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(31, 'JAVA', 'class Solution {
    public void nextPermutation(int[] nums) {
        
    }
}'),
(31, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var nextPermutation = function(nums) {
    
};'),
(31, 'PYTHON', 'class Solution(object):
    def nextPermutation(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        '),
(31, 'TYPESCRIPT', '/**
 Do not return anything, modify nums in-place instead.
 */
function nextPermutation(nums: number[]): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(31, '{"nums": [1, 2, 3]}', '[1, 3, 2]', TRUE, 1),
(31, '{"nums": [3, 2, 1]}', '[1, 2, 3]', TRUE, 2),
(31, '{"nums": [1, 1, 5]}', '[1, 5, 1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    200,
    '岛屿数量',
    'number-of-islands',
    'MEDIUM',
    '# 200. 岛屿数量

给你一个由 `''1''`（陆地）和 `''0''`（水）组成的的二维网格，请你计算网格中岛屿的数量。

岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

此外，你可以假设该网格的四条边均被水包围。

 

**示例 1：**

**输入：**grid = [
  [''1'',''1'',''1'',''1'',''0''],
  [''1'',''1'',''0'',''1'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''0'',''0'',''0'']
]
**输出：**1

**示例 2：**

**输入：**grid = [
  [''1'',''1'',''0'',''0'',''0''],
  [''1'',''1'',''0'',''0'',''0''],
  [''0'',''0'',''1'',''0'',''0''],
  [''0'',''0'',''0'',''1'',''1'']
]
**输出：**3

 

**提示：**

	
- `m == grid.length`
	
- `n == grid[i].length`
	
- `1 <= m, n <= 300`
	
- `grid[i][j]` 的值为 `''0''` 或 `''1''`',
    2000,
    256,
    '{"name": "numIslands", "params": [{"name": "grid", "type": "character[][]"}], "return": {"type": "integer"}, "manual": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(200, 'JAVA', 'class Solution {
    public int numIslands(char[][] grid) {
        
    }
}'),
(200, 'JAVASCRIPT', '/**
 * @param {character[][]} grid
 * @return {number}
 */
var numIslands = function(grid) {
    
};'),
(200, 'PYTHON', 'class Solution(object):
    def numIslands(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: int
        """
        '),
(200, 'TYPESCRIPT', 'function numIslands(grid: string[][]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(200, '{"grid": [["1", "1", "1", "1", "0"], ["1", "1", "0", "1", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "0", "0", "0"]]}', '1', TRUE, 1),
(200, '{"grid": [["1", "1", "0", "0", "0"], ["1", "1", "0", "0", "0"], ["0", "0", "1", "0", "0"], ["0", "0", "0", "1", "1"]]}', '3', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    234,
    '回文链表',
    'palindrome-linked-list',
    'EASY',
    '# 234. 回文链表

给你一个单链表的头节点 `head` ，请你判断该链表是否为回文链表。如果是，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

**输入：**head = [1,2,2,1]
**输出：**true

**示例 2：**

**输入：**head = [1,2]
**输出：**false

 

**提示：**

	
- 链表中节点数目在范围`[1, 105]` 内
	
- `0 <= Node.val <= 9`

 

**进阶：**你能否用 `O(n)` 时间复杂度和 `O(1)` 空间复杂度解决此题？',
    2000,
    256,
    '{"name": "isPalindrome", "params": [{"name": "head", "type": "ListNode"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(234, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public boolean isPalindrome(ListNode head) {
        
    }
}'),
(234, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function(head) {
    
};'),
(234, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def isPalindrome(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: bool
        """
        '),
(234, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function isPalindrome(head: ListNode | null): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(234, '{"head": [1, 2, 2, 1]}', 'true', TRUE, 1),
(234, '{"head": [1, 2]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    131,
    '分割回文串',
    'palindrome-partitioning',
    'MEDIUM',
    '# 131. 分割回文串

给你一个字符串 `s`，请你将 `s` 分割成一些 子串，使每个子串都是 **回文串** 。返回 `s` 所有可能的分割方案。

 

**示例 1：**

**输入：**s = "aab"
**输出：**[["a","a","b"],["aa","b"]]

**示例 2：**

**输入：**s = "a"
**输出：**[["a"]]

 

**提示：**

	
- `1 <= s.length <= 16`
	
- `s` 仅由小写英文字母组成',
    2000,
    256,
    '{"name": "partition", "params": [{"name": "s", "type": "string"}], "return": {"type": "list<list<string>>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(131, 'JAVA', 'class Solution {
    public List<List<String>> partition(String s) {
        
    }
}'),
(131, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {string[][]}
 */
var partition = function(s) {
    
};'),
(131, 'PYTHON', 'class Solution(object):
    def partition(self, s):
        """
        :type s: str
        :rtype: List[List[str]]
        """
        '),
(131, 'TYPESCRIPT', 'function partition(s: string): string[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(131, '{"s": "aab"}', '[["a", "a", "b"], ["aa", "b"]]', TRUE, 1),
(131, '{"s": "a"}', '[["a"]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    416,
    '分割等和子集',
    'partition-equal-subset-sum',
    'MEDIUM',
    '# 416. 分割等和子集

给你一个 **只包含正整数 **的 **非空 **数组 `nums` 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 

**示例 1：**

**输入：**nums = [1,5,11,5]
**输出：**true
**解释：**数组可以分割成 [1, 5, 5] 和 [11] 。

**示例 2：**

**输入：**nums = [1,2,3,5]
**输出：**false
**解释：**数组不能分割成两个元素和相等的子集。

 

**提示：**

	
- `1',
    2000,
    256,
    '{"name": "canPartition", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(416, 'JAVA', 'class Solution {
    public boolean canPartition(int[] nums) {
        
    }
}'),
(416, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
    
};'),
(416, 'PYTHON', 'class Solution(object):
    def canPartition(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        '),
(416, 'TYPESCRIPT', 'function canPartition(nums: number[]): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(416, '{"nums": [1, 5, 11, 5]}', 'true', TRUE, 1),
(416, '{"nums": [1, 2, 3, 5]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    763,
    '划分字母区间',
    'partition-labels',
    'MEDIUM',
    '# 763. 划分字母区间

给你一个字符串 `s` 。我们要把这个字符串划分为尽可能多的片段，同一字母最多出现在一个片段中。例如，字符串 `"ababcc"` 能够被分为 `["abab", "cc"]`，但类似 `["aba", "bcc"]` 或 `["ab", "ab", "cc"]` 的划分是非法的。

注意，划分结果需要满足：将所有划分结果按顺序连接，得到的字符串仍然是 `s` 。

返回一个表示每个字符串片段的长度的列表。

 

**示例 1：**

**输入：**s = "ababcbacadefegdehijhklij"
**输出：**[9,7,8]
**解释：**
划分结果为 "ababcbaca"、"defegde"、"hijhklij" 。
每个字母最多出现在一个片段中。
像 "ababcbacadefegde", "hijhklij" 这样的划分是错误的，因为划分的片段数较少。 

**示例 2：**

**输入：**s = "eccbbbbdec"
**输出：**[10]

 

**提示：**

	
- `1 <= s.length <= 500`
	
- `s` 仅由小写英文字母组成',
    2000,
    256,
    '{"name": "partitionLabels", "params": [{"name": "s", "type": "string"}], "return": {"type": "list<integer>"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(763, 'JAVA', 'class Solution {
    public List<Integer> partitionLabels(String s) {
        
    }
}'),
(763, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {number[]}
 */
var partitionLabels = function(s) {
    
};'),
(763, 'PYTHON', 'class Solution(object):
    def partitionLabels(self, s):
        """
        :type s: str
        :rtype: List[int]
        """
        '),
(763, 'TYPESCRIPT', 'function partitionLabels(s: string): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(763, '{"s": "ababcbacadefegdehijhklij"}', '[9, 7, 8]', TRUE, 1),
(763, '{"s": "eccbbbbdec"}', '[10]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    118,
    '杨辉三角',
    'pascals-triangle',
    'EASY',
    '# 118. 杨辉三角

给定一个非负整数 `numRows`，生成「杨辉三角」的前 `numRows` 行。

在**「杨辉三角」**中，每个数是它左上方和右上方的数的和。

 

**示例 1:**

**输入:** numRows = 5
**输出:** [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

**示例 2:**

**输入:** numRows = 1
**输出:** [[1]]

 

**提示:**

	
- `1 <= numRows <= 30`',
    2000,
    256,
    '{"name": "generate", "params": [{"name": "numRows", "type": "integer"}], "return": {"type": "list<list<integer>>", "dealloc": true, "rowsize": "param_1"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(118, 'JAVA', 'class Solution {
    public List<List<Integer>> generate(int numRows) {
        
    }
}'),
(118, 'JAVASCRIPT', '/**
 * @param {number} numRows
 * @return {number[][]}
 */
var generate = function(numRows) {
    
};'),
(118, 'PYTHON', 'class Solution(object):
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """
        '),
(118, 'TYPESCRIPT', 'function generate(numRows: number): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(118, '{"numRows": 5}', '[[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]', TRUE, 1),
(118, '{"numRows": 1}', '[[1]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    437,
    '路径总和 III',
    'path-sum-iii',
    'MEDIUM',
    '# 437. 路径总和 III

给定一个二叉树的根节点 `root` ，和一个整数 `targetSum` ，求该二叉树里节点值之和等于 `targetSum` 的 **路径** 的数目。

**路径** 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

 

**示例 1：**

**输入：**root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
**输出：**3
**解释：**和等于 8 的路径有 3 条，如图所示。

**示例 2：**

**输入：**root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
**输出：**3

 

**提示:**

	
- 二叉树的节点个数的范围是 `[0,1000]`
	
- `-109 9` 
	
- `-1000',
    2000,
    256,
    '{"name": "pathSum", "params": [{"name": "root", "type": "TreeNode"}, {"name": "targetSum", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(437, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int pathSum(TreeNode root, int targetSum) {
        
    }
}'),
(437, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} targetSum
 * @return {number}
 */
var pathSum = function(root, targetSum) {
    
};'),
(437, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def pathSum(self, root, targetSum):
        """
        :type root: Optional[TreeNode]
        :type targetSum: int
        :rtype: int
        """
        '),
(437, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function pathSum(root: TreeNode | null, targetSum: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(437, '{"root": [10, 5, -3, 3, 2, null, 11, 3, -2, null, 1], "targetSum": 8}', '3', TRUE, 1),
(437, '{"root": [5, 4, 8, 11, null, 13, 4, 7, 2, null, null, 5, 1], "targetSum": 22}', '3', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    279,
    '完全平方数',
    'perfect-squares',
    'MEDIUM',
    '# 279. 完全平方数

给你一个整数 `n` ，返回 和为 `n` 的完全平方数的最少数量 。

**完全平方数** 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，`1`、`4`、`9` 和 `16` 都是完全平方数，而 `3` 和 `11` 不是。

 

**示例 1：**

**输入：**n = `12`
**输出：**3 
**解释：**`12 = 4 + 4 + 4`

**示例 2：**

**输入：**n = `13`
**输出：**2
**解释：**`13 = 4 + 9`
 

**提示：**

	
- `1 <= n <= 104`',
    2000,
    256,
    '{"name": "numSquares", "params": [{"name": "n", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(279, 'JAVA', 'class Solution {
    public int numSquares(int n) {
        
    }
}'),
(279, 'JAVASCRIPT', '/**
 * @param {number} n
 * @return {number}
 */
var numSquares = function(n) {
    
};'),
(279, 'PYTHON', 'class Solution(object):
    def numSquares(self, n):
        """
        :type n: int
        :rtype: int
        """
        '),
(279, 'TYPESCRIPT', 'function numSquares(n: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(279, '{"n": 12}', '3', TRUE, 1),
(279, '{"n": 13}', '2', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    46,
    '全排列',
    'permutations',
    'MEDIUM',
    '# 46. 全排列

给定一个不含重复数字的数组 `nums` ，返回其 所有可能的全排列 。你可以 **按任意顺序** 返回答案。

 

**示例 1：**

**输入：**nums = [1,2,3]
**输出：**[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

**示例 2：**

**输入：**nums = [0,1]
**输出：**[[0,1],[1,0]]

**示例 3：**

**输入：**nums = [1]
**输出：**[[1]]

 

**提示：**

	
- `1 <= nums.length <= 6`
	
- `-10 <= nums[i] <= 10`
	
- `nums` 中的所有整数 **互不相同**',
    2000,
    256,
    '{"name": "permute", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "list<list<integer>>", "colsize": "size_1", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(46, 'JAVA', 'class Solution {
    public List<List<Integer>> permute(int[] nums) {
        
    }
}'),
(46, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function(nums) {
    
};'),
(46, 'PYTHON', 'class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        '),
(46, 'TYPESCRIPT', 'function permute(nums: number[]): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(46, '{"nums": [1, 2, 3]}', '[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]', TRUE, 1),
(46, '{"nums": [0, 1]}', '[[0, 1], [1, 0]]', TRUE, 2),
(46, '{"nums": [1]}', '[[1]]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    238,
    '除了自身以外数组的乘积',
    'product-of-array-except-self',
    'MEDIUM',
    '# 238. 除了自身以外数组的乘积

给你一个整数数组 `nums`，返回 数组 `answer` ，其中 `answer[i]` 等于 `nums` 中除了 `nums[i]` 之外其余各元素的乘积 。

题目数据 **保证** 数组 `nums`之中任意元素的全部前缀元素和后缀的乘积都在  **32 位** 整数范围内。

请 **不要使用除法，**且在 `O(n)` 时间复杂度内完成此题。

 

**示例 1:**

**输入:** nums = `[1,2,3,4]`
**输出:** `[24,12,8,6]`

**示例 2:**

**输入:** nums = [-1,1,0,-3,3]
**输出:** [0,0,9,0,0]

 

**提示：**

	
- `2 <= nums.length <= 105`
	
- `-30 <= nums[i] <= 30`
	
- 输入 **保证** 数组 `answer[i]` 在  **32 位** 整数范围内

 

**进阶：**你可以在 `O(1)` 的额外空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组 **不被视为 **额外空间。）',
    2000,
    256,
    '{"name": "productExceptSelf", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer[]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(238, 'JAVA', 'class Solution {
    public int[] productExceptSelf(int[] nums) {
        
    }
}'),
(238, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number[]}
 */
var productExceptSelf = function(nums) {
    
};'),
(238, 'PYTHON', 'class Solution(object):
    def productExceptSelf(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        '),
(238, 'TYPESCRIPT', 'function productExceptSelf(nums: number[]): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(238, '{"nums": [1, 2, 3, 4]}', '[24, 12, 8, 6]', TRUE, 1),
(238, '{"nums": [-1, 1, 0, -3, 3]}', '[0, 0, 9, 0, 0]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    19,
    '删除链表的倒数第 N 个结点',
    'remove-nth-node-from-end-of-list',
    'MEDIUM',
    '# 19. 删除链表的倒数第 N 个结点

给你一个链表，删除链表的倒数第 `n` 个结点，并且返回链表的头结点。

 

**示例 1：**

**输入：**head = [1,2,3,4,5], n = 2
**输出：**[1,2,3,5]

**示例 2：**

**输入：**head = [1], n = 1
**输出：**[]

**示例 3：**

**输入：**head = [1,2], n = 1
**输出：**[1]

 

**提示：**

	
- 链表中结点的数目为 `sz`
	
- `1 <= sz <= 30`
	
- `0 <= Node.val <= 100`
	
- `1 <= n <= sz`

 

**进阶：**你能尝试使用一趟扫描实现吗？',
    2000,
    256,
    '{"name": "removeNthFromEnd", "params": [{"name": "head", "type": "ListNode", "dealloc": false}, {"name": "n", "type": "integer"}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(19, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        
    }
}'),
(19, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} n
 * @return {ListNode}
 */
var removeNthFromEnd = function(head, n) {
    
};'),
(19, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def removeNthFromEnd(self, head, n):
        """
        :type head: Optional[ListNode]
        :type n: int
        :rtype: Optional[ListNode]
        """
        '),
(19, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function removeNthFromEnd(head: ListNode | null, n: number): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(19, '{"head": [1, 2, 3, 4, 5], "n": 2}', '[1, 2, 3, 5]', TRUE, 1),
(19, '{"head": [1], "n": 1}', '[]', TRUE, 2),
(19, '{"head": [1, 2], "n": 1}', '[1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    206,
    '反转链表',
    'reverse-linked-list',
    'EASY',
    '# 206. 反转链表

给你单链表的头节点 `head` ，请你反转链表，并返回反转后的链表。

 

**示例 1：**

**输入：**head = [1,2,3,4,5]
**输出：**[5,4,3,2,1]

**示例 2：**

**输入：**head = [1,2]
**输出：**[2,1]

**示例 3：**

**输入：**head = []
**输出：**[]

 

**提示：**

	
- 链表中节点的数目范围是 `[0, 5000]`
	
- `-5000 

 

**进阶：**链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？',
    2000,
    256,
    '{"name": "reverseList", "params": [{"name": "head", "type": "ListNode", "dealloc": false}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(206, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        
    }
}'),
(206, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var reverseList = function(head) {
    
};'),
(206, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        '),
(206, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function reverseList(head: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(206, '{"head": [1, 2, 3, 4, 5]}', '[5, 4, 3, 2, 1]', TRUE, 1),
(206, '{"head": [1, 2]}', '[2, 1]', TRUE, 2),
(206, '{"head": []}', '[]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    25,
    'K 个一组翻转链表',
    'reverse-nodes-in-k-group',
    'HARD',
    '# 25. K 个一组翻转链表

给你链表的头节点 `head` ，每 `k` 个节点一组进行翻转，请你返回修改后的链表。

`k` 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 `k` 的整数倍，那么请将最后剩余的节点保持原有顺序。

你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

 

**示例 1：**

**输入：**head = [1,2,3,4,5], k = 2
**输出：**[2,1,4,3,5]

**示例 2：**

**输入：**head = [1,2,3,4,5], k = 3
**输出：**[3,2,1,4,5]

 

**提示：**

	
- 链表中的节点数目为 `n`
	
- `1 <= k <= n <= 5000`
	
- `0 <= Node.val <= 1000`

 

**进阶：**你可以设计一个只用 `O(1)` 额外内存空间的算法解决此问题吗？',
    2000,
    256,
    '{"name": "reverseKGroup", "params": [{"name": "head", "type": "ListNode"}, {"name": "k", "type": "integer"}], "return": {"type": "ListNode"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(25, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
        
    }
}'),
(25, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
var reverseKGroup = function(head, k) {
    
};'),
(25, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseKGroup(self, head, k):
        """
        :type head: Optional[ListNode]
        :type k: int
        :rtype: Optional[ListNode]
        """
        '),
(25, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function reverseKGroup(head: ListNode | null, k: number): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(25, '{"head": [1, 2, 3, 4, 5], "k": 2}', '[2, 1, 4, 3, 5]', TRUE, 1),
(25, '{"head": [1, 2, 3, 4, 5], "k": 3}', '[3, 2, 1, 4, 5]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    189,
    '轮转数组',
    'rotate-array',
    'MEDIUM',
    '# 189. 轮转数组

给定一个整数数组 `nums`，将数组中的元素向右轮转 `k` 个位置，其中 `k` 是非负数。

 

**示例 1:**

**输入:** nums = [1,2,3,4,5,6,7], k = 3
**输出:** `[5,6,7,1,2,3,4]`
**解释:**
向右轮转 1 步: `[7,1,2,3,4,5,6]`
向右轮转 2 步: `[6,7,1,2,3,4,5]
`向右轮转 3 步: `[5,6,7,1,2,3,4]`

**示例 2:**

**输入：**nums = [-1,-100,3,99], k = 2
**输出：**[3,99,-1,-100]
**解释:** 
向右轮转 1 步: [99,-1,-100,3]
向右轮转 2 步: [3,99,-1,-100]

 

**提示：**

	
- `1 <= nums.length <= 105`
	
- `-231 <= nums[i] <= 231 - 1`
	
- `0 <= k <= 105`

 

**进阶：**

	
- 尽可能想出更多的解决方案，至少有 **三种** 不同的方法可以解决这个问题。
	
- 你可以使用空间复杂度为 `O(1)` 的 **原地 **算法解决这个问题吗？',
    2000,
    256,
    '{"name": "rotate", "params": [{"name": "nums", "type": "integer[]"}, {"name": "k", "type": "integer"}], "return": {"type": "void"}, "output": {"paramindex": 0}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(189, 'JAVA', 'class Solution {
    public void rotate(int[] nums, int k) {
        
    }
}'),
(189, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function(nums, k) {
    
};'),
(189, 'PYTHON', 'class Solution(object):
    def rotate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        '),
(189, 'TYPESCRIPT', '/**
 Do not return anything, modify nums in-place instead.
 */
function rotate(nums: number[], k: number): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(189, '{"nums": [1, 2, 3, 4, 5, 6, 7], "k": 3}', '[5, 6, 7, 1, 2, 3, 4]', TRUE, 1),
(189, '{"nums": [-1, -100, 3, 99], "k": 2}', '[3, 99, -1, -100]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    48,
    '旋转图像',
    'rotate-image',
    'MEDIUM',
    '# 48. 旋转图像

给定一个 n × n 的二维矩阵 `matrix` 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在** 原地** 旋转图像，这意味着你需要直接修改输入的二维矩阵。**请不要 **使用另一个矩阵来旋转图像。

 

**示例 1：**

**输入：**matrix = [[1,2,3],[4,5,6],[7,8,9]]
**输出：**[[7,4,1],[8,5,2],[9,6,3]]

**示例 2：**

**输入：**matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
**输出：**[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

 

**提示：**

	
- `n == matrix.length == matrix[i].length`
	
- `1 <= n <= 20`
	
- `-1000 <= matrix[i][j] <= 1000`',
    2000,
    256,
    '{"name": "rotate", "params": [{"name": "matrix", "type": "integer[][]"}], "return": {"type": "void"}, "output": {"paramindex": 0}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(48, 'JAVA', 'class Solution {
    public void rotate(int[][] matrix) {
        
    }
}'),
(48, 'JAVASCRIPT', '/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var rotate = function(matrix) {
    
};'),
(48, 'PYTHON', 'class Solution(object):
    def rotate(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
        '),
(48, 'TYPESCRIPT', '/**
 Do not return anything, modify matrix in-place instead.
 */
function rotate(matrix: number[][]): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(48, '{"matrix": [[1, 2, 3], [4, 5, 6], [7, 8, 9]]}', '[[7, 4, 1], [8, 5, 2], [9, 6, 3]]', TRUE, 1),
(48, '{"matrix": [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]}', '[[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    994,
    '腐烂的橘子',
    'rotting-oranges',
    'MEDIUM',
    '# 994. 腐烂的橘子

在给定的 `m x n` 网格 `grid` 中，每个单元格可以有以下三个值之一：

	
- 值 `0` 代表空单元格；
	
- 值 `1` 代表新鲜橘子；
	
- 值 `2` 代表腐烂的橘子。

每分钟，腐烂的橘子 **周围 4 个方向上相邻** 的新鲜橘子都会腐烂。

返回 直到单元格中没有新鲜橘子为止所必须经过的最小分钟数。如果不可能，返回 `-1` 。

 

**示例 1：**

****

**输入：**grid = [[2,1,1],[1,1,0],[0,1,1]]
**输出：**4

**示例 2：**

**输入：**grid = [[2,1,1],[0,1,1],[1,0,1]]
**输出：**-1
**解释：**左下角的橘子（第 2 行， 第 0 列）永远不会腐烂，因为腐烂只会发生在 4 个方向上。

**示例 3：**

**输入：**grid = [[0,2]]
**输出：**0
**解释：**因为 0 分钟时已经没有新鲜橘子了，所以答案就是 0 。

 

**提示：**

	
- `m == grid.length`
	
- `n == grid[i].length`
	
- `1 <= m, n <= 10`
	
- `grid[i][j]` 仅为 `0`、`1` 或 `2`',
    2000,
    256,
    '{"name": "orangesRotting", "params": [{"name": "grid", "type": "integer[][]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(994, 'JAVA', 'class Solution {
    public int orangesRotting(int[][] grid) {
        
    }
}'),
(994, 'JAVASCRIPT', '/**
 * @param {number[][]} grid
 * @return {number}
 */
var orangesRotting = function(grid) {
    
};'),
(994, 'PYTHON', 'class Solution(object):
    def orangesRotting(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        '),
(994, 'TYPESCRIPT', 'function orangesRotting(grid: number[][]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(994, '{"grid": [[2, 1, 1], [1, 1, 0], [0, 1, 1]]}', '4', TRUE, 1),
(994, '{"grid": [[2, 1, 1], [0, 1, 1], [1, 0, 1]]}', '-1', TRUE, 2),
(994, '{"grid": [[0, 2]]}', '0', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    240,
    '搜索二维矩阵 II',
    'search-a-2d-matrix-ii',
    'MEDIUM',
    '# 240. 搜索二维矩阵 II

编写一个高效的算法来搜索 `m x n` 矩阵 `matrix` 中的一个目标值 `target` 。该矩阵具有以下特性：

	
- 每行的元素从左到右升序排列。
	
- 每列的元素从上到下升序排列。

 

示例 1：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
输出：true

示例 2：

输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
输出：false

 

**提示：**

	
- `m == matrix.length`
	
- `n == matrix[i].length`
	
- `1 <= n, m <= 300`
	
- `-109 <= matrix[i][j] <= 109`
	
- 每行的所有元素从左到右升序排列
	
- 每列的所有元素从上到下升序排列
	
- `-109 <= target <= 109`',
    2000,
    256,
    '{"name": "searchMatrix", "params": [{"name": "matrix", "type": "integer[][]"}, {"name": "target", "type": "integer"}], "return": {"type": "boolean"}, "manual": true}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(240, 'JAVA', 'class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        
    }
}'),
(240, 'JAVASCRIPT', '/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
    
};'),
(240, 'PYTHON', 'class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        '),
(240, 'TYPESCRIPT', 'function searchMatrix(matrix: number[][], target: number): boolean {

};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(240, '{"matrix": [[1, 4, 7, 11, 15], [2, 5, 8, 12, 19], [3, 6, 9, 16, 22], [10, 13, 14, 17, 24], [18, 21, 23, 26, 30]], "target": 5}', 'true', TRUE, 1);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    74,
    '搜索二维矩阵',
    'search-a-2d-matrix',
    'MEDIUM',
    '# 74. 搜索二维矩阵

给你一个满足下述两条属性的 `m x n` 整数矩阵：

	
- 每行中的整数从左到右按非严格递增顺序排列。
	
- 每行的第一个整数大于前一行的最后一个整数。

给你一个整数 `target` ，如果 `target` 在矩阵中，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

**输入：**matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
**输出：**true

**示例 2：**

**输入：**matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
**输出：**false

 

**提示：**

	
- `m == matrix.length`
	
- `n == matrix[i].length`
	
- `1 <= m, n <= 100`
	
- `-104 <= matrix[i][j], target <= 104`',
    2000,
    256,
    '{"name": "searchMatrix", "params": [{"name": "matrix", "type": "integer[][]"}, {"name": "target", "type": "integer"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(74, 'JAVA', 'class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        
    }
}'),
(74, 'JAVASCRIPT', '/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
    
};'),
(74, 'PYTHON', 'class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        '),
(74, 'TYPESCRIPT', 'function searchMatrix(matrix: number[][], target: number): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(74, '{"matrix": [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], "target": 3}', 'true', TRUE, 1),
(74, '{"matrix": [[1, 3, 5, 7], [10, 11, 16, 20], [23, 30, 34, 60]], "target": 13}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    33,
    '搜索旋转排序数组',
    'search-in-rotated-sorted-array',
    'MEDIUM',
    '# 33. 搜索旋转排序数组

整数数组 `nums` 按升序排列，数组中的值 **互不相同** 。

在传递给函数之前，`nums` 在预先未知的某个下标 `k`（`0 <= k < nums.length`）上进行了 **向左旋转**，使数组变为 `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]`（下标 **从 0 开始** 计数）。例如， `[0,1,2,4,5,6,7]` 下标 `3` 上向左旋转后可能变为 `[4,5,6,7,0,1,2]` 。

给你 **旋转后** 的数组 `nums` 和一个整数 `target` ，如果 `nums` 中存在这个目标值 `target` ，则返回它的下标，否则返回 `-1` 。

你必须设计一个时间复杂度为 `O(log n)` 的算法解决此问题。

 

**示例 1：**

**输入：**nums = [4,5,6,7,0,1,2], target = 0
**输出：**4

**示例 2：**

**输入：**nums = [4,5,6,7,0,1,2], target = 3
**输出：**-1

**示例 3：**

**输入：**nums = [1], target = 0
**输出：**-1

 

**提示：**

	
- `1 <= nums.length <= 5000`
	
- `-104 <= nums[i] <= 104`
	
- `nums` 中的每个值都 **独一无二**
	
- 题目数据保证 `nums` 在预先未知的某个下标上进行了旋转
	
- `-104 <= target <= 104`',
    2000,
    256,
    '{"name": "search", "params": [{"name": "nums", "type": "integer[]"}, {"name": "target", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(33, 'JAVA', 'class Solution {
    public int search(int[] nums, int target) {
        
    }
}'),
(33, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function(nums, target) {
    
};'),
(33, 'PYTHON', 'class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        '),
(33, 'TYPESCRIPT', 'function search(nums: number[], target: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(33, '{"nums": [4, 5, 6, 7, 0, 1, 2], "target": 0}', '4', TRUE, 1),
(33, '{"nums": [4, 5, 6, 7, 0, 1, 2], "target": 3}', '-1', TRUE, 2),
(33, '{"nums": [1], "target": 0}', '-1', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    35,
    '搜索插入位置',
    'search-insert-position',
    'EASY',
    '# 35. 搜索插入位置

给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

请必须使用时间复杂度为 `O(log n)` 的算法。

 

**示例 1:**

**输入:** nums = [1,3,5,6], target = 5
**输出:** 2

**示例 2:**

**输入:** nums = [1,3,5,6], target = 2
**输出:** 1

**示例 3:**

**输入:** nums = [1,3,5,6], target = 7
**输出:** 4

 

**提示:**

	
- `1 <= nums.length <= 104`
	
- `-104 <= nums[i] <= 104`
	
- `nums` 为 **无重复元素 **的 **升序 **排列数组
	
- `-104 <= target <= 104`',
    2000,
    256,
    '{"name": "searchInsert", "params": [{"name": "nums", "type": "integer[]"}, {"name": "target", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(35, 'JAVA', 'class Solution {
    public int searchInsert(int[] nums, int target) {
        
    }
}'),
(35, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function(nums, target) {
    
};'),
(35, 'PYTHON', 'class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        '),
(35, 'TYPESCRIPT', 'function searchInsert(nums: number[], target: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(35, '{"nums": [1, 3, 5, 6], "target": 5}', '2', TRUE, 1),
(35, '{"nums": [1, 3, 5, 6], "target": 2}', '1', TRUE, 2),
(35, '{"nums": [1, 3, 5, 6], "target": 7}', '4', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    73,
    '矩阵置零',
    'set-matrix-zeroes',
    'MEDIUM',
    '# 73. 矩阵置零

给定一个 `m x n` 的矩阵，如果一个元素为 **0 **，则将其所在行和列的所有元素都设为 **0** 。请使用 **原地** 算法**。**

 

**示例 1：**

**输入：**matrix = [[1,1,1],[1,0,1],[1,1,1]]
**输出：**[[1,0,1],[0,0,0],[1,0,1]]

**示例 2：**

**输入：**matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
**输出：**[[0,0,0,0],[0,4,5,0],[0,3,1,0]]

 

**提示：**

	
- `m == matrix.length`
	
- `n == matrix[0].length`
	
- `1 <= m, n <= 200`
	
- `-231 <= matrix[i][j] <= 231 - 1`

 

**进阶：**

	
- 一个直观的解决方案是使用  `O(mn)` 的额外空间，但这并不是一个好的解决方案。
	
- 一个简单的改进方案是使用 `O(m + n)` 的额外空间，但这仍然不是最好的解决方案。
	
- 你能想出一个仅使用常量空间的解决方案吗？',
    2000,
    256,
    '{"name": "setZeroes", "params": [{"name": "matrix", "type": "integer[][]"}], "return": {"type": "void"}, "output": {"paramindex": 0}, "manual": false}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(73, 'JAVA', 'class Solution {
    public void setZeroes(int[][] matrix) {
        
    }
}'),
(73, 'JAVASCRIPT', '/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var setZeroes = function(matrix) {
    
};'),
(73, 'PYTHON', 'class Solution(object):
    def setZeroes(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
        '),
(73, 'TYPESCRIPT', '/**
 Do not return anything, modify matrix in-place instead.
 */
function setZeroes(matrix: number[][]): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(73, '{"matrix": [[1, 1, 1], [1, 0, 1], [1, 1, 1]]}', '[[1, 0, 1], [0, 0, 0], [1, 0, 1]]', TRUE, 1),
(73, '{"matrix": [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]}', '[[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    136,
    '只出现一次的数字',
    'single-number',
    'EASY',
    '# 136. 只出现一次的数字

给你一个 **非空** 整数数组 `nums` ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

 

**示例 1 ：**

**输入：**nums = [2,2,1]

**输出：**1

**示例 2 ：**

**输入：**nums = [4,1,2,1,2]

**输出：**4

**示例 3 ：**

**输入：**nums = [1]

**输出：**1

 

**提示：**

	
- `1 <= nums.length <= 3 * 104`
	
- `-3 * 104 <= nums[i] <= 3 * 104`
	
- 除了某个元素只出现一次以外，其余每个元素均出现两次。',
    2000,
    256,
    '{"name": "singleNumber", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(136, 'JAVA', 'class Solution {
    public int singleNumber(int[] nums) {
        
    }
}'),
(136, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
    
};'),
(136, 'PYTHON', 'class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        '),
(136, 'TYPESCRIPT', 'function singleNumber(nums: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(136, '{"nums": [2, 2, 1]}', '1', TRUE, 1),
(136, '{"nums": [4, 1, 2, 1, 2]}', '4', TRUE, 2),
(136, '{"nums": [1]}', '1', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    239,
    '滑动窗口最大值',
    'sliding-window-maximum',
    'HARD',
    '# 239. 滑动窗口最大值

给你一个整数数组 `nums`，有一个大小为 `k` 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 `k` 个数字。滑动窗口每次只向右移动一位。

返回 滑动窗口中的最大值 。

 

**示例 1：**

输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
输出：[3,3,5,5,6,7]
解释：
滑动窗口的位置                最大值
---------------               -----
[1  3  -1] -3  5  3  6  7       **3**
 1 [3  -1  -3] 5  3  6  7       **3**
 1  3 [-1  -3  5] 3  6  7      ** 5**
 1  3  -1 [-3  5  3] 6  7       **5**
 1  3  -1  -3 [5  3  6] 7       **6**
 1  3  -1  -3  5 [3  6  7]      **7**

**示例 2：**

输入：nums = [1], k = 1
输出：[1]

 

提示：

	
- `1 <= nums.length <= 105`
	
- `-104 <= nums[i] <= 104`
	
- `1 <= k <= nums.length`',
    2000,
    256,
    '{"name": "maxSlidingWindow", "params": [{"name": "nums", "type": "integer[]"}, {"name": "k", "type": "integer"}], "return": {"type": "integer[]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(239, 'JAVA', 'class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        
    }
}'),
(239, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function(nums, k) {
    
};'),
(239, 'PYTHON', 'class Solution(object):
    def maxSlidingWindow(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """
        '),
(239, 'TYPESCRIPT', 'function maxSlidingWindow(nums: number[], k: number): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(239, '{"nums": [1, 3, -1, -3, 5, 3, 6, 7], "k": 3}', '[3, 3, 5, 5, 6, 7]', TRUE, 1),
(239, '{"nums": [1], "k": 1}', '[1]

 

提示：

	
- `1 <= nums.length <= 105`
	
- `-104 <= nums[i] <= 104`
	
- `1 <= k <= nums.length`', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    75,
    '颜色分类',
    'sort-colors',
    'MEDIUM',
    '# 75. 颜色分类

给定一个包含红色、白色和蓝色、共 `n` 个元素的数组 `nums` ，**原地 **对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

我们使用整数 `0`、 `1` 和 `2` 分别表示红色、白色和蓝色。

必须在不使用库内置的 sort 函数的情况下解决这个问题。

 

**示例 1：**

**输入：**nums = [2,0,2,1,1,0]
**输出：**[0,0,1,1,2,2]

**示例 2：**

**输入：**nums = [2,0,1]
**输出：**[0,1,2]

 

**提示：**

	
- `n == nums.length`
	
- `1 <= n <= 300`
	
- `nums[i]` 为 `0`、`1` 或 `2`

 

**进阶：**

	
- 你能想出一个仅使用常数空间的一趟扫描算法吗？',
    2000,
    256,
    '{"name": "sortColors", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "void"}, "output": {"paramindex": 0}, "manual": false}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(75, 'JAVA', 'class Solution {
    public void sortColors(int[] nums) {
        
    }
}'),
(75, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function(nums) {
    
};'),
(75, 'PYTHON', 'class Solution(object):
    def sortColors(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        '),
(75, 'TYPESCRIPT', '/**
 Do not return anything, modify nums in-place instead.
 */
function sortColors(nums: number[]): void {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(75, '{"nums": [2, 0, 2, 1, 1, 0]}', '[0, 0, 1, 1, 2, 2]', TRUE, 1),
(75, '{"nums": [2, 0, 1]}', '[0, 1, 2]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    148,
    '排序链表',
    'sort-list',
    'MEDIUM',
    '# 148. 排序链表

给你链表的头结点 `head` ，请将其按 **升序** 排列并返回 **排序后的链表** 。

 

**示例 1：**

输入：head = [4,2,1,3]
输出：[1,2,3,4]

**示例 2：**

输入：head = [-1,5,3,4,0]
输出：[-1,0,3,4,5]

**示例 3：**

输入：head = []
输出：[]

 

提示：

	
- 链表中节点的数目在范围 `[0, 5 * 104]` 内
	
- `-105 <= Node.val <= 105`

 

进阶：你可以在 `O(n log n)` 时间复杂度和常数级空间复杂度下，对链表进行排序吗？',
    2000,
    256,
    '{"name": "sortList", "params": [{"name": "head", "type": "ListNode", "dealloc": false}], "return": {"type": "ListNode", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(148, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode sortList(ListNode head) {
        
    }
}'),
(148, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var sortList = function(head) {
    
};'),
(148, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def sortList(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        '),
(148, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function sortList(head: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(148, '{"head": [4, 2, 1, 3]}', '[1, 2, 3, 4]', TRUE, 1),
(148, '{"head": [-1, 5, 3, 4, 0]}', '[-1, 0, 3, 4, 5]', TRUE, 2),
(148, '{"head": []}', '[]

 

提示：

	
- 链表中节点的数目在范围 `[0, 5 * 104]` 内
	
- `-105 <= Node.val <= 105`

 

进阶：你可以在 `O(n log n)` 时间复杂度和常数级空间复杂度下，对链表进行排序吗？', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    54,
    '螺旋矩阵',
    'spiral-matrix',
    'MEDIUM',
    '# 54. 螺旋矩阵

给你一个 `m` 行 `n` 列的矩阵 `matrix` ，请按照 **顺时针螺旋顺序** ，返回矩阵中的所有元素。

 

**示例 1：**

**输入：**matrix = [[1,2,3],[4,5,6],[7,8,9]]
**输出：**[1,2,3,6,9,8,7,4,5]

**示例 2：**

**输入：**matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
**输出：**[1,2,3,4,8,12,11,10,9,5,6,7]

 

**提示：**

	
- `m == matrix.length`
	
- `n == matrix[i].length`
	
- `1',
    2000,
    256,
    '{"name": "spiralOrder", "params": [{"name": "matrix", "type": "integer[][]"}], "return": {"type": "list<integer>", "size": "size_1 * col_size_1", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(54, 'JAVA', 'class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        
    }
}'),
(54, 'JAVASCRIPT', '/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
var spiralOrder = function(matrix) {
    
};'),
(54, 'PYTHON', 'class Solution(object):
    def spiralOrder(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """
        '),
(54, 'TYPESCRIPT', 'function spiralOrder(matrix: number[][]): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(54, '{"matrix": [[1, 2, 3], [4, 5, 6], [7, 8, 9]]}', '[1, 2, 3, 6, 9, 8, 7, 4, 5]', TRUE, 1),
(54, '{"matrix": [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]}', '[1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    560,
    '和为 K 的子数组',
    'subarray-sum-equals-k',
    'MEDIUM',
    '# 560. 和为 K 的子数组

给你一个整数数组 `nums` 和一个整数 `k` ，请你统计并返回 该数组中和为 `k`** **的子数组的个数 。

子数组是数组中元素的连续非空序列。

 

**示例 1：**

**输入：**nums = [1,1,1], k = 2
**输出：**2

**示例 2：**

**输入：**nums = [1,2,3], k = 3
**输出：**2

 

**提示：**

	
- `1 <= nums.length <= 2 * 104`
	
- `-1000 <= nums[i] <= 1000`
	
- `-107 <= k <= 107`',
    2000,
    256,
    '{"name": "subarraySum", "params": [{"name": "nums", "type": "integer[]"}, {"name": "k", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(560, 'JAVA', 'class Solution {
    public int subarraySum(int[] nums, int k) {
        
    }
}'),
(560, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var subarraySum = function(nums, k) {
    
};'),
(560, 'PYTHON', 'class Solution(object):
    def subarraySum(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        '),
(560, 'TYPESCRIPT', 'function subarraySum(nums: number[], k: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(560, '{"nums": [1, 1, 1], "k": 2}', '2', TRUE, 1),
(560, '{"nums": [1, 2, 3], "k": 3}', '2', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    78,
    '子集',
    'subsets',
    'MEDIUM',
    '# 78. 子集

给你一个整数数组 `nums` ，数组中的元素 **互不相同** 。返回该数组所有可能的子集（幂集）。

解集 **不能** 包含重复的子集。你可以按 **任意顺序** 返回解集。

 

**示例 1：**

**输入：**nums = [1,2,3]
**输出：**[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

**示例 2：**

**输入：**nums = [0]
**输出：**[[],[0]]

 

**提示：**

	
- `1 <= nums.length <= 10`
	
- `-10 <= nums[i] <= 10`
	
- `nums` 中的所有元素 **互不相同**',
    2000,
    256,
    '{"name": "subsets", "params": [{"name": "nums", "type": "integer[]"}], "return": {"type": "list<list<integer>>", "dealloc": true}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(78, 'JAVA', 'class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        
    }
}'),
(78, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var subsets = function(nums) {
    
};'),
(78, 'PYTHON', 'class Solution(object):
    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        '),
(78, 'TYPESCRIPT', 'function subsets(nums: number[]): number[][] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(78, '{"nums": [1, 2, 3]}', '[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]', TRUE, 1),
(78, '{"nums": [0]}', '[[], [0]]', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    24,
    '两两交换链表中的节点',
    'swap-nodes-in-pairs',
    'MEDIUM',
    '# 24. 两两交换链表中的节点

给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。

 

**示例 1：**

**输入：**head = [1,2,3,4]
**输出：**[2,1,4,3]

**示例 2：**

**输入：**head = []
**输出：**[]

**示例 3：**

**输入：**head = [1]
**输出：**[1]

 

**提示：**

	
- 链表中节点的数目在范围 `[0, 100]` 内
	
- `0 <= Node.val <= 100`',
    2000,
    256,
    '{"name": "swapPairs", "params": [{"name": "head", "type": "ListNode"}], "return": {"type": "ListNode"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(24, 'JAVA', '/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode swapPairs(ListNode head) {
        
    }
}'),
(24, 'JAVASCRIPT', '/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var swapPairs = function(head) {
    
};'),
(24, 'PYTHON', '# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def swapPairs(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        '),
(24, 'TYPESCRIPT', '/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function swapPairs(head: ListNode | null): ListNode | null {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(24, '{"head": [1, 2, 3, 4]}', '[2, 1, 4, 3]', TRUE, 1),
(24, '{"head": []}', '[]', TRUE, 2),
(24, '{"head": [1]}', '[1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    101,
    '对称二叉树',
    'symmetric-tree',
    'EASY',
    '# 101. 对称二叉树

给你一个二叉树的根节点 `root` ， 检查它是否轴对称。

 

**示例 1：**

**输入：**root = [1,2,2,3,4,4,3]
**输出：**true

**示例 2：**

**输入：**root = [1,2,2,null,3,null,3]
**输出：**false

 

**提示：**

	
- 树中节点数目在范围 `[1, 1000]` 内
	
- `-100 <= Node.val <= 100`

 

**进阶：**你可以运用递归和迭代两种方法解决这个问题吗？',
    2000,
    256,
    '{"name": "isSymmetric", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(101, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public boolean isSymmetric(TreeNode root) {
        
    }
}'),
(101, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var isSymmetric = function(root) {
    
};'),
(101, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isSymmetric(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: bool
        """
        '),
(101, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function isSymmetric(root: TreeNode | null): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(101, '{"root": [1, 2, 2, 3, 4, 4, 3]}', 'true', TRUE, 1),
(101, '{"root": [1, 2, 2, null, 3, null, 3]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    347,
    '前 K 个高频元素',
    'top-k-frequent-elements',
    'MEDIUM',
    '# 347. 前 K 个高频元素

给你一个整数数组 `nums` 和一个整数 `k` ，请你返回其中出现频率前 `k` 高的元素。你可以按 **任意顺序** 返回答案。

 

**示例 1：**

输入：nums = [1,1,1,2,2,3], k = 2

**输出：**[1,2]

**示例 2：**

输入：nums = [1], k = 1

输出：[1]

**示例 3：**

输入：nums = [1,2,1,2,1,2,3,1,3,2], k = 2

**输出：**[1,2]

 

**提示：**

	
- `1 <= nums.length <= 105`
	
- `-104 <= nums[i] <= 104`
	
- `k` 的取值范围是 `[1, 数组中不相同的元素的个数]`
	
- 题目数据保证答案唯一，换句话说，数组中前 `k` 个高频元素的集合是唯一的

 

**进阶：**你所设计算法的时间复杂度 **必须** 优于 `O(n log n)` ，其中 `n` 是数组大小。',
    2000,
    256,
    '{"name": "topKFrequent", "params": [{"name": "nums", "type": "integer[]"}, {"name": "k", "type": "integer"}], "return": {"type": "integer[]"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(347, 'JAVA', 'class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        
    }
}'),
(347, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
    
};'),
(347, 'PYTHON', 'class Solution(object):
    def topKFrequent(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """
        '),
(347, 'TYPESCRIPT', 'function topKFrequent(nums: number[], k: number): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(347, '{"nums": [1, 1, 1, 2, 2, 3], "k": 2}', '', TRUE, 1),
(347, '{"nums": [1], "k": 1}', '[1]', TRUE, 2),
(347, '{"nums": [1, 2, 1, 2, 1, 2, 3, 1, 3, 2], "k": 2}', '', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    42,
    '接雨水',
    'trapping-rain-water',
    'HARD',
    '# 42. 接雨水

给定 `n` 个非负整数表示每个宽度为 `1` 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

 

**示例 1：**

**输入：**height = [0,1,0,2,1,0,1,3,2,1,2,1]
**输出：**6
**解释：**上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 

**示例 2：**

**输入：**height = [4,2,0,3,2,5]
**输出：**9

 

**提示：**

	
- `n == height.length`
	
- `1 <= n <= 2 * 104`
	
- `0 <= height[i] <= 105`',
    2000,
    256,
    '{"name": "trap", "params": [{"name": "height", "type": "integer[]"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(42, 'JAVA', 'class Solution {
    public int trap(int[] height) {
        
    }
}'),
(42, 'JAVASCRIPT', '/**
 * @param {number[]} height
 * @return {number}
 */
var trap = function(height) {
    
};'),
(42, 'PYTHON', 'class Solution(object):
    def trap(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        '),
(42, 'TYPESCRIPT', 'function trap(height: number[]): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(42, '{"height": [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]}', '6', TRUE, 1),
(42, '{"height": [4, 2, 0, 3, 2, 5]}', '9', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    1,
    '两数之和',
    'two-sum',
    'EASY',
    '# 1. 两数之和

给定一个整数数组 `nums` 和一个整数目标值 `target`，请你在该数组中找出 **和为目标值 **`target`  的那 **两个** 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。

你可以按任意顺序返回答案。

 

**示例 1：**

**输入：**nums = [2,7,11,15], target = 9
**输出：**[0,1]
**解释：**因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

**示例 2：**

**输入：**nums = [3,2,4], target = 6
**输出：**[1,2]

**示例 3：**

**输入：**nums = [3,3], target = 6
**输出：**[0,1]

 

**提示：**

	
- `2 <= nums.length <= 104`
	
- `-109 <= nums[i] <= 109`
	
- `-109 <= target <= 109`
	
- **只会存在一个有效答案**

 

**进阶：**你可以想出一个时间复杂度小于 `O(n2)` 的算法吗？',
    2000,
    256,
    '{"name": "twoSum", "params": [{"name": "nums", "type": "integer[]"}, {"name": "target", "type": "integer"}], "return": {"type": "integer[]", "size": 2}, "manual": false}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(1, 'JAVA', 'class Solution {
    public int[] twoSum(int[] nums, int target) {
        
    }
}'),
(1, 'JAVASCRIPT', '/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    
};'),
(1, 'PYTHON', 'class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        '),
(1, 'TYPESCRIPT', 'function twoSum(nums: number[], target: number): number[] {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(1, '{"nums": [2, 7, 11, 15], "target": 9}', '[0, 1]', TRUE, 1),
(1, '{"nums": [3, 2, 4], "target": 6}', '[1, 2]', TRUE, 2),
(1, '{"nums": [3, 3], "target": 6}', '[0, 1]', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    62,
    '不同路径',
    'unique-paths',
    'MEDIUM',
    '# 62. 不同路径

一个机器人位于一个 `m x n` 网格的左上角 （起始点在下图中标记为 “Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

问总共有多少条不同的路径？

 

**示例 1：**

**输入：**m = 3, n = 7
**输出：**28

**示例 2：**

**输入：**m = 3, n = 2
**输出：**3
**解释：**
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下

**示例 3：**

**输入：**m = 7, n = 3
**输出：**28

**示例 4：**

**输入：**m = 3, n = 3
**输出：**6

 

**提示：**

	
- `1 <= m, n <= 100`
	
- 题目数据保证答案小于等于 `2 * 109`',
    2000,
    256,
    '{"name": "uniquePaths", "params": [{"name": "m", "type": "integer"}, {"name": "n", "type": "integer"}], "return": {"type": "integer"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(62, 'JAVA', 'class Solution {
    public int uniquePaths(int m, int n) {
        
    }
}'),
(62, 'JAVASCRIPT', '/**
 * @param {number} m
 * @param {number} n
 * @return {number}
 */
var uniquePaths = function(m, n) {
    
};'),
(62, 'PYTHON', 'class Solution(object):
    def uniquePaths(self, m, n):
        """
        :type m: int
        :type n: int
        :rtype: int
        """
        '),
(62, 'TYPESCRIPT', 'function uniquePaths(m: number, n: number): number {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(62, '{"m": 3, "n": 7}', '28', TRUE, 1),
(62, '{"m": 3, "n": 2}', '3', TRUE, 2),
(62, '{"m": 7, "n": 3}', '28', TRUE, 3),
(62, '{"m": 3, "n": 3}', '6', TRUE, 4);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    20,
    '有效的括号',
    'valid-parentheses',
    'EASY',
    '# 20. 有效的括号

给定一个只包括 `''(''`，`'')''`，`''{''`，`''}''`，`''[''`，`'']''` 的字符串 `s` ，判断字符串是否有效。

有效字符串需满足：

	
- 左括号必须用相同类型的右括号闭合。
	
- 左括号必须以正确的顺序闭合。
	
- 每个右括号都有一个对应的相同类型的左括号。

 

**示例 1：**

输入：s = "()"

输出：true

**示例 2：**

输入：s = "()[]{}"

输出：true

**示例 3：**

输入：s = "(]"

输出：false

**示例 4：**

输入：s = "([])"

输出：true

**示例 5：**

输入：s = "([)]"

输出：false

 

**提示：**

	
- `1 <= s.length <= 104`
	
- `s` 仅由括号 `''()[]{}''` 组成',
    2000,
    256,
    '{"name": "isValid", "params": [{"name": "s", "type": "string"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(20, 'JAVA', 'class Solution {
    public boolean isValid(String s) {
        
    }
}'),
(20, 'JAVASCRIPT', '/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
    
};'),
(20, 'PYTHON', 'class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        '),
(20, 'TYPESCRIPT', 'function isValid(s: string): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(20, '{"s": "()"}', 'true', TRUE, 1),
(20, '{"s": "()[]{}"}', 'true', TRUE, 2),
(20, '{"s": "(]"}', 'false', TRUE, 3),
(20, '{"s": "([])"}', 'true', TRUE, 4),
(20, '{"s": "([)]"}', 'false', TRUE, 5);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    98,
    '验证二叉搜索树',
    'validate-binary-search-tree',
    'MEDIUM',
    '# 98. 验证二叉搜索树

给你一个二叉树的根节点 `root` ，判断其是否是一个有效的二叉搜索树。

**有效** 二叉搜索树定义如下：

	
- 节点的左子树只包含** 严格小于 **当前节点的数。
	
- 节点的右子树只包含 **严格大于** 当前节点的数。
	
- 所有左子树和右子树自身必须也是二叉搜索树。

 

**示例 1：**

**输入：**root = [2,1,3]
**输出：**true

**示例 2：**

**输入：**root = [5,1,4,null,null,3,6]
**输出：**false
**解释：**根节点的值是 5 ，但是右子节点的值是 4 。

 

**提示：**

	
- 树中节点数目范围在`[1, 104]` 内
	
- `-231 <= Node.val <= 231 - 1`',
    2000,
    256,
    '{"name": "isValidBST", "params": [{"name": "root", "type": "TreeNode"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(98, 'JAVA', '/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public boolean isValidBST(TreeNode root) {
        
    }
}'),
(98, 'JAVASCRIPT', '/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var isValidBST = function(root) {
    
};'),
(98, 'PYTHON', '# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: bool
        """
        '),
(98, 'TYPESCRIPT', '/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function isValidBST(root: TreeNode | null): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(98, '{"root": [2, 1, 3]}', 'true', TRUE, 1),
(98, '{"root": [5, 1, 4, null, null, 3, 6]}', 'false', TRUE, 2);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    139,
    '单词拆分',
    'word-break',
    'MEDIUM',
    '# 139. 单词拆分

给你一个字符串 `s` 和一个字符串列表 `wordDict` 作为字典。如果可以利用字典中出现的一个或多个单词拼接出 `s` 则返回 `true`。

**注意：**不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。

 

**示例 1：**

**输入:** s = "leetcode", wordDict = ["leet", "code"]
**输出:** true
**解释:** 返回 true 因为 "leetcode" 可以由 "leet" 和 "code" 拼接成。

**示例 2：**

**输入:** s = "applepenapple", wordDict = ["apple", "pen"]
**输出:** true
**解释:** 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
     注意，你可以重复使用字典中的单词。

**示例 3：**

**输入:** s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
**输出:** false

 

**提示：**

	
- `1 <= s.length <= 300`
	
- `1 <= wordDict.length <= 1000`
	
- `1 <= wordDict[i].length <= 20`
	
- `s` 和 `wordDict[i]` 仅由小写英文字母组成
	
- `wordDict` 中的所有字符串 **互不相同**',
    2000,
    256,
    '{"name": "wordBreak", "params": [{"name": "s", "type": "string"}, {"name": "wordDict", "type": "list<string>"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(139, 'JAVA', 'class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        
    }
}'),
(139, 'JAVASCRIPT', '/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */
var wordBreak = function(s, wordDict) {
    
};'),
(139, 'PYTHON', 'class Solution(object):
    def wordBreak(self, s, wordDict):
        """
        :type s: str
        :type wordDict: List[str]
        :rtype: bool
        """
        '),
(139, 'TYPESCRIPT', 'function wordBreak(s: string, wordDict: string[]): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(139, '{"s": "leetcode", "wordDict": ["leet", "code"]}', 'true', TRUE, 1),
(139, '{"s": "applepenapple", "wordDict": ["apple", "pen"]}', 'true', TRUE, 2),
(139, '{"s": "catsandog", "wordDict": ["cats", "dog", "sand", "and", "cat"]}', 'false', TRUE, 3);

INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb, meta_data)
VALUES (
    79,
    '单词搜索',
    'word-search',
    'MEDIUM',
    '# 79. 单词搜索

给定一个 `m x n` 二维字符网格 `board` 和一个字符串单词 `word` 。如果 `word` 存在于网格中，返回 `true` ；否则，返回 `false` 。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

 

**示例 1：**

**输入：**board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "ABCCED"
**输出：**true

**示例 2：**

**输入：**board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "SEE"
**输出：**true

**示例 3：**

**输入：**board = [[''A'',''B'',''C'',''E''],[''S'',''F'',''C'',''S''],[''A'',''D'',''E'',''E'']], word = "ABCB"
**输出：**false

 

**提示：**

	
- `m == board.length`
	
- `n = board[i].length`
	
- `1 <= m, n <= 6`
	
- `1 <= word.length <= 15`
	
- `board` 和 `word` 仅由大小写英文字母组成

 

**进阶：**你可以使用搜索剪枝的技术来优化解决方案，使其在 `board` 更大的情况下可以更快解决问题？',
    2000,
    256,
    '{"name": "exist", "params": [{"name": "board", "type": "character[][]"}, {"name": "word", "type": "string"}], "return": {"type": "boolean"}}'
);

INSERT IGNORE INTO problem_template (problem_id, language, template_code) VALUES
(79, 'JAVA', 'class Solution {
    public boolean exist(char[][] board, String word) {
        
    }
}'),
(79, 'JAVASCRIPT', '/**
 * @param {character[][]} board
 * @param {string} word
 * @return {boolean}
 */
var exist = function(board, word) {
    
};'),
(79, 'PYTHON', 'class Solution(object):
    def exist(self, board, word):
        """
        :type board: List[List[str]]
        :type word: str
        :rtype: bool
        """
        '),
(79, 'TYPESCRIPT', 'function exist(board: string[][], word: string): boolean {
    
};');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(79, '{"board": [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "word": "ABCCED"}', 'true', TRUE, 1),
(79, '{"board": [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "word": "SEE"}', 'true', TRUE, 2),
(79, '{"board": [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "word": "ABCB"}', 'false', TRUE, 3);

