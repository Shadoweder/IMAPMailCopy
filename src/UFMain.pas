unit UFMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UFMailBox, UFCopyProgress,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore,
  dxSkinOffice2007Blue, dxLayoutLookAndFeels,
  dxLayoutContainer, dxLayoutControl, cxClasses, dxSkinscxPCPainter, dxSkinsForm,
  dxBarBuiltInMenu, cxSplitter, cxPC, dxLayoutcxEditAdapters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, Vcl.ExtCtrls, cxInplaceContainer;

type
  TFMain = class(TForm)
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxSkinController1: TdxSkinController;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    PDSTMailBox: TPanel;
    dxLayoutItem2: TdxLayoutItem;
    PSRCMailBox: TPanel;
    dxLayoutItem1: TdxLayoutItem;
    BCopyMessage: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    BCopyFolder: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    BCopySelectedFolders: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure BCopyMessageClick(Sender: TObject);
    procedure BCopyFolderClick(Sender: TObject);
    procedure BCopySelectedFoldersClick(Sender: TObject);
  private
    { Private declarations }
    FSRCMailBox, FDSTMailBox: TFMailBox;

    procedure SetDefaultParams;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}
uses
  UFLog;

procedure TFMain.SetDefaultParams;
begin
{$IFDEF DEBUG}
//  FSRCMailBox.TEServer.Text := '';
//  FSRCMailBox.TEUser.Text := '';
//  FSRCMailBox.TEPassword.Text := '';

//  FDSTMailBox.TEServer.Text := '';
//  FDSTMailBox.TEUser.Text := '';
//  FDSTMailBox.TEPassword.Text := '';
{$ELSE}
  FSRCMailBox.TEServer.Text := '';
  FSRCMailBox.TEUser.Text := '';
  FSRCMailBox.TEPassword.Text := '';

  FDSTMailBox.TEServer.Text := '';
  FDSTMailBox.TEUser.Text := '';
  FDSTMailBox.TEPassword.Text := '';
{$ENDIF}

  FSRCMailBox.TEPort.Text := '143';
  FSRCMailBox.ChBUseTLS.Checked := False;
  FSRCMailBox.ChBUseSASL.Checked := False;
  FSRCMailBox.SETimeout.Value := 60;

  FDSTMailBox.TEPort.Text := '143';
  FDSTMailBox.ChBUseTLS.Checked := False;
  FDSTMailBox.ChBUseSASL.Checked := False;
  FDSTMailBox.SETimeout.Value := 60;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TFMain.FormCreate(Sender: TObject);
begin
  FSRCMailBox := TFMailBox.Create(PSRCMailBox);
  FSRCMailBox.Parent := PSRCMailBox;
  FSRCMailBox.Visible := True;
  FSRCMailBox.Name := 'SRCMailBox';

  FDSTMailBox := TFMailBox.Create(PDSTMailBox);
  FDSTMailBox.Parent := PDSTMailBox;
  FDSTMailBox.Visible := True;
  FDSTMailBox.Name := 'DSTMailBox';

  FSRCMailBox.PCMailbox.ActivePageIndex := 0;
  FDSTMailBox.PCMailbox.ActivePageIndex := 0;

  FSRCMailBox.CBServerType.ItemIndex := 0;
  FDSTMailBox.CBServerType.ItemIndex := 0;

  SetDefaultParams;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSRCMailBox) then
  begin
    FSRCMailBox.Close;
    FSRCMailBox.FreeOnRelease;
  end;

  if Assigned(FDSTMailBox) then
  begin
    FDSTMailBox.Close;
    FDSTMailBox.FreeOnRelease;
  end;
end;

procedure TFMain.FormResize(Sender: TObject);
begin
  if Assigned(FSRCMailBox) then
  begin
    FSRCMailBox.Align := alNone;
    FSRCMailBox.Align := alClient;
  end;

  if Assigned(FDSTMailBox) then
  begin
    FDSTMailBox.Align := alNone;
    FDSTMailBox.Align := alClient;
  end;
end;

procedure TFMain.BCopyMessageClick(Sender: TObject);
begin
  if not(FSRCMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FSRCMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  if not(FDSTMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect DST MailBox.');
    FDSTMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  FCopyProgress.FCopyType := ctMessage;
  FCopyProgress.FSRCMailBox := FSRCMailBox;
  FCopyProgress.FDSTMailBox := FDSTMailBox;
  FCopyProgress.ShowModal;
end;

procedure TFMain.BCopyFolderClick(Sender: TObject);
begin
  if not(FSRCMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FSRCMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  if not(FDSTMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect DST MailBox.');
    FDSTMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  FCopyProgress.FCopyType := ctFolder;
  FCopyProgress.FSRCMailBox := FSRCMailBox;
  FCopyProgress.FDSTMailBox := FDSTMailBox;
  FCopyProgress.ShowModal;
end;

procedure TFMain.BCopySelectedFoldersClick(Sender: TObject);
begin
  if not(FSRCMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FSRCMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  if not(FDSTMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect DST MailBox.');
    FDSTMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  FCopyProgress.FCopyType := ctSelectedFolders;
  FCopyProgress.FSRCMailBox := FSRCMailBox;
  FCopyProgress.FDSTMailBox := FDSTMailBox;
  FCopyProgress.ShowModal;
end;

end.
