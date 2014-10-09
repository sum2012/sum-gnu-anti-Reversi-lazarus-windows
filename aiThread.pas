unit aiThread;

{$MODE Delphi}

interface

uses
  Classes;

type

  Tboard=array[0..9,0..9] of integer;
  Tmovelist = array[1..20] of integer;

//  TNotifyEvent = procedure(Sender: TObject) of object;
  TAINotifyEvent = procedure(const TestNum:string;const Realprime: Boolean) of object;
  TAIThrd = class(TThread)
  private
    FTestNumber: integer;
    FAIResult: boolean;
    FAINotifyEvent: TAINotifyEvent;
  protected
//    function IsPrime: boolean;
    procedure IsPrime;
    procedure Execute; override;
    procedure Call;
  public
    property TestNumber: integer write FTestNumber;
    property AIResult: boolean read FAIResult;
  Published
    property AINotifyEvent :TAINotifyEvent read FAINotifyEvent write FAINotifyEvent;
  end;

implementation

uses SysUtils, Dialogs,windows, Unit1;

//function TAIThrd.IsPrime: boolean;
Procedure TAIThrd.IsPrime;
var
  iter: integer;
begin
  FAIResult := True;
  if FTestNumber < 0 then
  begin
    FAIResult := false;
    exit;
  end;
  if FTestNumber <= 2 then
    exit;
  for iter := 2 to FTestNumber - 1 do
  begin
    if (FTestNumber mod iter) = 0 then
    begin
      FAIResult := False;
      exit;
      {exit;}
    end;
  end;
end;

procedure TAIThrd.Execute;
var a:boolean;
begin
  IsPrime;
  if assigned(AINotifyEvent) then
     Synchronize(Call);
end;

procedure TAIThrd.Call;
begin
  AINotifyEvent(intTostr(FTestNumber),FAIResult);
end;

end.
