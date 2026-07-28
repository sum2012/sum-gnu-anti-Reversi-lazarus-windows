# Implementation Plan - Auto-detect and Enable CUDA 12.6 or Above

Auto-detect if the player's GPU supports CUDA 12.6 or higher upon application startup. If supported (driver version >= 12060), automatically enable CUDA and disable CPU parallelization to optimize performance for GPU-accelerated search.

## User Review Required

> [!IMPORTANT]
> The application will now attempt to load `nvcuda.dll` immediately on startup to check for CUDA 12.6 support. If `eval_kernel.ptx` is missing but CUDA 12.6 is detected, an error message might appear during startup if not handled silently. I will ensure the auto-detection is as silent as possible if it fails.

## Proposed Changes

### `cuda_utils.pas`

#### [MODIFY] [cuda_utils.pas](file:///D:/project/sum-gnu-anti-Reversi-lazarus-windows/cuda_utils.pas)
- Added `cuDriverGetVersion` function pointer and its initialization in `InitCuda`. (Already done in preliminary research step).

### `Unit1.pas`

#### [MODIFY] [Unit1.pas](file:///D:/project/sum-gnu-anti-Reversi-lazarus-windows/Unit1.pas)
- Refactor the CUDA enabling logic from `CudaEnabledMenuItemClick` into a new private method `ToggleCuda(Enabled: Boolean; ShowErrors: Boolean)`.
- Add a private method `DetectCudaVersion(var Version: Integer): Boolean` to check the installed CUDA driver version.
- Update `FormCreate` to:
    1. Check if CUDA 12.6+ (version 12060) is supported.
    2. If supported, call `ToggleCuda(True, False)`.
- Update `ToggleCuda` to set `ProcThreadPool.MaxThreadCount := 1` when CUDA is enabled, and restore it using `GetSystemThreadCount` when disabled.
- Update `CudaEnabledMenuItemClick` to call `ToggleCuda`.

## Verification Plan

### Manual Verification
1. **With CUDA 12.6+ Driver:**
   - Launch the application.
   - Verify that the "CUDA Enabled" menu item is automatically checked.
   - Verify that "GPU Disabled" label in the timer changes to show GPU Evals.
   - Run a search and confirm GPU activity.
2. **Without CUDA or with older Driver:**
   - Launch the application.
   - Verify that the "CUDA Enabled" menu item remains unchecked.
   - Verify that CPU parallelization works as expected (multi-threaded search).
3. **Manual Toggle:**
   - Manually uncheck/check the CUDA menu item and verify that CPU threads are restored/limited accordingly.
