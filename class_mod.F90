module class_mod

  implicit none
  private

  type, public :: my_class
    character(len=256) :: my_str
  contains
    generic :: my_interface => string_real, &
                               string_int, &
                               string_logical, &
                               string_string, &
                               single_string, &
                               three_strings
    procedure, private :: string_real
    procedure, private :: string_int
    procedure, private :: string_logical
    procedure, private :: string_string
    procedure, private :: single_string
    procedure, private :: three_strings
  end type my_class

contains

  ! =================

  subroutine string_real(self, str_in, real_in)

    class(my_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    real,              intent(in)    :: real_in

    self%my_str = str_in
    write(*, "(A,1X,E25.17)") str_in, real_in

  end subroutine string_real

  ! =================

  subroutine string_int(self, str_in, int_in)

    class(my_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    integer,           intent(in)    :: int_in

    self%my_str = str_in
    write(*, "(A,1X,I0)") str_in, int_in

  end subroutine string_int

  ! =================

  subroutine string_logical(self, str_in, log_in)

    class(my_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in
    logical,           intent(in)    :: log_in

    self%my_str = str_in
    if (log_in) then
      write(*, "(A,1X,A)") str_in, ".true."
    else
      write(*, "(A,1X,A)") str_in, ".false."
    end if

  end subroutine string_logical

  ! =================

  subroutine string_string(self, str_in, str_in2)

    class(my_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in, str_in2

    self%my_str = str_in
    write(*, "(A,1X,A)") str_in, str_in2

  end subroutine string_string

  ! =================

  subroutine single_string(self, str_in)

    class(my_class),   intent(inout) :: self
    character(len=*),  intent(in)    :: str_in

    self%my_str = str_in
    write(*, "(A)") str_in

  end subroutine single_string

  ! =================

  subroutine three_strings(self, str_in, str_in2, str_in3)

    class(my_class),   intent(inout) :: self
    character(len=*), intent(in)    :: str_in, str_in2, str_in3

    self%my_str = str_in
    write(*, "(A,1X,A,1X,A)") str_in, str_in2, str_in3

  end subroutine three_strings

  ! =================

end module class_mod
