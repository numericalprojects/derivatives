!-----------------------------------------------------------------------
!Module: read_write
!-----------------------------------------------------------------------
!! By: Nathan Crawford 
!!
!! The subroutines in this module take input for x_0 from the user
!! and write the output of the analytical and numerical derivatives
!!----------------------------------------------------------------------
!! Included subroutines:
!!
!! read_input(x_zero)
!! write_derivatives(x_zero)
!-----------------------------------------------------------------------
module read_write
use types
use analytic_functions, only : second_derivative_f
use euler_formulas, only : euler_3points, euler_5points
implicit none

! The private statement restricts every function, parameter and variable
! defined in this module to be visible only by this module
private
! Then we use the public statement to only make visible to other modules 
! the few functions or subroutines that will be used by them
public read_input, write_derivatives

contains

!-----------------------------------------------------------------------
!Subroutine: read_input
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Give an explanation of how the subroutine works
!! Reads Input for x_0 from the user for the analytical 
!! and numerical solutions
!!----------------------------------------------------------------------
!! Arguments:
!! x_zero  real  value at which the derivatives will be calculated
!-----------------------------------------------------------------------
subroutine read_input(x_zero)
    implicit none
    real(dp), intent(out) :: x_zero
    character(len=120) :: string
    integer :: ierror
   
    print *, 'This program calculates the second derivative of x*sin(x)'
    print *, 'Please enter a real number for x_0.'
    print *, '...'

    
    ! Instead of trying to read a real number we read a string containing
    ! the user's input and then make checks on that string by converting 
    ! it into a real number.
    ! 
    ! The first check is to make sure that the string is not empty 
    ! (i.e. the user simply pressed the enter key)
    ! 
    ! The second check is made by using the 'read' statement to convert
    ! the string into a number, if that is not possible iostat gives an
    ! error code different from zero.
    do
        read(*,'(a)', iostat=ierror) string
        if(string /= '') then
            read(string, *, iostat=ierror) x_zero
            if (ierror == 0 ) exit
            print *, "'"//trim(string)//"'"//' is not a number, please provide a number'
        else
            print *, 'that was an empty input, please provide a number'
        endif
    enddo
end subroutine read_input

!-----------------------------------------------------------------------
!Subroutine: write_derivatives
!-----------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Opens a file called results.dat and writes the results of the 
!! Analytical and numerical solutions
!!
!!----------------------------------------------------------------------
!! Arguments:
!! x_zero  real  value at which the derivatives will be calculated
!-----------------------------------------------------------------------
subroutine write_derivatives(x_zero)
    implicit none
    real(dp), intent(in) :: x_zero
    real(dp) :: h_step = 0.01_dp
    real(dp), parameter :: h_increment = 1.01_dp, h_max = 2.0_dp
    real(dp) :: d2_analytic, d2_num3, d2_num5
    character(len=*), parameter :: file_name = 'results.dat'
    integer :: unit

    d2_analytic = second_derivative_f(x_zero) 
    

    open(newunit=unit, file=file_name)
    write(unit,'(4a28)') 'h', 'analytic', '3 point', '5 point'
    do 
        d2_num3 = euler_3points(x_zero, h_step)
        d2_num5 = euler_5points(x_zero, h_step)
        write(unit,'(4e28.16)') h_step, d2_analytic, d2_num3, d2_num5
        if(h_step >= h_max) exit
        h_step = h_step*h_increment
    enddo
    close(unit)

    print *, 'The derivatives were written in the '//file_name//' file'
end subroutine write_derivatives

end module read_write
