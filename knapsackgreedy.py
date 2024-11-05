class Item:
    def __init__(self, profit, weight):
        self.profit = profit
        self.weight = weight

def fractionalKnapsack(w, arr):
    # Sort items by profit/weight ratio in descending order
    arr.sort(key=lambda x: x.profit/x.weight, reverse=True)
    finalValue = 0.0  # Variable to store the final maximum value

    # Iterate through the sorted items
    for item in arr:
        if w >= item.weight:
            # Take the whole item
            finalValue += item.profit
            w -= item.weight
        else:
            # Take a fraction of the remaining weight
            finalValue += item.profit * (w / item.weight)
            break  # No more capacity left

    return finalValue

if __name__ == "__main__":
    n = int(input("Enter number of items-\n"))
    arr = []
    for i in range(n):
        profit = int(input(f"Enter profit of item {i + 1}-\n"))
        weight = int(input(f"Enter weight of item {i + 1}-\n"))
        arr.append(Item(profit, weight))

    w = int(input("Enter capacity of knapsack-\n"))
    print("Maximum value in knapsack:", fractionalKnapsack(w, arr))
