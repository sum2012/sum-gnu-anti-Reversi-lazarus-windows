Sum GNU anti-Reversi-lazarus-windows
====================================
Sum GNU Anti Reversi 8x8 program is an anti Reversi of the classic game "Reversi". 
The player who has more pieces on the board when the game is finished, loses the game.

Use lazarus 4.8 to compile + support Parallel and Nvidia Cuda 12.6
The source is based on https://github.com/sum2012/sum-gnu-anti-Reversi-delphi-windows

CUDA Kernel Compilation
-----------------------
To compile the CUDA kernel (`eval_kernel.cu`) into the PTX file required by the application, use the NVIDIA CUDA Compiler (`nvcc`). It is recommended to run this command from the **x64 Native Tools Command Prompt for VS 2022**:

```bash
nvcc -ptx eval_kernel.cu -o eval_kernel.ptx -Xcompiler "/utf-8"
```

Make sure you have the CUDA Toolkit installed and `nvcc` is in your system PATH. The generated `eval_kernel.ptx` should be placed in the same directory as the executable.
