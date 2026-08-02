unit cuda_utils;

{$MODE Delphi}

interface

uses
  Windows, SysUtils;

const
  CUDA_SUCCESS = 0;

type
  CUdevice = Integer;
  CUcontext = Pointer;
  CUmodule = Pointer;
  CUfunction = Pointer;
  CUdeviceptr = NativeUInt;

  // Standard CUDA type name
  CUresult = Integer;
  // Alias for backward compatibility
  TCUresult = CUresult;

  CUlimit = (
    CU_LIMIT_STACK_SIZE = $00,
    CU_LIMIT_PRINTF_FIFO_SIZE = $01,
    CU_LIMIT_MALLOC_HEAP_SIZE = $02,
    CU_LIMIT_DEV_RUNTIME_SYNC_DEPTH = $03,
    CU_LIMIT_DEV_RUNTIME_PENDING_LAUNCH_COUNT = $04,
    CU_LIMIT_MAX_LVALUE_COUNT = $05,
    CU_LIMIT_RESERVED_0 = $06,
    CU_LIMIT_RESERVED_1 = $07
  );

var
  cuInit: function(Flags: Cardinal): CUresult; stdcall;
  cuDriverGetVersion: function(var driverVersion: Integer): CUresult; stdcall;
  cuDeviceGet: function(var device: CUdevice; ordinal: Integer): CUresult; stdcall;
  cuCtxCreate: function(var pctx: CUcontext; flags: Cardinal; dev: CUdevice): CUresult; stdcall;
  cuModuleLoadData: function(var module: CUmodule; image: Pointer): CUresult; stdcall;
  cuModuleGetFunction: function(var hfunc: CUfunction; hmod: CUmodule; name: PAnsiChar): CUresult; stdcall;
  cuModuleGetGlobal: function(var dptr: CUdeviceptr; var bytes: NativeUInt; hmod: CUmodule; name: PAnsiChar): CUresult; stdcall;
  cuMemAlloc: function(var dptr: CUdeviceptr; bytesize: NativeUInt): CUresult; stdcall;
  cuMemFree: function(dptr: CUdeviceptr): CUresult; stdcall;
  cuMemcpyHtoD: function(dstDevice: CUdeviceptr; srcHost: Pointer; ByteCount: NativeUInt): CUresult; stdcall;
  cuMemcpyDtoH: function(dstHost: Pointer; srcDevice: CUdeviceptr; ByteCount: NativeUInt): CUresult; stdcall;
  cuLaunchKernel: function(f: CUfunction; gridDimX, gridDimY, gridDimZ: Cardinal;
    blockDimX, blockDimY, blockDimZ: Cardinal; sharedMemBytes: Cardinal;
    hStream: Pointer; kernelParams: Pointer; extra: Pointer): CUresult; stdcall;
  cuCtxDestroy: function(ctx: CUcontext): CUresult; stdcall;
  cuCtxSetLimit: function(limit: CUlimit; value: NativeUInt): CUresult; stdcall;
  cuCtxSetCurrent: function(ctx: CUcontext): CUresult; stdcall;
  cuCtxPushCurrent: function(ctx: CUcontext): CUresult; stdcall;
  cuCtxPopCurrent: function(var pctx: CUcontext): CUresult; stdcall;

function InitCuda: Boolean;
function LoadKernel(const PTXSource: string; const FuncName: string; var Module: CUmodule; var Func: CUfunction): Boolean;

implementation

var
  CudaLib: THandle = 0;

function InitCuda: Boolean;
var
  res: CUresult;
begin
  Result := False;
  if CudaLib = 0 then
    CudaLib := LoadLibrary('nvcuda.dll');

  if CudaLib <> 0 then
  begin
    @cuInit := GetProcAddress(CudaLib, 'cuInit');
    @cuDriverGetVersion := GetProcAddress(CudaLib, 'cuDriverGetVersion');
    @cuDeviceGet := GetProcAddress(CudaLib, 'cuDeviceGet');
    // ...
    @cuCtxCreate := GetProcAddress(CudaLib, 'cuCtxCreate');
    @cuModuleLoadData := GetProcAddress(CudaLib, 'cuModuleLoadData');
    @cuModuleGetFunction := GetProcAddress(CudaLib, 'cuModuleGetFunction');
    @cuModuleGetGlobal := GetProcAddress(CudaLib, 'cuModuleGetGlobal');
    @cuMemAlloc := GetProcAddress(CudaLib, 'cuMemAlloc');
    @cuMemFree := GetProcAddress(CudaLib, 'cuMemFree');
    @cuMemcpyHtoD := GetProcAddress(CudaLib, 'cuMemcpyHtoD');
    @cuMemcpyDtoH := GetProcAddress(CudaLib, 'cuMemcpyDtoH');
    @cuLaunchKernel := GetProcAddress(CudaLib, 'cuLaunchKernel');
    @cuCtxDestroy := GetProcAddress(CudaLib, 'cuCtxDestroy');
    @cuCtxSetLimit := GetProcAddress(CudaLib, 'cuCtxSetLimit');
    @cuCtxSetCurrent := GetProcAddress(CudaLib, 'cuCtxSetCurrent');
    @cuCtxPushCurrent := GetProcAddress(CudaLib, 'cuCtxPushCurrent');
    @cuCtxPopCurrent := GetProcAddress(CudaLib, 'cuCtxPopCurrent');

    if Assigned(cuInit) then
    begin
       res := cuInit(0);
       if res = CUDA_SUCCESS then Result := True;
    end;
  end;
end;

function LoadKernel(const PTXSource: string; const FuncName: string; var Module: CUmodule; var Func: CUfunction): Boolean;
begin
  Result := False;
  if Assigned(cuModuleLoadData) and (cuModuleLoadData(Module, Pointer(PAnsiChar(PTXSource))) = CUDA_SUCCESS) then
    if Assigned(cuModuleGetFunction) and (cuModuleGetFunction(Func, Module, PAnsiChar(FuncName)) = CUDA_SUCCESS) then
      Result := True;
end;

initialization

finalization
  if CudaLib <> 0 then
    FreeLibrary(CudaLib);

end.
