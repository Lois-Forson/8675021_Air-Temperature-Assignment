program temperature_conversion
    implicit none
    character(len=100) :: input_file = "8675021_Air_Temperature_Assignment.csv"
    character(len=100) :: output_file = "8675021_Air_Temperature_Assignment1.csv"
    real, allocatable :: celsius_values(:), kelvin_values(:)
    integer :: num_temps, i
    
    ! Open the input file and count the number of temperatures
    open(unit=10, file=input_file)
    num_temps = 0
    do
        read(10, *, iostat=i)
        if (i /= 0) exit
        num_temps = num_temps + 1
    end do
    close(10)
    
    ! Allocate memory for arrays
    allocate(celsius_values(num_temps))
    allocate(kelvin_values(num_temps))
    
    ! Read the temperature values from input file
    open(unit=10, file=input_file)
    do i = 1, num_temps
        read(10, *) celsius_values(i)
    end do
    close(10)
    
    ! Convert Celsius to Kelvin
    kelvin_values = celsius_values + 273.15
    
    ! Write the converted temperature values to output file
    open(unit=20, file=output_file)
    do i = 1, num_temps
        write(20, '(F8.2)') kelvin_values(i)
    end do
    close(20)
    
    ! Deallocate memory
    deallocate(celsius_values)
    deallocate(kelvin_values)
    
    write(*, *) "Values successfully converted!"
end program temperature_conversion

