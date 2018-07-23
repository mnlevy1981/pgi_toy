Program test

  use class_mod, only : marbl_interface_class

  implicit none

  character(len=256) :: input_line

  type(marbl_interface_class) :: my_test

  input_line = ''
  call my_test%put_setting(input_line)

End program test