INSERT IGNORE INTO problem (id, title, slug, difficulty, description_md, time_limit_ms, memory_limit_mb)
VALUES (
    122,
    '买卖股票的最佳时机 II',
    'best-time-to-buy-and-sell-stock-ii',
    'MEDIUM',
    '# 122. 买卖股票的最佳时机 II

给你一个整数数组 `prices` ，其中 `prices[i]` 表示某支股票第 `i` 天的价格。

在每一天，你可以决定是否购买和/或出售股票。你在任何时候 **最多** 只能持有 **一股** 股票。你也可以先购买，然后在 **同一天** 出售。

返回你能获得的 **最大** 利润。

## 示例 1

**输入：** prices = [7,1,5,3,6,4]

**输出：** 7

**解释：** 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3。总利润为 4 + 3 = 7。

## 示例 2

**输入：** prices = [1,2,3,4,5]

**输出：** 4

**解释：** 在第 1 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。总利润为 4。

## 示例 3

**输入：** prices = [7,6,4,3,1]

**输出：** 0

**解释：** 在这种情况下, 交易无法完成, 因为没有利润可赚。

## 提示

- `1 <= prices.length <= 3 * 10^4`
- `0 <= prices[i] <= 10^4`
',
    2000,
    256
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
(122, 'PYTHON', 'class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        pass'),
(122, 'TYPESCRIPT', 'function maxProfit(prices: number[]): number {
    
}');

INSERT IGNORE INTO test_case (problem_id, input, expected_output, is_sample, sort_order) VALUES
(122, '[7,1,5,3,6,4]', '7', TRUE, 1),
(122, '[1,2,3,4,5]', '4', TRUE, 2),
(122, '[7,6,4,3,1]', '0', TRUE, 3),
(122, '[2,4,1]', '2', FALSE, 4),
(122, '[3,2,6,5,0,3]', '7', FALSE, 5);
