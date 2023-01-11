! Program: numerical_derivatives
! By: Nathan Crawford
!-----------------------------------------------------------------------------
!
! Calculates the second derivative of f(x) = x sin(x) using Euler's method.
! This program will ask the user for a value x_0, called x_zero in this program
! that must be a number
! The program will then use the symmetric 3 point and symmetric 5 point methods
! to calculate the numerical solutions and also contains functions to evaluate 
! the analytical solutions 
! All of the results will be written into a file called results.dat 
! We can use the results to analyze the accuracy of our methods by 
! directly comparing to the analytical solutions
!-----------------------------------------------------------------------------
program numerical_derivatives
use types 
use read_write

implicit none
real(dp) :: x_zero

! the dp inside of the real(dp) declaration was defined in the types module
! and allows to use reals with double precision 
call read_input(x_zero)
call write_derivatives(x_zero)
end program numerical_derivatives