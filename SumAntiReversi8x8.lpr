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
 
program SumAntiReversi8x8;

{$MODE Delphi}
{$APPTYPE CONSOLE}

uses
  Forms, Interfaces, LCLIntf,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  if (ParamCount > 0) and (ParamStr(1) = '--test') then
  begin
    Writeln('Starting AI Test...');
    Form1.RunCliTest;
  end;
  Application.Run;
end.
