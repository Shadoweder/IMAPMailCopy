unit UFLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2007Blue,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, cxContainer, cxEdit, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxLayoutContainer, cxTextEdit, cxMemo, dxLayoutLookAndFeels, dxLayoutControl,
  cxClasses, dxSkinsForm;

type
  TFLog = class(TForm)
    dxSkinController1: TdxSkinController;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    MLog: TcxMemo;
    dxLayoutItem1: TdxLayoutItem;
    BLogClear: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    procedure BLogClearClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    procedure LogAddStrings(Strings : array of string);
  end;

var
  FLog: TFLog;

implementation

{$R *.dfm}


procedure BeginUpdateWinControl(AWinControl: TWinControl);
begin
  AWinControl.Perform(WM_SETREDRAW, 0, 0);
end;

procedure EndUpdateWinControl(AWinControl: TWinControl);
begin
  AWinControl.Perform(WM_SETREDRAW, 1, 0);
  RedrawWindow(AWinControl.Handle, nil, 0, RDW_ALLCHILDREN+RDW_INVALIDATE+RDW_FRAME+RDW_ERASE);
end;

//Записать строку в лог
//Вызов: LogWriteStrings(['StringLine1', 'StringLine2', ...]);
procedure TFLog.LogAddStrings(Strings : array of string);
var
  SL: TStringList;
  I, J : integer;
  S: String;
begin
  BeginUpdateWinControl(MLog);
  try
    S := FormatDateTime('yyyy.mm.dd hh:mm:ss.zzz', Now)+' ';
    SL := TStringList.Create;
    try
      for I := 0 to High(Strings) do
      begin
        SL.Text := Strings[I];
        for J := 0 to SL.Count - 1 do
        begin
          if (I=0) and (J=0) then
            FLog.MLog.Lines.Add(S + SL.Strings[J])
          else
            FLog.MLog.Lines.Add('                        ' + SL.Strings[J]); //Пробелы для форматирования
       end;
      end;
    finally
      SL.Free;
    end;
  finally
    EndUpdateWinControl(MLog);
  end;
end;

procedure TFLog.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := 0;
end;

procedure TFLog.BLogClearClick(Sender: TObject);
begin
  MLog.Lines.Clear;
end;

end.
