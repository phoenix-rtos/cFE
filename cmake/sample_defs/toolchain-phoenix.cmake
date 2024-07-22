# This example toolchain file describes the cross compiler to use for
# the target architecture indicated in the configuration file.

# In this sample application, the cross toolchain is configured to
# use a compiler for the Phoenix-RTOS operating system.

# Note that to use this, the "PHOENIX" platform module may need to be added
# to the system-wide CMake installation as a default CMake does not yet
# recognize PHOENIX as a system name. An example of this is distributed with
# the generic-phoenix PSP.

# Basic cross system configuration
set(CMAKE_SYSTEM_NAME       PHOENIX)
set(CMAKE_SYSTEM_PROCESSOR  "$ENV{TARGET_FAMILY}")
set(CMAKE_SYSTEM_VERSION    3.2.0)

# these settings are specific to cFE/OSAL and determines which
# abstraction layers are built when using this toolchain
SET(CFE_SYSTEM_PSPNAME      generic-phoenix)
SET(OSAL_SYSTEM_BSPTYPE     generic-phoenix)
SET(OSAL_SYSTEM_OSTYPE      phoenix)

set(PHOENIX_BSP_C_FLAGS       "$ENV{EXPORT_CFLAGS}")
set(PHOENIX_BSP_CXX_FLAGS     "$ENV{CXXFLAGS}")

# Exception handling is very iffy.  These two options disable eh_frame creation.
set(CMAKE_C_COMPILE_OPTIONS_PIC -fno-exceptions -fno-asynchronous-unwind-tables)

SET(CMAKE_C_COMPILER            "$ENV{EXPORT_CC}")
SET(CMAKE_LINKER                "$ENV{EXPORT_LD}")
SET(CMAKE_ASM_COMPILER          "$ENV{EXPORT_AS}")
SET(CMAKE_STRIP                 "$ENV{EXPORT_STRIP}")
SET(CMAKE_AR                    "$ENV{EXPORT_AR}")
SET(CMAKE_OBJDUMP               "$ENV{CROSS}objdump")
SET(CMAKE_OBJCOPY               "$ENV{CROSS}objcopy")

set(CMAKE_C_FLAGS               "${PHOENIX_BSP_C_FLAGS}")
set(CMAKE_CXX_FLAGS             "${PHOENIX_BSP_CXX_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "$ENV{EXPORT_LDFLAGS}")

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM   NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY   ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE   ONLY)

SET(CMAKE_PREFIX_PATH                   /)
