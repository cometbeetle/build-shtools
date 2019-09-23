# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# OpenBLAS version for systems that use it.
OPENBLAS_VERSION=0.3.6

function build_fftw {
    build_simple fftw 3.3.8 http://www.fftw.org
}


function pre_build {
    if [ -n "$IS_OSX" ]; then
        brew update
        # brew cask uninstall oclint || true
        brew install gcc
        brew install fftw
    else
        export CC="gcc -fPIC"
        build_openblas
        build_fftw
    fi
    unset FFLAGS
}

function run_tests {
    :
}
