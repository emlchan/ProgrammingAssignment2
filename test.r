source("cachematrix.R")

# Create matrix m1
# [ 1 3 ]
# [ 2 4 ]
m1 <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
cm1 <- makeCacheMatrix(m1)

print("Test 1: `makeCacheMatrix` sets and gets correct matrix")
if (identical(m1, cm1$get())) {
    message("Passed")
} else {
    message("Failed")
}

print("Test 2: `cacheSolve` calculates correct matrix inverse")
if (identical(solve(m1), cacheSolve(cm1))) {
    message("Passed")
} else {
    message("Failed")
}

print("Test 3: `cacheSolve` caches correct matrix inverse")
if (identical(solve(m1), cm1$getInverse())) {
    message("Passed")
} else {
    message("Failed")
}

# Create matrix m2
# [ 4 2 ]
# [ 3 1 ]
print("Test 4: `makeCacheMatrix` sets new matrix correctly")
m2 <- matrix(c(4, 3, 2, 1), nrow = 2, ncol = 2)
cm1$set(m2)
if (!identical(cm1$get(), m1) && identical(cm1$get(), m2)) {
    message("Passed")
} else {
    message("Failed")
}

print("Test 5: `cacheSolve` calculates and stores new matrix inverse")
cacheSolve(cm1)
if (identical(solve(m2), cm1$getInverse())) {
    message("Passed")
} else {
    message("Failed")
}

