unit u_d_arrays_2023;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnShow: TButton;
    btnRead: TButton;
    edID: TEdit;
    edOUT: TEdit;
    Label1: TLabel;
    memoIN: TMemo;
    procedure btnReadClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a   : integer;
  arr : array of integer; //dynamic array of length 0
  arrs: array [0 .. 9] of integer; //static array of lgth 10

  n:integer=0; //rows in memoIN
  l:integer; //array last index

  i:integer; //counter

  id:integer; //id to look at

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnReadClick(Sender: TObject);
begin
  n:=memoIN.Lines.Count;

  if (n>=1) then
  begin

    SetLength(arr,n); //array ARR now has length of N

    l:=Length(arr)-1;
    //OR
    l:=High(arr);

    for i:=0 to l do
    begin
      if not TryStrToInt(memoIN.Lines[i],arr[i]) then arr[i]:=0;
      //[i] refers to i-th element of a given array
      //TryStrToInt ATTEMPTS to convert string to integer, if not - returns FALSE
    end;

  end else n:=0;
end;

procedure TForm1.btnShowClick(Sender: TObject);
begin

  if (n>0) then
  begin
    l:=High(arr);
    id:=strtoint(edID.Text);
    if (id<=l) and (id>=0) then
    begin
      edOUT:=inttostr(arr[id]);
    end;
  end;

end;

end.

