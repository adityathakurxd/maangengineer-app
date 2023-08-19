import 'package:maangengineer/models/learn_model.dart';

List<LearnModel> LearnTopicsList = [
  LearnModel(topicName: 'Arrays', topicDesc: "Arrays are the best", questions: [
    Questions(
        codeSample: '''
def max_stock_profit(prices):
    if len(prices) < 2:
        return 0
    
    minPrice = prices[0]
    maxProfit = 0
    
    for price in prices:
        maxProfit = max(maxProfit, price - minPrice)
        minPrice = min(minPrice, price)
    
    return maxProfit
      ''',
        topic: 'Maximize Stock Profit',
        story:
            "You're working at WealthEdge, a stock trading firm. You have a list of daily stock prices for a particular stock. Your task is to find the maximum profit that can be achieved by buying and selling the stock only once.",
        solution:
            "Iterate through the array of stock prices while maintaining two variables: minPrice to track the minimum stock price encountered so far, and maxProfit to track the maximum profit achievable. Update maxProfit whenever a higher profit is calculated."),
    Questions(
        codeSample: '''
def has_pair_with_sum(expenses, target):
    num_set = set()
    
    for expense in expenses:
        if target - expense in num_set:
            return True
        num_set.add(expense)
    
    return False

      ''',
        topic: "Pair Sum",
        story:
            "You're a developer at Spendwise, a budget management app. Users input their expenses, and you need to determine if any two expenses add up to a specific target value.",
        solution:
            "Use a hash set to keep track of visited numbers. For each number, check if the difference between the target and the current number exists in the hash set."),
    Questions(
        codeSample: '''
def find_missing_number(nums):
    n = len(nums) + 1
    total_sum = (n * (n + 1)) // 2
    actual_sum = sum(nums)
    
    return total_sum - actual_sum

      ''',
        topic: "Missing Number",
        story:
            "DataCheck ensures data integrity by validating uploaded files. You're tasked with finding a missing number in a range of consecutive integers.",
        solution:
            "Calculate the sum of all integers from 1 to n using the arithmetic sum formula. Subtract the sum of given numbers from the calculated sum to find the missing number."),
    Questions(
        codeSample: '''
def rotate_array(nums, k):
    n = len(nums)
    k = k % n
    rotated = [0] * n
    
    for i in range(n):
        rotated[(i + k) % n] = nums[i]
    
    return rotated

      ''',
        topic: "Array Rotation",
        story:
            "You're developing TaskMinder, a task scheduling app. Users can rotate their task lists, shifting tasks forward by a given number of positions.",
        solution:
            "Use the modulus operator to avoid excessive rotations. Rotate the array by shifting each element to its new position using (i + k) % len(array)."),
    Questions(
        codeSample: '''
def majority_element(nums):
    candidate = None
    counter = 0
    
    for num in nums:
        if counter == 0:
            candidate = num
        counter += 1 if num == candidate else -1
    
    return candidate

      ''',
        topic: "Majority Element",
        story:
            "Opinix conducts surveys and needs to identify the majority opinion on a particular question. You're tasked with finding the element that appears more than half the time in an array.",
        solution:
            "Use Boyer-Moore Voting Algorithm. Maintain a counter and a candidate variable. Increase the counter if the current element matches the candidate, and decrease it otherwise. If the counter reaches 0, update the candidate to the current element.")
  ]),

  //Topic 2
  LearnModel(
      topicName: ' Linked List',
      topicDesc: " Linked List are the best",
      questions: [
        Questions(
            codeSample: '''
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverse_linked_list(head):
    prev = None
    current = head
    
    while current:
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
    
    return prev

      ''',
            topic: 'Reverse Linked List',
            story:
                "ReViewIt is developing a feature that allows users to reverse the order of paragraphs in their documents. You're tasked with implementing a function to reverse a linked list.",
            solution:
                "Iteratively reverse the linked list by maintaining three pointers: current, previous, and next_node."),
        Questions(
            codeSample: '''
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def has_cycle(head):
    if not head or not head.next:
        return False
    
    slow = head
    fast = head.next
    
    while slow != fast:
        if not fast or not fast.next:
            return False
        slow = slow.next
        fast = fast.next.next
    
    return True

      ''',
            topic: "Detect Cycle in Linked List",
            story:
                "FitLife is developing a wearable device to monitor users' health. You're responsible for detecting any irregularities in the recorded data, represented as a linked list.",
            solution:
                "Use Floyd's cycle-finding algorithm with two pointers, a slow one that moves one step at a time, and a fast one that moves two steps at a time. If the pointers meet, there's a cycle."),
        Questions(
            codeSample: '''
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def find_middle(head):
    slow = head
    fast = head
    
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
    
    return slow

      ''',
            topic: "Middle of Linked List",
            story:
                "SurveyEase wants to present users with engaging surveys. To minimize survey fatigue, they need to display only the middle question for a more streamlined experience.",
            solution:
                "Use two pointers, one moving one step at a time and the other moving two steps at a time. When the fast pointer reaches the end, the slow pointer will be at the middle."),
        Questions(
            codeSample: '''
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def remove_nth_from_end(head, n):
    dummy = ListNode(0)
    dummy.next = head
    first = dummy
    second = dummy
    
    for i in range(n + 1):
        first = first.next
    
    while first:
        first = first.next
        second = second.next
    
    second.next = second.next.next
    
    return dummy.next


      ''',
            topic: "Remove Nth Node From End",
            story:
                "InboxClean aims to declutter users' email inboxes. You're tasked with creating a feature that allows users to remove the nth email from the end of their inbox.",
            solution:
                "Use two pointers with a gap of n nodes between them. Traverse the linked list until the first pointer reaches the end. The second pointer will be pointing to the nth node from the end."),
        Questions(
            codeSample: '''
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def merge_sorted_lists(l1, l2):
    dummy = ListNode(0)
    current = dummy
    
    while l1 and l2:
        if l1.val < l2.val:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
    
    if l1:
        current.next = l1
    if l2:
        current.next = l2
    
    return dummy.next


      ''',
            topic: "Merge Two Sorted Linked Lists",
            story:
                "ContactSync wants to merge contact lists from different devices while keeping them sorted. You're tasked with merging two sorted linked lists into a single sorted list.",
            solution:
                "Use a dummy node and two pointers to traverse both linked lists. Compare the values of the nodes at the current positions and attach the smaller node to the merged list.")
      ]),
];
