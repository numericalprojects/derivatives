!-----------------------------------------------------------------------
!Module: analytic_functions
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! The functions determine the analytical solutions of the function 
!! and second derivative of the function at a point x_0 which is  
!! user input
!!----------------------------------------------------------------------
!! Included functions:
!!
!! analytic_f(x)
!! second_derivative_f(x)
!-----------------------------------------------------------------------
module analytic_functions
use types
implicit none

! The private statement restricts every function, parameter and variable
! defined in this module to be visible only by this module
private
! Then we use the public statement to only make visible to other modules 
! the few functions or subroutines that will be used by them
public analytic_f, second_derivative_f

contains

!-----------------------------------------------------------------------
!Function: analytic_f
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Takes a value of x_zero that is user input and determines 
!! Analytical solution of the function at a point
!!----------------------------------------------------------------------
!! Arguments: 
!!
!! x_zero	real	point x_0 at which to evaluate f(x_0)
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero	real	x_0 sin(x_0)
!-----------------------------------------------------------------------
function analytic_f(x_zero) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero
    real(dp) :: y_zero
    
    y_zero = x_zero * sin(x_zero) 
end function analytic_f

!-----------------------------------------------------------------------
!Function: second_derivative_f
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Takes in a user input value x_zero and determines analytical 
!! Solution of the function's second derivative at that point
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero	real	point x_0 at which to evaluate f''(x_0)
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero	real    2cos(x_zero) - x_zero * sin(x_zero) 	
!-----------------------------------------------------------------------
function second_derivative_f(x_zero) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero
    real(dp) :: y_zero
    y_zero = (2.0_dp*cos(x_zero)) - (x_zero*sin(x_zero)) 
end function second_derivative_f
    
end module analytic_functions
