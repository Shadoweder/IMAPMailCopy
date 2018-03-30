program IMAPMailCopy;

//{$DEFINE DEBUG}

uses
  Vcl.Forms,
  UFMain in 'UFMain.pas' {FMain},
  UFMailBox in 'UFMailBox.pas' {FMailBox},
  UFCopyProgress in 'UFCopyProgress.pas' {FCopyProgress};

{$R *.res}

begin
{$IFDEF DEBUG}
//  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFCopyProgress, FCopyProgress);
  FMain.dxLayoutSkinLookAndFeel1.LookAndFeel.SkinName := 'Office2007Blue';
  FMain.dxSkinController1.SkinName := 'Office2007Blue';

  Application.Run;
end.
