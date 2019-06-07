# docker_linboot
A docker recipe for running linboot, a CUDA-based Bootstrap application for linear regression 

* Base image is from mullinix/nvidia-cuda-devel-gcc-gsl
* Pulls source from github.com/mullinix/cuda_linear_model_mc_bs
* Compiles CUDA source
* Calls linboot at runtime

