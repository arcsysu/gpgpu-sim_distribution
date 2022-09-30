# syntax=docker/dockerfile:1.4
FROM wukan0621/sccenv
RUN <<EOF
apt-get update -y
apt-get upgrade -y
apt-get install --no-install-recommends -y cpp # for libx11
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
. $SCC_SETUP_ENV
spack install -y gpgpu-sim%gcc@7.5.0 target=$(arch) ^ mesa+glx~llvm
spack uninstall -y --dependents cuda gpgpu-sim # 节约带宽
spack clean -ab
EOF