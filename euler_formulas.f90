!-----------------------------------------------------------------------
!Module: euler_formulas
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! These functions evaluate the second derivative of the function xsinx
!! at the point x_0 which is user input using the 3 point method and 
!! the 5 point method
!!----------------------------------------------------------------------
!! Included functions:
!!
!! euler_3points(x,h) 
!! euler_5points(x,h)
!-----------------------------------------------------------------------
module euler_formulas
use types
use analytic_functions, only : analytic_f
implicit none

! The private statement restricts every function, parameter and variable
! defined in this module to be visible only by this module
private
! Then we use the public statement to only make visible to other modules 
! the few functions or subroutines that will be used by them
public euler_3points, euler_5points

contains

!-----------------------------------------------------------------------
!Function: euler_3points
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Evaluates numerical solution of the second derivative 
!! of xsinx at a point x_0 which is user input 
!! using the 3 point method
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero   real    point x_0 at which to evaluate f''(x_0)
!! h_step   real    step size in the numerical expression
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero   real    (f(x+h)-2f(x)+f(x-h))/(h^2)
!-----------------------------------------------------------------------
function euler_3points(x_zero,h_step) result(y_zero)
    implicit none
    real(dp), intent(in) :: x_zero, h_step
    real(dp) :: y_zero
    real(dp) :: f_plus, f_zero, f_minus
    ! This evaluates the analytic function defined in the analytic_functions
    ! module at x+h, x, and x-h. Modify as you see necessary 
    f_plus = analytic_f(x_zero + h_step)
    f_zero = analytic_f(x_zero)
    f_minus = analytic_f(x_zero - h_step)

    ! Here you can use the evaluated values to calculate the numerical
    ! approximation to the second derivative
    y_zero = ((f_plus) - (2 * f_zero) + f_minus)/(h_step ** 2.0_dp)
end function euler_3points
 


!-----------------------------------------------------------------------
!Function: euler_5points
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Evaluates numerical solution of the second derivative 
!! of xsinx at a point x_0 which is user input 
!! using the 5 point method
!!----------------------------------------------------------------------
!! Arguments:
!!
!! x_zero   real    point x_0 at which to evaluate f''(x_0)
!! h_step   real    step size in the numerical expression
!-----------------------------------------------------------------------
!! Result:
!!
!! y_zero   real    (-f(x+2h) + 16f(x+h) - 30f(x) + 16f(x-h) - f(x-2h))/(12h^2)
!-----------------------------------------------------------------------
function euler_5points(x_zero, h_step) result(y_zero) 
    implicit none 
    real(dp), intent(in) :: x_zero, h_step 
    real(dp) :: y_zero 
    real(dp) :: f_plus, f_zero, f_minus, f_minus2h, f_plus2h 
    
    f_plus = analytic_f(x_zero + h_step) 
    f_plus2h = analytic_f(x_zero + (2 * h_step))
    f_minus = analytic_f(x_zero - h_step) 
    f_minus2h = analytic_f(x_zero - (2 * h_step))
    f_zero = analytic_f(x_zero) 
    
    y_zero = ((-f_plus2h) + (16 * f_plus) - (30 * f_zero) + (16 * f_minus) - (f_minus2h))/(12.0_dp * (h_step**2.0_dp)) 
end function euler_5points
end module euler_formulas
