unit UFMailBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, System.UITypes,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore,
  dxSkinOffice2007Blue, dxLayoutLookAndFeels,
  dxLayoutContainer, dxLayoutControl, cxClasses, dxSkinscxPCPainter, dxSkinsForm,
  dxBarBuiltInMenu, cxSplitter, cxPC, dxLayoutcxEditAdapters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  dxLayoutControlAdapters, cxButtons,   cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxListView, cxMemo,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB, dxmdaset,
  Vcl.ExtCtrls, cxSpinEdit,
  imapsend, mimemess, ssl_openssl,
  dxGDIPlusClasses, cxImage;

type
  TMyLookupComboBoxProperties = class(TcxLookupComboBoxProperties)
  protected
    function GetDisplayLookupText(const AKey: TcxEditValue): string; override;
  end;

  TMycxLookupComboBox = class(TcxLookupComboBox)
  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  TcxLookupComboBox = class(TMycxLookupComboBox);

  TListFoldersType = (lftMailFolders, lftSubscribedMailFolders);

type
  TFMailBox = class(TForm)
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxSkinController1: TdxSkinController;
    PCMailBox: TcxPageControl;
    TSFolders: TcxTabSheet;
    TSSettings: TcxTabSheet;
    TSMessages: TcxTabSheet;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    CBServerType: TcxComboBox;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    TEServer: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    TEUser: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    TEPassword: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    TEPort: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    ChBUseSASL: TcxCheckBox;
    dxLayoutItem4: TdxLayoutItem;
    BLogin: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    BLogout: TcxButton;
    dxLayoutItem11: TdxLayoutItem;
    ChBUseTLS: TcxCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutControl4Group_Root: TdxLayoutGroup;
    dxLayoutControl4: TdxLayoutControl;
    dxLayoutGroup6: TdxLayoutGroup;
    TLFolders: TcxTreeList;
    dxLayoutItem13: TdxLayoutItem;
    TLFoldersColumn1: TcxTreeListColumn;
    TLFoldersColumn2: TcxTreeListColumn;
    TLFoldersColumn3: TcxTreeListColumn;
    dxLayoutGroup7: TdxLayoutGroup;
    BGetFoldersList: TcxButton;
    dxLayoutItem14: TdxLayoutItem;
    TLFoldersColumn4: TcxTreeListColumn;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    BNewFolder: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    BDeleteFolder: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    BSubscribeFolder: TcxButton;
    dxLayoutItem15: TdxLayoutItem;
    BUnSubscribeFolder: TcxButton;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    BPurge: TcxButton;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    StatusBar: TdxStatusBar;
    MMessage: TcxMemo;
    dxLayoutItem18: TdxLayoutItem;
    LVMessages: TcxListView;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    BGetMessagesList: TcxButton;
    dxLayoutItem20: TdxLayoutItem;
    BDeleteMessage: TcxButton;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutSeparatorItem4: TdxLayoutSeparatorItem;
    BClearFolder: TcxButton;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    TEFolderName: TcxTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutSeparatorItem5: TdxLayoutSeparatorItem;
    LCBProfiles: TcxLookupComboBox;
    LCMLoginProfiles: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    BSaveProfile: TcxButton;
    dxLayoutItem24: TdxLayoutItem;
    BDeleteProfile: TcxButton;
    dxLayoutItem25: TdxLayoutItem;
    BLoadProfile: TcxButton;
    dxLayoutItem26: TdxLayoutItem;
    dxLayoutSeparatorItem6: TdxLayoutSeparatorItem;
    MDProfiles: TdxMemData;
    MDProfilesServer: TStringField;
    MDProfilesUser: TStringField;
    MDProfilesPassword: TStringField;
    MDProfilesPort: TStringField;
    MDProfilesUseTLS: TBooleanField;
    MDProfilesUseSASL: TBooleanField;
    DSProfiles: TDataSource;
    dxLayoutGroup8: TdxLayoutGroup;
    IReloadProfiles: TcxImage;
    dxLayoutItem27: TdxLayoutItem;
    dxLayoutSeparatorItem7: TdxLayoutSeparatorItem;
    BSelectAllFolders: TcxButton;
    dxLayoutItem28: TdxLayoutItem;
    BUnSelectAllFolders: TcxButton;
    dxLayoutItem29: TdxLayoutItem;
    TImapTimeout: TTimer;
    SETimeout: TcxSpinEdit;
    dxLayoutItem30: TdxLayoutItem;
    BRenameFolder: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    BClearFolderFast: TcxButton;
    dxLayoutItem31: TdxLayoutItem;
    BNewRootFolder: TcxButton;
    dxLayoutItem32: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure BLoginClick(Sender: TObject);
    procedure BLogoutClick(Sender: TObject);
    procedure BGetFoldersListClick(Sender: TObject);
    procedure BNewFolderClick(Sender: TObject);
    procedure BDeleteFolderClick(Sender: TObject);
    procedure BSubscribeFolderClick(Sender: TObject);
    procedure BUnSubscribeFolderClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BPurgeClick(Sender: TObject);
    procedure BGetMessagesListClick(Sender: TObject);
    procedure TLFoldersDblClick(Sender: TObject);
    procedure LVMessagesDblClick(Sender: TObject);
    procedure TLFoldersFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure BDeleteMessageClick(Sender: TObject);
    procedure BClearFolderClick(Sender: TObject);
    procedure BLoadProfileClick(Sender: TObject);
    procedure BSaveProfileClick(Sender: TObject);
    procedure BDeleteProfileClick(Sender: TObject);
    procedure IReloadProfilesClick(Sender: TObject);
    procedure BSelectAllFoldersClick(Sender: TObject);
    procedure BUnSelectAllFoldersClick(Sender: TObject);
    procedure TImapTimeoutTimer(Sender: TObject);
    procedure TSMessagesShow(Sender: TObject);
    procedure BRenameFolderClick(Sender: TObject);
    procedure BClearFolderFastClick(Sender: TObject);
    procedure BNewRootFolderClick(Sender: TObject);
  private
    { Private declarations }
    FInWork: Boolean;
    FWorkName: String;
    FWorkProcess: String;
  public
    { Public declarations }
    Imap: TIMAPSend;

    FListFoldersType: TListFoldersType;
    FMailBoxSeparator: String;
    FMailFolders, FSubscribedMailFolders: TStrings;
    FMessagesCount: Integer;

    procedure LoadProfiles(ALookupComboBox: TcxLookupComboBox);
    procedure SaveProfiles(ALookupComboBox: TcxLookupComboBox);

    function InWork: Boolean;
    procedure StartWork(AWorkName: string = '');
    procedure StopWork;
    procedure SetWorkProcess(AWorkProcess: String = '');

    procedure GetFolderList;
    procedure GetMessageList;
    function GetFolderName(ANode: TcxTreelistNode): string;
    function GetOriginalFolderName(ANode: TcxTreelistNode): string;

    function StringToWideStringEx(const AString: String; ACodePage: Word): WideString;
    function ConvertUTF7ImapToWideString(const AString: String): WideString;
    function ConvertStringToUTF7Imap(const AString: String): String;
    function AddFolderToTreeList(const AName: String): TcxTreeListNode;

    function CheckConnected: Boolean;
  end;

implementation

{$R *.dfm}

class function TMycxLookupComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TMyLookupComboBoxProperties;
end;

function TMyLookupComboBoxProperties.GetDisplayLookupText(const AKey: TcxEditValue): string;
begin
  Result := inherited GetDisplayLookupText(AKey);

  if DataController.FocusedRecordIndex <> -1 then
  begin
    Result := DataController.DisplayTexts[DataController.FocusedRecordIndex, 0] +
      ':' +
      DataController.DisplayTexts[DataController.FocusedRecordIndex, 1] +
      ' (' +
      DataController.DisplayTexts[DataController.FocusedRecordIndex, 2] +
      ')';
  end;
end;

procedure BeginUpdateWinControl(AWinControl: TWinControl);
begin
  AWinControl.Perform(WM_SETREDRAW, 0, 0);
end;

procedure EndUpdateWinControl(AWinControl: TWinControl);
begin
  AWinControl.Perform(WM_SETREDRAW, 1, 0);
  RedrawWindow(AWinControl.Handle, nil, 0, RDW_ALLCHILDREN+RDW_INVALIDATE+RDW_FRAME+RDW_ERASE);
end;

procedure TFMailBox.LoadProfiles(ALookupComboBox: TcxLookupComboBox);
var
  ProfilesFileName: String;
begin
  ProfilesFileName := ExtractFilePath(Application.ExeName) + 'Profiles.data';
  if FileExists(ProfilesFileName) then
    MDProfiles.LoadFromTextFile(ProfilesFileName);
  MDProfiles.Active := True;
  if MDProfiles.RecordCount>0 then
  begin
    MDProfiles.CurRec := 0;
    ALookupComboBox.Properties.DataController.FocusedRecordIndex := 0;
    ALookupComboBox.Text := ALookupComboBox.Properties.DataController.DisplayTexts[ALookupComboBox.Properties.DataController.FocusedRecordIndex, 0] +
      ':' +
      ALookupComboBox.Properties.DataController.DisplayTexts[ALookupComboBox.Properties.DataController.FocusedRecordIndex, 1] +
      ' (' +
      ALookupComboBox.Properties.DataController.DisplayTexts[ALookupComboBox.Properties.DataController.FocusedRecordIndex, 2] +
      ')';
  end;
end;

procedure TFMailBox.SaveProfiles(ALookupComboBox: TcxLookupComboBox);
var
  ProfilesFileName: String;
begin
  ProfilesFileName := ExtractFilePath(Application.ExeName) + 'Profiles.data';
  MDProfiles.SaveToTextFile(ProfilesFileName);
end;

function TFMailBox.InWork: Boolean;
begin
  Result := FInWork;
end;

procedure TFMailBox.IReloadProfilesClick(Sender: TObject);
begin
  LoadProfiles(LCBProfiles);
end;

procedure TFMailBox.StartWork(AWorkName: string = '');
begin
  FInWork := True;
  FWorkName := AWorkName;
  StatusBar.Panels[0].Text := 'InWork';
  if FWorkName<>'' then
    StatusBar.Panels[0].Text := StatusBar.Panels[0].Text + ': ' + FWorkName;
end;

procedure TFMailBox.StopWork;
begin
  FInWork := False;
  FWorkName := '';
  FWorkProcess := '';
  StatusBar.Panels[0].Text := ''
end;

procedure TFMailBox.SetWorkProcess(AWorkProcess: String = '');
begin
  FWorkProcess := AWorkProcess;
  StatusBar.Panels[0].Text := 'InWork';
  if FWorkName<>'' then
    StatusBar.Panels[0].Text := StatusBar.Panels[0].Text + ': ' + FWorkName;
  if FWorkProcess<>'' then
    StatusBar.Panels[0].Text := StatusBar.Panels[0].Text + ' (' + FWorkProcess + ')';
end;

procedure TFMailBox.GetFolderList;
var
  I: Integer;
  MailFolderName: String;
  TempNode: TcxTreeListNode;
  S: string;
begin
  TLFolders.BeginUpdate;
  try
    StartWork('ListMailBoxes');

    FMailFolders.Clear;
    FSubscribedMailFolders.Clear;
    TLFolders.Clear;
    TLFolders.OptionsView.CheckGroups := True;
    LVMessages.Clear;
    MMessage.Clear;

    FMailBoxSeparator := '';
    Imap.IMAPcommand('LIST "' + '' + '" ""');
    S := Imap.FullResult.Text;
    I := Pos('" ""', S);
    if I=0 then
      I := Pos('" "/"', S);
    if I > 3 then
    begin
      if S[I - 2] = '"' then
        FMailBoxSeparator := S[I - 1];
    end;
    if FMailBoxSeparator = '' then
      FMailBoxSeparator := '\';

    Imap.List('', FMailFolders);
    Imap.ListSubscribed('', FSubscribedMailFolders);

    for I := 0 to FMailFolders.Count - 1 do
    begin
      if InWork then
      begin
        SetWorkProcess(IntToStr(I + 1) + '/' + IntToStr(FMailFolders.Count));
        Application.ProcessMessages;
      end
      else
        Exit;

      MailFolderName := FMailFolders[I];
      TempNode := AddFolderToTreeList(MailFolderName);
      FMailFolders.Objects[I] := TObject(Integer(TempNode));
      Imap.SelectROFolder(MailFolderName);
      TempNode.Texts[1] := IntToStr(Imap.SelectedCount);
      if FSubscribedMailFolders.IndexOf(MailFolderName)<>-1 then
      begin
        TempNode.Values[2] := True;
        TempNode.Values[3] := True;
        FSubscribedMailFolders.Objects[FSubscribedMailFolders.IndexOf(MailFolderName)] := TObject(Integer(TempNode));
      end
      else
      begin
        TempNode.Values[2] := False;
        TempNode.Values[3] := False;
      end;
    end;
  finally
    StopWork;

    if TLFolders.Root<>nil then
      TLFolders.Root.Expand(True);
    if TLFolders.Count>0 then
      TLFolders.FocusedNode := TLFolders.Items[0];

    TLFolders.EndUpdate;
  end;
end;

function TFMailBox.StringToWideStringEx(const AString: String; ACodePage: Word): WideString;
var
  InputLength,
  OutputLength: Integer;
begin
  InputLength := Length(AString);
  OutputLength := MultiByteToWideChar(ACodePage, 0, PAnsiChar(AnsiString(AString)), InputLength, nil, 0);
  SetLength(Result, OutputLength);
  MultiByteToWideChar(ACodePage, 0, PAnsiChar(AnsiString(AString)), InputLength, PWideChar(Result), OutputLength);
end;

function TFMailBox.ConvertUTF7ImapToWideString(const AString: String): WideString;
var
  S, T: String;
  I, J: Integer;
begin
  Result := '';
  S := AString;
  while True do
  begin
    I := Pos('&', S);
    if I=0 then
    begin
      Result := Result + S;
      Break;
    end
    else
    begin
      Result := Result + Copy(S, 1, I - 1);
      Delete(S, 1, I - 1);
      J := Pos('-', S);
      T := Copy(S, 1, J);
      Delete(S, 1, J);
      T := StringReplace(T, '&', '+', [rfReplaceAll, rfIgnoreCase]);
      T := StringReplace(T, ',', '/', [rfReplaceAll, rfIgnoreCase]);
      T := StringToWideStringEx(T, CP_UTF7);
      Result := Result + T;
    end;
  end;
end;

function TFMailBox.ConvertStringToUTF7Imap(const AString: String): string;
var
  StringStream: TStringStream;
  I: Integer;
begin
  Result := '';
  StringStream := TStringStream.Create(AString, TEncoding.UTF7);
  try
    for I := 0 to StringStream.Size - 1 do
      Result := Result + Chr(StringStream.Bytes[I]);
    Result := StringReplace(Result, '+', '&', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, '/', ',', [rfReplaceAll, rfIgnoreCase]);
  finally
    StringStream.Free;
  end;
end;

function TFMailBox.AddFolderToTreeList(const AName: String): TcxTreeListNode;
var
  I: Integer;
  S, T: String;
  OwnerNode, TempNode: TcxTreeListNode;
begin
  Result := nil;
  OwnerNode := TLFolders.Root;
  S := AName;
  if S[1]=FMailBoxSeparator then
    Delete(S, 1, 1);

  while True do
  begin
    I := Pos(FMailBoxSeparator, S);
    if I=0 then
    begin
      Result := TLFolders.AddChild(OwnerNode);
      Result.Texts[0] := ConvertUTF7ImapToWideString(S);
      Break;
    end
    else
    begin
      T := Copy(S, 1, I - 1);
      Delete(S, 1, I);
      TempNode := TLFolders.FindNodeByText(ConvertUTF7ImapToWideString(T), TLFolders.Columns[0], OwnerNode, False, True, False);
      if TempNode=nil then
      begin
        OwnerNode := TLFolders.AddChild(OwnerNode);
        OwnerNode.Texts[0] := ConvertUTF7ImapToWideString(T);
      end
      else
        OwnerNode := TempNode;
    end;
  end;
end;

function TFMailBox.CheckConnected: Boolean;
begin
  Result := False;

  try
    Result := Imap.NoOp;
  except
  end;

  if not(Result) then
  begin
    ShowMessage('You are not connected. Please click Login to connect.');
    PCMailbox.ActivePageIndex := 0;
  end;
end;

function TFMailBox.GetFolderName(ANode: TcxTreelistNode): string;
begin
  Result := '';
  if ANode = nil then
  begin
    Exit;
  end
  else
  begin
    Result := ANode.Texts[0];
    while (ANode.Parent<>TLFolders.Root) do
    begin
      ANode := ANode.Parent;
      Result := ANode.Texts[0] + FMailBoxSeparator + Result;
    end;
  end;
end;

function TFMailBox.GetOriginalFolderName(ANode: TcxTreelistNode): string;
begin
  Result := '';
  if ANode=nil then
  begin
    Exit;
  end
  else
  begin
    if FMailFolders.IndexOfObject(TObject(Integer(ANode)))=-1 then
    begin
      Exit;
    end
    else
    begin
      Result := FMailFolders.Strings[FMailFolders.IndexOfObject(TObject(Integer(ANode)))];
    end;
  end;
end;

procedure TFMailBox.GetMessageList;
var
  TempItem: TListItem;
  I: Integer;
  MessageSize: Integer;
  MimeMessage: TMimeMess;
  MessageFlags: String;
begin
  LVMessages.Clear;
  MMessage.Clear;

  StartWork('GetMessageList');
  MimeMessage := TMimeMess.Create;
  try
    Imap.SelectROFolder(GetOriginalFolderName(TLFolders.FocusedNode));
    PCMailbox.ActivePageIndex := 2;
    FMessagesCount := Imap.SelectedCount;
    for I := 1 to FMessagesCount do
    begin
      if InWork then
      begin
        SetWorkProcess(IntToStr(I) + '/' + IntToStr(FMessagesCount));
        Application.ProcessMessages;
      end
      else
      begin
        Exit;
      end;

      Imap.FetchHeader(I, MimeMessage.Lines);
      MessageSize := Imap.MessageSize(I);
      Imap.GetFlagsMess(I, MessageFlags);

      MimeMessage.DecodeMessage;

      TempItem := LVMessages.Items.Add;
      TempItem.Caption := IntToStr(I);
      TempItem.Data := Pointer(I);

      TempItem.SubItems.Add('');
      TempItem.SubItems.Add(MimeMessage.Header.From);
      TempItem.SubItems.Add(MimeMessage.Header.Subject);
      TempItem.SubItems.Add(DateTimeToStr(MimeMessage.Header.Date));
      TempItem.SubItems.Add(IntToStr(MessageSize));
      TempItem.SubItems.Add(MessageFlags);
    end;
  finally
    MimeMessage.Free;
    StopWork;

    if LVMessages.Items.Count>0 then
      LVMessages.Selected := LVMessages.Items[0];
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TFMailBox.FormCreate(Sender: TObject);
begin
  Imap := TIMAPSend.Create;

  FMailFolders := TStringList.Create;
  FSubscribedMailFolders := TStringList.Create;
  StopWork;
  LoadProfiles(LCBProfiles);
end;

procedure TFMailBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopWork;
  BLogoutClick(Sender);
  FSubscribedMailFolders.Free;
  FMailFolders.Free;

  Imap.Free;
end;

procedure TFMailBox.BLoginClick(Sender: TObject);
begin
  if Trim(TEServer.Text) = '' then
    BLoadProfileClick(Sender);

  if (Trim(TEServer.Text) = '') or (Trim(TEUser.Text) = '') or (Trim(TEPassword.Text) = '') then
  begin
    ShowMessage('Check Login parameters!');
    Exit;
  end;

  if Imap.Capability then
  begin
    ShowMessage('You are already connected. Please click Logout to disconnect.');
    Exit;
  end;

  StopWork;

  Imap.TargetHost := Trim(TEServer.Text);
  Imap.TargetPort := Trim(TEPort.Text);
  Imap.UserName := Trim(TEUser.Text);
  Imap.Password := Trim(TEPassword.Text);

  Imap.AutoTLS := ChBUseTLS.Checked;
  Imap.FullSSL := ChBUseTLS.Checked;

  TImapTimeout.Interval := SETimeout.Value * 1000;

  try
    Imap.Login;
    if Imap.Capability then
    begin
      TImapTimeout.Enabled := True;

      PCMailbox.ActivePageIndex := 1;
      GetFolderList;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TFMailBox.BLogoutClick(Sender: TObject);
begin
  StopWork;

  FMailFolders.Clear;
  FSubscribedMailFolders.Clear;
  TLFolders.Clear;

  TImapTimeout.Enabled := False;

  if Imap.Capability then
  begin
    Imap.Logout;
  end;
end;

procedure TFMailBox.TImapTimeoutTimer(Sender: TObject);
begin
  if Imap.Capability then
  begin
    if InWork then
      Exit;
    try
      Imap.Noop;
    except
      Imap.Logout;
      Imap.Login;
    end;
  end;
end;

procedure TFMailBox.TLFoldersDblClick(Sender: TObject);
begin
  if (Imap.Capability) and (TLFolders.FocusedNode<>nil) then
  begin
    StopWork;

    try
      GetMessageList;
    except on E: Exception do
      ShowMessage(E.Message);
     end;
  end;
end;

procedure TFMailBox.TLFoldersFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if (Imap.Capability) and (TLFolders.FocusedNode<>nil) then
  begin
    StopWork;
    TEFolderName.Text := GetFolderName(TLFolders.FocusedNode);
    Imap.SelectFolder(GetOriginalFolderName(TLFolders.FocusedNode));
  end;
end;

procedure TFMailBox.BGetFoldersListClick(Sender: TObject);
begin
  if not(Imap.Capability) then
  begin
    StopWork;

    ShowMessage('You are not connected. Please click Login to connect.');
    PCMailbox.ActivePageIndex := 0;
    Exit;
  end;
  GetFolderList;
end;

procedure TFMailBox.BNewRootFolderClick(Sender: TObject);
var
  NewFolderName: String;
  ClickedOK: Boolean;
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    NewFolderName := 'NewFolder';
    ClickedOK := InputQuery('Create Folder', 'New Folder Name:', NewFolderName);
    if ClickedOK then
    begin
      NewFolderName := Trim(NewFolderName);
      if NewFolderName='' then
      begin
        ShowMessage('The Folder name can not be empty');
        Exit;
      end;
      NewFolderName := StringReplace(NewFolderName, FMailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
      NewFolderName := ConvertStringToUTF7Imap(NewFolderName);
      Imap.CreateFolder(NewFolderName);
      Imap.SubscribeFolder(NewFolderName);
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BNewFolderClick(Sender: TObject);
var
  NewFolderName: String;
  ClickedOK: Boolean;
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    NewFolderName := 'NewFolder';
    ClickedOK := InputQuery('Create Folder', 'New Folder Name:', NewFolderName);
    if ClickedOK then
    begin
      NewFolderName := Trim(NewFolderName);
      if NewFolderName='' then
      begin
        ShowMessage('The Folder name can not be empty');
        Exit;
      end;
      NewFolderName := StringReplace(NewFolderName, FMailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
      NewFolderName := GetOriginalFolderName(TLFolders.FocusedNode) + FMailBoxSeparator + ConvertStringToUTF7Imap(NewFolderName);
      Imap.CreateFolder(NewFolderName);
      Imap.SubscribeFolder(NewFolderName);
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BRenameFolderClick(Sender: TObject);
var
  NewFolderName: String;
  ClickedOK: Boolean;
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    NewFolderName := TLFolders.FocusedNode.Texts[0];
    ClickedOK := InputQuery('Rename Folder', 'New Folder Name:', NewFolderName);
    if ClickedOK then
    begin
      NewFolderName := Trim(NewFolderName);
      if NewFolderName='' then
      begin
        ShowMessage('The Folder name can not be empty');
        Exit;
      end;
      if NewFolderName=TLFolders.FocusedNode.Texts[0] then
      begin
        Exit;
      end;

      NewFolderName := StringReplace(NewFolderName, FMailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
      if TLFolders.FocusedNode.Parent<>TLFolders.Root then
        NewFolderName := GetOriginalFolderName(TLFolders.FocusedNode.Parent) + FMailBoxSeparator + ConvertStringToUTF7Imap(NewFolderName);
      Imap.RenameFolder(GetOriginalFolderName(TLFolders.FocusedNode), NewFolderName);
      Imap.SubscribeFolder(NewFolderName);
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BDeleteFolderClick(Sender: TObject);

  procedure DeleteFolder(ANode: TcxTreelistNode);
  begin
    Imap.UnsubscribeFolder(GetOriginalFolderName(ANode));
    Imap.DeleteFolder(GetOriginalFolderName(ANode));
//Костыль
//После DeleteMailBox сервер отключает соединение
//Но Indy (и IPWorks) об ътом не знает и Connected не показывает обрыв связи
//Поэтому ловим Exeption в Indy - EIdConnClosedGracefully
//Поэтому ловим Exeption в IPWorks - Interrupt
//и переподключаемся
    try
      Imap.Logout;
      Imap.Login;
    except
      Imap.Login;
    end;
  end;

  procedure RecurseDeleteFolders(AOwnerNode: TcxTreelistNode);
  var
    TempNode: TcxTreelistNode;
  begin
    TempNode := AOwnerNode.GetFirstChild;
    if TempNode = nil then
    begin
      Exit;
    end;

    repeat
      RecurseDeleteFolders(TempNode);
      DeleteFolder(TempNode);
      TempNode := AOwnerNode.GetNextChild(TempNode);
    until TempNode = nil;
  end;

begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    if (MessageDlg(Format('Do you wish to delete the "%s" folder?', [GetFolderName(TLFolders.FocusedNode)]), mtConfirmation, [mbYes, mbNo], 0)<>mrYes) then
      Exit;

    if TLFolders.FocusedNode.Count<>0 then
    begin
      if (MessageDlg(Format('The folder "%s" has %d Children. Delete the child folders as well?', [GetFolderName(TLFolders.FocusedNode), TLFolders.FocusedNode.Count]), mtConfirmation, [mbYes, mbNo], 0)=mrYes) then
      begin
        RecurseDeleteFolders(TLFolders.FocusedNode);
      end
      else
      begin
        ShowMessage(Format('The folder "%s" has %d Children. Delete child folders first.', [GetFolderName(TLFolders.FocusedNode), TLFolders.FocusedNode.Count]));
        Exit;
      end;
    end;
    DeleteFolder(TLFolders.FocusedNode);
    GetFolderList;
  end;
end;

procedure TFMailBox.BSubscribeFolderClick(Sender: TObject);
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    Imap.SubscribeFolder(GetOriginalFolderName(TLFolders.FocusedNode));
    ShowMessage(Format('The folder "%s" has been subscribed.', [GetFolderName(TLFolders.FocusedNode)]));
    GetFolderList;
  end;
end;

procedure TFMailBox.BUnSubscribeFolderClick(Sender: TObject);
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    Imap.UnsubscribeFolder(GetOriginalFolderName(TLFolders.FocusedNode));
    ShowMessage(Format('The folder "%s" has been unsubscribed.', [GetFolderName(TLFolders.FocusedNode)]));
    GetFolderList;
  end;
end;

procedure TFMailBox.BPurgeClick(Sender: TObject);
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode<>nil then
  begin
    StopWork;

    if (MessageDlg('Purge all marked as deleted messages in selected folder?', mtConfirmation, [mbYes, mbNo], 0)=mrYes) then
    begin
      Imap.SelectFolder(GetOriginalFolderName(TLFolders.FocusedNode));
      Imap.ExpungeFolder;
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BClearFolderClick(Sender: TObject);
var
  I: Integer;
  MessagesCount: Integer;
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode <> nil then
  begin
    if (MessageDlg('Delete all messages in selected folder?', mtConfirmation, [mbYes, mbNo], 0)=mrNo) then
    begin
      Exit;
    end;

    StopWork;

    StartWork('Clear Folder');
    try
      Imap.SelectFolder(GetOriginalFolderName(TLFolders.FocusedNode));
      MessagesCount := Imap.SelectedCount;
      for I := 1 to MessagesCount do
      begin
        if InWork then
        begin
          SetWorkProcess(IntToStr(I) + '/' + IntToStr(FMessagesCount));
          Application.ProcessMessages;
        end
        else
        begin
          Exit;
        end;

        Imap.DeleteMess(I);
      end;
    finally
      Imap.ExpungeFolder;
      StopWork;
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BClearFolderFastClick(Sender: TObject);
var
  MessagesCount: Integer;
begin
  if not(CheckConnected) then
    Exit;

  if TLFolders.FocusedNode <> nil then
  begin
    if (MessageDlg('Delete all messages in selected folder?', mtConfirmation, [mbYes, mbNo], 0)=mrNo) then
    begin
      Exit;
    end;

    StopWork;

    StartWork('Clear Folder');
    try
      Imap.SelectFolder(GetOriginalFolderName(TLFolders.FocusedNode));
      MessagesCount := Imap.SelectedCount;

      Imap.IMAPcommand('STORE 1:' + IntToStr(MessagesCount) + ' +FLAGS.SILENT (\Deleted)');
    finally
      Imap.ExpungeFolder;
      StopWork;
      GetFolderList;
    end;
  end;
end;

procedure TFMailBox.BGetMessagesListClick(Sender: TObject);
begin
  if not(CheckConnected) then
    Exit;

  StopWork;

  GetMessageList;
end;

procedure TFMailBox.LVMessagesDblClick(Sender: TObject);
var
  MimeMessage: TMimeMess;
begin
  if not(CheckConnected) then
    Exit;

  if (Imap.Capability) and (LVMessages.Selected<>nil) then
  begin
    StopWork;

    MMessage.Clear;
    MimeMessage := TMimeMess.Create;
    try
      Imap.FetchMess(Integer(LVMessages.Selected.Data), MimeMessage.Lines);
      MMessage.Lines.AddStrings(MimeMessage.Lines);
    finally
      MimeMessage.Free;
    end;

    MMessage.SelStart := 0;
    MMessage.SelLength := 0;
  end
  else
  begin
    MMessage.Lines.Clear;
  end;
end;

procedure TFMailBox.BDeleteMessageClick(Sender: TObject);
begin
  if not(CheckConnected) then
    Exit;

  if (LVMessages.Selected<>nil) and (LVMessages.SelCount=1) then
  begin
    StopWork;

    if (MessageDlg('Do you wish to delete the message?', mtConfirmation, [mbYes, mbNo], 0)=mrYes) then
    begin
      Imap.DeleteMess(Integer(LVMessages.Selected.Data));
      GetMessageList;
    end;
  end;
end;

procedure TFMailBox.BSaveProfileClick(Sender: TObject);
begin
  MDProfiles.Append;
  MDProfiles.FieldByName('Server').AsString := Trim(TEServer.Text);
  MDProfiles.FieldByName('User').AsString := Trim(TEUser.Text);
  MDProfiles.FieldByName('Password').AsString := Trim(TEPassword.Text);
  MDProfiles.FieldByName('Port').AsString := Trim(TEPort.Text);
  MDProfiles.FieldByName('UseTLS').AsBoolean := ChBUseTLS.Checked;
  MDProfiles.FieldByName('UseSASL').AsBoolean := ChBUseSASL.Checked;
  MDProfiles.Post;

  SaveProfiles(LCBProfiles);
end;

procedure TFMailBox.BSelectAllFoldersClick(Sender: TObject);
var
  I: Integer;
begin
  TLFolders.BeginUpdate;
  try
    for I := 0 to TLFolders.AbsoluteCount - 1 do
      TLFolders.AbsoluteItems[I].Values[3] := True;
  finally
    TLFolders.EndUpdate;
  end;
end;

procedure TFMailBox.BUnSelectAllFoldersClick(Sender: TObject);
var
  I: Integer;
begin
  TLFolders.BeginUpdate;
  try
    for I := 0 to TLFolders.AbsoluteCount - 1 do
      TLFolders.AbsoluteItems[I].Values[3] := False;
  finally
    TLFolders.EndUpdate;
  end;
end;

procedure TFMailBox.BLoadProfileClick(Sender: TObject);
var
  FocusedRecordIndex: Integer;
begin
  FocusedRecordIndex := LCBProfiles.Properties.DataController.FocusedRecordIndex;
  if (MDProfiles.RecordCount>0) and (FocusedRecordIndex<>-1) then
  begin
    TEServer.Text := VarToStr(LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 0]);
    TEUser.Text := VarToStr(LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 2]);
    TEPassword.Text := VarToStr(LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 3]);
    TEPort.Text := VarToStr(LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 1]);
    ChBUseTLS.Checked := LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 4];
    ChBUseSASL.Checked := LCBProfiles.Properties.DataController.Values[FocusedRecordIndex, 5];
  end;
end;

procedure TFMailBox.BDeleteProfileClick(Sender: TObject);
begin
  if MDProfiles.RecordCount>0 then
  begin
    MDProfiles.Delete;

    SaveProfiles(LCBProfiles);
  end;
end;

procedure TFMailBox.TSMessagesShow(Sender: TObject);
begin
  SendMessage (Application.MainForm.Handle, WM_SIZE, 0, 0);
end;

end.

