program IMAPMailCopy;

{$DEFINE DEBUG}

uses
  Vcl.Forms,
  UFMain in 'UFMain.pas' {FMain},
{$IFDEF DEBUG}
  UFLog in 'UFLog.pas' {FLog},
{$ENDIF}
  UFMailBox in 'UFMailBox.pas' {FMailBox},
  UFCopyProgress in 'UFCopyProgress.pas' {FCopyProgress};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
{$IFDEF DEBUG}
  Application.CreateForm(TFLog, FLog);
{$ENDIF}
  Application.CreateForm(TFCopyProgress, FCopyProgress);
  FMain.dxLayoutSkinLookAndFeel1.LookAndFeel.SkinName := 'Office2007Blue';
  FMain.dxSkinController1.SkinName := 'Office2007Blue';
{$IFDEF DEBUG}
  FLog.dxLayoutSkinLookAndFeel1.LookAndFeel.SkinName := 'Office2007Blue';
  FLog.dxSkinController1.SkinName := 'Office2007Blue';
{$ENDIF}

  Application.Run;
end.
