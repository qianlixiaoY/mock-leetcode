package com.mockleetcode.judge.harness;

public final class NodeRuntimeTemplate {

    private static final String SOURCE = """
            class ListNode {
                constructor(val, next = null) {
                    this.val = val;
                    this.next = next;
                }
            }

            class TreeNode {
                constructor(val, left = null, right = null) {
                    this.val = val;
                    this.left = left;
                    this.right = right;
                }
            }

            class Node {
                constructor(val) {
                    this.val = val;
                    this.next = null;
                    this.random = null;
                }
            }

            function getParam(input, name, totalParams) {
                if (Object.prototype.hasOwnProperty.call(input, name)) {
                    return input[name];
                }
                if (totalParams === 1 && Object.prototype.hasOwnProperty.call(input, 'input')) {
                    return input.input;
                }
                throw new Error('Missing param: ' + name);
            }

            function arrayToListNode(values) {
                if (!values || values.length === 0) {
                    return null;
                }
                const head = new ListNode(values[0]);
                let current = head;
                for (let i = 1; i < values.length; i++) {
                    current.next = new ListNode(values[i]);
                    current = current.next;
                }
                return head;
            }

            function asListNode(input, name, totalParams) {
                const value = getParam(input, name, totalParams);
                if (value == null) {
                    return null;
                }
                return arrayToListNode(value);
            }

            function asListNodeWithCycle(input, headKey, posKey) {
                const values = getParam(input, headKey, 1);
                if (values == null) {
                    return null;
                }
                const head = arrayToListNode(values);
                if (!head || !Object.prototype.hasOwnProperty.call(input, posKey)) {
                    return head;
                }
                const pos = input[posKey];
                if (pos < 0) {
                    return head;
                }
                let tail = head;
                let cycleEntry = head;
                for (let i = 0; i < values.length - 1; i++) {
                    tail = tail.next;
                }
                for (let i = 0; i < pos; i++) {
                    cycleEntry = cycleEntry.next;
                }
                tail.next = cycleEntry;
                return head;
            }

            function buildIntersection(input, headA) {
                const intersectVal = input.intersectVal;
                const listA = input.listA;
                const listB = input.listB;
                const skipA = input.skipA;
                const skipB = input.skipB;
                if (intersectVal === 0) {
                    return arrayToListNode(headA ? listA : listB);
                }
                const prefixValues = headA ? listA.slice(0, skipA) : listB.slice(0, skipB);
                const sharedValues = headA ? listA.slice(skipA) : listB.slice(skipB);
                const prefix = arrayToListNode(prefixValues);
                const shared = arrayToListNode(sharedValues);
                if (!prefix) {
                    return shared;
                }
                let tail = prefix;
                while (tail.next) {
                    tail = tail.next;
                }
                tail.next = shared;
                return prefix;
            }

            function buildIntersectionHeadA(input) {
                return buildIntersection(input, true);
            }

            function buildIntersectionHeadB(input) {
                return buildIntersection(input, false);
            }

            function asRandomListNode(input, name, totalParams) {
                const nodes = getParam(input, name, totalParams);
                if (!nodes || nodes.length === 0) {
                    return null;
                }
                const built = nodes.map(pair => new Node(pair[0]));
                for (let i = 0; i < built.length - 1; i++) {
                    built[i].next = built[i + 1];
                }
                for (let i = 0; i < nodes.length; i++) {
                    const randomIndex = nodes[i][1];
                    if (randomIndex != null) {
                        built[i].random = built[randomIndex];
                    }
                }
                return built[0];
            }

            function arrayToTreeNode(array) {
                if (!array || array.length === 0 || array[0] == null) {
                    return null;
                }
                const root = new TreeNode(array[0]);
                const queue = [root];
                let index = 1;
                while (queue.length > 0 && index < array.length) {
                    const node = queue.shift();
                    if (index < array.length && array[index] != null) {
                        node.left = new TreeNode(array[index]);
                        queue.push(node.left);
                    }
                    index++;
                    if (index < array.length && array[index] != null) {
                        node.right = new TreeNode(array[index]);
                        queue.push(node.right);
                    }
                    index++;
                }
                return root;
            }

            function asTreeNode(input, name, totalParams) {
                const value = getParam(input, name, totalParams);
                if (value == null) {
                    return null;
                }
                return arrayToTreeNode(value);
            }

            function findTreeNodeByVal(root, value) {
                if (!root) {
                    return null;
                }
                const queue = [root];
                while (queue.length > 0) {
                    const node = queue.shift();
                    if (node.val === value) {
                        return node;
                    }
                    if (node.left) {
                        queue.push(node.left);
                    }
                    if (node.right) {
                        queue.push(node.right);
                    }
                }
                return null;
            }

            function listNodeToArray(head) {
                const values = [];
                while (head) {
                    values.push(head.val);
                    head = head.next;
                }
                return values;
            }

            function listNodeToJson(head) {
                return JSON.stringify(listNodeToArray(head));
            }

            function listNodeRefToJson(node) {
                return node == null ? 'null' : String(node.val);
            }

            function randomListToJson(head) {
                if (!head) {
                    return '[]';
                }
                const nodes = [];
                const index = new Map();
                let current = head;
                while (current) {
                    index.set(current, nodes.length);
                    nodes.push(current);
                    current = current.next;
                }
                return JSON.stringify(nodes.map(node => [
                    node.val,
                    node.random == null ? null : index.get(node.random)
                ]));
            }

            function treeNodeToArray(root) {
                if (!root) {
                    return [];
                }
                const result = [];
                const queue = [root];
                while (queue.length > 0) {
                    const node = queue.shift();
                    if (!node) {
                        result.push(null);
                        continue;
                    }
                    result.push(node.val);
                    queue.push(node.left);
                    queue.push(node.right);
                }
                while (result.length > 0 && result[result.length - 1] == null) {
                    result.pop();
                }
                return result;
            }

            function treeNodeToJson(root) {
                return JSON.stringify(treeNodeToArray(root));
            }

            function treeNodeRefToJson(node) {
                return node == null ? 'null' : String(node.val);
            }

            module.exports = {
                ListNode,
                TreeNode,
                Node,
                getParam,
                asListNode,
                asListNodeWithCycle,
                buildIntersectionHeadA,
                buildIntersectionHeadB,
                asRandomListNode,
                asTreeNode,
                findTreeNodeByVal,
                listNodeToJson,
                listNodeRefToJson,
                randomListToJson,
                treeNodeToJson,
                treeNodeRefToJson,
            };
            """;

    private NodeRuntimeTemplate() {
    }

    public static String source() {
        return SOURCE;
    }
}
