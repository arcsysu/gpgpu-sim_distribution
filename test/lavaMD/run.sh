(spack load gcc@7.5.0 cuda &&
    nvcc --cudart shared -arch=sm_70 -o ~/lavaMD $(realpath $(dirname $0))/lavaMD.cu)

spack load gpgpu-sim@modified
cd $(spack location -i gpgpu-sim@modified)/gpgpu-sim_distribution
. setup_environment release
rm -rf ~/SM7_QV100
cp -r $(spack location -i gpgpu-sim@modified)/gpgpu-sim_distribution/configs/tested-cfgs/SM7_QV100 ~
cd ~/SM7_QV100
~/lavaMD -boxes1d 2 2>stderr.log 1>stdout.log
