!----------------------------------------------------------------------
!Module: types
!---------------------------------------------------------------------
!! By: Nathan Crawford
!!
!! Defines the integer parameters sp, dp and qp to
!! be used as kinds to define real variables as single precision 
!! (32-bit), double precision (64-bit) and quadruple precision 
!! (128-bit) (depending on the machine and compiler, this last one may
!! not always be available).
!!
!! The intrinsic module iso_fortran_env (Fortran 2008 and later) is
!! used.
!!
!!
!! Fundamental constants (i.e. pi;, e, hbar,...) will also be defined 
!! here if needed. 
!---------------------------------------------------------------------
module types
! The iso_fortran_env is an intrinsic module that should already be
! inside of the compiler
use iso_fortran_env
implicit none
integer, parameter :: sp = REAL32 !< single precision kind
integer, parameter :: dp = REAL64 !< double precision kind
integer, parameter :: qp = REAL128!< quadruple precision kind
real(dp), parameter :: pi=acos(-1.0_dp)!< &pi; = 3.141592...
end module types
