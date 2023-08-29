# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# OpenBLAS version for systems that use it.
OPENBLAS_VERSION=0.3.21

function build_fftw {
    build_simple fftw 3.3.8 http://www.fftw.org
}


function pre_build {
    set -x
    if [ -n "$IS_OSX" ]; then
        # the line below is a hack to bypass an error
        export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
        brew update
        brew reinstall gcc
        brew install fftw
        build_openblas
        export LAPACK='/usr/local/opt/openblas'
    else
        export CC="gcc -fPIC"
        build_openblas
        ldconfig
        build_fftw
    fi
    unset FFLAGS
    set +x
}

function run_tests {
    :
}
