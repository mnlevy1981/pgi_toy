module class_mod

  implicit none
  private

  type, public :: marbl_interface_class
    character(len=256) :: my_str
  contains
    generic :: put_setting => put_real, &
                               put_integer, &
                               put_logical, &
                               put_string, &
                               put_input_file_line, &
                               put_all_string
    procedure, private :: put_real
    procedure, private :: put_integer
    procedure, private :: put_logical
    procedure, private :: put_string
    procedure, private :: put_input_file_line
    procedure, private :: put_all_string
  end type marbl_interface_class

contains

  ! =================

  subroutine put_real(self, str_in, real_in)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    real,              intent(in)    :: real_in

    self%my_str = str_in
    write(*, "(A,1X,E25.17)") str_in, real_in

  end subroutine put_real

  ! =================

  subroutine put_integer(self, str_in, int_in)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    integer,           intent(in)    :: int_in

    self%my_str = str_in
    write(*, "(A,1X,I0)") str_in, int_in

  end subroutine put_integer

  ! =================

  subroutine put_logical(self, str_in, log_in)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    logical,           intent(in)    :: log_in

    self%my_str = str_in
    if (log_in) then
      write(*, "(A,1X,A)") str_in, ".true."
    else
      write(*, "(A,1X,A)") str_in, ".false."
    end if

  end subroutine put_logical

  ! =================

  subroutine put_string(self, str_in, str_in2)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in, str_in2

    self%my_str = str_in
    write(*, "(A,1X,A)") str_in, str_in2

  end subroutine put_string

  ! =================

  subroutine put_input_file_line(self, str_in)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in

    self%my_str = str_in
    write(*, "(A)") str_in

  end subroutine put_input_file_line

  ! =================

  subroutine put_all_string(self, str_in, str_in2, str_in3)

    class(marbl_interface_class),   intent(inout) :: self
    character(len=*), intent(in)    :: str_in, str_in2, str_in3

    self%my_str = str_in
    write(*, "(A,1X,A,1X,A)") str_in, str_in2, str_in3

  end subroutine put_all_string

  ! =================

end module class_mod
