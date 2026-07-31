//   Copyright 2011-2026 by Wu Hon Sum
//   This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  newsgroup:news://my.newsgroup.com.hk/welcome.sum
// forum http://home.i-cable.com/wu/
// movedlist may be wrong need remove later

unit Unit1;

{$MODE Delphi}

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus,ComCtrls,MTProcs,lclintf,MTPCPU,ClipBrd, cuda_utils;

const
  inf = 10000;




type
  Tboard=array[0..9,0..9] of integer;
  Tmovelist = array[1..20] of integer;
  TMoveArray = record
    Count: Integer;
    Moves: array[0..63] of Integer;
  end;


type

  { TForm1 }

  TForm1 = class(TForm)
    apple: TImage;
    Chess2: TImage;
    Chess1: TImage;
    HumanFirstButton: TMenuItem;
    HumanVsHumanButton: TMenuItem;
    ComputerFirstButton: TMenuItem;
    AboutButton: TMenuItem;
    RuleButton: TMenuItem;
    RedChess: TImage;
    BlackChess: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image46: TImage;
    Image47: TImage;
    Image48: TImage;
    Image49: TImage;
    Image50: TImage;
    Image51: TImage;
    Image52: TImage;
    Image53: TImage;
    Image54: TImage;
    Image55: TImage;
    Image56: TImage;
    Image57: TImage;
    Image58: TImage;
    Image59: TImage;
    Image60: TImage;
    Image61: TImage;
    Image62: TImage;
    Image63: TImage;
    Image64: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    SaveButton: TMenuItem;
    Closebutton: TMenuItem;
    Restartbutton: TMenuItem;
    LoadButton: TMenuItem;
    Mode1: TMenuItem;
    HumanVsComputer: TMenuItem;
    ComputerVsHuman: TMenuItem;
    HumanvsHuman: TMenuItem;
    BackButton: TMenuItem;
    StepListBox: TListBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    BoardSetting: TMenuItem;
    ClearButton: TButton;
    MoveFirstRadioGroup: TRadioGroup;
    CopyToClipboardButton: TButton;
    ChessRadioGroup: TRadioGroup;
    SetupBoard: TMenuItem;
    CancelSetupBoard: TMenuItem;
    FinishSetupboard: TMenuItem;
    AiListBox: TListBox;
    NornalDepth: TEdit;
    Label5: TLabel;
    EndgameDepth: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ScoreLabel: TLabel;
    AIDisplayScoreLabel: TLabel;
    GpuEvalLabel: TLabel;
    CudaMenu: TMenuItem;
    CudaEnabledMenuItem: TMenuItem;
    CudaStressTest: TMenuItem;
    Redlabel: TLabel;
    BlackLabel: TLabel;
    ProgressBar1: TProgressBar;
    Startposition2Button: TMenuItem;
    Startposition3Button: TMenuItem;
    Startposition4Button: TMenuItem;
    Startposition1Button: TMenuItem;
    ThinkstepEdit: TEdit;
    StartpositionButton: TMenuItem;
    Startposition6utton: TMenuItem;
    StopThinkButton: TMenuItem;
    Tojavaboardbutton: TMenuItem;
    Timer1: TTimer;
    procedure CudaEnabledMenuItemClick(Sender: TObject);
    procedure CudaStressTestClick(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComputerFirstButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HumanFirstButtonClick(Sender: TObject);
    procedure HumanVsHumanButtonClick(Sender: TObject);
    procedure HumanvsHumanClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure RuleButtonClick(Sender: TObject);
    procedure RedChessClick(Sender: TObject);
    procedure BlackChessClick(Sender: TObject);
    procedure ClosebuttonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CopyToClipboardButtonClick(Sender: TObject);
    procedure ChessRadioGroupClick(Sender: TObject);
    procedure Chess2Click(Sender: TObject);
    procedure ComputerVsHumanClick(Sender: TObject);
    procedure HumanVsComputerClick(Sender: TObject);
    procedure Chess1Click(Sender: TObject);
    procedure SetupBoardClick(Sender: TObject);
    procedure FinishSetupboardClick(Sender: TObject);
    procedure CancelSetupBoardClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure Deletechess(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure Startposition2ButtonClick(Sender: TObject);
    procedure Startposition3ButtonClick(Sender: TObject);
    procedure Startposition4ButtonClick(Sender: TObject);
    procedure Startposition1ButtonClick(Sender: TObject);
    procedure StartpositionButtonClick(Sender: TObject);
    procedure Startposition6uttonClick(Sender: TObject);
    procedure StopThinkButtonClick(Sender: TObject);
    procedure TojavaboardbuttonClick(Sender: TObject);
  private
//      mutistep:Boolean;
//      mutiscore:Integer;
      mutidepth:integer;
      mutitemplist:Tstringlist;
      mutisteplist:Tstringlist;
      mutiscorelist:Tstringlist;
//    mutiscore:array[0..20] of integer;
      mutiSideisRed:Boolean;
      mutiBoard:Tboard;
      MyCriticalSection: TRTLCriticalSection;
      StopThink:Boolean;
      initboard,board:Tboard;
      FirstIsRed:Boolean;
      NotInBack:Boolean;
//      RedMove:boolean;//use in Setupboard
//    step:integer;
 //   MoveListA,MoveListB:TMemo;
      RedNoMove:Boolean;
      BlackNoMove:Boolean;
      RealDepth:integer;
      Redlist,Blacklist:TStringList;
      AiMovelist:string;
      movedlist:TStringList;
      FCudaEnabled: Boolean;
      FCudaContext: CUcontext;
      FCudaModule: CUmodule;
      FCudaFunc: CUfunction;
      FCudaSearchFunc: CUfunction;
      FGpuEvalCount: Int64;
      FGpuBoardsBuf, FGpuResultsBuf, FGpuPosMarkBuf, FGpuTransposedBuf: CUdeviceptr;
      FGpuBufSize: NativeUInt;
      procedure FastMakeRedMove(const ABoard:Tboard; var temp:TMoveArray);
      procedure FastMakeBlackMove(const ABoard:Tboard; var temp:TMoveArray);
      function Muti(const ComputerisRed:Boolean):string;
      procedure DoSomethingParallel(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
      procedure MakeRedMove(const ABoard:Tboard;var temp:TStringList);
      procedure MakeBlackMove(const ABoard:Tboard;var temp:TStringList);
 //     function MakeRedMoveAI(const ABoard:Tboard):TStringList;
//      function MakeBlackMoveAI(const ABoard:Tboard):TStringList;
      procedure MakeClick(t:Tstringlist;Player:string);
      procedure Score(const Aboard:Tboard;var RedScore,BlackScore:integer);
      procedure RedBoardUpdate(var Aboard:Tboard;LastChess:Integer);
      procedure BlackBoardUpdate(var Aboard:Tboard;LastChess:Integer);
      procedure Updateboard;
      function AI(Aboard:Tboard;ComputerIsRed:Boolean):string;
      function MinMax(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
      function MinMaxRandom(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
      function EvaluateScore(const Aboard:Tboard;const SideIsRed:Boolean):Integer;
      function MinMaxStart(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
      function MutiMinMaxStart(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
      Procedure Scoresort(var scorelist:Tstringlist;var stepno:Tstringlist);
      function ThinkNumber(Aboard:Tboard;SideIsRed:Boolean;depth:integer):integer;
      function BoardtoFen:String;
      function MutiMinMax(Aboard:Tboard;const SideIsRed:Boolean;const depth:integer;var aithinkstep:string):integer;
      procedure BatchEvaluateOnGPU(const Boards: array of Tboard; const SideIsRed: Boolean; var Scores: array of Integer);
      procedure BatchSearchOnGPU(const Boards: array of Tboard; const Depth: Integer; const SideIsRed: Boolean; const Color: Integer; var Scores: array of Integer);
      function DetectCudaVersion(var Version: Integer): Boolean;
      procedure ToggleCuda(Enabled: Boolean; ShowErrors: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form1: TForm1;
  {
  PicCompentName: array [1..64] of string =(
  'Image1','Image2','image3','Image4','Image5',
  'Image6','Image7','image8','Image9','Image10',
  'Image11','Image12','image13','Image14','Image15',
  'Image16','Image17','image18','Image19','Image20',
  'Image21','Image22','image23','Image24','Image25',
  'Image26','Image27','image28','Image29','Image30',
  'Image31','Image32','image33','Image34','Image35',
  'Image36','Image37','image38','Image39','Image40',
  'Image41','Image42','image43','Image44','Image45',
  'Image46','Image47','image48','Image49','Image50',
  'Image51','Image52','image53','Image54','Image55',
  'Image56','Image57','image58','Image59','Image60',
  'Image61','Image62','image63','Image64');
  }
 //  board:array[1..8,1..8] of integer = (
 {
    Initboard: Tboard = (
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,-1,1,0,0,0),
   (0,0,0,1,-1,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0));

    board:Tboard = (
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,-1,1,0,0,0),
   (0,0,0,1,-1,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0),
   (0,0,0,0,0,0,0,0));
}
// 1 red ; -1 black ; 0 space
// eat chess-> new board->produce eat step -> eat chess...
    PosMark:Tboard = (
    (0,0,0,0,0,0,0,0,0,0),
      (0,-199,3,-1,-1,-1,-1,3,-199,0),
      (0,3,-1,-1,-1,-1,-1,-1,3,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
      (0,3,-1,-1,-1,-1,-1,-1,3,0),
      (0,-199,3,-1,-1,-1,-1,3,-199,0),
    (0,0,0,0,0,0,0,0,0,0)
      );
{
     BlackPosMark:Tboard = (
     (0,0,0,0,0,0,0,0,0,0),
      (0,200,2,-1,-1,-1,-1,2,200,0),
      (0,2,-1,-1,-1,-1,-1,-1,2,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
       (0,-1,-1,-1,-1,-1,-1,-1,-1,0),
      (0,2,-1,-1,-1,-1,-1,-1,2,0),
      (0,200,2,-1,-1,-1,-1,2,200,0),
    (0,0,0,0,0,0,0,0,0,0)
      );
 }
implementation

{$R *.lfm}



procedure TForm1.FormCreate(Sender: TObject);
var a,b,CudaVersion:integer;
begin
  mutitemplist := Tstringlist.Create;
  mutisteplist := Tstringlist.Create;
  mutiscorelist := Tstringlist.Create;
  FCudaEnabled := False;
  FCudaContext := nil;
  FCudaModule := nil;
  FCudaFunc := nil;
  FCudaSearchFunc := nil;
  FGpuEvalCount := 0;

  // Auto-detect and enable CUDA 12.6 or above
  if DetectCudaVersion(CudaVersion) then
  begin
    if CudaVersion >= 12060 then
    begin
      ToggleCuda(True, False);
      NornalDepth.Text:= '8';
      EndgameDepth.Text:= '14';
    end;
  end;

  system.InitCriticalSection(MyCriticalSection);
 randomize;
  StopThink:=False;
//  RedMove:=True;
  for a:= 0 to 9 do
    for b:= 0 to 9 do
      Initboard[a][b]:=0;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;
  Redlist := TStringList.Create;
  Blacklist := TStringList.Create;
  movedlist := TStringList.Create;
  RedNoMove:=False;
  BlackNoMove:=false;

  Image28.picture := Redchess.Picture;
  Image29.picture := Redchess.Picture;
  Image36.picture := Redchess.Picture;
  Image37.picture := Redchess.Picture;
  Image28.OnClick := Redchess.OnClick;
  Image29.OnClick := Redchess.OnClick;
  Image36.OnClick := Redchess.OnClick;
  Image37.OnClick := Redchess.OnClick;
  Redlist.Add('Image28');
  Redlist.Add('Image29');
  Redlist.Add('Image36');
  Redlist.Add('Image37');
  Label3.Caption:='0';
  Label4.Caption:='0';

end;
function TForm1.Muti(const ComputerisRed:Boolean):String;
function test(const depth:integer;const cuted:Boolean;const fullthink:boolean):string;
var a,b,c,d,bestscore,cutnum:integer;templist,templist2:Tstringlist;OneDepthSideisRed:boolean;move,bestmove:string;//cut:Boolean;
begin
  Result := '';
  mutitemplist.clear;
  mutiscorelist.clear;
// mutitemplist := Tstringlist.Create;
////mutisteplist := Tstringlist.Create;
//mutiscorelist := Tstringlist.Create;
templist := Tstringlist.Create;
templist2 := Tstringlist.Create;
AiListBox.clear;
if ComputerisRed = False then
begin
  OneDepthSideisRed:=False;
  if mutisteplist.count <> 0 then
  begin
    templist.AddStrings(mutisteplist);
    //:= mutisteplist;
    mutisteplist.clear;
  end
  else
  MakeBlackmove(board,templist);
end
else begin
  OneDepthSideisRed:=True;
  if mutisteplist.count <> 0 then
  begin
    templist.AddStrings(mutisteplist);
//    templist := mutisteplist;
    mutisteplist.clear;
  end
  else
    MakeRedmove(board,templist);
end;

mutiSideisRed := OneDepthSideisRed;
For a:= 0 to templist.Count-1 do
begin
  mutiscorelist.add('-2000');
  mutisteplist.add('.');
end;
For a:= 0 to templist.Count-1 do
begin

   bestscore:= -inf;
   mutiBoard := board;
   if OneDepthSideisRed then
   begin
     Redboardupdate(mutiBoard,strtoint(templist[a]));
     MakeBlackmove(mutiBoard,templist2);
   end
   else  begin
     Blackboardupdate(mutiBoard,strtoint(templist[a]));
     MakeRedmove(mutiBoard,templist2);
   end;
   for b:= 0 to templist2.count -1 do
     mutitemplist.Add(inttostr(a)+' '+templist[a]+' '+templist2[b]);
   if templist2.count = 0 then
     mutitemplist.Add(inttostr(a)+' '+templist[a]+' p');
end;
mutidepth:= depth;

if FCudaEnabled then
begin
  // Sequential loop for CUDA to avoid multi-thread overhead and noise
  for a := 0 to mutitemplist.count - 1 do
    DoSomethingParallel(a, nil, nil);
end
else begin
  ProcThreadPool.DoParallel(DoSomethingParallel,0,mutitemplist.count-1,nil);// address, startindex, endindex, optional data,max thread
end;

for a:= 0 to mutiscorelist.count-1 do
   mutiscorelist[a] := inttostr(-strtoint(mutiscorelist[a]));
scoresort(mutiscorelist,mutisteplist);
If (cuted = false) or (fullthink = True) then
begin
 for a:= 0 to mutiscorelist.count-1 do
  AiListBox.items.add(mutiscorelist[a]+':'+mutisteplist[a]);
 b:= mutiscorelist.count-1;
 for a:= b downto 1 do
 begin
   if strtoint(mutiscorelist[a]) <  strtoint(mutiscorelist[0]) then
   begin
     mutiscorelist.Delete(a);
     mutisteplist.Delete(a);
   end
 end;
 a:=Random(mutisteplist.Count);
 Result:='image'+ inttostr(8*strtoint(copy(mutisteplist[a],3,1))+strtoint(copy(mutisteplist[a],1,1))-8);
 ThinkstepEdit.text := AiListBox.items[a];
 AIDisplayScoreLabel.Caption:= mutiscorelist[0];
end
else begin
  b:= mutisteplist.count div 2 +1;
  c:= mutisteplist.count -1;
  for a:= b to c do
    mutisteplist.Delete(mutisteplist.Count-1);
  for a:= 0 to mutisteplist.count-1 do
  begin
    b:= strtoint(copy(mutisteplist[a],1,1));
    c:= strtoint(copy(mutisteplist[a],3,1));
    mutisteplist[a] := inttostr(8*c+b-8);
  end;
end;
templist.free;
templist2.free;
mutitemplist.clear;
mutiscorelist.clear;
//mutitemplist.free;
//mutiscorelist.free;
end;
var a,b,c,tempdepth:integer;aibestmove: string;
begin
  Result := '';
  if FCudaEnabled then
  begin
     aibestmove := '';
     AiListBox.clear;
     ThinkstepEdit.Text:= '';
     FGpuEvalCount := 0;
     Application.ProcessMessages;
     tempdepth:= strToint(Endgamedepth.text);
     score(board,a,b);
     if a+b + tempdepth > 64 then
       tempdepth:= 64-a-b
     else
       tempdepth:= strToint(Nornaldepth.Text);

     a:=MutiMinMax(board, ComputerisRed, tempdepth, aibestmove);
     AIDisplayScoreLabel.Caption:= inttostr(a);
     aibestmove := copy(aibestmove,3,length(aibestmove)-2);
     AiListBox.items.add(inttostr(a)+':'+aibestmove);
     ThinkstepEdit.Text:= AiListBox.items[0];
     a := strtoint(copy(aibestmove,1,1));
     b := strtoint(copy(aibestmove,3,1));
     Result := 'Image'+ inttostr(8*(b-1) +a);
     exit;
  end;
//  mutisteplist := Tstringlist.Create;

    if ComputerIsRed = true then
  begin
      MakeRedMove(board,redlist);
     c:= redlist.Count;
     redlist.clear;
  end
  else begin
    MakeBlackMove(board,blacklist);
    c:= blacklist.Count;
    blacklist.clear;
  end;
  score(board,a,b);
  tempdepth:= strToint(Endgamedepth.text);
  if a+b + tempdepth > 64 then
    tempdepth:= 64-a-b
  else
    tempdepth:= strToint(Nornaldepth.Text);

  if (c > 4) and (a + b < 46)  then
  begin
  //nornally  tempdepth:= strtoint(NornalDepth.text)-2;
    tempdepth:= tempdepth-4;
    test(tempdepth,true,false);
    // use mutisteplist to store cuted step
    tempdepth:= tempdepth + 2;
//    tempdepth:= strtoint(NornalDepth.text)-2;
    Result:=test(tempdepth,false,false);
  end
  else begin
    tempdepth := tempdepth - 2;
//    tempdepth:= strtoint(NornalDepth.text)-2;
    Result:=test(tempdepth,true,True);
  end;
  mutisteplist.clear;
//  mutisteplist.free;
end;



procedure TForm1.BatchEvaluateOnGPU(const Boards: array of Tboard; const SideIsRed: Boolean; var Scores: array of Integer);
var
  num_boards, i, pos: Integer;
  h_results, h_transposed: array of Integer;
  side_val: Integer;
  kernel_params: array[0..3] of Pointer;
  res: CUresult;
  boards_ptr, results_ptr: CUdeviceptr;
begin
  num_boards := Length(Boards);
  if (FCudaFunc = nil) or (num_boards = 0) then exit;

  SetLength(h_results, num_boards);
  SetLength(h_transposed, num_boards * 100);
  if SideIsRed then side_val := 1 else side_val := 0;

  // Transpose board data for coalesced access: [pos * num_boards + idx]
  for i := 0 to num_boards - 1 do
    for pos := 0 to 99 do
       h_transposed[pos * num_boards + i] := Boards[i][pos div 10, pos mod 10];

  if (FGpuTransposedBuf <> 0) and (num_boards * 100 * SizeOf(Integer) <= FGpuBufSize) then
  begin
    boards_ptr := FGpuTransposedBuf;
    results_ptr := FGpuResultsBuf;
  end
  else
  begin
    res := cuMemAlloc(boards_ptr, num_boards * 100 * SizeOf(Integer));
    if res <> CUDA_SUCCESS then exit;
    res := cuMemAlloc(results_ptr, num_boards * SizeOf(Integer));
    if res <> CUDA_SUCCESS then begin cuMemFree(boards_ptr); exit; end;
  end;

  cuMemcpyHtoD(boards_ptr, @h_transposed[0], num_boards * 100 * SizeOf(Integer));

  kernel_params[0] := @boards_ptr;
  kernel_params[1] := @results_ptr;
  kernel_params[2] := @num_boards;
  kernel_params[3] := @side_val;

  res := cuLaunchKernel(FCudaFunc, (num_boards + 255) div 256, 1, 1, 256, 1, 1, 0, nil, @kernel_params[0], nil);
  if res <> CUDA_SUCCESS then
  begin
    system.EnterCriticalSection(MyCriticalSection);
    FGpuEvalCount := -1000000;
    system.LeaveCriticalSection(MyCriticalSection);
    for i := 0 to num_boards - 1 do
      Scores[i] := EvaluateScore(Boards[i], SideIsRed);
  end
  else
  begin
    res := cuMemcpyDtoH(@h_results[0], results_ptr, num_boards * SizeOf(Integer));
    if res <> CUDA_SUCCESS then
    begin
       ShowMessage('CUDA: BatchEvaluateOnGPU failed at memcpy: ' + IntToStr(res));
       for i := 0 to num_boards - 1 do
         Scores[i] := EvaluateScore(Boards[i], SideIsRed);
    end
    else
      Move(h_results[0], Scores[0], num_boards * SizeOf(Integer));

    system.EnterCriticalSection(MyCriticalSection);
    FGpuEvalCount := FGpuEvalCount + num_boards;
    system.LeaveCriticalSection(MyCriticalSection);
  end;

  if boards_ptr <> FGpuTransposedBuf then
  begin
    cuMemFree(boards_ptr);
    cuMemFree(results_ptr);
  end;
end;

procedure TForm1.BatchSearchOnGPU(const Boards: array of Tboard; const Depth: Integer; const SideIsRed: Boolean; const Color: Integer; var Scores: array of Integer);
var
  num_boards, i, pos: Integer;
  h_results, h_transposed: array of Integer;
  side_val: Integer;
  kernel_params: array[0..5] of Pointer;
  res: CUresult;
  boards_ptr, results_ptr: CUdeviceptr;
begin
  num_boards := Length(Boards);
  if (FCudaSearchFunc = nil) or (num_boards = 0) then
  begin
    BatchEvaluateOnGPU(Boards, SideIsRed, Scores);
    exit;
  end;

  SetLength(h_results, num_boards);
  SetLength(h_transposed, num_boards * 100);
  if SideIsRed then side_val := 1 else side_val := 0;

  for i := 0 to num_boards - 1 do
    for pos := 0 to 99 do
       h_transposed[pos * num_boards + i] := Boards[i][pos div 10, pos mod 10];

  if (FGpuTransposedBuf <> 0) and (num_boards * 100 * SizeOf(Integer) <= FGpuBufSize) then
  begin
    boards_ptr := FGpuTransposedBuf;
    results_ptr := FGpuResultsBuf;
  end
  else
  begin
    res := cuMemAlloc(boards_ptr, num_boards * 100 * SizeOf(Integer));
    if res <> CUDA_SUCCESS then exit;
    res := cuMemAlloc(results_ptr, num_boards * SizeOf(Integer));
    if res <> CUDA_SUCCESS then begin cuMemFree(boards_ptr); exit; end;
  end;

  cuMemcpyHtoD(boards_ptr, @h_transposed[0], num_boards * 100 * SizeOf(Integer));

  kernel_params[0] := @boards_ptr;
  kernel_params[1] := @results_ptr;
  kernel_params[2] := @num_boards;
  kernel_params[3] := @Depth;
  kernel_params[4] := @side_val;
  kernel_params[5] := @Color;

  res := cuLaunchKernel(FCudaSearchFunc, (num_boards + 255) div 256, 1, 1, 256, 1, 1, 0, nil, @kernel_params[0], nil);
  if res <> CUDA_SUCCESS then
  begin
    for i := 0 to num_boards - 1 do
      Scores[i] := EvaluateScore(Boards[i], SideIsRed);
  end
  else
  begin
    res := cuMemcpyDtoH(@h_results[0], results_ptr, num_boards * SizeOf(Integer));
    if res <> CUDA_SUCCESS then
    begin
       ShowMessage('CUDA: BatchSearchOnGPU failed at memcpy: ' + IntToStr(res));
       for i := 0 to num_boards - 1 do
         Scores[i] := EvaluateScore(Boards[i], SideIsRed);
       exit;
    end;
    Move(h_results[0], Scores[0], num_boards * SizeOf(Integer));

    system.EnterCriticalSection(MyCriticalSection);
    // Rough estimate of nodes searched
    FGpuEvalCount := FGpuEvalCount + Int64(num_boards) * (1 shl (Depth * 2));
    system.LeaveCriticalSection(MyCriticalSection);
  end;

  if boards_ptr <> FGpuTransposedBuf then
  begin
    cuMemFree(boards_ptr);
    cuMemFree(results_ptr);
  end;
end;


procedure TForm1.CudaStressTestClick(Sender: TObject);
var
  StartTime, EndTime: QWord;
  Elapsed: Double;
  aithinkstep: string;
  depth: Integer;
  res_score: Integer;
  SideIsRed: Boolean;
  ColorName: string;
begin
  if not FCudaEnabled then
  begin
    ShowMessage('Please enable CUDA first.');
    exit;
  end;

  // Determine whose turn it is based on move history
  if (StepListBox.Items.Count mod 2 = 0) then
    SideIsRed := FirstIsRed
  else
    SideIsRed := not FirstIsRed;

  if SideIsRed then ColorName := 'Red' else ColorName := 'Black';

  depth := StrToIntDef(NornalDepth.Text, 7);
  FGpuEvalCount := 0;
  aithinkstep := '';

  ShowMessage('Starting High-Performance Search Benchmark for ' + ColorName + ' at Depth ' + IntToStr(depth) + '...');

  StartTime := GetTickCount64;
  res_score := MutiMinMax(board, SideIsRed, depth, aithinkstep);
  aithinkstep := copy(aithinkstep,3,length(aithinkstep)-2);
  EndTime := GetTickCount64;

  Elapsed := (EndTime - StartTime) / 1000;
  if Elapsed < 0.001 then Elapsed := 0.001;

  ShowMessage('Benchmark Complete (' + ColorName + ' Search).' + #13#10 +
              'Best Move: ' + aithinkstep + #13#10 +
              'Real Board Score: ' + IntToStr(res_score) + #13#10 +
              'Total GPU Evals: ' + IntToStr(FGpuEvalCount) + #13#10 +
              'Time used: ' + FloatToStrF(Elapsed, ffFixed, 8, 2) + ' seconds' + #13#10 +
              'GPU Speed: ' + FloatToStrF((FGpuEvalCount / Elapsed) / 1000000, ffFixed, 8, 2) + ' MNPS');
end;

procedure TForm1.CudaEnabledMenuItemClick(Sender: TObject);
begin
  ToggleCuda(TMenuItem(Sender).Checked, True);
end;

function TForm1.DetectCudaVersion(var Version: Integer): Boolean;
var
  res: CUresult;
begin
  Result := False;
  Version := 0;
  if not InitCuda then exit;

  if Assigned(cuDriverGetVersion) then
  begin
    res := cuDriverGetVersion(Version);
    if res = CUDA_SUCCESS then
      Result := True;
  end;
end;

procedure TForm1.ToggleCuda(Enabled: Boolean; ShowErrors: Boolean);
var
  dev: CUdevice;
  PTXFile: TStringList;
  const_ptr: CUdeviceptr;
  const_size: NativeUInt;
  res: CUresult;
begin
  if Enabled then
  begin
    if not InitCuda then
    begin
      if ShowErrors then ShowMessage('CUDA initialization failed. Make sure nvcuda.dll is in your system path.');
      CudaEnabledMenuItem.Checked := False;
      exit;
    end;

    if cuDeviceGet(dev, 0) <> CUDA_SUCCESS then
    begin
      if ShowErrors then ShowMessage('No CUDA device found.');
      CudaEnabledMenuItem.Checked := False;
      exit;
    end;

    if cuCtxCreate(FCudaContext, 0, dev) <> CUDA_SUCCESS then
    begin
      if ShowErrors then ShowMessage('Failed to create CUDA context.');
      CudaEnabledMenuItem.Checked := False;
      exit;
    end;

    // Increase stack size to 8KB for recursive alphabeta search
    cuCtxSetLimit(CU_LIMIT_STACK_SIZE, 8192);

    if FileExists('eval_kernel.ptx') then
    begin
      PTXFile := TStringList.Create;
      try
        PTXFile.LoadFromFile('eval_kernel.ptx');
        if not LoadKernel(PTXFile.Text, 'evaluate_boards', FCudaModule, FCudaFunc) then
        begin
           if ShowErrors then ShowMessage('Failed to load CUDA kernel from eval_kernel.ptx');
           CudaEnabledMenuItem.Checked := False;
           cuCtxDestroy(FCudaContext);
           FCudaContext := nil;
           exit;
        end;

        if FCudaModule <> nil then
           cuModuleGetFunction(FCudaSearchFunc, FCudaModule, 'alphabeta_search');
      finally
        PTXFile.Free;
      end;
    end
    else
    begin
      if ShowErrors then ShowMessage('eval_kernel.ptx not found. Please compile eval_kernel.cu with nvcc.');
      CudaEnabledMenuItem.Checked := False;
      cuCtxDestroy(FCudaContext);
      FCudaContext := nil;
      exit;
    end;

    FCudaEnabled := True;
    CudaEnabledMenuItem.Checked := True;

    if FCudaEnabled then
    begin
       // Allocate persistent buffers for 100k boards
       FGpuBufSize := 100000 * 100 * SizeOf(Integer);
       res := cuMemAlloc(FGpuBoardsBuf, FGpuBufSize);
       if res <> CUDA_SUCCESS then
       begin
         if ShowErrors then ShowMessage('CUDA: Failed to allocate FGpuBoardsBuf: ' + IntToStr(res));
         FCudaEnabled := False;
         CudaEnabledMenuItem.Checked := False;
         exit;
       end;

       res := cuMemAlloc(FGpuResultsBuf, 100000 * SizeOf(Integer));
       if res <> CUDA_SUCCESS then
       begin
         if ShowErrors then ShowMessage('CUDA: Failed to allocate FGpuResultsBuf: ' + IntToStr(res));
         cuMemFree(FGpuBoardsBuf);
         FGpuBoardsBuf := 0;
         FCudaEnabled := False;
         CudaEnabledMenuItem.Checked := False;
         exit;
       end;

       res := cuMemAlloc(FGpuTransposedBuf, FGpuBufSize);
       if res <> CUDA_SUCCESS then
       begin
         if ShowErrors then ShowMessage('CUDA: Failed to allocate FGpuTransposedBuf: ' + IntToStr(res));
         cuMemFree(FGpuBoardsBuf);
         cuMemFree(FGpuResultsBuf);
         FGpuBoardsBuf := 0;
         FGpuResultsBuf := 0;
         FCudaEnabled := False;
         CudaEnabledMenuItem.Checked := False;
         exit;
       end;

       // Set constant memory weights
       if cuModuleGetGlobal(const_ptr, const_size, FCudaModule, 'c_posmark') = CUDA_SUCCESS then
          cuMemcpyHtoD(const_ptr, @PosMark[0,0], 100 * SizeOf(Integer));

       // Disable CPU parallelization
       ProcThreadPool.MaxThreadCount := 1;
    end;
  end
  else
  begin
    if FGpuBoardsBuf <> 0 then cuMemFree(FGpuBoardsBuf);
    if FGpuResultsBuf <> 0 then cuMemFree(FGpuResultsBuf);
    if FGpuTransposedBuf <> 0 then cuMemFree(FGpuTransposedBuf);
    FGpuBoardsBuf := 0;
    FGpuResultsBuf := 0;
    FGpuTransposedBuf := 0;

    if FCudaContext <> nil then
      cuCtxDestroy(FCudaContext);
    FCudaContext := nil;
    FCudaModule := nil;
    FCudaFunc := nil;
    FCudaSearchFunc := nil;
    FCudaEnabled := False;
    CudaEnabledMenuItem.Checked := False;

    // Restore CPU parallelization
    ProcThreadPool.MaxThreadCount := GetSystemThreadCount;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if FCudaEnabled then
  begin
    if FGpuEvalCount < 0 then
      GpuEvalLabel.Caption := 'GPU ERROR!'
    else
      GpuEvalLabel.Caption := 'GPU Evals: ' + IntToStr(FGpuEvalCount);
  end
  else
    GpuEvalLabel.Caption := 'GPU Disabled';
end;

procedure TForm1.AboutButtonClick(Sender: TObject);
begin
 ShowMessage('Copyright 2011,2012 by Wu Hon Sum'+#13+
'This program is free software: you can redistribute it and/or modify'+#13+
'it under the terms of the GNU General Public License as published by'+#13+
'the Free Software Foundation, either version 3 of the License, or'+#13+
'any later version.');
end;

procedure TForm1.ComputerFirstButtonClick(Sender: TObject);
begin
  HumanVsHumanButton.Click;
  ComputerVsHuman.Click;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
 mutitemplist.free;
 mutisteplist.free;
 mutiscorelist.free;
  system.DoneCriticalSection(MyCriticalSection);
end;

procedure TForm1.DoSomethingParallel(Index: PtrInt; Data: Pointer; Item: TMultiThreadProcItem);
var Aboard:Tboard;a,B,C,D,mutitscore:integer;stepno,tempstring,tempstring2,tempstring3,aithinkstep:string;SideisRed:Boolean;
begin
// system.EnterCriticalsection(MyCriticalSection);
 tempstring := mutitemplist[index];
// system.LeaveCriticalsection(MyCriticalSection);
  For a := 2 to length(tempstring) do
    if tempstring[a] = ' ' then break;
  stepno := copy(tempstring,1,a-1);
  tempstring :=  copy(tempstring,a+1,length(mutitemplist[index])-a);
  For a := 2 to length(tempstring) do
    if tempstring[a] = ' ' then break;
  tempstring2 := copy(tempstring,1,a-1);
  tempstring := copy(tempstring,a+1,2);
  d:= strtoint(tempstring2);
  b:= d div 8 +1 ;
  c:= d mod 8;
  if c = 0 then
  begin
    Dec(b);
    c:=8;
  end;
  aithinkstep := inttostr(c)+','+inttostr(b);
  Aboard:= board;
  if tempstring[1] <> 'p' then
  begin
    d:= strtoint(tempstring);
    b:= d div 8 +1 ;
    c:= d mod 8;
    if c = 0 then
    begin
      Dec(b);
      c:=8;
    end;
    aithinkstep := aithinkstep+'->'+inttostr(c)+','+inttostr(b);
    if mutisideisRed = True then
    begin
      RedboardUpdate(Aboard,strtoint(tempstring2));
      Blackboardupdate(Aboard,strtoint(tempstring));
    end
    else begin
      Blackboardupdate(Aboard,strtoint(tempstring2));
      RedboardUpdate(Aboard,strtoint(tempstring));
    end;
    if  mutidepth > 5 then
      mutitscore := -MutiMinMaxStart(Aboard,mutiSideIsRed,mutidepth,aithinkstep)
    else
      mutitscore := -MutiMinMax(Aboard,mutiSideIsRed,mutidepth,aithinkstep);
  end
  else begin
     aithinkstep := aithinkstep + '->PASS';
     if mutisideisRed = True then
       RedboardUpdate(Aboard,strtoint(tempstring2))
     Else
       Blackboardupdate(Aboard,strtoint(tempstring2));
     mutitscore := -MutiMinMax(Aboard,mutiSideIsRed,mutidepth+1,aithinkstep);
  end;
  a := strtoint(stepno);
  system.EnterCriticalsection(MyCriticalSection);
  if mutitscore > strtoint(mutiscorelist[a]) then
  begin
    mutiscorelist[a] := inttostr(mutitscore);
    mutisteplist[a] := aithinkstep;
  end;
  system.LeaveCriticalsection(MyCriticalSection);
{
 AAboard:=Aboard;
  d:= strtoint(mutitemplist[index]);
  b:= d div 8 +1 ;
  c:= d mod 8;
  if c = 0 then
   begin
  b:=b-1;
  c:=8;
  end;
  oldaithinkstep := inttostr(c)+','+inttostr(b);
  For a:= 0 to Templist.Count-1 do
  begin
    Aboard:=AAboard;
    d:= strtoint(Templist[a]);
    b:= d div 8 +1 ;
    c:= d mod 8;
    if c = 0 then
    begin
       b:=b-1;
       c:=8;
    end;
    aithinkstep :=oldaithinkstep + '->'+ inttostr(c)+','+inttostr(b);
    if mutisideisRed = True then
      BlackboardUpdate(Aboard,strToint(Templist[a]))
    else
      RedboardUpdate(Aboard,strToint(Templist[a]));
    mutitscore := -MutiMinMax(Aboard,mutiSideIsRed,mutidepth-2,aithinkstep);
    if mutitscore > bestscore then
    begin
      bestscore := mutitscore;
      bestaithinkstep := aithinkstep;
    end;
  end;
  Templist.free;

  system.EnterCriticalsection(MyCriticalSection);
  mutiscorelist.Add(inttostr(-bestscore));
  mutisteplist.Add(bestaithinkstep);
  system.LeaveCriticalsection(MyCriticalSection);
}
end;

function TForm1.MutiMinMaxStart(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
var a,b,c,d,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;scorelist,steplist:Tstringlist;aithinksteplist:Tstringlist;oldaithinkstep:string;//bestaithinkstep:string;
    //var a,b,c,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;sameboard:boolean;
    begin
    //一般來說，這裡有一個判斷棋局是否結束的函數，
    //一旦棋局結束就不必繼續搜索了，直接返回極值。
    //但由於黑白棋不存在中途結束的情況，故省略。

      Score(Aboard,a,b);
      if a = 0 then
      begin
        if SideIsRed then
          result:= 2000
        else
          result:= -2000;
        exit;
      end;
      if b = 0 then
      begin
        if SideIsRed then
          result:= -2000
        else
          result:= 2000;
        exit;
      end;
      if (depth<=0) or (a+b>63) then //葉子節點
      begin
        result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
        exit;
      end;
    //  if SideIsRed then
        bestvalue:=-INF;//初始最佳值設為負無窮
    //  else
    //    bestvalue:=INF;
      //生成走法
      templist:=tstringlist.Create;
      if SideIsRed Then
    //    templist:=MakeRedMoveAI(Aboard)
        MakeRedMove(Aboard,templist)
      else
    //    templist:=MakeBlackMoveAI(Aboard);
        MakeBlackMove(Aboard,templist);
      if templist.Count = 0 then
      begin
        if SideIsRed Then
          MakeBlackMove(Aboard,templist)
        else
          MakeRedMove(Aboard,templist);

        if templist.Count = 0 then // both red and black no move
        begin
          templist.Free;
    //      result:=0;
          result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
          exit;
        end;
    //    templist.Free;
    //    if a + b > 63 then begin
    //      result:= -EvaluateScore(Aboard,not SideIsRed);
    //      exit;
    //    end
    //    else begin
          result := -mutiMinMaxStart(Aboard,Not SideIsRed,depth,aithinkstep);//);//搜索子節點，注意前面的負號
     //     result := -MinMaxSecond(Aboard,Not SideIsRed,depth);//);//搜索子節點，注意前面的負號
    //      if a+ b < 40 then
    //        result := result + 100;
          templist.Free;
          exit;
      end;
      tempboard:=Aboard;
      scorelist := Tstringlist.Create;
      steplist := Tstringlist.Create;
      oldaithinkstep:=aithinkstep+'->';
      For a:= 0 to templist.Count-1 do
      begin
//        Application.ProcessMessages;

        aithinkstep:='';
      // 走一步棋;//
      //局面aboard 隨之改變
        Aboard:=tempboard;
      steplist.Add(templist[a]);
        if SideIsRed Then
         RedboardUpdate(Aboard,strToint(templist[a]))
        else
          BlackboardUpdate(aboard,strToint(templist[a]));
        value:= -mutiMinMax(Aboard,Not SideIsRed,depth -2,aithinkstep);//);//搜索子節點，注意前面的負號
        scorelist.add(inttostr(value));

       end;
       Scoresort(scorelist,steplist);
       aithinksteplist:=Tstringlist.Create;
//       for a := scorelist.Count div 2 to scorelist.Count do
//          ProgressBar1.StepIt;// need modied
       For a:=0 to  scorelist.count div 2 do //need modied
       begin
      // 走一步棋;//
      //局面aboard 隨之改變
        Aboard:=tempboard;
        aithinkstep:='';
            d:= strtoint(steplist[a]);
          b:= d div 8 +1 ;
          c:= d mod 8;
          if c = 0 then
            begin
          b:=b-1;
          c:=8;
           end;
         aithinkstep := aithinkstep+intTostr(c)+','+intTostr(b) ;

        if SideIsRed Then
         RedboardUpdate(Aboard,strToint(steplist[a]))
        else
          BlackboardUpdate(aboard,strToint(steplist[a]));

        value:= -mutiMinMax(Aboard,Not SideIsRed,depth-1,aithinkstep);//);//搜索子節點，注意前面的負號

    //    Aboard:=Tempboard;//撤銷剛才的一步;//恢復局面

    // for display move value need modied;
          d:= strtoint(steplist[a]);
          b:= d div 8 +1 ;
          c:= d mod 8;
          if c = 0 then
            begin
          b:=b-1;
          c:=8;
           end;
//          AiListBox.items.Add(intTostr(c)+','+intTostr(b)+' '+intTostr(value));
          if value = bestvalue then
            aithinksteplist.Add(aithinkstep)
          else if value > bestvalue then
          begin
            aimovelist:=steplist[a]+' '+intTostr(value);
            aithinksteplist.Clear;
    // support random best move
            aithinksteplist.Add(aithinkstep);
    //        bestaithinkstep:=aithinkstep;

    // end of display value
    //    if sideIsRed then
    //    begin
    //      if value > bestvalue then
    //      begin
            bestvalue:=value;
    //        if depth = Realdepth then
    //        aimovelist.Add(templist[a]+' '+intTostr(value));
           end;
    //      end;
        end;
    {
        else begin
          if value < bestvalue then
          begin
            bestvalue:=value;
            if depth = Realdepth then
              aimovelist.Add(templist[a]+' '+intTostr(value));
          end;
        end;
      end;
      }
      b:=Random(aithinksteplist.Count);
      AiMovelist := inttostr(8*strtoint(copy(aithinksteplist[b],3,1))+strtoint(copy(aithinksteplist[b],1,1))-8) + ' '+inttostr(bestvalue);
      aithinkstep := oldaithinkstep + aithinksteplist[b];
      Result:= bestvalue;
    //  aithinkstep:=bestaithinkstep;
      scorelist.free;
      steplist.free;
      templist.Free;
      aithinksteplist.free;
    end;

function TForm1.MutiMinMax(Aboard: Tboard; const SideIsRed: Boolean; const depth: integer; var aithinkstep: string): integer;
type
  TBranchInfo = record
    a_idx, b_idx: Integer;
    b_move: Integer;
    start_idx, count: Integer;
    moves_c: array of Integer;
  end;
var
  a, b, c, d, bestvalue, value, b_pos, c_pos, i: integer;
  node_val, branch_best, best_a_move, best_b_move, best_c_move, temp_best_c: integer;
  oldaithinkstep, bestaithinkstep: string;
  moves, child_moves, grandchild_moves: TMoveArray;
  tempboard, tempboard2: Tboard;
  batch_boards: array of Tboard;
  batch_scores: array of Integer;
  branch_info: array of TBranchInfo;
  branch_count: Integer;
  a_best, a_best_b, a_best_c: array of Integer;
begin
  a := 0; b := 0;
  Score(Aboard, a, b);
  if a = 0 then
  begin
    if SideIsRed then Result := 2000 else Result := -2000;
    exit;
  end;
  if b = 0 then
  begin
    if SideIsRed then Result := -2000 else Result := 2000;
    exit;
  end;

  // x250 Turbo Boost: Unified Subtree Batching at Depth 3+
  if (depth >= 3) and FCudaEnabled and (not StopThink) then
  begin
    if SideIsRed then FastMakeRedMove(Aboard, moves)
    else FastMakeBlackMove(Aboard, moves);

    if moves.Count > 0 then
    begin
      bestvalue := -INF;
      oldaithinkstep := aithinkstep;
      branch_count := 0;
      SetLength(batch_boards, 0);
      SetLength(branch_info, 0);

      for a := 0 to moves.Count - 1 do
      begin
        tempboard := Aboard;
        if SideIsRed then RedboardUpdate(tempboard, moves.Moves[a])
        else BlackboardUpdate(tempboard, moves.Moves[a]);

        if (not SideIsRed) then FastMakeRedMove(tempboard, child_moves)
        else FastMakeBlackMove(tempboard, child_moves);

        for b := 0 to child_moves.Count - 1 do
        begin
          tempboard2 := tempboard;
          if (not SideIsRed) then RedboardUpdate(tempboard2, child_moves.Moves[b])
          else BlackboardUpdate(tempboard2, child_moves.Moves[b]);

          if SideIsRed then FastMakeRedMove(tempboard2, grandchild_moves)
          else FastMakeBlackMove(tempboard2, grandchild_moves);

          if grandchild_moves.Count > 0 then
          begin
            SetLength(branch_info, branch_count + 1);
            branch_info[branch_count].a_idx := a;
            branch_info[branch_count].b_idx := b;
            branch_info[branch_count].b_move := child_moves.Moves[b];
            branch_info[branch_count].start_idx := Length(batch_boards);
            branch_info[branch_count].count := grandchild_moves.Count;
            SetLength(branch_info[branch_count].moves_c, grandchild_moves.Count);
            inc(branch_count);

            SetLength(batch_boards, Length(batch_boards) + grandchild_moves.Count);
            for c := 0 to grandchild_moves.Count - 1 do
            begin
              branch_info[branch_count-1].moves_c[c] := grandchild_moves.Moves[c];
              batch_boards[branch_info[branch_count-1].start_idx + c] := tempboard2;
              if SideIsRed then RedboardUpdate(batch_boards[branch_info[branch_count-1].start_idx + c], grandchild_moves.Moves[c])
              else BlackboardUpdate(batch_boards[branch_info[branch_count-1].start_idx + c], grandchild_moves.Moves[c]);
            end;
          end;
        end;
      end;

      if Length(batch_boards) > 0 then
      begin
        SetLength(batch_scores, Length(batch_boards));
        if depth = 3 then
          BatchEvaluateOnGPU(batch_boards, Not SideIsRed, batch_scores)
        else
        begin
          c := -1; if SideIsRed then c := 1;
          BatchSearchOnGPU(batch_boards, depth - 3, Not SideIsRed, -c, batch_scores);
        end;

        SetLength(a_best, moves.Count);
        SetLength(a_best_b, moves.Count);
        SetLength(a_best_c, moves.Count);
        for a := 0 to moves.Count - 1 do
        begin
          a_best[a] := INF; // Minimizer (b) level
          a_best_b[a] := -1;
          a_best_c[a] := -1;
        end;

        for i := 0 to branch_count - 1 do
        begin
           node_val := -INF;
           temp_best_c := -1;
           for c := 0 to branch_info[i].count - 1 do
           begin
              // Level 3 is opponent's turn. We maximize Black's score at Level 2.
              // batch_scores[idx] is from opponent's perspective (Red).
              // So -batch_scores is Black's perspective.
              if -batch_scores[branch_info[i].start_idx + c] > node_val then
              begin
                 node_val := -batch_scores[branch_info[i].start_idx + c];
                 temp_best_c := branch_info[i].moves_c[c];
              end;
           end;

           // Level 1 is Red's turn. Red minimizes Black's score.
           if node_val < a_best[branch_info[i].a_idx] then
           begin
              a_best[branch_info[i].a_idx] := node_val;
              a_best_b[branch_info[i].a_idx] := branch_info[i].b_move;
              a_best_c[branch_info[i].a_idx] := temp_best_c;
           end;
        end;

        bestvalue := -INF;
        best_a_move := -1;
        best_b_move := -1;
        best_c_move := -1;

        for a := 0 to moves.Count - 1 do
        begin
          if a_best[a] = INF then
          begin
             // Fallback: evaluate the board AFTER the move, not the root board
             tempboard := Aboard;
             if SideIsRed then RedboardUpdate(tempboard, moves.Moves[a])
             else BlackboardUpdate(tempboard, moves.Moves[a]);
             // EvaluateScore returns score for the root side (SideIsRed).
             a_best[a] := EvaluateScore(tempboard, SideIsRed);
          end;

          // Root is Black. Black maximizes his score.
          if a_best[a] > bestvalue then
          begin
            bestvalue := a_best[a];
            best_a_move := moves.Moves[a];
            best_b_move := a_best_b[a];
            best_c_move := a_best_c[a];
          end;
        end;

        if best_a_move >= 0 then
        begin
          bestaithinkstep := oldaithinkstep;
          // Step 1
          d := best_a_move;
          b_pos := d div 8 + 1; c_pos := d mod 8;
          if c_pos = 0 then begin b_pos := b_pos - 1; c_pos := 8; end;
          bestaithinkstep := bestaithinkstep + '->' + intTostr(c_pos) + ',' + intTostr(b_pos);
          tempboard := Aboard;
          if SideIsRed then RedboardUpdate(tempboard, best_a_move)
          else BlackboardUpdate(tempboard, best_a_move);

          // Step 2
          if best_b_move >= 0 then
          begin
            d := best_b_move;
            b_pos := d div 8 + 1; c_pos := d mod 8;
            if c_pos = 0 then begin b_pos := b_pos - 1; c_pos := 8; end;
            bestaithinkstep := bestaithinkstep + '->' + intTostr(c_pos) + ',' + intTostr(b_pos);
            if (not SideIsRed) then RedboardUpdate(tempboard, best_b_move)
            else BlackboardUpdate(tempboard, best_b_move);

            // Step 3
            if best_c_move >= 0 then
            begin
              d := best_c_move;
              b_pos := d div 8 + 1; c_pos := d mod 8;
              if c_pos = 0 then begin b_pos := b_pos - 1; c_pos := 8; end;
              bestaithinkstep := bestaithinkstep + '->' + intTostr(c_pos) + ',' + intTostr(b_pos);
              if SideIsRed then RedboardUpdate(tempboard, best_c_move)
              else BlackboardUpdate(tempboard, best_c_move);

              // Step 4+ (Path Recovery)
              if (depth > 3) and (not StopThink) then
                MutiMinMax(tempboard, Not SideIsRed, depth - 3, bestaithinkstep);
            end;
          end;
        end;

        aithinkstep := bestaithinkstep;
        Result := bestvalue;
        exit;
      end;
    end;
  end;

  if (depth <= 0) or (a + b > 63) or StopThink then
  begin
    Result := EvaluateScore(Aboard, SideIsRed);
    exit;
  end;

  bestvalue := -INF;
  if SideIsRed then FastMakeRedMove(Aboard, moves)
  else FastMakeBlackMove(Aboard, moves);

  if moves.Count = 0 then
  begin
    if SideIsRed then FastMakeBlackMove(Aboard, moves)
    else FastMakeRedMove(Aboard, moves);

    if moves.Count = 0 then
    begin
      Result := EvaluateScore(Aboard, SideIsRed);
      exit;
    end;
    oldaithinkstep := aithinkstep;
    aithinkstep := aithinkstep + '->PASS';
    Result := -MutiMinMax(Aboard, Not SideIsRed, depth, aithinkstep);
    exit;
  end;

  tempboard := Aboard;
  oldaithinkstep := aithinkstep;
  for a := 0 to moves.Count - 1 do
  begin
    aithinkstep := oldaithinkstep;
    d := moves.Moves[a];
    b := d div 8 + 1;
    c := d mod 8;
    if c = 0 then begin b := b - 1; c := 8; end;
    aithinkstep := aithinkstep + '->' + intTostr(c) + ',' + intTostr(b);

    Aboard := tempboard;
    if SideIsRed then RedboardUpdate(Aboard, moves.Moves[a])
    else BlackboardUpdate(Aboard, moves.Moves[a]);

    value := -MutiMinMax(Aboard, Not SideIsRed, depth - 1, aithinkstep);

    if value > bestvalue then
    begin
      bestvalue := value;
      bestaithinkstep := aithinkstep;
    end;
  end;
  aithinkstep := bestaithinkstep;
  Result := bestvalue;
end;

procedure TForm1.FastMakeRedMove(const aBoard:Tboard; var temp:TMoveArray);
label lbl_next_red;
var a,b,c,d:integer;
begin
  temp.Count := 0;
  for b:=1 to 8 do
    for c:=1 to 8 do
    begin
      if aBoard[b,c] <> 0 then continue;

      // left to right
      if (c < 7) and (aBoard[b][c+1] = -1) then
      begin
        for d:=2 to 7 do
        begin
          if c+d < 9 then
          begin
            if aBoard[b][c+d] = 1 then
            begin
              temp.Moves[temp.Count] := 8*c+b-8;
              inc(temp.Count);
              goto lbl_next_red;
            end
            else if aBoard[b][c+d] <> -1 then break;
          end;
        end;
      end;

      if c > 2 then // right to left
      begin
        if aBoard[b][c-1] = -1 then
        begin
          for d:=2 to 7 do
          begin
            if c-d > 0 then
            begin
              if aBoard[b][c-d] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b][c-d] <> -1 then break;
            end;
          end;
        end;
      end;

      if b < 7 then // top to bottom
      begin
        if aBoard[b+1][c] = -1 then
        begin
          for d:= 2 to 7 do
          begin
            if b+d < 9 then
            begin
              if aBoard[b+d][c] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b+d][c] <> -1 then break;
            end;
          end;
        end;
      end;

      if b > 2 then // bottom to top
      begin
        if aBoard[b-1][c] = -1 then
        begin
          for d := 2 to 7 do
          begin
            if b - d > 0 then
            begin
              if aBoard[b-d][c] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b-d][c] <> -1 then break;
            end;
          end;
        end;
      end;

      if (b > 2) and (c > 2) then // top left
      begin
        if aBoard[b-1][c-1] = -1 then
        begin
          for d := 2 to 7 do
          begin
            if (b - d > 0) and (c - d > 0) then
            begin
              if aBoard[b-d][c-d] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b-d][c-d] <> -1 then break;
            end;
          end;
        end;
      end;

      if (b < 7) and (c < 7) then // bottom right
      begin
        if aBoard[b+1][c+1] = -1 then
        begin
          for d := 2 to 7 do
          begin
            if (b + d < 9) and (c + d < 9) then
            begin
              if aBoard[b+d][c+d] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b+d][c+d] <> -1 then break;
            end;
          end;
        end;
      end;

      if (b > 2) and (c < 7) then // top right
      begin
        if aBoard[b-1][c+1] = -1 then
        begin
          for d := 2 to 7 do
          begin
            if (b - d > 0) and (c + d < 9) then
            begin
              if aBoard[b-d][c+d] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b-d][c+d] <> -1 then break;
            end;
          end;
        end;
      end;

      if (b < 7) and (c > 2) then // bottom left
      begin
        if aBoard[b+1][c-1] = -1 then
        begin
          for d := 2 to 7 do
          begin
            if (b + d < 9) and (c - d > 0) then
            begin
              if aBoard[b+d][c-d] = 1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_red;
              end
              else if aBoard[b+d][c-d] <> -1 then break;
            end;
          end;
        end;
      end;

      lbl_next_red:;
    end;
end;

procedure TForm1.FastMakeBlackMove(const aBoard:Tboard; var temp:TMoveArray);
label lbl_next_black;
var a,b,c,d:integer;
begin
  temp.Count := 0;
  for b:=1 to 8 do
    for c:=1 to 8 do
    begin
      if aBoard[b,c] <> 0 then continue;

      if (c < 7) and (aBoard[b][c+1] = 1) then
      begin
        for d:=2 to 7 do
        begin
          if c+d < 9 then
          begin
            if aBoard[b][c+d] = -1 then
            begin
              temp.Moves[temp.Count] := 8*c+b-8;
              inc(temp.Count);
              goto lbl_next_black;
            end
            else if aBoard[b][c+d] <> 1 then break;
          end;
        end;
      end;

      if c > 2 then
      begin
        if aBoard[b][c-1] = 1 then
        begin
          for d:=2 to 7 do
          begin
            if c-d > 0 then
            begin
              if aBoard[b][c-d] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b][c-d] <> 1 then break;
            end;
          end;
        end;
      end;

      if b < 7 then
      begin
        if aBoard[b+1][c] = 1 then
        begin
          for d:= 2 to 7 do
          begin
            if b+d < 9 then
            begin
              if aBoard[b+d][c] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b+d][c] <> 1 then break;
            end;
          end;
        end;
      end;

      if b > 2 then
      begin
        if aBoard[b-1][c] = 1 then
        begin
          for d := 2 to 7 do
          begin
            if b - d > 0 then
            begin
              if aBoard[b-d][c] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b-d][c] <> 1 then break;
            end;
          end;
        end;
      end;

      if (b > 2) and (c > 2) then
      begin
        if aBoard[b-1][c-1] = 1 then
        begin
          for d := 2 to 7 do
          begin
            if (b - d > 0) and (c - d > 0) then
            begin
              if aBoard[b-d][c-d] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b-d][c-d] <> 1 then break;
            end;
          end;
        end;
      end;

      if (b < 7) and (c < 7) then
      begin
        if aBoard[b+1][c+1] = 1 then
        begin
          for d := 2 to 7 do
          begin
            if (b + d < 9) and (c + d < 9) then
            begin
              if aBoard[b+d][c+d] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b+d][c+d] <> 1 then break;
            end;
          end;
        end;
      end;

      if (b > 2) and (c < 7) then
      begin
        if aBoard[b-1][c+1] = 1 then
        begin
          for d := 2 to 7 do
          begin
            if (b - d > 0) and (c + d < 9) then
            begin
              if aBoard[b-d][c+d] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b-d][c+d] <> 1 then break;
            end;
          end;
        end;
      end;

      if (b < 7) and (c > 2) then
      begin
        if aBoard[b+1][c-1] = 1 then
        begin
          for d := 2 to 7 do
          begin
            if (b + d < 9) and (c - d > 0) then
            begin
              if aBoard[b+d][c-d] = -1 then
              begin
                temp.Moves[temp.Count] := 8*c+b-8;
                inc(temp.Count);
                goto lbl_next_black;
              end
              else if aBoard[b+d][c-d] <> 1 then break;
            end;
          end;
        end;
      end;

      lbl_next_black:;
    end;
end;

procedure TForm1.MakeRedMove(const aBoard:Tboard;var temp:TStringList);
var b,c,d:integer;
Label nextpeace;
begin
 //  aBoard is for ai work
  temp.clear;
  for b:=1 to 8 do
  for c:=1 to 8 do
  begin
    if aboard[b,c] <> 0 then
      goto nextpeace;
    //from left to right
      if c < 7 then if aboard[b][c+1] = -1 then
      begin
        for d:=2 to 7 do
        begin
          if c+d < 9 then
          begin
            if aboard[b][c+d] = 1 then
            begin
                temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b][c+d] <> -1 then break;
          end;
        end;
      end;


    if c > 2  then // from right to left
    begin
      if aboard[b][c-1] = -1 then
      begin
        for d:=2 to 7 do
        begin
          if c-d > 0 then
          begin
            if aboard[b][c-d] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b][c-d] <> -1 then break;
          end;
        end;
      end;
    end;

    if b < 7  then //from top to bottom
    begin
      if aboard[b+1][c] = -1 then
      begin
        for d:= 2 to 7 do
        begin
          if b+d < 9 then
          begin
            if aboard[b+d][c] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;;
            end
            else if aboard[b+d][c] <> -1 then break;
          end;
        end;
      end;
    end;

    if b > 2 then //from bottom to top
    begin
      if aboard[b-1][c] = -1 then
      begin
        for d := 2 to 7 do
        begin
          if b - d > 0 then
          begin
            if aboard[b-d][c] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;;
            end
            else if aboard[b-d][c] <> -1 then break;
          end;
        end;
      end;
    end;

    if (b < 7) and (c < 7) then //from left top and right bottom
    begin
      if aboard[b+1][c+1] = -1 then
      begin
        for d:= 2 to 7 do
        begin
          if (b+d < 9) and (c+d < 9) then
          begin
            if aboard[b+d][c+d] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;;
            end
            else if aboard[b+d][c+d] <> -1 then break;
          end;
        end;
      end;
    end;

    if (b > 2) and (c > 2) then //from right bottom to left top
    begin
      if aboard[b-1][c-1] = -1 then
      begin
        for d:= 2 to 7 do
        begin
          if (b-d > 0) and (c-d > 0) then
          begin
            if aboard[b-d][c-d] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b-d][c-d] <> -1 then break;
          end;
        end;
      end;
    end;

    if (b < 7) and (c > 2) then //from left bottom to right top
    begin
      if aboard[b+1][c-1] = -1 then
      begin
        for d :=2 to 7 do
        begin
          if (b+d < 9) and (c-d > 0) then
          begin
            if aboard[b+d][c-d] = 1 then
            begin
              temp.add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b+d][c-d] <> -1 then break;
          end;
        end;
      end;
    end;

    if (b > 2) and (c < 7) then //from right top to left bottom
    begin
      if aboard[b-1][c+1] = -1 then
      begin
        for d :=2 to 7 do
        begin
          if (b-d > 0) and (c+d < 9) then
          begin
            if aboard[b-d][c+d] = 1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b-d][c+d] <> -1 then goto nextpeace;
          end;
        end;
      end;
    end;
    nextpeace:
  end;
end;


procedure TForm1.MakeblackMove(const aBoard:Tboard;var temp:TStringList);
var b,c,d:integer;
Label nextpeace;
begin

// make all unplayed box
  temp.Clear;
  for b:=1 to 8 do
  for c:=1 to 8 do
  begin
    if aboard[b,c] <> 0 then
      Continue;
    //from left to right

      if c < 7 then if aboard[b][c+1] = 1 then
      begin
        for d:=2 to 7 do
        begin
          if c+d < 9 then
          begin
            if aboard[b][c+d] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;;
            end
            else if aboard[b][c+d] <> 1 then break;
          end;
        end;
      end;

    if c > 2 then // from right to left
    begin
      if aboard[b][c-1] = 1 then
      begin
        for d:=2 to 7 do
        begin
          if c-d > 0 then
          begin
            if aboard[b][c-d] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b][c-d] <> 1 then break;
          end;
        end;
      end;
    end;

    if b <7 then //from top to bottom
    begin
      if aboard[b+1][c] = 1 then
      begin
        for d:= 2 to 7 do
        begin
          if b+d < 9 then
          begin
            if aboard[b+d][c] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b+d][c] <> 1 then break;
          end;
        end;
      end;
    end;

    if b > 2 then //from bottom to top
    begin
      if aboard[b-1][c] = 1 then
      begin
        for d := 2 to 7 do
        begin
          if b - d > 0 then
          begin
            if aboard[b-d][c] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;;
            end
            else if aboard[b-d][c] <> 1 then
              break;
          end;
        end;
      end;
    end;

    if (b < 7) and (c < 7) then //from left top and right bottom
    begin
      if aboard[b+1][c+1] = 1 then
      begin
        for d:= 2 to 7 do
        begin
          if (b+d < 9) and (c+d < 9) then
          begin
            if aboard[b+d][c+d] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b+d][c+d] <> 1 then break;
          end;
        end;
      end;
    end;

    if (b > 2) and (c > 2) then //from right bottom to left top
    begin
      if aboard[b-1][c-1] = 1 then
      begin
        for d:= 2 to 7 do
        begin
          if (b-d > 0) and (c-d > 0) then
          begin
            if aboard[b-d][c-d] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b-d][c-d] <> 1 then break;
          end;
        end;
      end;
    end;

    if (b < 7) and (c > 2) then //from left bottom to right top
    begin
      if aboard[b+1][c-1] = 1 then
      begin
        for d :=2 to 7 do
        begin
          if (b+d < 9) and (c-d > 0) then
          begin
            if aboard[b+d][c-d] = -1 then
            begin
              temp.add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b+d][c-d] <> 1 then break;
          end;
        end;
      end;
    end;

    if (b > 2) and (c < 7) then //from right top to left bottom
    begin
      if aboard[b-1][c+1] = 1 then
      begin
        for d :=2 to 7 do
        begin
          if (b-d > 0) and (c+d < 9) then
          begin
            if aboard[b-d][c+d] = -1 then
            begin
              temp.Add(IntTostr(8*c+b-8));
              goto nextpeace;
            end
            else if aboard[b-d][c+d] <> 1 then goto nextpeace;
          end;
        end;
      end;
    end;
    nextpeace:
  end;
end;
//end of aimove

procedure TForm1.MakeClick(t:Tstringlist;Player:string);
var a:integer;
begin
  for a:= 0 to t.Count-1 do
    t[a]:='Image'+ t[a];
  redlist.Clear;
  blacklist.Clear;
  if player = 'player1' then
  begin
    for a:= 0 to t.Count-1 do
      redlist.Add(t[a]);
  end
  else begin
    for a:= 0 to t.Count-1 do
      blacklist.Add(t[a]);
  end;
end;

procedure TForm1.RedBoardUpdate(var Aboard:Tboard;LastChess:Integer);
var a,b,c,d:integer;
begin
  a:= LastChess;
  c:= a div 8 +1 ;
  b:= a mod 8;
//  if c = 0 then
//    Aboard[b-1][8] := 1
//  else

  if b = 0 then
  begin
    c:=c-1;
    b:=8;
  end;
//  }
  Aboard[b][c] := 1;
  // left

  if c > 2 then
  begin
    if (Aboard[b][c-1] = -1) and (Aboard[b][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b][c-d] = -1) do
        inc(d);
      if Aboard[b][c-d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b][c-a] := 1;
      end;
    end;
  end;



  // right test

  if c < 7 then
  begin
    if (Aboard[b][c+1] = -1) and (Aboard[b][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b][c+d] = -1) do
        inc(d);
      if Aboard[b][c+d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b][c+a] := 1;
      end;
    end;
  end;



  //top test

  if b > 2 then
  begin
    if (Aboard[b-1][c] = -1) and (Aboard[b-2][c] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c] = -1) do
        inc(d);
      if Aboard[b-d][c] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c] := 1;
      end;
    end;
  end;


   // bottom test

  if b < 7 then
  begin
    if (Aboard[b+1][c] = -1) and (Aboard[b+2][c] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c] = -1) do
        inc(d);
      if Aboard[b+d][c] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c] := 1;
      end;
    end;
  end;



  // left top test

  if (b-2>0) and (c-2 > 0) then
  begin
    if (Aboard[b-1][c-1] = -1) and (Aboard[b-2][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c-d] = -1) do
        inc(d);
      if Aboard[b-d][c-d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c-a] := 1;
      end;
    end;
  end;



//   left bottom test

  if (b < 7) and (c > 2) then
  begin
    if (Aboard[b+1][c-1] = -1) and (Aboard[b+2][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c-d] = -1) do
        inc(d);
      if Aboard[b+d][c-d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c-a] := 1;
      end;
    end;
  end;


  // right bottom test

  if (b < 7) and (c < 7) then
  begin
    if (Aboard[b+1][c+1] = -1) and (Aboard[b+2][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c+d] = -1) do
        inc(d);
      if Aboard[b+d][c+d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c+a] := 1;
      end;
    end;
  end;



// right top fixed 2 nd

  if (b-2>0) and (c+2<9) then
  begin
    if (Aboard[b-1][c+1] = -1) and (Aboard[b-2][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c+d] = -1) do
        inc(d);
      if Aboard[b-d][c+d] = 1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c+a] := 1;
      end;
    end;
  end;

  // give another play
end;

procedure TForm1.RedChessClick(Sender: TObject);
// update chess
var a,b,c:integer;templist:tstringlist;
begin
  // clean the t
  For a:= 0 to Redlist.Count-1 do
  begin
//
//    if TWinControl(FindComponent(Redlist[a])) <> TWinControl(Sender) then
//    begin
      Timage(FindComponent(Redlist[a])).picture := nil;
      Timage(FindComponent(Redlist[a])).onclick := nil;
//    end;
  end;
 // clean move
  Timage(Sender).Picture := Chess2.Picture;
  Timage(Sender).OnClick := nil;

  if notinback = true then
  begin
    c:=movedlist.Add('Red');
  for a:=1 to 8 do
    for b:=1 to 8 do
      movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
  end;
  a:=StrToint(Copy(TComponent(Sender).name,6,2));
// temp fix wrong ?
  b:= a div 8 +1 ;
  c:= a mod 8;
  if c = 0 then
  begin
    b:=b-1;
    c:=8;
  end;
//  a := (c-1)*8 + b;
    board[c][b] := 1;

  if notinback = true then
  begin
    if c <> 0 then
      StepListbox.Items.Add('Red '+intTostr(c)+','+inttostr(b))
    else
      StepListbox.Items.Add('Red 8,'+inttostr(b-1));
  end;
  if StepListBox.items.count > 1 then
    BackButton.enabled:=True;
  StepListbox.ItemIndex:=StepListbox.items.Count-1;
  redlist.Clear;
  blacklist.Clear;
  score(board,b,c);
  if b + c < 4 then
  begin
    Label3.Caption:=intTostr(b);
    Label4.Caption:=intTostr(c);
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := BlackChessClick;
       Image28.Picture := BlackChess.Picture;
       Blacklist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := BlackChessClick;
       Image29.Picture := BlackChess.Picture;
       Blacklist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := BlackChessClick;
       Image36.Picture := BlackChess.Picture;
       Blacklist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := BlackChessClick;
       Image37.Picture := BlackChess.Picture;
       Blacklist.Add('Image37');
       templist.Add('Image37');
    end;
    a := Random(templist.Count);
    if HumanVsComputer.Checked = true then
      blackChessclick(Timage(FindComponent(templist[a])));
     templist.Free;
    exit;
  end;
  RedboardUpdate(board,a);
  Score(board,b,c);
  Label3.Caption:=intTostr(b);
  Label4.Caption:=intTostr(c);
  templist := Tstringlist.Create;
  // give another play
  MakeBlackMove(board,templist);
  if templist.Count > 0 then
  begin
    MakeClick(templist,'player2');
    RedNoMove:=False;
    BlackNoMove:=False;
    Updateboard;
    if (HumanVsComputer.Checked = true) and (FirstIsRed = true) or (ComputerVsHuman.Checked = true) and (FirstIsRed = false) then
    begin
      Application.ProcessMessages;
      Sleep(2000);
      BlackChessclick(Timage(FindComponent(AI(board,False))));
//      Updateboard; AiMoveList
    end;
  end
  else
  begin
    if notinback =False then
      exit;
    StepListBox.Items.Add('Black pass');
    c:=movedlist.Add('Blackpass');
    for a:=1 to 8 do
      for b:=1 to 8 do
      movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
    if StepListBox.items.count > 1 then
      backbutton.enabled:=True;
    if RedNoMove = True then
    begin
      Updateboard;
      score(board,a,b);
      if a < b Then
        ShowMessage('Both no more move,finish game'+#13+'Red win')
      else if a < b then
        ShowMessage('Both no more move,finish game'+#13+'Black win')
      else if a = b then
        ShowMessage('Both no more move,finish game'+#13+'Draw');
    end
    else begin
      Updateboard;
      templist.Clear;
      if a+b <> 64 then
        ShowMessage('Black no move');
      MakeRedMove(board,templist);
      if templist.Count > 0 then
      begin
        MakeClick(templist,'player1');
        RedNoMove:=False;
        BlackNoMove:=False;
        Updateboard;
//        if ComputerVsHuman.Checked = true then
        if (ComputerVsHuman.Checked = true) and (FirstIsRed = true) then
        begin
          Application.ProcessMessages;
          Sleep(2000);
//        RedChessclick(Timage(FindComponent(templist[0])));
          RedChessclick(Timage(FindComponent(AI(board,True))));
//          Updateboard;
        end;
      end
      else begin
        if NotInBack = True then
        begin
        StepListBox.Items.Add('Red pass');
        c:=movedlist.Add('Redpass');
        for a:=1 to 8 do
         for b:=1 to 8 do
        movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
        end;
        if StepListBox.items.count > 1 then
          backbutton.enabled:=True;
        score(board,a,b);
        if a < b Then
          ShowMessage('Both no more move,finish game'+#13+'Red win')
        else if a > b then
          ShowMessage('Both no more move,finish game'+#13+'Black win')
        else if a = b then
          ShowMessage('Both no more move,finish game'+#13+'Draw');
      end;
    end;
  end;
  templist.Free;
end;

procedure TForm1.Score(const Aboard:Tboard;var RedScore,BlackScore:integer);
var a,b:integer;
begin
  RedScore:=0;
  BlackScore:=0;
  for a:= 1 to 8 do
  begin
    for b:= 1 to 8 do
    begin
      if Aboard[a][b] = 1 then inc(RedScore)
      else if Aboard[a][b] = -1 then inc(BlackScore)
    end;
  end;
end;

procedure TForm1.Updateboard;
var a,b:integer;
begin
// draw general picture
  for a:= 1 to 8 do
    for b:= 1 to 8 do
    begin
      if board[a,b] = 1 then
        Timage(FindComponent('image'+intTostr(8*b+a-8))).picture := Chess2.picture
      else if board[a,b] = -1 then
        Timage(FindComponent('image'+intTostr(8*b+a-8))).picture := Chess1.picture
      else if board[a,b] = 0 then
        Timage(FindComponent('image'+intTostr(8*b+a-8))).picture := nil;
      Timage(FindComponent('image'+intTostr(8*b+a-8))).onclick := nil;
    end;
// draw red picture

//  for a:=0 to movelist.Lines.Count-1 do
  for a:=0 to Redlist.Count-1 do
  begin
    Timage(FindComponent(Redlist[a])).picture := Redchess.picture;
    Timage(FindComponent(Redlist[a])).OnClick := Redchess.onclick;
//    Timage(FindComponent(movelist.Lines[a])).picture := Redchess.picture;
//    Timage(FindComponent(movelist.Lines[a])).OnClick := Redchess.onclick;
  end;
//  for a:=0 to movelist.Lines.Count-1 do
  for a:=0 to Blacklist.Count-1 do
  begin
    Timage(FindComponent(Blacklist[a])).picture := BlackChess.picture;
    Timage(FindComponent(Blacklist[a])).OnClick := BlackChess.onclick;
//    Timage(FindComponent(Blacklist.Lines[a])).picture := Chess4.picture;
//    Timage(FindComponent(Blacklist.Lines[a])).OnClick := chess4.onclick;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if FCudaContext <> nil then
    cuCtxDestroy(FCudaContext);
 // 唔用就釋放番
  Redlist.Free;
  Blacklist.Free;
//  AiMoveList.Free;
  Movedlist.Free;
end;

procedure TForm1.HumanFirstButtonClick(Sender: TObject);
begin
  HumanVsHumanButtonClick(nil);
  HumanVsComputer.click;
end;

procedure TForm1.HumanVsHumanButtonClick(Sender: TObject);
var a,b:integer;
begin
  HumanvsHuman.Checked :=True;
  HumanVsComputer.Checked :=False;
  ComputerVsHuman.Checked :=False;
  redlist.Clear;
  blacklist.Clear;
  StepListBox.items.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  backbutton.Checked:=false;
  for a:= 1 to 8 do
    for b:= 1 to 8 do
    begin
      board[a][b]:=0;
      Timage(FindComponent('image'+intTostr(8*a+b-8))).picture := nil;
      Timage(FindComponent('image'+intTostr(8*a+b-8))).Onclick := nil;
    end;

  Image28.picture := RedChess.Picture;
  Image29.picture := RedChess.Picture;
  Image36.picture := RedChess.Picture;
  Image37.picture := RedChess.Picture;
  Image28.OnClick := RedChess.OnClick;
  Image29.OnClick := RedChess.OnClick;
  Image36.OnClick := RedChess.OnClick;
  Image37.OnClick := RedChess.OnClick;

  Redlist.Add('Image28');
  Redlist.Add('Image29');
  Redlist.Add('Image36');
  Redlist.Add('Image37');
  Label3.Caption:='0';
  Label4.Caption:='0';
  end;
procedure TForm1.HumanvsHumanClick(Sender: TObject);
begin
  HumanVsComputer.checked :=False;
  ComputerVsHuman.checked :=False;
  HumanvsHuman.checked :=True;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.RuleButtonClick(Sender: TObject);
begin
  Showmessage('Rule:The player who has more pieces on the board when the game is finished, loses the game');
end;

procedure TForm1.Startposition1ButtonClick(Sender: TObject);
var a,b:integer;
begin
//  RedMove:=True;
  for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=-1;
  Initboard[4][5]:=1;
  Initboard[5][4]:=1;
  Initboard[5][5]:=-1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;
  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  {
  Image28.picture := chess1.Picture;
  Image29.picture := chess2.Picture;
  Image36.picture := chess2.Picture;
  Image37.picture := chess1.Picture;
  Image20.picture := Redchess.picture;
  Image38.picture := Redchess.picture;
  Image27.picture := Redchess.picture;
  Image45.picture := Redchess.picture;
  }
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image20');
  Redlist.Add('Image38');
  Redlist.Add('Image27');
  Redlist.Add('Image45');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;

procedure TForm1.Startposition2ButtonClick(Sender: TObject);
var a,b:integer;
begin
 for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=-1;
  Initboard[4][5]:=-1;
  Initboard[5][4]:=1;
  Initboard[5][5]:=1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;

  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image19');
  Redlist.Add('Image27');
  Redlist.Add('Image35');
  Redlist.Add('Image43');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;

procedure TForm1.Startposition3ButtonClick(Sender: TObject);
var a,b:integer;
begin
 for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=1;
  Initboard[4][5]:=-1;
  Initboard[5][4]:=-1;
  Initboard[5][5]:=1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;
  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image30');
  Redlist.Add('Image21');
  Redlist.Add('Image35');
  Redlist.Add('Image44');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;


procedure TForm1.Startposition4ButtonClick(Sender: TObject);
var a,b:integer;
begin
 for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=1;
  Initboard[4][5]:=1;
  Initboard[5][4]:=-1;
  Initboard[5][5]:=-1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;

  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image22');
  Redlist.Add('Image30');
  Redlist.Add('Image38');
  Redlist.Add('Image46');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;

procedure TForm1.Startposition6uttonClick(Sender: TObject);
var a,b:integer;
begin
 for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=-1;
  Initboard[4][5]:=1;
  Initboard[5][4]:=-1;
  Initboard[5][5]:=1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;

  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image19');
  Redlist.Add('Image20');
  Redlist.Add('Image21');
  Redlist.Add('Image22');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;

procedure TForm1.StartpositionButtonClick(Sender: TObject);
var a,b:integer;
begin
 for a:= 1 to 8 do
    for b:= 1 to 8 do
      Initboard[a][b]:=0;
  Initboard[4][4]:=1;
  Initboard[4][5]:=-1;
  Initboard[5][4]:=1;
  Initboard[5][5]:=-1;

  board:=Initboard;
  FirstIsRed:=True;
  NotinBack:=True;

  Redlist.Clear;
  Blacklist.Clear;
  movedlist.Clear;
  RedNoMove:=False;
  BlackNoMove:=false;
  Image20.OnClick := Redchess.OnClick;
  Image38.OnClick := Redchess.OnClick;
  Image27.OnClick := Redchess.OnClick;
  Image45.OnClick := Redchess.OnClick;
  Redlist.Add('Image43');
  Redlist.Add('Image44');
  Redlist.Add('Image45');
  Redlist.Add('Image46');
  Label3.Caption:='2';
  Label4.Caption:='2';
  Updateboard;
end;

procedure TForm1.StopThinkButtonClick(Sender: TObject);
begin
  StopThink:=True;
end;

procedure TForm1.BlackBoardUpdate(var Aboard:Tboard;LastChess:Integer);
// update chess
var a,b,c,d:integer;
begin
  a:=LastChess;
  c:= a div 8 +1 ;
  b:= a mod 8;
//  if c = 0 then
//    Aboard[b-1][8] := -1

  if b = 0 then
  begin
    c:=c-1;
    b:=8;
  end;

//  else
    Aboard[b][c] := -1;
  // left

  if c > 2 then
  begin
    if (Aboard[b][c-1] = 1) and (Aboard[b][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b][c-d] = 1) do
        inc(d);
      if Aboard[b][c-d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b][c-a] := -1;
      end;
    end;
  end;



  // right test

  if c < 7 then
  begin
    if (Aboard[b][c+1] = 1) and (Aboard[b][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b][c+d] = 1) do
        inc(d);
      if Aboard[b][c+d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b][c+a] := -1;
      end;
    end;
  end;


  //top corrected test

  if b > 2 then
  begin
    if (Aboard[b-1][c] = 1) and (Aboard[b-2][c] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c] = 1) do
        inc(d);
      if Aboard[b-d][c] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c] := -1;
      end;
    end;
  end;



   // bottom test

  if b< 7 then
  begin
    if (Aboard[b+1][c] = 1) and (Aboard[b+2][c] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c] = 1) do
        inc(d);
      if Aboard[b+d][c] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c] := -1;
      end;
    end;
  end;



  // left top test

  if (b-2>0) and (c-2>0) then
  begin
    if (Aboard[b-1][c-1] = 1) and (Aboard[b-2][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c-d] = 1) do
        inc(d);
      if Aboard[b-d][c-d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c-a] := -1;
      end;
    end;
  end;


//   left bottom test

  if (b+2<9) and (c-2>0) then
  begin
    if (Aboard[b+1][c-1] = 1) and (Aboard[b+2][c-2] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c-d] = 1) do
        inc(d);
      if Aboard[b+d][c-d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c-a] := -1;
      end;
    end;
  end;


  // right bottom  test

  if (b+2<9) and (c+2<9) then
  begin
    if (Aboard[b+1][c+1] = 1) and (Aboard[b+2][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b+d][c+d] = 1) do
        inc(d);
      if Aboard[b+d][c+d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b+a][c+a] := -1;
      end;
    end;
  end;


// right top fixed 2 nd

  if (b-2>0) and (c+2<9) then
  begin
    if (Aboard[b-1][c+1] = 1) and (Aboard[b-2][c+2] <> 0) then
    begin
      d:=1;
      while (Aboard[b-d][c+d] = 1) do
        inc(d);
      if Aboard[b-d][c+d] = -1 then
      begin
        for a := 1 to d-1 do
          Aboard[b-a][c+a] := -1;
      end;
    end;
  end;
end;


procedure TForm1.BlackChessClick(Sender: TObject);
// update chess
var a,b,c:integer;templist:Tstringlist;
begin
  // clean the made move
  For a:= 0 to Blacklist.Count-1 do
  begin
//    if TWinControl(FindComponent(Blacklist[a])) <> TWinControl(Sender) then
//    begin
      Timage(FindComponent(Blacklist[a])).picture := nil;
      Timage(FindComponent(Blacklist[a])).onclick := nil;
//    end;
  end;
  // clean move
    Timage(Sender).Picture := Chess1.Picture;
    Timage(Sender).OnClick := nil;
  if notinback = true then
  begin
    c:=movedlist.Add('Black');
    for a:=1 to 8 do
    for b:=1 to 8 do
      movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
  end;

  a:=StrToint(Copy(TComponent(Sender).name,6,2));
// tempfix
  b:= a div 8 +1 ;
  c:= a mod 8;
  if c = 0 then
  begin
    b:=b-1;
    c:=8;
  end;
//  a := (c-1)*8 + b;
  board[c][b] := -1;
  if notinback = true then
  begin
    if c <> 0 then
      StepListbox.Items.Add('Black '+intTostr(c)+','+inttostr(b))
    else
      StepListbox.Items.Add('Black 8,'+inttostr(b-1));
   end;
   if StepListBox.items.count > 1 then
      backbutton.enabled:=True;
  StepListbox.ItemIndex:=StepListbox.items.Count-1;
   redlist.clear;
  blacklist.Clear;
  Score(board,b,c);
  if b + c < 4 then
  begin
    Label3.Caption:=intTostr(b);
    Label4.Caption:=intTostr(c);
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := RedChessClick;
       Image28.Picture := RedChess.Picture;
       Blacklist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := RedChessClick;
       Image29.Picture := RedChess.Picture;
       Blacklist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := RedChessClick;
       Image36.Picture := RedChess.Picture;
       Blacklist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := RedChessClick;
       Image37.Picture := RedChess.Picture;
       Blacklist.Add('Image37');
       templist.Add('Image37');
    end;
    a := Random(templist.Count);
    if ComputerVsHuman.Checked = true then
      RedChessclick(Timage(FindComponent(templist[a])));
     templist.Free;
    exit;
  end;
  BlackBoardUpdate(board,a);
  Score(board,b,c);
  Label3.Caption:=intTostr(b);
  Label4.Caption:=intTostr(c);
  templist:= Tstringlist.Create;
  MakeRedMove(board,templist);
  if templist.Count >0 then
  begin
    RedNoMove:=False;
    BlackNoMove:=False;
    MakeClick(templist,'player1');
    Updateboard;
//    if ComputerVsHuman.Checked = true then
    if (HumanVsComputer.Checked = true) and (FirstIsRed = false) or (ComputerVsHuman.Checked = True) and (FirstIsRed = true) then
    begin
      Application.ProcessMessages;
      Sleep(2000);
//      RedChessclick(Timage(FindComponent(templist[0])));
      RedChessclick(Timage(FindComponent(AI(board,true))));
 //     Updateboard;
    end;
  end
  else begin
    if notinback =False then
      exit;
    StepListBox.Items.Add('Red pass');
    c:=movedlist.Add('Red');
    for a:=1 to 8 do
     for b:=1 to 8 do
    movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
//may be correcteed
    if RedNoMove = True then
    begin
      Updateboard;
      score(board,a,b);
      if a < b Then
        ShowMessage('Both no more move,finish game'+#13+'Red win')
      else if a > b then
        ShowMessage('Both no more move,finish game'+#13+'Black win')
      else if a = b then
        ShowMessage('Both no more move,finish game'+#13+'Draw');
    end
    else begin
      Updateboard;
      if a+b <> 64 then
        ShowMessage('Red pass');
      templist.clear;
      MakeBlackMove(board,templist);
      if templist.Count > 0 then
      begin
        MakeClick(templist,'player2');
        RedNoMove:=False;
        BlackNoMove:=False;
       Updateboard;

    if (HumanVsComputer.Checked = true) and (FirstIsRed = true) or (HumanVsHuman.Checked = false) and (HumanVsComputer.Checked = false) and (FirstIsRed = true) then
        begin
          Application.ProcessMessages;
          Sleep(2000);
          BlackChessclick(Timage(FindComponent(AI(board,False))));
        end;
      end
      else begin
      if NotInback = True then
      begin
        StepListBox.Items.Add('Black pass');
        c:=movedlist.Add('Black');
        for a:=1 to 8 do
         for b:=1 to 8 do
        movedlist[c]:=movedlist[c]+intTostr(board[a][b]+1);
      end;
      score(board,a,b);
      //corrected
      if a < b Then
        ShowMessage('Both no more move,finish game'+#13+'Red win')
      else if a > b then
        ShowMessage('Both no more move,finish game'+#13+'Black win')
      else if a = b then
        ShowMessage('Both no more move,finish game'+#13+'Draw');
      end;
    end;
  end;
  templist.Free;
end;
procedure TForm1.ClosebuttonClick(Sender: TObject);
begin
  Form1.Close;
end;


procedure TForm1.SaveButtonClick(Sender: TObject);
var a,b:integer;c:string;f:textfile;
begin
  SaveDialog1.Filter :='Apple game files (*.txt)|*.TXT';
  if SaveDialog1.Execute then
  begin
    assignfile(f,SaveDialog1.FileName);
    try
      Rewrite(f);
      Writeln(F,'Anti Reversi 8x8');
      Writeln(F,'Initboard');
      for b:=1 to 8 do
      begin
        c:='';
        for a:=1 to 8 do
          c:=c+intTostr(initboard[a][b]+1);
        Writeln(F,c);
      end;
      Writeln(F,'Mode');
      if HumanVsComputer.Checked then
      begin
        c:= extractfilename(savedialog1.FileName);
        redlabel.Caption := copy(c,1,length(c)-4);
//        redlabel.Caption := extractfilename(savedialog1.FileName);
        blacklabel.Caption := 'Computer';
        Writeln(F,'HumanVSComputer');
      end
      else if ComputerVsHuman.Checked then
      begin
        c:= extractfilename(savedialog1.FileName);
        blacklabel.Caption := copy(c,1,length(c)-4);

//        blacklabel.Caption := extractfilename(savedialog1.FileName);
        redlabel.Caption := 'Computer';
        Writeln(F,'ComputerVSHuman');
      end
      else begin
        redlabel.Caption := 'Computer';
        blacklabel.Caption := 'Computer';
        Writeln(F,'HumanVSHuman');
      end;
      if FirstIsRed = true then
        Writeln(F,'Red first')
      else
        Writeln(F,'Black first');
      for a:= 0 to steplistbox.Items.Count-1 do
        Writeln(f,steplistbox.items[a]);
    finally
      closefile(f);
    end;
  end;
end;


Function TForm1.BoardtoFen:String;
var x,y,t:integer;
begin
//abc
  Result:='';
  for y:= 1 to 8 do
  begin
    t:=0;
    for x:= 1 to 8 do
    begin
       if initboard[x][y] = 0 then
          inc(t)
       else if initboard[x][y] = -1 then
       begin
          if t <> 0 then
            Result:= Result + inttostr(t) + 'B'
          else
            Result:= Result +'B';
          t:=0;
       end
       else if initboard[x][y] = 1 then
       begin
          if t <> 0 then
            Result:= Result + inttostr(t) + 'R'
          else
            Result:= Result + 'R';
          t:=0;
       end;
    end;
    if y  <> 8 then
    begin
      if t = 0 then
        Result := Result + '/'
      else
        Result := Result + inttostr(t) +'/';
    end
    else begin
      if t <> 0 then
        Result := Result + inttostr(t);
    end;

  end;

end;

procedure TForm1.CopyToClipboardButtonClick(Sender: TObject);
begin
  Clipboard.AsText := StepListBox.Items.Text;
end;

procedure TForm1.ChessRadioGroupClick(Sender: TObject);
var a,b:integer;
begin
  if ChessRadioGroup.ItemIndex = 0 then
  begin
    for a:=1 to 8 do
    begin
      for b:=1 to 8 do
        Timage(FindComponent('image'+intTostr(8*a+b-8))).Onclick := Chess2Click;
    end;
  end
  else if ChessRadioGroup.ItemIndex = 1 then begin
    for a:=1 to 8 do
    begin
      for b:=1 to 8 do
        Timage(FindComponent('image'+intTostr(8*a+b-8))).Onclick := Chess1Click;
    end;
  end
  else if ChessRadioGroup.ItemIndex = 2 then begin
    for a:=1 to 8 do
    begin
      for b:=1 to 8 do
        Timage(FindComponent('image'+intTostr(8*a+b-8))).Onclick := deletechess;
    end;
  end;
end;

procedure TForm1.Deletechess(Sender: TObject);
begin
  Timage(Sender).picture := nil;
  Timage(Sender).Tag := 0;
end;

procedure TForm1.Chess2Click(Sender: TObject);
begin
  Timage(Sender).picture := chess2.Picture;
  Timage(Sender).Tag := 1;
end;

procedure TForm1.ComputerVsHumanClick(Sender: TObject);
VAR b,c:integer;templist:Tstringlist;
begin
  HumanVsComputer.checked :=False;
  ComputerVsHuman.checked :=True;
  HumanvsHuman.checked :=False;
  if FirstIsRed then
  begin
    if StepListBox.Items.count = 0 then
      StepListBox.Items.add('temp');
    if  (StepListBox.Items[StepListBox.count-1] = 'temp') or (copy(StepListBox.Items[StepListBox.Items.count - 1],1,5) = 'Black') then
    begin
      if StepListBox.Items[StepListBox.count-1] = 'temp' then
        StepListBox.Clear;
      RedNoMove:=False;
      BlackNoMove:=False;
      Score(Board,b,c);
      if b+c > 3 then
      begin
        RedChessclick(Timage(FindComponent(AI(board,True))));
        Updateboard;
      end
      else begin
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := RedChessClick;
       Image28.Picture := RedChess.Picture;
       Redlist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := RedChessClick;
       Image29.Picture := RedChess.Picture;
       Redlist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := RedChessClick;
       Image36.Picture := RedChess.Picture;
       Redlist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := RedChessClick;
       Image37.Picture := RedChess.Picture;
       Redlist.Add('Image37');
       templist.Add('Image37');
    end;
    b := Random(templist.Count);
    if ComputerVSHuman.Checked = true then
    RedChessclick(Timage(FindComponent(templist[b])));
     templist.Free;
    exit;
      end;
    end;
  end

  else begin
    if  (StepListBox.Items.count = 0) or (copy(StepListBox.Items[StepListBox.Items.count - 1],1,5) = 'Black') then
    begin
      RedNoMove:=False;
      BlackNoMove:=False;
      Score(Board,b,c);
      if b+c > 4 then
      begin
      BlackChessclick(Timage(FindComponent(AI(board,false))));
      Updateboard;
      end
      else begin
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := BlackChessClick;
       Image28.Picture := BlackChess.Picture;
       Blacklist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := BlackChessClick;
       Image29.Picture := BlackChess.Picture;
       Blacklist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := BlackChessClick;
       Image36.Picture := BlackChess.Picture;
       Blacklist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := BlackChessClick;
       Image37.Picture := BlackChess.Picture;
       Blacklist.Add('Image37');
       templist.Add('Image37');
    end;
    b := Random(templist.Count);
    if ComputerVSHuman.Checked = true then
    BlackChessclick(Timage(FindComponent(templist[b])));
     templist.Free;
    exit;
      end;
    end;
  end;

end;



procedure TForm1.HumanVsComputerClick(Sender: TObject);
var b,c:integer;templist:Tstringlist;
begin
  HumanVsComputer.checked :=True;
  ComputerVsHuman.checked :=False;
  HumanvsHuman.checked :=False;
  if FirstIsRed then
  begin
    if  (StepListBox.Items.count = 0) Then exit;
    if copy(StepListBox.Items[StepListBox.Items.count - 1],1,3) = 'Red' then
    begin
      RedNoMove:=False;
      BlackNoMove:=False;
      Score(Board,b,c);
      if b+c > 4 then
      begin
      BlackChessclick(Timage(FindComponent(AI(board,False))));
      Updateboard;
      end
      else begin
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := BlackChessClick;
       Image28.Picture := BlackChess.Picture;
       Blacklist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := BlackChessClick;
       Image29.Picture := BlackChess.Picture;
       Blacklist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := BlackChessClick;
       Image36.Picture := BlackChess.Picture;
       Blacklist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := BlackChessClick;
       Image37.Picture := BlackChess.Picture;
       Blacklist.Add('Image37');
       templist.Add('Image37');
    end;
    b := Random(templist.Count);
    if HumanVsComputer.Checked = true then
    BlackChessClick(Timage(FindComponent(templist[b])));
     templist.Free;
    exit;
    end;
  end

  else begin
    if  (StepListBox.Items.count = 0) Then exit;
    if copy(StepListBox.Items[StepListBox.Items.count - 1],1,3) = 'Red' then
    begin
      RedNoMove:=False;
      BlackNoMove:=False;
      Score(Board,b,c);
      if b+c > 4 then
      begin
      RedChessclick(Timage(FindComponent(AI(board,True))));
      Updateboard;
      end
       else begin
    Image28.OnClick := nil;
    Image29.OnClick := nil;
    Image36.OnClick := nil;
    Image37.OnClick := nil;
    templist := Tstringlist.Create;
    if board[4][4] = 0 then
    begin
       Image28.OnClick := RedChessClick;
       Image28.Picture := RedChess.Picture;
       Redlist.Add('Image28');
       templist.Add('Image28');
    end;
    if board[5][4] = 0 then
    begin
       Image29.OnClick := RedChessClick;
       Image29.Picture := RedChess.Picture;
       Redlist.Add('Image29');
       templist.Add('Image29');
    end;
    if board[4][5] = 0 then
    begin
       Image36.OnClick := RedChessClick;
       Image36.Picture := RedChess.Picture;
       Redlist.Add('Image36');
       templist.Add('Image36');
    end;
    if board[5][5] = 0 then
    begin
       Image37.OnClick := RedChessClick;
       Image37.Picture := RedChess.Picture;
       Redlist.Add('Image37');
       templist.Add('Image37');
    end;
    b := Random(templist.Count);
    if HumanVsComputer.Checked = true then
    RedChessClick(Timage(FindComponent(templist[b])));
     templist.Free;
    exit;
    end;
    end;
  end;


  end;

end;
procedure TForm1.Chess1Click(Sender: TObject);
begin
  Timage(Sender).picture := chess1.Picture;
    Timage(Sender).Tag := -1;
end;

procedure TForm1.SetupBoardClick(Sender: TObject);
var a,b:integer;
begin
  form1.Tag:=0;
  restartbutton.Enabled:=False;
  if backbutton.Enabled = true then
  begin
    backbutton.Enabled:=false;
    form1.Tag:=1;
  end;
  savebutton.enabled:=false;
  loadbutton.Enabled:=False;
  ChessRadioGroup.Show;
  ClearButton.Show;
  MoveFirstRadioGroup.Show;
  SetupBoard.Enabled:=False;
  FinishSetupboard.Enabled:=True;
  CancelSetupBoard.Enabled:=True;
  if Redlist.Count > 0 then
  begin
    for a:= 0 to redlist.Count-1 do
      Timage(FindComponent(redlist[a])).picture := nil;
  end
  else if Blacklist.count >0 then
  begin
    for a:= 0 to Blacklist.Count-1 do
      Timage(FindComponent(blacklist[a])).picture := nil;
  end;
  For a:=1 to 8 do
  begin
    for b:=1 to 8 do
      Timage(FindComponent('image'+intTostr(8*b+a-8))).Tag:=board[a][b];
  end;


  if StepListBox.Items.Count=0 then
  begin
    if FirstIsRed=True then
     StepListBox.Items.Add('Black123')
   else
      StepListBox.Items.Add('Red123');
  end;

  if copy(StepListBox.Items[StepListBox.Items.Count-1],1,3) ='Red' then
  begin
    if StepListBox.Items[StepListBox.Items.Count-1] = 'Red123' then
      StepListBox.Items.Delete(StepListBox.Items.Count-1);
    MoveFirstRadioGroup.ItemIndex:= 1;
  end
  else begin
    if StepListBox.Items[StepListBox.Items.Count-1] = 'Black123' then
      StepListBox.Items.Delete(StepListBox.Items.Count-1);
    MoveFirstRadioGroup.ItemIndex:= 0;
  end;
  ChessRadioGroupClick(self);
end;

procedure TForm1.FinishSetupboardClick(Sender: TObject);
var a,b:integer;templist:Tstringlist;
begin
  form1.Tag:=0;
  templist := Tstringlist.Create;
  restartbutton.Enabled:=True;
  savebutton.enabled:=true;
  loadbutton.Enabled:=true;
  StepListBox.items.Clear;
  RedNoMove:=False;
  BlackNoMove:=False;
  HumanvsHuman.Checked:=True;
  SetupBoard.Enabled:=True;
  CancelSetupBoard.Enabled:=False;
  FinishSetupboard.Enabled:=False;
  MoveFirstRadioGroup.Hide;
  ChessRadioGroup.Hide;
  ClearButton.Hide;
  redlist.Clear;
  blacklist.Clear;
  BackButton.Enabled:=False;
  For a:=1 to 8 do
  begin
    For b:=1 to 8 do
    begin
     Initboard[a][b]:= Timage(FindComponent('image'+intTostr(8*b+a-8))).Tag;
     Timage(FindComponent('image'+intTostr(8*b+a-8))).Tag := 0;
    end;
  end;
  board:=Initboard;
  if MoveFirstRadioGroup.ItemIndex =0 then
  begin
    FirstIsRed:=True;
    MakeRedMove(board,templist);
    if templist.count > 0 then
    begin
      MakeClick(templist,'player1');
      Updateboard;
      score(board,a,b);
      label3.Caption:=intTostr(a);
      label4.caption:=intTostr(b);
    end
    else begin
      ShowMessage('Red no move');
      StepListBox.Items.Add('Red pass');
      RedNoMove:=True;
      Makeblackmove(board,templist);
      if templist.count > 0 then
      begin
        MakeClick(templist,'player2');
        Updateboard;
        score(board,a,b);
        label3.Caption:=intTostr(a);
        label4.caption:=intTostr(b);
      end
      else begin
        score(board,a,b);
        StepListBox.Items.Add('Black pass');
        if a > b Then
          ShowMessage('Both no more move,finish game'+#13+'Black win')
        else if a < b then
          ShowMessage('Both no more move,finish game'+#13+'Red win')
        else if a = b then
          ShowMessage('Both no more move,finish game'+#13+'Draw');
      end;
    end;
  end
  else if MoveFirstRadioGroup.ItemIndex =1 then begin
    FirstIsRed:=False;
    MakeBlackMove(board,templist);
    if templist.count > 0 then
    begin
      MakeClick(templist,'player2');
      Updateboard;
      score(board,a,b);
      label3.Caption:=intTostr(a);
      label4.caption:=intTostr(b);
    end
    else begin
      ShowMessage('Back no move');
      StepListBox.Items.Add('Black pass');
      BlackNoMove:=True;
      MakeRedmove(board,templist);
      if templist.count > 0 then
      begin
        MakeClick(templist,'player1');
        Updateboard;
        score(board,a,b);
        label3.Caption:=intTostr(a);
        label4.caption:=intTostr(b);
      end
      else begin
        ShowMessage('Red no move');
        StepListBox.Items.Add('Red pass');
        score(board,a,b);
        if a > b Then
          ShowMessage('Both no more move,finish game'+#13+'Black win')
        else if a < b then
          ShowMessage('Both no more move,finish game'+#13+'Red win')
        else if a = b then
          ShowMessage('Both no more move,finish game'+#13+'Draw');
      end;
    end;
  end;
  templist.Free;
end;

procedure TForm1.CancelSetupBoardClick(Sender: TObject);
var a,b:integer;templist:TStringList;
begin
  if form1.Tag=1 then
  begin
    backbutton.Enabled:=true;
    form1.Tag:=0;
  end;
  For a:=1 to 8 do
  begin
    for b:=1 to 8 do
    begin
      board[a][b]:=Timage(FindComponent('image'+intTostr(8*b+a-8))).Tag;
      Timage(FindComponent('image'+intTostr(8*b+a-8))).Tag:=0;
    end;
  end;
  HumanvsHuman.Checked:=true;
  SetupBoard.Enabled:=True;
  restartbutton.enabled:=True;
  CancelSetupBoard.Enabled:=False;
  FinishSetupboard.Enabled:=False;
  savebutton.enabled:=true;
  loadbutton.Enabled:=true;
  MoveFirstRadioGroup.Hide;
  ChessRadioGroup.Hide;
  ClearButton.Hide;
  templist := TStringList.Create;
  if StepListBox.Items.Count=0 then
  begin
    if FirstIsRed=True then
     StepListBox.Items.Add('Black123')
   else
      StepListBox.Items.Add('Red123');
  end;

  if copy(StepListBox.Items[StepListBox.Items.Count-1],1,3) ='Red' then
  begin
    if StepListBox.Items[StepListBox.Items.Count-1] = 'Red123' then
      StepListBox.Items.Delete(StepListBox.Items.Count-1);
    MakeBlackMove(board,templist);
    MakeClick(templist,'player2');
  end
  else begin
    if StepListBox.Items[StepListBox.Items.Count-1] = 'Black123' then
      StepListBox.Items.Delete(StepListBox.Items.Count-1);
    MakeRedMove(board,templist);
    MakeClick(templist,'player1');

  end;
  templist.Free;
  Updateboard;
end;

procedure TForm1.LoadButtonClick(Sender: TObject);
var a,h:string;b,c,d,e:integer;F:textfile;templist:Tstringlist;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
//    try
    Reset(f);
    readln(f,a);
    if a <>'Anti Reversi 8x8' then
    begin
      closefile(f);
      ShowMessage('Wrong file');
      exit;
    end;
    readln(f,a);
    blacklist.Clear;
    redlist.Clear;
    for b:=1 to 8 do
    begin
      readln(f,a);
      for c:= 1 to 8 do
        initboard[c][b]:= strToint(copy(a,c,1))-1; //need test
    end;
    readln(f,a);
    readln(f,h);
    readln(f,a);
    if a = 'Red first' then
      FirstIsRed:=True
    else
      FirstIsRed:=False;
    movedlist.clear;
    StepListBox.items.Clear;

//    readln(f,a);//need change
    while not eof(f) do
    begin
      readln(f,a);
      StepListBox.Items.Add(a);
     // need add ?
    end;
    closefile(f);
    board:=initboard;
    notInBack:=False;
    redlist.Clear;
    blacklist.Clear;
    HumanvsHuman.Checked:=true;
    ComputerVsHuman.Checked:=False;
    HumanVsComputer.Checked:=False;
    templist:= Tstringlist.Create;
    for b:= 0 to StepListBox.Items.count - 1 do
    begin
      if copy(StepListBox.Items[b],1,3) = 'Red' then
      begin
        if copy(StepListBox.Items[b],5,1) <> 'p' then//p for pass
        begin
          e:=movedlist.Add('Red');
          for c:=1 to 8 do
           for d:=1 to 8 do
             movedlist[e]:=movedlist[e]+intTostr(board[c][d]+1);
          c:= strtoint(copy(StepListBox.Items[b],5,1));
          d:= strtoint(copy(StepListBox.Items[b],7,1));
          MakeRedMove(board,templist);
          MakeClick(templist,'player1');
          RedChessClick(Timage(FindComponent('image'+intTostr(8*d+c-8))));
  //        redlist.Clear;
//          blacklist.Clear;
//          updateboard;
        end
        else begin
          e:=movedlist.Add('Redpass');
          for c:=1 to 8 do
          for d:=1 to 8 do
          movedlist[e]:=movedlist[e]+intTostr(board[c][d]+1);
        end;
      end
      else if copy(StepListBox.Items[b],1,5) = 'Black' then
      begin
        if copy(StepListBox.Items[b],7,1) <> 'p' then//p for pass
        begin
          e:=movedlist.Add('Black');
          for c:=1 to 8 do
           for d:=1 to 8 do
             movedlist[e]:=movedlist[e]+intTostr(board[c][d]+1);

          c:= strtoint(copy(StepListBox.Items[b],7,1));
          d:= strtoint(copy(StepListBox.Items[b],9,1));
          MakeRedMove(board,templist);
          MakeClick(templist,'player1');
          BlackChessClick(Timage(FindComponent('image'+intTostr(8*d+c-8))));
        end
        else begin
          e:=movedlist.Add('Blackpass');
          for c:=1 to 8 do
          for d:=1 to 8 do
          movedlist[e]:=movedlist[e]+intTostr(board[c][d]+1);
        end;
      end;
    end;

  SaveDialog1.FileName := OpenDialog1.FileName;
  notInBack:=True;
  if StepListBox.Items.Count = 0 then
  begin
    if FirstIsRed = true then
    begin
      MakeRedMove(board,templist);
      MakeClick(templist,'player1');
    end
    else begin
      MakeBlackMove(board,templist);
      MakeClick(templist,'player2');
    end;
  end;
  score(board,b,c);
  label3.Caption:=intTostr(b);
  label4.caption:=intTostr(c);
  if StepListBox.Items.Count < 2 then
    backbutton.Enabled:=False;
  notinback:=True;
  if h = 'HumanVSComputer' then
  begin
    HumanVSComputer.Click;
    h:= extractfilename(Opendialog1.FileName);
    redlabel.Caption:= copy(h,1,length(h)-4);
    blacklabel.Caption := 'Human';
  end
  else if h = 'ComputerVSHuman' then
  begin
    ComputerVSHuman.Click;
    h:= extractfilename(Opendialog1.FileName);
    blacklabel.Caption:= copy(h,1,length(h)-4);
    redlabel.Caption := 'Human';
  end
  else begin
    redlabel.Caption := 'Human';
    blacklabel.Caption := 'Human';
  end;
  Updateboard;
  templist.Free;
  end;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
var a,b:integer;
begin
   for a:=1 to 8 do
    begin
      for b:=1 to 8 do
      begin
        Timage(FindComponent('image'+intTostr(8*a+b-8))).picture := nil;
        Timage(FindComponent('image'+intTostr(8*a+b-8))).tag := 0;
      end;
    end;

end;

procedure TForm1.BackButtonClick(Sender: TObject);
var a,b,c:integer;templist:Tstringlist;
begin
 templist:= Tstringlist.Create;
  While true do
  begin
//    d:=True;
    a:= movedlist.count-1;

   if (copy(movedlist[a],1,7) = 'Redpass') and (copy(movedlist[a-1],1,9) <> 'Blackpass') then
       break;
   if (copy(movedlist[a],1,9) = 'Blackpass') and (copy(movedlist[a-1],1,7) <> 'Redpass') then
       break;
   if a < 2 then break;
   if (copy(movedlist[a],1,7) <> 'Redpass') and (copy(movedlist[a],1,9) <> 'Blackpass') and (copy(movedlist[a-2],1,7) <> 'Redpass') and (copy(movedlist[a-2],1,9) <> 'Blackpass') Then
     break;
    movedlist.Delete(movedlist.Count-1);
//    movedlist.Delete(movedlist.Count-1);
//    StepListBox.items.Delete(StepListBox.count-1);
    StepListBox.items.Delete(StepListBox.count-1);
  end;
  a:=movedlist.Count-2;
  if a > -1 then
  begin
    movedlist.Delete(movedlist.Count-1);
    StepListBox.items.Delete(StepListBox.count-1);
  end;
  if (StepListBox.items[StepListBox.count-1] = 'Red pass') or (StepListBox.items[StepListBox.count-3] = 'Black pass') then
  begin
   StepListBox.items.Delete(StepListBox.count-1);
   StepListBox.items.Delete(StepListBox.count-1);
   movedlist.Delete(movedlist.Count-1);
   movedlist.Delete(movedlist.Count-1);
  end;
   StepListBox.items.Delete(StepListBox.count-1);
  redlist.Clear;
  blacklist.clear;
  if movedlist.Count > 0 Then
  begin
    if copy(movedlist[movedlist.Count-1],1,3) = 'Red' Then
      a:=3//4
    else
      a:=5;//6
    for b:=1 to 8 do
    for c:=1 to 8 do
      board[b][c]:=strToint(copy(movedlist[movedlist.Count-1],8*b-8+a+c,1))-1;
    if copy(movedlist[movedlist.Count-1],1,3) = 'Red' then
    begin
      MakeRedMove(board,templist);
      Makeclick(templist,'player1');
    end
    else begin
      MakeBlackMove(board,templist);
      Makeclick(templist,'player2');
    end;
  end
  else begin
    board:=initboard;
    if Firstisred then
    begin
      MakeRedMove(board,templist);
      Makeclick(templist,'player1');
    end
    else begin
      MakeBlackMove(board,templist);
      Makeclick(templist,'player2');
    end;
  end;
  movedlist.Delete(movedlist.Count-1);
  if StepListBox.items.Count < 2 then
    backbutton.Enabled:=False;
  Score(board,a,b);
  Label3.Caption:= inttostr(a);
  Label4.Caption:= inttostr(b);
  notinback:=true;
  updateboard;
  templist.Free;
end;


function TForm1.MinMaxRandom(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
var a,b,c,d,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;oldaithinkstep:string;aithinksteplist:Tstringlist;//var a,b,c,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;sameboard:boolean;
begin
//一般來說，這裡有一個判斷棋局是否結束的函數，
//一旦棋局結束就不必繼續搜索了，直接返回極值。
//但由於黑白棋不存在中途結束的情況，故省略。
  Application.ProcessMessages;
//  bestaithinkstep:=aithinkstep;
  Score(Aboard,a,b);
  if a = 0 then
  begin
    if SideIsRed then
      result:= 2000
    else
      result:= -2000;
    exit;
  end;
  if b = 0 then
  begin
    if SideIsRed then
      result:= -2000
    else
      result:= 2000;
    exit;
  end;
  if (depth<=0) or (a+b>63) then //葉子節點
  begin
      result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
    exit;
  end;
    templist := Tstringlist.Create;
//  if SideIsRed then
    bestvalue:=-INF;//初始最佳值設為負無窮
//  else
//    bestvalue:=INF;
  //生成走法
//  templist:=tstringlist.Create;
  if SideIsRed Then
//    templist:=MakeRedMoveAI(Aboard)
    MakeRedMove(Aboard,templist)
  else
//    templist:=MakeBlackMoveAI(Aboard);
    MakeBlackMove(Aboard,templist);
  if templist.Count = 0 then
  begin
    if SideIsRed Then
      MakeBlackMove(Aboard,templist)
    else
      MakeRedMove(Aboard,templist);

    if templist.Count = 0 then // both red and black no move
    begin
      templist.Free;
//      result:=0;
        result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
      exit;
    end;
    result := -MinMax(Aboard,Not SideIsRed,depth,aithinkstep);//);//搜索子節點，注意前面的負號
//    if a+ b < 40 then
//      result := result + 100;
    templist.Free;
    exit;
  end;
  aithinksteplist := Tstringlist.Create;
  tempboard:=Aboard;
  oldaithinkstep :=aithinkstep;
  For a:= 0 to templist.Count-1 do
  begin
    Application.ProcessMessages;
    aithinkstep := oldaithinkstep;
      d:= strtoint(templist[a]);
      b:= d div 8 +1 ;
      c:= d mod 8;
      if c = 0 then
       begin
      b:=b-1;
      c:=8;
       end;
    aithinkstep := intTostr(c)+','+intTostr(b);
  // 走一步棋;//
  //局面aboard 隨之改變
    Aboard:=tempboard;
    if SideIsRed Then
     RedboardUpdate(Aboard,strToint(templist[a]))
    else
      BlackboardUpdate(aboard,strToint(templist[a]));
    value:= -MinMax(Aboard,Not SideIsRed,depth-1,aithinkstep);//);//搜索子節點，注意前面的負號

//    if depth = Realdepth-1 then
//      ProgressBar1.StepIt;

//    if depth = Realdepth then
//    begin
      d:= strtoint(templist[a]);
      b:= d div 8 +1 ;
      c:= d mod 8;
      if c = 0 then
       begin
      b:=b-1;
      c:=8;
       end;
      AiListBox.items.Add(intTostr(value)+':'+aithinkstep);
      if value = bestvalue then
        aithinksteplist.Add(aithinkstep)
      else if value > bestvalue then
      begin
        aimovelist:=templist[a]+' '+intTostr(value);
//    end;
//      if value > bestvalue then
//      begin
        bestvalue:=value;
//        bestaithinkstep := aithinkstep;
        aithinksteplist.Clear;
        aithinksteplist.Add(aithinkstep)
      end;
    end;
  b:=Random(aithinksteplist.Count);
  AiMovelist := inttostr(8*strtoint(copy(aithinksteplist[b],3,1))+strtoint(copy(aithinksteplist[b],1,1))-8) + ' '+inttostr(bestvalue);
  aithinkstep := aithinksteplist[b];
  templist.Free;
//  aithinkstep :=bestaithinkstep;
  Result:= bestvalue;
  aithinksteplist.Free;
end;

function TForm1.MinMax(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
var a,b,c,d,bestvalue, value, b_pos, c_pos, node_val, branch_best, start_idx:integer;
    moves, child_moves, grandchild_moves: TMoveArray;
    templist,templist2, templist3:tstringlist;tempboard, tempboard2:Tboard;oldaithinkstep,bestaithinkstep:string;
    child_boards, batch_boards: array of Tboard; gpu_scores, batch_scores: array of Integer;
//var a,b,c,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;sameboard:boolean;
begin
//一般來說，這裡有一個判斷棋局是否結束的函數，
//一旦棋局結束就不必繼續搜索了，直接返回極值。
//但由於黑白棋不存在中途結束的情況，故省略。
  Application.ProcessMessages;
  bestaithinkstep:=aithinkstep;
  Score(Aboard,a,b);
  if a = 0 then
  begin
    if SideIsRed then
      result:= 2000
    else
      result:= -2000;
    exit;
  end;
  if b = 0 then
  begin
    if SideIsRed then
      result:= -2000
    else
      result:= 2000;
    exit;
  end;
  // x25 Power Boost: High-Performance GPU Subtree Evaluation at Depth 6
  if (depth=6) and FCudaEnabled and (not StopThink) then
  begin
    if SideIsRed then FastMakeRedMove(Aboard, moves)
    else FastMakeBlackMove(Aboard, moves);

    if moves.Count > 0 then
    begin
      bestvalue := -INF;
      oldaithinkstep := aithinkstep;

      for a := 0 to moves.Count - 1 do
      begin
        if StopThink then break;
        tempboard := Aboard;
        if SideIsRed then RedboardUpdate(tempboard, moves.Moves[a])
        else BlackboardUpdate(tempboard, moves.Moves[a]);

        if (not SideIsRed) then FastMakeRedMove(tempboard, child_moves)
        else FastMakeBlackMove(tempboard, child_moves);

        branch_best := INF; // Minimizer (side at depth 5)

        for b := 0 to child_moves.Count - 1 do
        begin
          tempboard2 := tempboard;
          if (not SideIsRed) then RedboardUpdate(tempboard2, child_moves.Moves[b])
          else BlackboardUpdate(tempboard2, child_moves.Moves[b]);

          if SideIsRed then FastMakeRedMove(tempboard2, grandchild_moves)
          else FastMakeBlackMove(tempboard2, grandchild_moves);

          if grandchild_moves.Count > 0 then
          begin
            SetLength(batch_boards, grandchild_moves.Count);
            SetLength(batch_scores, grandchild_moves.Count);
            for c := 0 to grandchild_moves.Count - 1 do
            begin
              batch_boards[c] := tempboard2;
              if SideIsRed then RedboardUpdate(batch_boards[c], grandchild_moves.Moves[c])
              else BlackboardUpdate(batch_boards[c], grandchild_moves.Moves[c]);
            end;

            // GPU evaluates all leaves of this grandchild node at once
            BatchEvaluateOnGPU(batch_boards, SideIsRed, batch_scores);

            node_val := -INF; // Maximizer (side at depth 4)
            for c := 0 to High(batch_scores) do
              if batch_scores[c] > node_val then node_val := batch_scores[c];

            if node_val < branch_best then branch_best := node_val;
          end
          else begin
            node_val := EvaluateScore(tempboard2, SideIsRed);
            if node_val < branch_best then branch_best := node_val;
          end;
        end;

        if child_moves.Count = 0 then branch_best := EvaluateScore(tempboard, SideIsRed);

        if branch_best > bestvalue then
        begin
          bestvalue := branch_best;
          d := moves.Moves[a];
          b_pos := d div 8 + 1;
          c_pos := d mod 8;
          if c_pos = 0 then begin b_pos := b_pos - 1; c_pos := 8; end;
          bestaithinkstep := oldaithinkstep + '->' + intTostr(c_pos) + ',' + intTostr(b_pos);
        end;
      end;
      aithinkstep := bestaithinkstep;
      Result := bestvalue;
      exit;
    end;
  end;

  if (depth<=0) or (a+b>63) or StopThink then //葉子節點
  begin
    result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
    exit;
  end;
    templist := Tstringlist.Create;
//  if SideIsRed then
    bestvalue:=-INF;//初始最佳值設為負無窮
//  else
//    bestvalue:=INF;
  //生成走法
//  templist:=tstringlist.Create;
  if SideIsRed Then
//    templist:=MakeRedMoveAI(Aboard)
    MakeRedMove(Aboard,templist)
  else
//    templist:=MakeBlackMoveAI(Aboard);
    MakeBlackMove(Aboard,templist);
  if templist.Count = 0 then
  begin
    if SideIsRed Then
      MakeBlackMove(Aboard,templist)
    else
      MakeRedMove(Aboard,templist);
    if templist.Count = 0 then // both red and black no move
    begin
      templist.Free;
//      result:=0;
      result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
      exit;
    end;
    aithinkstep := aithinkstep +'->PASS';
    result := -MinMax(Aboard,Not SideIsRed,depth,aithinkstep);//);//搜索子節點，注意前面的負號
//    if a+ b < 40 then
//      result := result + 100;
    templist.Free;
    exit;
  end;
  tempboard:=Aboard;
  oldaithinkstep :=aithinkstep;
  For a:= 0 to templist.Count-1 do
  begin
    Application.ProcessMessages;
    aithinkstep := oldaithinkstep;
      d:= strtoint(templist[a]);
      b:= d div 8 +1 ;
      c:= d mod 8;
      if c = 0 then
       begin
      b:=b-1;
      c:=8;
       end;
    aithinkstep := aithinkstep+'->'+intTostr(c)+','+intTostr(b);
  // 走一步棋;//
  //局面aboard 隨之改變
    Aboard:=tempboard;
    if SideIsRed Then
     RedboardUpdate(Aboard,strToint(templist[a]))
    else
      BlackboardUpdate(aboard,strToint(templist[a]));
    value:= -MinMax(Aboard,Not SideIsRed,depth-1,aithinkstep);//);//搜索子節點，注意前面的負號

    if depth = Realdepth-1 then
      ProgressBar1.StepIt;
      if value > bestvalue then
      begin
        bestvalue:=value;
        bestaithinkstep := aithinkstep;
      end;
    end;
  templist.Free;
  aithinkstep :=bestaithinkstep;
  Result:= bestvalue;
end;

function TForm1.AI(Aboard:Tboard;ComputerIsRed:Boolean):string;
var a,b,c:integer;thinkstep:string;
begin
  AiListBox.Clear;
  thinkstep:='';
  Application.ProcessMessages;
  Score(board,a,b);
  if (a+b < 64) and (GetSystemThreadCount > 1) then
  begin
    Result:=muti(ComputerIsRed);
    exit;
  end;
  StopThinkButton.Enabled:=True;
// http://blog.csdn.net/nowcan/archive/2004/10/19/142994.aspx
// 其實所有戰術都是減低對方行動力,最後逼對方行死位.
{
  if ComputerIsRed = true then
      MakeRedMove(Aboard,templist)
  else begin
    MakeBlackMove(Aboard,templist);
  end;
  }
  aimovelist :='';
  //aimovelist only output next move and score
  score(Aboard,a,b);
  Realdepth:= strToint(Endgamedepth.text);
  if a+b + Realdepth > 64 then
    Realdepth:= 64-a-b
  else
    Realdepth:= strToint(Nornaldepth.Text);
  ProgressBar1.Max :=0;
  ProgressBar1.Max:=ThinkNumber(Aboard,ComputerIsRed,Realdepth);
  ProgressBar1.Step:=1;
  if ComputerIsRed = true then
  begin
      MakeRedMove(Aboard,redlist);
     c:= redlist.Count;
  end
  else begin
    MakeBlackMove(Aboard,blacklist);
    c:= blacklist.Count;
  end;

     if (a + b < 46) and  (c > 4) and (Realdepth > 5) then
   a:=minMaxStart(Aboard,ComputerIsRed,Realdepth,thinkstep)
 else

    a:=minMaxRandom(Aboard,ComputerIsRed,Realdepth,thinkstep);
  if ProgressBar1.Position < ProgressBar1.Max then
     ProgressBar1.Position := ProgressBar1.Max;
  if copy(thinkstep,1,1)='-' then
    thinkstep:=Copy(thinkstep,3,length(thinkstep)-2);
  redlist.Clear;
  blacklist.Clear;
  ThinkstepEdit.text:=thinkstep;
  AIDisplayScoreLabel.caption:=intTostr(A);


  a:=strtoint(trim(copy(aimovelist,1,2)));
  Result:='image'+ inttostr(a) ;
  StopThinkButton.Enabled:=False;
  StopThink:=False;
end;

Procedure Tform1.Scoresort(var scorelist:Tstringlist;var stepno:Tstringlist);
var a,b:string;c,d:integer;
begin
   for d:= 1 to stepno.count-1 do
   begin
   for c:= 1 to stepno.count-1 do
   begin
     if strtoint(scorelist[c]) > strtoint(scorelist[c-1]) then
     begin
      a:= scorelist[c-1];
      b:= stepno[c-1];
      scorelist[c-1]:=  scorelist[c];
      stepno[c-1]:=  stepno[c];
      scorelist[c] := a;
      stepno[c] := b;
     end;
  end;
 end;


end;


function TForm1.MinMaxStart(Aboard:Tboard;SideIsRed:Boolean;depth:integer;var aithinkstep:string):integer;
var a,b,c,d,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;scorelist,steplist:Tstringlist;aithinksteplist:Tstringlist;//bestaithinkstep:string;
//var a,b,c,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;sameboard:boolean;
begin
//一般來說，這裡有一個判斷棋局是否結束的函數，
//一旦棋局結束就不必繼續搜索了，直接返回極值。
//但由於黑白棋不存在中途結束的情況，故省略。
  Application.ProcessMessages;
  Score(Aboard,a,b);
  if a = 0 then
  begin
    if SideIsRed then
      result:= 2000
    else
      result:= -2000;
    exit;
  end;
  if b = 0 then
  begin
    if SideIsRed then
      result:= -2000
    else
      result:= 2000;
    exit;
  end;
  if (depth<=0) or (a+b>63) then //葉子節點
  begin
    result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
    exit;
  end;
//  if SideIsRed then
    bestvalue:=-INF;//初始最佳值設為負無窮
//  else
//    bestvalue:=INF;
  //生成走法
  templist:=tstringlist.Create;
  if SideIsRed Then
//    templist:=MakeRedMoveAI(Aboard)
    MakeRedMove(Aboard,templist)
  else
//    templist:=MakeBlackMoveAI(Aboard);
    MakeBlackMove(Aboard,templist);
  if templist.Count = 0 then
  begin
    if SideIsRed Then
      MakeBlackMove(Aboard,templist)
    else
      MakeRedMove(Aboard,templist);

    if templist.Count = 0 then // both red and black no move
    begin
      templist.Free;
//      result:=0;
      result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
      exit;
    end;
//    templist.Free;
//    if a + b > 63 then begin
//      result:= -EvaluateScore(Aboard,not SideIsRed);
//      exit;
//    end
//    else begin
      result := -MinMaxStart(Aboard,Not SideIsRed,depth,aithinkstep);//);//搜索子節點，注意前面的負號
 //     result := -MinMaxSecond(Aboard,Not SideIsRed,depth);//);//搜索子節點，注意前面的負號
//      if a+ b < 40 then
//        result := result + 100;
      templist.Free;
      exit;
  end;
  tempboard:=Aboard;
  scorelist := Tstringlist.Create;
  steplist := Tstringlist.Create;
  For a:= 0 to templist.Count-1 do
  begin
    Application.ProcessMessages;
    aithinkstep:='';
  // 走一步棋;//
  //局面aboard 隨之改變
    Aboard:=tempboard;
  steplist.Add(templist[a]);
    if SideIsRed Then
     RedboardUpdate(Aboard,strToint(templist[a]))
    else
      BlackboardUpdate(aboard,strToint(templist[a]));
    value:= -MinMax(Aboard,Not SideIsRed,depth -2,aithinkstep);//);//搜索子節點，注意前面的負號
    scorelist.add(inttostr(value));

   end;
   Scoresort(scorelist,steplist);
   aithinksteplist:=Tstringlist.Create;
   for a := scorelist.Count div 2 to scorelist.Count do
      ProgressBar1.StepIt;// need modied
   For a:=0 to  scorelist.count div 2 do //need modied
   begin
  // 走一步棋;//
  //局面aboard 隨之改變

    Aboard:=tempboard;
    aithinkstep:='';
        d:= strtoint(steplist[a]);
      b:= d div 8 +1 ;
      c:= d mod 8;
      if c = 0 then
        begin
      b:=b-1;
      c:=8;
       end;
     aithinkstep := intTostr(c)+','+intTostr(b) ;

    if SideIsRed Then
     RedboardUpdate(Aboard,strToint(steplist[a]))
    else
      BlackboardUpdate(aboard,strToint(steplist[a]));

    value:= -MinMax(Aboard,Not SideIsRed,depth-1,aithinkstep);//);//搜索子節點，注意前面的負號

//    Aboard:=Tempboard;//撤銷剛才的一步;//恢復局面

// for display move value need modied;
      d:= strtoint(steplist[a]);
      b:= d div 8 +1 ;
      c:= d mod 8;
      if c = 0 then
        begin
      b:=b-1;
      c:=8;
       end;
      AiListBox.items.Add(intTostr(c)+','+intTostr(b)+' '+intTostr(value));
      if value = bestvalue then
        aithinksteplist.Add(aithinkstep)
      else if value > bestvalue then
      begin
        aimovelist:=steplist[a]+' '+intTostr(value);
        aithinksteplist.Clear;
// support random best move
        aithinksteplist.Add(aithinkstep);
//        bestaithinkstep:=aithinkstep;

// end of display value
//    if sideIsRed then
//    begin
//      if value > bestvalue then
//      begin
        bestvalue:=value;
//        if depth = Realdepth then
//        aimovelist.Add(templist[a]+' '+intTostr(value));
       end;
//      end;
    end;
{
    else begin
      if value < bestvalue then
      begin
        bestvalue:=value;
        if depth = Realdepth then
          aimovelist.Add(templist[a]+' '+intTostr(value));
      end;
    end;
  end;
  }
  b:=Random(aithinksteplist.Count);
  AiMovelist := inttostr(8*strtoint(copy(aithinksteplist[b],3,1))+strtoint(copy(aithinksteplist[b],1,1))-8) + ' '+inttostr(bestvalue);
  aithinkstep := aithinksteplist[b];
  Result:= bestvalue;
//  aithinkstep:=bestaithinkstep;
  scorelist.free;
  steplist.free;
  templist.Free;
  aithinksteplist.free;
end;



function TForm1.ThinkNumber(Aboard:Tboard;SideIsRed:Boolean;depth:integer):integer;
var a,b:integer;templist:tstringlist;tempboard:Tboard;
//var a,b,c,bestvalue, value:integer;templist:tstringlist;tempboard:Tboard;sameboard:boolean;
begin
//一般來說，這裡有一個判斷棋局是否結束的函數，
//一旦棋局結束就不必繼續搜索了，直接返回極值。
//但由於黑白棋不存在中途結束的情況，故省略。
  result:=0;
  templist := tstringlist.Create;
  Application.ProcessMessages;
  Score(Aboard,a,b);

  if a = 0 then
  begin
  {
    if SideIsRed then
      result:= 2000
    else
      result:= -2000;
      }
    exit;
  end;
  if b = 0 then
  begin
  {
    if SideIsRed then
      result:= -2000
    else
      result:= 2000;
    exit;
    }
  end;

  if (depth<=0) or (a+b>63) then //葉子節點
  begin
//    result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
    exit;
  end;


//    bestvalue:=-INF;//初始最佳值設為負無窮
  //生成走法

  if SideIsRed Then
    MakeRedMove(Aboard,templist)
  else

    MakeBlackMove(Aboard,templist);
  if templist.Count = 0 then
  begin
    if SideIsRed Then
      MakeBlackMove(Aboard,templist)
    else
      MakeRedMove(Aboard,templist);

    if templist.Count = 0 then // both red and black no move
    begin
      templist.Free;

//      result:= EvaluateScore(Aboard,SideIsRed);//直接返回對局面的估值
        result:=1;
      exit;
    end;


//      result := -MinMax(Aboard,Not SideIsRed,depth);//);//搜索子節點，注意前面的負號
      result:=1;
      templist.Free;
      exit;
  end;
  if depth = realdepth-1 then
  begin
    For a:= 0 to templist.Count-1 do
    begin
      Application.ProcessMessages;
      inc(result);
    end;
    templist.Free;
    exit;
  end;
  tempboard:=Aboard;
  For a:= 0 to templist.Count-1 do
  begin
  // 走一步棋;//
  //局面aboard 隨之改變
    Aboard:=tempboard;
    if SideIsRed Then
     RedboardUpdate(Aboard,strToint(templist[a]))
    else
      BlackboardUpdate(aboard,strToint(templist[a]));
    result:=result+ThinkNumber(Aboard,Not SideIsRed,depth-1);
//    value:= -MinMax(Aboard,Not SideIsRed,depth-1);//);//搜索子節點，注意前面的負號
    end;
//      if value > bestvalue then
//        bestvalue:=value;
//    end;
  templist.Free;
//  Result:= bestvalue;
end;
procedure TForm1.TojavaboardbuttonClick(Sender: TObject);
var F:Textfile;s,t,u:string;a:integer;
begin
  SaveDialog1.FileName := '*.htm';
  SaveDialog1.Filter := 'Apple game Java (*.htm)|*.HTM';

  if SaveDialog1.Execute then
  begin
    Assignfile(F,SaveDialog1.FileName);
    Rewrite(f);
    Writeln(f,'<HTML>');
    Writeln(f,'<Center>');
    Writeln(f,'<APPLET width="284" height="331" codebase="http://home.i-cable.com/wu/java/" code="JavaReversi">');
    Writeln(f,'<PARAM name="Position" value="'+boardtofen+'">');
    If FirstIsRed then
      Writeln(f,'<PARAM name="MoveFirst" value="Red">')
    else
      Writeln(f,'<PARAM name="MoveFirst" value="Black">');
   s:='';
   for a := 0 to StepListBox.Count - 1 do
   begin
     if copy(StepListBox.Items[a],1,3) = 'Red'  then
       t := copy(StepListBox.Items[a],5,3)
     else if copy(StepListBox.Items[a],1,5) = 'Black'  then
       t := copy(StepListBox.Items[a],7,3);
     if a =  StepListBox.Count - 2 then
     begin
       if (StepListBox.items[a] = 'Red pass') and (StepListBox.items[a+1] = 'Black pass') or (StepListBox.items[a] = 'Black pass') and (StepListBox.items[a+1] = 'Red pass') then
         break;
     end;
     if copy(t,1,1) = 'p' then
        s:=s + ' P'
     Else begin
       u:= copy(t,1,1);
       t:= copy(t,3,1);
       if a = 0 then
          s := char(strtoint(u)+64)+t
       else
         s := s+ ' '+char(strtoint(u)+64)+t;
     end;

   end;

    Writeln(f,'<PARAM name="MoveList" value="'+s+'">');
    Writeln(f,'</HTML>');
    Writeln(f,'</Center>');
    Closefile(f);
  end;

end;

function Tform1.EvaluateScore(const Aboard:Tboard;const SideIsRed:Boolean):Integer;
var a,b:integer;
begin
  a:=0;
  b:=0;
  Score(Aboard,a,b);
  if a+b <= 59 then begin
    if aboard[1][1] = 0 then
      Result:= b-a+aboard[2][1]*posmark[2][1]+aboard[1][2]*posmark[1][2]
    else
      Result:= b-a+aboard[1][1]*posmark[1][1];
    if aboard[8][1] = 0 then
      Result:= Result+aboard[7][1]*posmark[7][1]+aboard[8][2]*posmark[8][2]
    else
      Result:= Result+aboard[8][1]*posmark[8][1];
    if aboard[1][8] = 0 then
      Result:= Result+aboard[1][7]*posmark[1][7]+aboard[2][8]*posmark[2][8]
    else
      Result:= Result+aboard[1][8]*posmark[1][8];
    if aboard[8][8] = 0 then
      Result:= Result+aboard[8][7]*posmark[8][7]+aboard[7][8]*posmark[7][8]
    else
      Result:= Result+aboard[8][8]*posmark[8][8];

    if  not SideIsRed then
      Result:= -Result;
  end
 else begin
    if SideIsRed then
    Result := b-a
  else
    Result := a-b;
 end;
end;


end.
