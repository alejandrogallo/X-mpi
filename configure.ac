dnl [[file:readme.org::*Introduction][Introduction:1]]
AC_INIT([x-mpi],[0.0.0],[https://gihtub.com/alejandrogallo/x-mpi])
AC_CONFIG_SRCDIR([configure.ac])
AC_PREREQ(2.69)
AC_CONFIG_MACRO_DIRS([./etc/m4])
AC_CONFIG_AUX_DIR([./etc/autotools])
AM_INIT_AUTOMAKE([foreign -Wall])

AC_MSG_NOTICE([

              CHECKING YOUR OVERALL SYSTEM ...

               ])
AC_CANONICAL_BUILD
AC_CANONICAL_HOST

dnl Guess compilers
AC_LANG([C++])
AC_MSG_NOTICE([
               CHECKING COMPILERS...
               ])
AC_PROG_CXX
AX_MPI([], [AC_MSG_FAILURE([No MPI C++ compiler found.])])
AX_COMPILER_VENDOR
CXX="${MPICXX}"

AM_PROG_AR
AC_PROG_CPP           dnl sets variable CPP
AC_PROG_RANLIB        dnl sets variable RANLIB
AC_PROG_INSTALL       dnl sets variables INSTALL, INSTALL_DATA, INSTALL_PROGRAM
AC_PROG_LN_S          dnl sets variable LN_S
AC_PROG_MAKE_SET      dnl set $(MAKE) if needed
AC_PROG_RANLIB        dnl set variable RANLIB
AC_CHECK_TOOL([AR],[ar]) dnl set variable AR to appropriate `ar' program

AC_CHECK_TOOL([SBCL],[sbcl])
dnl Introduction:1 ends here

dnl [[file:readme.org::*export][export:1]]
AC_ARG_VAR([VENDOR_LIB_PATH], [Path to vendor libraries like MPI])
AC_MSG_RESULT([
               MPILIBS=$MPILIBS
               MPICXX = $MPICXX
               CC = $CC
               MPICC = $MPICC
               ])

AC_CONFIG_FILES([
                 Makefile
                 config.lisp
                 lisp
                 ])

AC_OUTPUT
dnl export:1 ends here
