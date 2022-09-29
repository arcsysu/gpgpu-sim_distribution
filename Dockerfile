FROM wukan0621/sccenv
RUN (. $SCC_SETUP_ENV && spack install -y rodinia%gcc@7.5.0 cuda_arch=70 cudart=shared ^ mesa~llvm gpgpu-sim%gcc@7.5.0 ^ mesa~llvm && spack clean -ab)