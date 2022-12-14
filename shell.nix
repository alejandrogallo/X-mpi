{ compiler ? "gcc"
, pkgs ? import <nixpkgs> {}
}:

let

  vendor = import ./etc/nix/vendor-shell.nix;

in

pkgs.mkShell rec {

  compiler-pkg
    = if compiler    == "gcc11" then pkgs.gcc11
    else if compiler == "gcc10" then pkgs.gcc10
    else if compiler == "gcc9" then pkgs.gcc9
    else if compiler == "gcc8" then pkgs.gcc8
    else if compiler == "gcc7" then pkgs.gcc7
    else if compiler == "gcc6" then pkgs.gcc6
    else if compiler == "gcc49" then pkgs.gcc49
    else if compiler == "clang13" then pkgs.clang_13
    else if compiler == "clang12" then pkgs.clang_12
    else if compiler == "clang11" then pkgs.clang_11
    else if compiler == "clang10" then pkgs.clang_10
    else if compiler == "clang9" then pkgs.clang_9
    else if compiler == "clang8" then pkgs.clang_8
    else if compiler == "clang7" then pkgs.clang_7
    else if compiler == "clang6" then pkgs.clang_6
    else if compiler == "clang5" then pkgs.clang_5
    else pkgs.gcc;


  buildInputs
    = with pkgs; [

        gdb
        coreutils
        git
        vim

        openmpi
        llvmPackages.openmp

        sbcl
        ccl
        binutils
        gfortran

        gnumake
        libtool
        autoconf
        automake
        pkg-config
      ]
    ;

  CXX = "${compiler-pkg}/bin/c++";
  CC = "${compiler-pkg}/bin/cc";
  LD = "${compiler-pkg}/bin/ld";

  shellHook
    =
    ''

    ${vendor.src}

    ${vendor.cpath "${pkgs.openmpi.out}/include"}

    ${vendor.lib "${pkgs.openmpi.out}/lib"}

    export OMPI_CXX=${CXX}
    export OMPI_CC=${CC}
    CXX=${CXX}
    CC=${CC}
    LD=${LD}
    ''
    ;

}
