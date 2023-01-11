
## Goal of the Program 

Consider the function $f(x) = x \sin(x)$

Using the symmetric 3-point formula and 5-point formula, compute the numerical
second derivative $f''(x_0)$. The goal is to compare the two methods. The point 
will be decided with input. 

This code will also write into a file called `results.dat` the analytic and
numerical derivatives as a function of the step size $dx$ for a given $x_0$. Of
course, the analytic formula is constant for any $dx$.

The jupyter notebook will read the output from your fortran code and make a 
log-log plot of the error of the numerical derivative  as a function of $dx$.


## Running the program

In order to run the program you'll need to be on some sort of Linux machine 
to make use of the makefile. Once you clone the repository and get into the 
directory via terminal then type make and then ./numerical-derivatives. From 
here you'll see that there's an output file. Now you can open and run the python 
code in jupyter to see analysis of the results.


## Formulas for 3 point and 5 point

The symmetric three-point formula is:
$$f''(x) \approx \frac{f(x+h)-2f(x)+f(x-h)}{h^2} + O(h^2)$$

The symmetric five-point formula is:
$$f''(x) \approx \frac{-f(x+2h)+16f(x+h)-30f(x)+16f(x-h)-f(x-2h)}{12h^2} + O(h^4)$$ 

The big O notation here is saying the error is of $h^n$. 
