Sum GNU anti-Reversi-lazarus-windows
====================================

Use lazarus to compile + support Parallel
Latest compiled version in https://sourceforge.net/projects/antireversi8x8/files/lazarus_v0.7_Eng/
The source is based on https://github.com/sum2012/sum-gnu-anti-Reversi-delphi-windows

CUDA Kernel Compilation
-----------------------
To compile the CUDA kernel (`eval_kernel.cu`) into the PTX file required by the application, use the NVIDIA CUDA Compiler (`nvcc`). It is recommended to run this command from the **x64 Native Tools Command Prompt for VS 2022**:

```bash
nvcc -ptx eval_kernel.cu -o eval_kernel.ptx -Xcompiler "/utf-8"
```

Make sure you have the CUDA Toolkit installed and `nvcc` is in your system PATH. The generated `eval_kernel.ptx` should be placed in the same directory as the executable.
