package com.mockleetcode.judge.harness;

public final class JsonRuntimeTemplate {

    public static final String CLASSPATH_ENTRY = "/opt/gson.jar";

    private static final String SOURCE = """
            import com.google.gson.*;
            import java.nio.file.*;
            import java.util.*;

            public class JsonRuntime {
                private static final Gson GSON = new Gson();

                public static JsonObject readInput() throws Exception {
                    String json = Files.readString(Path.of("input.json"));
                    return JsonParser.parseString(json).getAsJsonObject();
                }

                public static JsonElement getParam(JsonObject input, String paramName, int totalParams) {
                    if (input.has(paramName)) {
                        return input.get(paramName);
                    }
                    if (totalParams == 1 && input.has("input")) {
                        return input.get("input");
                    }
                    throw new IllegalArgumentException("Missing param: " + paramName);
                }

                public static int asInt(JsonObject input, String paramName, int totalParams) {
                    return getParam(input, paramName, totalParams).getAsInt();
                }

                public static int[] asIntArray(JsonObject input, String paramName, int totalParams) {
                    return jsonArrayToIntArray(getParam(input, paramName, totalParams).getAsJsonArray());
                }

                public static String asString(JsonObject input, String paramName, int totalParams) {
                    JsonElement value = getParam(input, paramName, totalParams);
                    if (value.isJsonNull()) {
                        return null;
                    }
                    return value.getAsString();
                }

                public static boolean asBoolean(JsonObject input, String paramName, int totalParams) {
                    return getParam(input, paramName, totalParams).getAsBoolean();
                }

                public static int[][] asIntMatrix(JsonObject input, String paramName, int totalParams) {
                    JsonArray rows = getParam(input, paramName, totalParams).getAsJsonArray();
                    int[][] result = new int[rows.size()][];
                    for (int i = 0; i < rows.size(); i++) {
                        JsonArray row = rows.get(i).getAsJsonArray();
                        result[i] = new int[row.size()];
                        for (int j = 0; j < row.size(); j++) {
                            result[i][j] = row.get(j).getAsInt();
                        }
                    }
                    return result;
                }

                public static ListNode asListNode(JsonObject input, String paramName, int totalParams) {
                    JsonElement value = getParam(input, paramName, totalParams);
                    if (value.isJsonNull()) {
                        return null;
                    }
                    return arrayToListNode(jsonArrayToIntArray(value.getAsJsonArray()));
                }

                public static ListNode asListNodeWithCycle(JsonObject input, String headKey, String posKey) {
                    JsonElement value = getParam(input, headKey, 1);
                    if (value.isJsonNull()) {
                        return null;
                    }
                    int[] values = jsonArrayToIntArray(value.getAsJsonArray());
                    ListNode head = arrayToListNode(values);
                    if (head == null || !input.has(posKey)) {
                        return head;
                    }
                    int pos = input.get(posKey).getAsInt();
                    if (pos < 0) {
                        return head;
                    }
                    ListNode tail = head;
                    ListNode cycleEntry = head;
                    for (int i = 0; i < values.length - 1; i++) {
                        tail = tail.next;
                    }
                    for (int i = 0; i < pos; i++) {
                        cycleEntry = cycleEntry.next;
                    }
                    tail.next = cycleEntry;
                    return head;
                }

                public static ListNode buildIntersectionHeadA(JsonObject input) {
                    return buildIntersection(input, true);
                }

                public static ListNode buildIntersectionHeadB(JsonObject input) {
                    return buildIntersection(input, false);
                }

                private static ListNode buildIntersection(JsonObject input, boolean headA) {
                    int intersectVal = input.get("intersectVal").getAsInt();
                    int[] listA = jsonArrayToIntArray(input.get("listA").getAsJsonArray());
                    int[] listB = jsonArrayToIntArray(input.get("listB").getAsJsonArray());
                    int skipA = input.get("skipA").getAsInt();
                    int skipB = input.get("skipB").getAsInt();
                    if (intersectVal == 0) {
                        return arrayToListNode(headA ? listA : listB);
                    }
                    ListNode prefix = arrayToListNode(headA ? slice(listA, 0, skipA) : slice(listB, 0, skipB));
                    ListNode shared = arrayToListNode(headA ? slice(listA, skipA, listA.length) : slice(listB, skipB, listB.length));
                    if (prefix == null) {
                        return shared;
                    }
                    ListNode tail = prefix;
                    while (tail.next != null) {
                        tail = tail.next;
                    }
                    tail.next = shared;
                    return prefix;
                }

                public static Node asRandomListNode(JsonObject input, String paramName, int totalParams) {
                    JsonArray nodes = getParam(input, paramName, totalParams).getAsJsonArray();
                    if (nodes.size() == 0) {
                        return null;
                    }
                    Node[] built = new Node[nodes.size()];
                    for (int i = 0; i < nodes.size(); i++) {
                        JsonArray pair = nodes.get(i).getAsJsonArray();
                        built[i] = new Node(pair.get(0).getAsInt());
                    }
                    for (int i = 0; i < nodes.size() - 1; i++) {
                        built[i].next = built[i + 1];
                    }
                    for (int i = 0; i < nodes.size(); i++) {
                        JsonElement randomIndex = nodes.get(i).getAsJsonArray().get(1);
                        if (!randomIndex.isJsonNull()) {
                            built[i].random = built[randomIndex.getAsInt()];
                        }
                    }
                    return built[0];
                }

                public static TreeNode asTreeNode(JsonObject input, String paramName, int totalParams) {
                    JsonElement value = getParam(input, paramName, totalParams);
                    if (value.isJsonNull()) {
                        return null;
                    }
                    return arrayToTreeNode(value.getAsJsonArray());
                }

                public static TreeNode findTreeNodeByVal(TreeNode root, int value) {
                    if (root == null) {
                        return null;
                    }
                    ArrayDeque<TreeNode> queue = new ArrayDeque<>();
                    queue.add(root);
                    while (!queue.isEmpty()) {
                        TreeNode node = queue.removeFirst();
                        if (node.val == value) {
                            return node;
                        }
                        if (node.left != null) {
                            queue.addLast(node.left);
                        }
                        if (node.right != null) {
                            queue.addLast(node.right);
                        }
                    }
                    return null;
                }

                public static String listNodeToJson(ListNode head) {
                    return GSON.toJson(listNodeToArray(head));
                }

                public static String listNodeRefToJson(ListNode node) {
                    return node == null ? "null" : String.valueOf(node.val);
                }

                public static String randomListToJson(Node head) {
                    if (head == null) {
                        return "[]";
                    }
                    ArrayList<Node> nodes = new ArrayList<>();
                    Map<Node, Integer> index = new IdentityHashMap<>();
                    Node current = head;
                    while (current != null) {
                        index.put(current, nodes.size());
                        nodes.add(current);
                        current = current.next;
                    }
                    JsonArray result = new JsonArray();
                    for (Node node : nodes) {
                        JsonArray pair = new JsonArray();
                        pair.add(node.val);
                        pair.add(node.random == null ? JsonNull.INSTANCE : new JsonPrimitive(index.get(node.random)));
                        result.add(pair);
                    }
                    return GSON.toJson(result);
                }

                public static String treeNodeToJson(TreeNode root) {
                    return GSON.toJson(treeNodeToArray(root));
                }

                public static String treeNodeRefToJson(TreeNode node) {
                    return node == null ? "null" : String.valueOf(node.val);
                }

                public static String toJson(Object value) {
                    return GSON.toJson(value);
                }

                private static ListNode arrayToListNode(int[] values) {
                    if (values == null || values.length == 0) {
                        return null;
                    }
                    ListNode head = new ListNode(values[0]);
                    ListNode current = head;
                    for (int i = 1; i < values.length; i++) {
                        current.next = new ListNode(values[i]);
                        current = current.next;
                    }
                    return head;
                }

                private static int[] listNodeToArray(ListNode head) {
                    ArrayList<Integer> values = new ArrayList<>();
                    while (head != null) {
                        values.add(head.val);
                        head = head.next;
                    }
                    int[] result = new int[values.size()];
                    for (int i = 0; i < values.size(); i++) {
                        result[i] = values.get(i);
                    }
                    return result;
                }

                private static TreeNode arrayToTreeNode(JsonArray array) {
                    if (array.size() == 0 || array.get(0).isJsonNull()) {
                        return null;
                    }
                    TreeNode root = new TreeNode(array.get(0).getAsInt());
                    ArrayDeque<TreeNode> queue = new ArrayDeque<>();
                    queue.add(root);
                    int index = 1;
                    while (!queue.isEmpty() && index < array.size()) {
                        TreeNode node = queue.removeFirst();
                        if (index < array.size() && !array.get(index).isJsonNull()) {
                            node.left = new TreeNode(array.get(index).getAsInt());
                            queue.addLast(node.left);
                        }
                        index++;
                        if (index < array.size() && !array.get(index).isJsonNull()) {
                            node.right = new TreeNode(array.get(index).getAsInt());
                            queue.addLast(node.right);
                        }
                        index++;
                    }
                    return root;
                }

                private static List<Integer> treeNodeToArray(TreeNode root) {
                    ArrayList<Integer> result = new ArrayList<>();
                    if (root == null) {
                        return result;
                    }
                    ArrayDeque<TreeNode> queue = new ArrayDeque<>();
                    queue.add(root);
                    while (!queue.isEmpty()) {
                        TreeNode node = queue.removeFirst();
                        if (node == null) {
                            result.add(null);
                            continue;
                        }
                        result.add(node.val);
                        queue.addLast(node.left);
                        queue.addLast(node.right);
                    }
                    while (!result.isEmpty() && result.get(result.size() - 1) == null) {
                        result.remove(result.size() - 1);
                    }
                    return result;
                }

                private static int[] jsonArrayToIntArray(JsonArray array) {
                    int[] result = new int[array.size()];
                    for (int i = 0; i < array.size(); i++) {
                        result[i] = array.get(i).getAsInt();
                    }
                    return result;
                }

                private static int[] slice(int[] values, int start, int end) {
                    int[] result = new int[end - start];
                    for (int i = start; i < end; i++) {
                        result[i - start] = values[i];
                    }
                    return result;
                }
            }
            """;

    private JsonRuntimeTemplate() {
    }

    public static String source() {
        return SOURCE;
    }
}
