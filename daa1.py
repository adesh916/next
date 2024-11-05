nterms = int(input("How many terms? "))

# First two terms
n1, n2 = 0, 1
count = 0

# Check if the number of terms is valid
if nterms <= 0:
    print("Please enter a positive integer")
# If there is only one term, return n1
elif nterms == 1:
    print("Fibonacci sequence up to", nterms, ":")
    print(n1)
# Generate Fibonacci sequence
else:
    print("Fibonacci sequence:")
    while count < nterms:
        print(n1)  # Print the current term
        nth = n1 + n2  # Update for the next term
        # Update n1 and n2
        n1 = n2
        n2 = nth
        count += 1