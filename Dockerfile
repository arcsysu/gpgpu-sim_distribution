# syntax=docker/dockerfile:1.4
FROM wukan0621/sccenv
RUN <<EOF
. $SCC_SETUP_ENV
spack install -y gpgpu-sim%gcc@7.5.0 target=$(arch) ^ mesa~llvm
spack clean -ab
EOF