unit UFCopyProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  UFMailBox,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2007Blue,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxContainer, cxEdit, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxProgressBar, cxCheckBox, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, Vcl.StdCtrls, cxButtons, dxLayoutLookAndFeels,
  dxLayoutControl, cxClasses, dxSkinsForm,
  IdIMAP4, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls;

type
  TCopyType = (ctMessage, ctFolder, ctSelectedFolders);

type
  TFCopyProgress = class(TForm)
    dxSkinController1: TdxSkinController;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    BStartCopy: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    BStopCopy: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    TEDSTFolder: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    TLFolders: TcxTreeList;
    dxLayoutItem4: TdxLayoutItem;
    TLFoldersColumn1: TcxTreeListColumn;
    TLFoldersColumn2: TcxTreeListColumn;
    TLFoldersColumn5: TcxTreeListColumn;
    BClose: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    SRCImap: TIdIMAP4;
    DSTImap: TIdIMAP4;
    MailMessage: TIdMessage;
    TLFoldersColumn3: TcxTreeListColumn;
    TLFoldersColumn4: TcxTreeListColumn;
    SRCTLS: TIdSSLIOHandlerSocketOpenSSL;
    DSTTLS: TIdSSLIOHandlerSocketOpenSSL;
    TSRCImapTimeout: TTimer;
    TDSTImapTimeout: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BStopCopyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BStartCopyClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure TSRCImapTimeoutTimer(Sender: TObject);
    procedure TDSTImapTimeoutTimer(Sender: TObject);
  private
    { Private declarations }
    FInWork: Boolean;

  public
    { Public declarations }
    FCopyType: TCopyType;

    FSRCMailBox, FDSTMailBox: TFMailBox;
    FSRCMessage, FDSTMessage: Integer;
    FSRCFolder, FDSTFolder: String;
    FSRCSelectedFolderList, FDSTSelectedFolderList: TStrings;
    FSRCFullFolderList, FDSTFullFolderList: TStrings;
    FSRCImapTimeout, FDSTImapTimeout: Integer;

    function InWork: Boolean;
    procedure StartWork;
    procedure StopWork;

    procedure CanStartWork(ACanStartWork: Boolean);

    procedure AssignImap(AImap, ASRCImap: TIdIMAP4);
    procedure ReAssignImap(AImap: TIdIMAP4);
    procedure AssignData(AMailBox: TFMailBox; out AMessage: Integer; out AFolder: String; ASelectedFolderList: TStrings; AFullFolderList: TStrings; out ATimeOut: Integer);
    function AddFolderToTreeList(const AName: String): TcxTreeListNode;

    procedure CopyMessage;
    procedure CopyFolder;
    procedure CopySelectedFolders;
  end;

var
  FCopyProgress: TFCopyProgress;

implementation

{$R *.dfm}

{$IFDEF DEBUG}
uses
  UFLog;
{$ENDIF}

function TFCopyProgress.InWork: Boolean;
begin
  Result := FInWork;
end;

procedure TFCopyProgress.StartWork;
begin
  FInWork := True;
  BStartCopy.Enabled := False;
  BStopCopy.Enabled := True;
end;

procedure TFCopyProgress.StopWork;
begin
  FInWork := False;
  BStartCopy.Enabled := True;
  BStopCopy.Enabled := False;
end;

procedure TFCopyProgress.TDSTImapTimeoutTimer(Sender: TObject);
begin
  if DSTImap.Connected then
  begin
    if InWork then
      Exit;
//Костыль
//Indy регулярно не знает об обрыве и Connected не показывает обрыв связи
//Поэтому ловим Exeption - EIdConnClosedGracefully
//и переподключаеися
    try
      DSTImap.KeepAlive;
    except
      DSTImap.Disconnect(True);
      DSTImap.Connect;
    end;
  end;
end;

procedure TFCopyProgress.TSRCImapTimeoutTimer(Sender: TObject);
begin
  if SRCImap.Connected then
  begin
    if InWork then
      Exit;
//Костыль
//Indy регулярно не знает об обрыве и Connected не показывает обрыв связи
//Поэтому ловим Exeption - EIdConnClosedGracefully
//и переподключаеися
    try
      SRCImap.KeepAlive;
    except
      SRCImap.Disconnect(True);
      SRCImap.Connect;
    end;
  end;

end;

procedure TFCopyProgress.CanStartWork(ACanStartWork: Boolean);
begin
  FInWork := False;
  BStartCopy.Enabled := ACanStartWork;
  BStopCopy.Enabled := False;
end;

procedure TFCopyProgress.AssignImap(AImap, ASRCImap: TIdIMAP4);
begin
  AImap.Host := ASRCImap.Host;
  AImap.Port := ASRCImap.Port;
  AImap.UserName := ASRCImap.UserName;
  AImap.Password := ASRCImap.Password;
  AImap.AuthType := ASRCImap.AuthType;
  AImap.UseTLS := ASRCImap.UseTLS;
  AImap.MailBoxSeparator := ASRCImap.MailBoxSeparator;
  AImap.Connect;

  if AImap.Connected then
  begin
{$IFDEF DEBUG}
    FLog.LogAddStrings([
    AImap.Name + ': ' + 'Server Connected',
    'Server: ' + AImap.Host,
    'Port: ' + IntToStr(AImap.Port),
    'User: ' + AImap.UserName,
    'Password: ' + AImap.Password,
    'UseSASL: ' + IntToStr(Ord(AImap.AuthType)),
    'UseTLS/SSL: ' + IntToStr(Ord(AImap.UseTLS))]);
{$ENDIF}
  end;
end;

procedure TFCopyProgress.ReAssignImap(AImap: TIdIMAP4);
begin
  if AImap.Connected then
  begin
    AImap.Disconnect;
{$IFDEF DEBUG}
    FLog.LogAddStrings([
    AImap.Name + ': ' + 'Server Disconnected',
    'Server: ' + AImap.Host,
    'Port: ' + IntToStr(AImap.Port),
    'User: ' + AImap.UserName,
    'Password: ' + AImap.Password,
    'UseSASL: ' + IntToStr(Ord(AImap.AuthType)),
    'UseTLS/SSL: ' + IntToStr(Ord(AImap.UseTLS))]);
{$ENDIF}
  end;
end;

procedure TFCopyProgress.AssignData(AMailBox: TFMailBox; out AMessage: Integer; out AFolder: String; ASelectedFolderList: TStrings; AFullFolderList: TStrings; out ATimeOut: Integer);
var
  I: Integer;
begin
  if not(Assigned(AMailBox)) then
    Exit;

  AFullFolderList.Clear;
  AFullFolderList.Assign(AMailBox.FMailFolders);

  ASelectedFolderList.Clear;
  if (AMailBox.TLFolders.AbsoluteCount<>0) then
  begin
    AMailBox.StopWork;
    for I := 0 to AMailBox.TLFolders.AbsoluteCount - 1 do
    begin
      if AMailBox.TLFolders.AbsoluteItems[I].Values[3]=True then
      begin
        ASelectedFolderList.Add(AMailBox.GetOriginalFolderName(AMailBox.TLFolders.AbsoluteItems[I]));
{$IFDEF DEBUG}
        FLog.LogAddStrings([AMailBox.Name + ' AFolderList: ' + AMailBox.GetOriginalFolderName(AMailBox.TLFolders.AbsoluteItems[I])]);
{$ENDIF}
      end;
    end;
  end;

  AFolder := '';
  if AMailBox.TLFolders.FocusedNode<>nil then
  begin
    AMailBox.StopWork;
    AFolder := AMailBox.GetOriginalFolderName(AMailBox.TLFolders.FocusedNode);
{$IFDEF DEBUG}
    FLog.LogAddStrings([AMailBox.Name + ' AFolder: ' + AMailBox.GetOriginalFolderName(AMailBox.TLFolders.FocusedNode)]);
{$ENDIF}
  end;

  AMessage := 0;
  if AMailBox.LVMessages.Selected<>nil then
  begin
    AMailBox.StopWork;
    AMessage := Integer(AMailBox.LVMessages.Selected.Data);
{$IFDEF DEBUG}
    FLog.LogAddStrings([AMailBox.Name + ' AMessage: ' + IntToStr(AMessage)]);
{$ENDIF}
  end;

  ATimeOut := AMailBox.SETimeout.Value;
end;

function TFCopyProgress.AddFolderToTreeList(const AName: String): TcxTreeListNode;
var
  I: Integer;
  S, T: String;
  OwnerNode, TempNode: TcxTreeListNode;
begin
  Result := nil;
  OwnerNode := TLFolders.Root;
  S := AName;
  if S[1]=SRCImap.MailBoxSeparator then
    Delete(S, 1, 1);

  while True do
  begin
    I := Pos(SRCImap.MailBoxSeparator, S);
    if I=0 then
    begin
      Result := TLFolders.AddChild(OwnerNode);
      Result.Texts[0] := S;
      Break;
    end
    else
    begin
      T := Copy(S, 1, I - 1);
      Delete(S, 1, I);
      TempNode := TLFolders.FindNodeByText(T, TLFolders.Columns[0], OwnerNode, False, True, False);
      if TempNode=nil then
      begin
        OwnerNode := TLFolders.AddChild(OwnerNode);
        OwnerNode.Texts[0] := T;
      end
      else
        OwnerNode := TempNode;
    end;
  end;
end;

procedure TFCopyProgress.CopyMessage;
var
  Flags: TIdMessageFlagsSet;
  MessageUID: string;
begin
  SRCImap.SelectMailBox(FSRCFolder);
  DSTImap.SelectMailBox(FDSTFolder);

  SRCImap.GetUID(FSRCMessage, MessageUID);
  SRCImap.UIDRetrievePeek(MessageUID, MailMessage);
  SRCImap.UIDRetrieveFlags(MessageUID, Flags);
  DSTImap.AppendMsg(FDSTFolder, MailMessage, Flags);

//  SRCImap.RetrievePeek(FSRCMessage, MailMessage);
//  DSTImap.AppendMsg(FDSTFolder, MailMessage, []);
  TLFolders.Items[0].Values[2] := 1;
  TLFolders.Items[0].Values[3] := 0;
  TLFolders.Items[0].Values[4] := 100;
end;

procedure TFCopyProgress.CopyFolder;
var
  Flags: TIdMessageFlagsSet;
  MessageUID: string;
  I: Integer;
  NewFolderName: String;
  MessagesCount: Integer;
begin
  NewFolderName := FSRCFolder;
  if NewFolderName[1]=FSRCMailBox.Imap.MailBoxSeparator then
    Delete(NewFolderName, 1, 1);

  while True do
  begin
    I := Pos(FSRCMailBox.Imap.MailBoxSeparator, NewFolderName);
    if I=0 then
    begin
      Break;
    end
    else
    begin
      Delete(NewFolderName, 1, I);
    end;
  end;

  NewFolderName := StringReplace(NewFolderName, FDSTMailBox.Imap.MailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
  NewFolderName := FDSTFolder + FDSTMailBox.Imap.MailBoxSeparator + NewFolderName;
  DSTImap.CreateMailBox(NewFolderName);
  DSTImap.SubscribeMailBox(NewFolderName);

  SRCImap.SelectMailBox(FSRCFolder);
  DSTImap.SelectMailBox(NewFolderName);

  MessagesCount := SRCImap.MailBox.TotalMsgs;
  for I := 1 to MessagesCount do
  begin
    if InWork then
    begin
      Application.ProcessMessages;
    end
    else
      Exit;

    SRCImap.GetUID(I, MessageUID);
    SRCImap.UIDRetrievePeek(MessageUID, MailMessage);
    SRCImap.UIDRetrieveFlags(MessageUID, Flags);
    DSTImap.AppendMsg(NewFolderName, MailMessage, Flags);

    TLFolders.Items[0].Values[2] := I;
    TLFolders.Items[0].Values[3] := MessagesCount - I;
    TLFolders.Items[0].Values[4] := Round(I * 100 / MessagesCount);
  end;
end;

procedure TFCopyProgress.CopySelectedFolders;
var
  Flags: TIdMessageFlagsSet;
  MessageUID: string;
  I, F, M: Integer;
  NewFolderName: String;
  MessagesCount: Integer;
  S, T: string;
  CopyToFolder: string;
  TempNode: TcxTreeListNode;
begin
  for F := 0 to FSRCSelectedFolderList.Count - 1 do
  begin
    NewFolderName := FSRCSelectedFolderList.Strings[F];
    NewFolderName := StringReplace(NewFolderName, FSRCMailBox.Imap.MailBoxSeparator, FDSTMailBox.Imap.MailBoxSeparator,[rfReplaceAll, rfIgnoreCase]);
    if NewFolderName[1]=FSRCMailBox.Imap.MailBoxSeparator then
      Delete(NewFolderName, 1, 1);

    CopyToFolder := FDSTFolder;
    S := NewFolderName;
    while True do
    begin
      I := Pos(DSTImap.MailBoxSeparator, S);
      if I=0 then
      begin
        S := StringReplace(S, FDSTMailBox.Imap.MailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
        CopyToFolder := CopyToFolder + DSTImap.MailBoxSeparator + S;
        DSTImap.CreateMailBox(CopyToFolder);
        DSTImap.SubscribeMailBox(CopyToFolder);
        Break;
      end
      else
      begin
        T := Copy(S, 1, I - 1);
        Delete(S, 1, I);
        T := StringReplace(T, FDSTMailBox.Imap.MailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
        CopyToFolder := CopyToFolder + DSTImap.MailBoxSeparator + T;
        DSTImap.CreateMailBox(CopyToFolder);
        DSTImap.SubscribeMailBox(CopyToFolder);
      end;
    end;


    SRCImap.SelectMailBox(FSRCSelectedFolderList.Strings[F]);
    DSTImap.SelectMailBox(CopyToFolder);

    TempNode := TcxTreeListNode(FSRCSelectedFolderList.Objects[F]);
    MessagesCount := SRCImap.MailBox.TotalMsgs;
    for M := 1 to MessagesCount do
    begin
      if InWork then
      begin
        Application.ProcessMessages;
      end
      else
        Exit;

//      SRCImap.GetUID(M, MessageUID);
//      SRCImap.UIDRetrievePeek(MessageUID, MailMessage);
//      SRCImap.UIDRetrieveFlags(MessageUID, Flags);
      SRCImap.RetrievePeek(M, MailMessage);
      SRCImap.RetrieveFlags(M, Flags);
      DSTImap.AppendMsg(CopyToFolder, MailMessage, Flags);

      TempNode.Values[2] := M;
      TempNode.Values[3] := MessagesCount - M;
      TempNode.Values[4] := Round(M * 100 / MessagesCount);
    end;

  end;

end;

////////////////////////////////////////////////////////////////////////////////

procedure TFCopyProgress.FormCreate(Sender: TObject);
begin
  FSRCSelectedFolderList := TStringList.Create;
  FSRCFullFolderList := TStringList.Create;
  FDSTSelectedFolderList := TStringList.Create;
  FDSTFullFolderList := TStringList.Create;
end;

procedure TFCopyProgress.FormDestroy(Sender: TObject);
begin
  FSRCSelectedFolderList.Free;
  FSRCFullFolderList.Free;
  FDSTFullFolderList.Free;
  FDSTSelectedFolderList.Free;
end;

procedure TFCopyProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReAssignImap(SRCImap);
  ReAssignImap(DSTImap);
  TSRCImapTimeout.Enabled := False;
  TDSTImapTimeout.Enabled := False;
end;

procedure TFCopyProgress.FormShow(Sender: TObject);
var
  MailFolderName: String;
  TempNode: TcxTreeListNode;
  I: Integer;
begin
  CanStartWork(False);

  TLFolders.Clear;
  TEDSTFolder.Text := '';

  if not(FSRCMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FSRCMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  if not(FDSTMailBox.Imap.Connected) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FDSTMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  AssignImap(SRCImap, FSRCMailBox.Imap);
  AssignImap(DSTImap, FDSTMailBox.Imap);

  AssignData(FSRCMailBox, FSRCMessage, FSRCFolder, FSRCSelectedFolderList, FSRCFullFolderList, FSRCImapTimeout);
  AssignData(FDSTMailBox, FDSTMessage, FDSTFolder, FDSTSelectedFolderList, FDSTFullFolderList, FDSTImapTimeout);

  TSRCImapTimeout.Interval := FSRCImapTimeout * 1000;
  TDSTImapTimeout.Interval := FDSTImapTimeout * 1000;
  TSRCImapTimeout.Enabled := True;
  TDSTImapTimeout.Enabled := True;

  if FDSTFolder='' then
  begin
    ShowMessage('Error! Destination folder empty!');
    Exit;
  end;

  TEDSTFolder.Text := FDSTFolder;

  case FCopyType of
    ctMessage:
    begin
      if FSRCMessage<=0 then
      begin
        ShowMessage('Error! Source Message Number<=0' + IntToStr(FSRCMessage));
        Exit;
      end;
      TempNode := TLFolders.Add;
      TempNode.Texts[0] := FSRCFolder;
      TempNode.Texts[1] := '1';
      TempNode.Texts[2] := '0';
      TempNode.Texts[3] := '1';
      TempNode.Values[2] := 0;
    end;
    ctFolder:
    begin
      if FSRCFolder='' then
      begin
        ShowMessage('Error! Source folder empty!');
        Exit;
      end;
      SRCImap.SelectMailBox(FSRCFolder);
      TempNode := TLFolders.Add;
      TempNode.Texts[0] := FSRCFolder;
      TempNode.Texts[1] := IntToStr(SRCImap.MailBox.TotalMsgs);
      TempNode.Texts[2] := '0';
      TempNode.Texts[3] := IntToStr(SRCImap.MailBox.TotalMsgs);
      TempNode.Values[4] := 0;
    end;
    ctSelectedFolders:
    begin
      if FSRCSelectedFolderList.Count=0 then
      begin
        ShowMessage('Error! Source Selected folder list empty!');
        Exit;
      end;

      for I := 0 to FSRCSelectedFolderList.Count - 1 do
      begin
        MailFolderName := FSRCSelectedFolderList[I];
        TempNode := AddFolderToTreeList(MailFolderName);
        FSRCSelectedFolderList.Objects[I] := TObject(Integer(TempNode));
        SRCImap.SelectMailBox(MailFolderName);
        TempNode.Texts[1] := IntToStr(SRCImap.MailBox.TotalMsgs);
        TempNode.Texts[2] := '0';
        TempNode.Texts[3] := IntToStr(SRCImap.MailBox.TotalMsgs);
        TempNode.Values[4] := 0;
        FSRCSelectedFolderList.Objects[I] := TObject(Integer(TempNode));
      end;

      if TLFolders.Root<>nil then
        TLFolders.Root.Expand(True);
    end;
  end;

  CanStartWork(True);
end;

procedure TFCopyProgress.BStartCopyClick(Sender: TObject);
var
  I: integer;
begin
  if not(SRCImap.Connected) then
    SRCImap.Connect;
  if not(DSTImap.Connected) then
    DSTImap.Connect;

  for I := 0 to TLFolders.AbsoluteCount - 1 do
    TLFolders.AbsoluteItems[I].Values[4] := 0;

  StartWork;

  try
    case FCopyType of
      ctMessage:
      begin
        CopyMessage;
      end;
      ctFolder:
      begin
        CopyFolder;
      end;
      ctSelectedFolders:
      begin
        CopySelectedFolders;
      end;
    end;
  finally
    StopWork;
  end;
end;

procedure TFCopyProgress.BStopCopyClick(Sender: TObject);
begin
  StopWork;
  try
    FDSTMailBox.GetFolderList;
  except
    FDSTMailBox.Imap.Disconnect(True);
  end;
end;

procedure TFCopyProgress.BCloseClick(Sender: TObject);
begin
  BStopCopyClick(Sender);
  Close;
end;


end.
