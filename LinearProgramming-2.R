#A manufacturing company makes two models A and B of a product. Each piece of Model A
#requires 9 labour hours for fabricating and 1 labour hour for finishing. Each piece of Model B
#requires 12 labour hours for fabricating and 3 labour hours for finishing. For fabricating and
#finishing, the maximum labour hours available are 180 and 30 respectively. The company makes
#a profit of Rs 8000 on each piece of model A and Rs 12000 on each piece of Model B. How many
#pieces of Model A and Model B should be manufactured per week to realise a maximum profit?
#What is the maximum profit per week?

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(8000,12000)

#constraint; 
f.con <- matrix(c(9,12,
                  1,3),nrow=2,byrow=TRUE)

#signs;
f.dir <- c("<=",
           "<=")

# maximum labour hours available
f.rhs <- c(180,
           30)

# Final value (z), Hasil
lp("max",f.obj,f.con,f.dir,f.rhs)

# Variables final values, Titik Maksimum
lp("max",f.obj,f.con,f.dir,f.rhs)$solution

# Sensitivities
lp("max",f.obj,f.con,f.dir,f.rhs,compute.sens=TRUE)$sens.coef.from
lp("max",f.obj,f.con,f.dir,f.rhs,compute.sens=TRUE)$sens.coef.to

# Dual Values (first dual of the constraints and then dual of the variables)
# Duals of the constraints and variables are mixed
lp("max",f.obj,f.con,f.dir,f.rhs,compute.sens=TRUE)$duals

# Duals lower and upper limits
lp("max",f.obj,f.con,f.dir,f.rhs,compute.sens=TRUE)$duals.from
lp("max",f.obj,f.con,f.dir,f.rhs,compute.sens=TRUE)$duals.to