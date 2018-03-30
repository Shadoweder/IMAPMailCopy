unit UFCopyProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  OtlThreadPool,
  OtlTaskControl,
  OtlEventMonitor,
  OtlComm,
  UFMailBox,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinOffice2007Blue,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxContainer, cxEdit,
  cxStyles, cxTL, cxTextEdit, cxProgressBar, cxCheckBox, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, Vcl.StdCtrls, cxButtons, dxLayoutLookAndFeels,
  dxLayoutControl, cxClasses, dxSkinsForm,
<<<<<<< HEAD
  Vcl.ExtCtrls,
  dxSkinsdxStatusBarPainter, dxStatusBar,
  cxMaskEdit, cxSpinEdit, cxCustomData, cxListBox,
  imapsend, mimemess, ssl_openssl;

const

  WM_CopyMessageWorker_Created = WM_USER + 1;
  WM_CopyMessageWorker_Destroyed = WM_USER + 2;

  WM_CopyMessageWorker_Create = WM_USER + 101;
  WM_CopyMessageWorker_Destroy = WM_USER + 102;
  WM_CopyMessageWorker_Initialize = WM_USER + 103;
  WM_CopyMessageWorker_Cleanup = WM_USER + 104;
  WM_CopyMessageWorker_StartExecute = WM_USER + 105;
  WM_CopyMessageWorker_StopExecute = WM_USER + 106;

  WM_CopyMessageWorker_Log = WM_USER + 201;
=======
  IdIMAP4, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  dxSkinsdxStatusBarPainter, dxStatusBar, IdIntercept, IdLogBase, IdLogEvent;
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00

type
  TCopyType = (ctMessage, ctFolder, ctSelectedFolders);

  TThreadData = record
    SRCImap, DSTImap: TIMAPSend;
    MessageStrings: TStrings;
    SRCMessage: Integer;
    SRCFolder: string;
    DSTFolder: string;
  end;

  TCopyMessageWorker = class(TOmniWorker)
  strict private
    FFormHandle: THandle;
    FTask: Integer;
    FTaskID: Int64;
  public
    constructor Create(AFormHandle: THandle; ATask: Integer);
    destructor Destroy; override;
    function Initialize: boolean; override;
    procedure Cleanup; override;
    procedure Execute;
  end;

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
    TLFoldersColumn3: TcxTreeListColumn;
    TLFoldersColumn4: TcxTreeListColumn;
<<<<<<< HEAD
    StatusBar: TdxStatusBar;
    TDoWork: TTimer;
    dxLayoutGroup4: TdxLayoutGroup;
    SEThreadsCount: TcxSpinEdit;
    dxLayoutItem6: TdxLayoutItem;
    OmniEventMonitor: TOmniEventMonitor;
    LBLog: TcxListBox;
    dxLayoutItem8: TdxLayoutItem;
=======
    SRCTLS: TIdSSLIOHandlerSocketOpenSSL;
    DSTTLS: TIdSSLIOHandlerSocketOpenSSL;
    TSRCImapTimeout: TTimer;
    TDSTImapTimeout: TTimer;
    StatusBar: TdxStatusBar;
    IdLogEvent1: TIdLogEvent;
    TDoWork: TTimer;
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
    procedure FormCreate(Sender: TObject);
    procedure BStopCopyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BStartCopyClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
<<<<<<< HEAD
    procedure TDoWorkTimer(Sender: TObject);
    procedure OmniEventMonitorPoolThreadCreated(const pool: IOmniThreadPool;
      threadID: Integer);
    procedure OmniEventMonitorPoolThreadDestroying(const pool: IOmniThreadPool;
      threadID: Integer);
    procedure OmniEventMonitorPoolThreadKilled(const pool: IOmniThreadPool;
      threadID: Integer);
    procedure OmniEventMonitorPoolWorkItemCompleted(const pool: IOmniThreadPool;
      taskID: Int64);
    procedure OmniEventMonitorTaskMessage(const task: IOmniTaskControl;
      const msg: TOmniMessage);
    procedure OmniEventMonitorTaskTerminated(const task: IOmniTaskControl);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
=======
    procedure TSRCImapTimeoutTimer(Sender: TObject);
    procedure TDSTImapTimeoutTimer(Sender: TObject);
    procedure TDoWorkTimer(Sender: TObject);
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
  private
    { Private declarations }
    MaxThreads: Integer;

    FStartTime: TDateTime;
    FStopTime: TDateTime;

<<<<<<< HEAD
    FSRCSelectedFolderList: TStrings;
=======
    FStartTime: TDateTime;
    FStopTime: TDateTime;

    FSRCMailBox, FDSTMailBox: TFMailBox;
    FSRCMessage, FDSTMessage: Integer;
    FSRCFolder, FDSTFolder: String;
    FSRCSelectedFolderList, FDSTSelectedFolderList: TStrings;
    FSRCFullFolderList, FDSTFullFolderList: TStrings;
    FSRCImapTimeout, FDSTImapTimeout: Integer;
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00

    CurrentFolderCount: Integer;
    CurrentFolderLeft: Integer;
    CurrentNode: TcxTreeListNode;

    FThreadPool: IOmniThreadPool;

    FSRCMailBoxSeparator, FDSTMailBoxSeparator: String;

    procedure CanStartWork(ACanStartWork: Boolean);

    function AddFolderToTreeList(const AName: String): TcxTreeListNode;

    procedure CopyMessage(ASRCMessage: Integer); overload;
    procedure CopyMessage; overload;
    procedure CopyFolder;
    procedure CopySelectedFolders;

    procedure ThreadsCreate;
    procedure ThreadsDestroy;
    procedure ThreadNewWork(ASRCMessage: Integer);
    function IsThreadsActive: Boolean;
    procedure UpdateState;

    procedure WMCopyMessageWorkerCreated(var msg: TMessage); message WM_CopyMessageWorker_Created;
    procedure WMCopyMessageWorkerDestroyed(var msg: TMessage); message WM_CopyMessageWorker_Destroyed;

    procedure Log(const ALogMsg: string);
  public
    { Public declarations }
    FInWork: Boolean;

    FCopyType: TCopyType;

    FSRCMailBox, FDSTMailBox: TFMailBox;

    procedure UpdateTreeList;
    function InWork: Boolean;
    procedure StartWork;
    procedure StopWork;
  end;

var
  FCopyProgress: TFCopyProgress;

//  FThreads1: array of ITask;
  FThreads: array of IOmniTaskControl;
  FThreadsData: array of TThreadData;

implementation

uses
  OtlCommon;

{$R *.dfm}

{TCopyMessageWorker}

constructor TCopyMessageWorker.Create(AFormHandle: THandle; ATask: Integer);
begin
  inherited Create;

  FFormHandle := AFormHandle;
  FTask := ATask;

//  PostMessage(FFormHandle, WM_CopyMessageWorker_Created, integer(FTask), GetCurrentThreadID);
end;

destructor TCopyMessageWorker.Destroy;
begin
<<<<<<< HEAD
//  PostMessage(FFormHandle, WM_CopyMessageWorker_Destroyed, integer(FTask), GetCurrentThreadID);
  inherited;
=======
  FStartTime := Now;
  FStopTime := Now;
  TDoWork.Enabled := True;

  FInWork := True;
  BStartCopy.Enabled := False;
  BStopCopy.Enabled := True;
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
end;

function TCopyMessageWorker.Initialize: boolean;
begin
<<<<<<< HEAD
  FTaskID := Task.UniqueID;
//  Task.Comm.Send(WM_CopyMessageWorker_Initialize, Format('WM_CopyMessageWorker_Initialize - Task %d reporting live from thread %d', [Task.UniqueID, GetCurrentThreadID]));
  Result := true;
end;

procedure TCopyMessageWorker.Cleanup;
begin
//  Task.Comm.Send(WM_CopyMessageWorker_Cleanup, Format('WM_CopyMessageWorker_Cleanup - Task %d signing off from thread %d', [Task.UniqueID, GetCurrentThreadID]));
end;

procedure TCopyMessageWorker.Execute;
begin
//  Task.Comm.Send(WM_CopyMessageWorker_StartExecute, Format('WM_CopyMessageWorker_StartExecute - Task %d START EXECUTE from thread %d, FTask=%d, SRCMessage=%d', [Task.UniqueID, GetCurrentThreadID, FTask, FThreadsData[FTask].SRCMessage]));

  FThreadsData[FTask].MessageStrings.Clear;
  FThreadsData[FTask].SRCImap.FetchMess(FThreadsData[FTask].SRCMessage, FThreadsData[FTask].MessageStrings);
  FThreadsData[FTask].DSTImap.AppendMess(FThreadsData[FTask].DSTFolder, FThreadsData[FTask].MessageStrings);

  Task.Comm.Send(WM_CopyMessageWorker_StopExecute, Format('WM_CopyMessageWorker_StopExecute - Task %d STOP EXECUTE from thread %d, FTask=%d, SRCMessage=%d', [Task.UniqueID, GetCurrentThreadID, FTask, FThreadsData[FTask].SRCMessage]));

  Task.Terminate;
  FThreads[FTask] := nil;
end;

{TCopyMessageWorker}

function TFCopyProgress.InWork: Boolean;
=======
  FStopTime := Now;
  TDoWork.Enabled := False;

  FInWork := False;
  BStartCopy.Enabled := True;
  BStopCopy.Enabled := False;
end;

procedure TFCopyProgress.CanStartWork(ACanStartWork: Boolean);
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
begin
  Result := FInWork;
end;

procedure TFCopyProgress.StartWork;
begin
  FStartTime := Now;
  FStopTime := Now;
  TDoWork.Enabled := True;

  FInWork := True;
  BStartCopy.Enabled := False;
  BStopCopy.Enabled := True;

  SEThreadsCount.Enabled := False;
end;

procedure TFCopyProgress.StopWork;
begin
  Sleep(500);
  FStopTime := Now;
  TDoWork.Enabled := False;

  FInWork := False;
  BStartCopy.Enabled := True;
  BStopCopy.Enabled := False;

  SEThreadsCount.Enabled := True;
end;

procedure TFCopyProgress.CanStartWork(ACanStartWork: Boolean);
begin
  FInWork := False;
  BStartCopy.Enabled := ACanStartWork;
  BStopCopy.Enabled := False;
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
  if S[1]=FSRCMailBoxSeparator then
    Delete(S, 1, 1);

  while True do
  begin
    I := Pos(FSRCMailBoxSeparator, S);
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

procedure TFCopyProgress.CopyMessage(ASRCMessage: Integer);
begin
  ThreadNewWork(ASRCMessage);
end;

procedure TFCopyProgress.CopyMessage;
begin
  FThreadsData[0].SRCImap.SelectROFolder(FThreadsData[0].SRCFolder);
  FThreadsData[0].DSTImap.SelectFolder(FThreadsData[0].DSTFolder);

  CurrentFolderCount := 1;
  CurrentFolderLeft := 1;

<<<<<<< HEAD
  CopyMessage(FThreadsData[0].SRCMessage);

  while IsThreadsActive do
  begin
    Sleep(100);
    Application.ProcessMessages;

    if not(InWork) then
      Exit;
  end;
=======
//  SRCImap.GetUID(FSRCMessage, MessageUID);
//  SRCImap.UIDRetrievePeek(MessageUID, MailMessage);
//  SRCImap.UIDRetrieveFlags(MessageUID, Flags);
  SRCImap.RetrievePeek(FSRCMessage, MailMessage);
  SRCImap.RetrieveFlags(FSRCMessage, Flags);
  DSTImap.AppendMsg(FDSTFolder, MailMessage, Flags);

  TLFolders.Items[0].Values[2] := 1;
  TLFolders.Items[0].Values[3] := 0;
  TLFolders.Items[0].Values[4] := 100;
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
end;

procedure TFCopyProgress.CopyFolder;
var
  I: Integer;
  NewFolderName: String;
  MessagesCount: Integer;
begin
  try
    ThreadsCreate;

    NewFolderName := FThreadsData[0].SRCFolder;
    if NewFolderName[1]=FSRCMailBoxSeparator then
      Delete(NewFolderName, 1, 1);

    while True do
    begin
      I := Pos(FSRCMailBoxSeparator, NewFolderName);
      if I=0 then
      begin
        Break;
      end
      else
      begin
        Delete(NewFolderName, 1, I);
      end;
    end;

    NewFolderName := StringReplace(NewFolderName, FDSTMailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
    NewFolderName := FThreadsData[0].DSTFolder + FDSTMailBoxSeparator + NewFolderName;
    FThreadsData[0].DSTImap.CreateFolder(NewFolderName);
    FThreadsData[0].DSTImap.SubscribeFolder(NewFolderName);

    for I := 0 to MaxThreads - 1 do
    begin
      FThreadsData[I].SRCFolder := FThreadsData[0].SRCFolder;
      FThreadsData[I].DSTFolder := NewFolderName;
      FThreadsData[I].SRCImap.SelectROFolder(FThreadsData[0].SRCFolder);
      FThreadsData[I].DSTImap.SelectFolder(NewFolderName);
    end;

    MessagesCount := FThreadsData[0].SRCImap.SelectedCount;

    CurrentFolderCount := MessagesCount;
    CurrentFolderLeft := MessagesCount;

    for I := 1 to MessagesCount do
    begin
      CopyMessage(I);

      Application.ProcessMessages;
      if not(InWork) then
        Exit;
    end;

<<<<<<< HEAD
    while IsThreadsActive do
    begin
      Sleep(100);

      Application.ProcessMessages;
      if not(InWork) then
        Exit;
    end;
=======
//    SRCImap.GetUID(I, MessageUID);
//    SRCImap.UIDRetrievePeek(MessageUID, MailMessage);
//    SRCImap.UIDRetrieveFlags(MessageUID, Flags);
    SRCImap.RetrievePeek(I, MailMessage);
    SRCImap.RetrieveFlags(I, Flags);
    DSTImap.AppendMsg(NewFolderName, MailMessage, Flags);
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00

  finally
    ThreadsDestroy;
  end;
end;

procedure TFCopyProgress.CopySelectedFolders;
var
  I, F: Integer;
  NewFolderName: String;
  S, T: string;
  CopyToFolder: string;
begin
  for F := 0 to FSRCSelectedFolderList.Count - 1 do
  begin
    FThreadsData[0].SRCFolder := FSRCSelectedFolderList.Strings[F];
    FThreadsData[0].DSTFolder := FDSTMailBox.GetOriginalFolderName(FDSTMailBox.TLFolders.FocusedNode);

    NewFolderName := FSRCSelectedFolderList.Strings[F];
    NewFolderName := StringReplace(NewFolderName, FSRCMailBoxSeparator, FDSTMailBoxSeparator, [rfReplaceAll, rfIgnoreCase]);
    if NewFolderName[1]=FSRCMailBoxSeparator then
      Delete(NewFolderName, 1, 1);

    CopyToFolder := FThreadsData[0].DSTFolder;
    S := NewFolderName;
    while True do
    begin
      I := Pos(FDSTMailBoxSeparator, S);
      if I = 0 then
      begin
        Break;
      end
      else
      begin
        T := Copy(S, 1, I - 1);
        Delete(S, 1, I);
        T := StringReplace(T, FDSTMailBoxSeparator, '_',[rfReplaceAll, rfIgnoreCase]);
        CopyToFolder := CopyToFolder + FDSTMailBoxSeparator + T;
        FThreadsData[0].DSTImap.CreateFolder(CopyToFolder);
        FThreadsData[0].DSTImap.SubscribeFolder(CopyToFolder);
      end;
    end;

    FThreadsData[0].DSTFolder := CopyToFolder;

    CurrentNode := TcxTreeListNode(FSRCSelectedFolderList.Objects[F]);

    CopyFolder;
  end;
end;

procedure TFCopyProgress.ThreadsCreate;
var
  I: Integer;
begin
  SetLength(FThreads, MaxThreads);
  SetLength(FThreadsData, MaxThreads);

  for I := 1 to MaxThreads - 1 do
  begin
    FThreads[I] := nil;

    FThreadsData[I].SRCImap := TIMAPSend.Create;
    FThreadsData[I].SRCImap.TargetHost := FThreadsData[0].SRCImap.TargetHost;
    FThreadsData[I].SRCImap.TargetPort := FThreadsData[0].SRCImap.TargetPort;
    FThreadsData[I].SRCImap.UserName := FThreadsData[0].SRCImap.UserName;
    FThreadsData[I].SRCImap.Password := FThreadsData[0].SRCImap.Password;
    FThreadsData[I].SRCImap.AutoTLS := FThreadsData[0].SRCImap.AutoTLS;
    FThreadsData[I].SRCImap.FullSSL := FThreadsData[0].SRCImap.FullSSL;
    FThreadsData[I].SRCImap.Login;

    FThreadsData[I].DSTImap := TIMAPSend.Create;
    FThreadsData[I].DSTImap.TargetHost := FThreadsData[0].DSTImap.TargetHost;
    FThreadsData[I].DSTImap.TargetPort := FThreadsData[0].DSTImap.TargetPort;
    FThreadsData[I].DSTImap.UserName := FThreadsData[0].DSTImap.UserName;
    FThreadsData[I].DSTImap.Password := FThreadsData[0].DSTImap.Password;
    FThreadsData[I].DSTImap.AutoTLS := FThreadsData[0].DSTImap.AutoTLS;
    FThreadsData[I].DSTImap.FullSSL := FThreadsData[0].DSTImap.FullSSL;
    FThreadsData[I].DSTImap.Login;

    FThreadsData[I].MessageStrings :=  TStringList.Create;
  end;
end;

procedure TFCopyProgress.ThreadsDestroy;
var
  I: Integer;
begin
  for I := 1 to MaxThreads - 1 do
  begin
    try
      FThreadsData[I].SRCImap.Logout;
    except
    end;

    try
      FThreadsData[I].DSTImap.Logout;
    except
    end;

    FThreadsData[I].SRCImap.Free;
    FThreadsData[I].DSTImap.Free;

    FThreadsData[I].MessageStrings.Free;
  end;

  for I := 0 to MaxThreads - 1 do
  begin
    if Assigned(FThreads[I]) then
    begin
      FThreads[I].Terminate(100);
//      GlobalOmniThreadPool.CancelAll;
//      if Assigned(FThreadPool) then
//        FThreadPool.CancelAll;
    end;
    FThreads[I] := nil
  end;

  SetLength(FThreads, 1);
  SetLength(FThreadsData, 1);
end;

procedure TFCopyProgress.ThreadNewWork(ASRCMessage: Integer);
var
  FreeTask: Integer;
  I: Integer;
begin
  FreeTask := -1;
  while FreeTask=-1 do
  begin
    for I := Low(FThreads) to High(FThreads) do
    begin
      if FThreads[I]=nil then
      begin
        FreeTask := I;
        Break;
      end;
    end;

    Sleep(100);
    Application.ProcessMessages;

    if not(InWork) then
      Exit;
  end;

  FThreadsData[FreeTask].SRCMessage := ASRCMessage;

  FThreads[FreeTask] := CreateTask(TCopyMessageWorker.Create(Self.Handle, FreeTask), 'Thread' + IntToStr(FreeTask)).
    MonitorWith(OmniEventMonitor).
    Run(@TCopyMessageWorker.Execute);

  Application.ProcessMessages;
end;

function TFCopyProgress.IsThreadsActive: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(FThreads) to High(FThreads) do
  begin
    if (FThreads[I]<>nil) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TFCopyProgress.UpdateState;
begin
  Dec(CurrentFolderLeft);

  CurrentNode.Values[2] := CurrentFolderCount - CurrentFolderLeft;
  CurrentNode.Values[3] := CurrentFolderLeft;
  CurrentNode.Values[4] := Round((CurrentFolderCount - CurrentFolderLeft) * 100 / CurrentFolderCount);
end;

////////////////////////////////////////////////////////////////////////////////

procedure TFCopyProgress.FormCreate(Sender: TObject);
begin
  SetLength(FThreads, 1);
  SetLength(FThreadsData, 1);

  FThreads[0] := nil;

  FThreadsData[0].MessageStrings := TStringList.Create;

  FSRCSelectedFolderList := TStringList.Create;

  GlobalOmniThreadPool.MonitorWith(OmniEventMonitor);
end;

procedure TFCopyProgress.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  GlobalOmniThreadPool.CancelAll;
  if Assigned(FThreadPool) then begin
    FThreadPool.CancelAll;
    FThreadPool := nil;
  end;
  CanClose := True;
end;

procedure TFCopyProgress.FormDestroy(Sender: TObject);
begin
  FSRCSelectedFolderList.Free;

  FThreadsData[0].MessageStrings.Free;

  FThreads[0] := nil;
  SetLength(FThreads, 0);
  SetLength(FThreadsData, 0);
end;

procedure TFCopyProgress.FormShow(Sender: TObject);
var
  I: Integer;
begin
  LBLog.Clear;

  CanStartWork(False);

  StatusBar.Panels[0].Text := '';

  TLFolders.Clear;
  TEDSTFolder.Text := '';

  if not(FSRCMailBox.Imap.Capability) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect SRC MailBox.');
    FSRCMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  if not(FDSTMailBox.Imap.Capability) then
  begin
    ShowMessage('Error! You are not connected. Please click Login to connect DST MailBox.');
    FDSTMailBox.PCMailbox.ActivePageIndex := 0;
    Exit;
  end;

  FThreadsData[0].SRCImap := FSRCMailBox.Imap;
  FThreadsData[0].DSTImap := FDSTMailBox.Imap;

  FSRCMailBoxSeparator := FSRCMailBox.FMailBoxSeparator;
  FDSTMailBoxSeparator := FDSTMailBox.FMailBoxSeparator;

  FThreadsData[0].SRCFolder := '';
  if FSRCMailBox.TLFolders.FocusedNode <> nil then
  begin
    FSRCMailBox.StopWork;
    FThreadsData[0].SRCFolder := FSRCMailBox.GetOriginalFolderName(FSRCMailBox.TLFolders.FocusedNode);
  end;

  if FThreadsData[0].SRCFolder = '' then
  begin
    ShowMessage('Error! Source folder empty!');
    Exit;
  end;

  FThreadsData[0].DSTFolder := '';
  if FDSTMailBox.TLFolders.FocusedNode <> nil then
  begin
    FDSTMailBox.StopWork;
    FThreadsData[0].DSTFolder := FDSTMailBox.GetOriginalFolderName(FDSTMailBox.TLFolders.FocusedNode);
  end;

  if FThreadsData[0].DSTFolder = '' then
  begin
    ShowMessage('Error! Destination folder empty!');
    Exit;
  end;

  TEDSTFolder.Text := FDSTMailBox.GetFolderName(FDSTMailBox.TLFolders.FocusedNode);

  case FCopyType of
    ctMessage:
    begin
      FThreadsData[0].SRCMessage := 0;
      if FSRCMailBox.LVMessages.Selected <> nil then
      begin
        FSRCMailBox.StopWork;
        FThreadsData[0].SRCMessage := Integer(FSRCMailBox.LVMessages.Selected.Data);
      end;

      if (FThreadsData[0].SRCMessage <= 0) then
      begin
        ShowMessage('Error! Source Message Number<=' + IntToStr(FThreadsData[0].SRCMessage));
        Exit;
      end;
    end;
    ctFolder:
    begin
      if FThreadsData[0].SRCFolder='' then
      begin
        ShowMessage('Error! Source folder empty!');
        Exit;
      end;
    end;
    ctSelectedFolders:
    begin
      FSRCSelectedFolderList.Clear;
      if (FSRCMailBox.TLFolders.AbsoluteCount <> 0) then
      begin
        FSRCMailBox.StopWork;
        for I := 0 to FSRCMailBox.TLFolders.AbsoluteCount - 1 do
        begin
          if FSRCMailBox.TLFolders.AbsoluteItems[I].Values[3] = True then
          begin
            FSRCSelectedFolderList.Add(FSRCMailBox.GetOriginalFolderName(FSRCMailBox.TLFolders.AbsoluteItems[I]));
          end;
        end;
      end;

      if FSRCSelectedFolderList.Count = 0 then
      begin
        ShowMessage('Error! Source Selected folder list empty!');
        Exit;
      end;
    end;
  end;

  UpdateTreeList;

  CanStartWork(True);
end;

procedure TFCopyProgress.UpdateTreeList;
var
  I: integer;
  TempNode: TcxTreeListNode;
begin
  TLFolders.Clear;
  case FCopyType of
    ctMessage:
    begin
      TempNode := TLFolders.Add;
      TempNode.Texts[0] := FDSTMailBox.ConvertUTF7ImapToWideString(FThreadsData[0].SRCFolder);
      TempNode.Texts[1] := '1';
      TempNode.Texts[2] := '0';
      TempNode.Texts[3] := '1';
      TempNode.Values[2] := 0;
      CurrentNode := TLFolders.Items[0];
    end;
    ctFolder:
    begin
      FThreadsData[0].SRCImap.SelectROFolder(FThreadsData[0].SRCFolder);
      TempNode := TLFolders.Add;
      TempNode.Texts[0] := FDSTMailBox.ConvertUTF7ImapToWideString(FThreadsData[0].SRCFolder);
      TempNode.Texts[1] := IntToStr(FThreadsData[0].SRCImap.SelectedCount);
      TempNode.Texts[2] := '0';
      TempNode.Texts[3] := IntToStr(FThreadsData[0].SRCImap.SelectedCount);
      TempNode.Values[4] := 0;
      CurrentNode := TLFolders.Items[0];
    end;
    ctSelectedFolders:
    begin
      for I := 0 to FSRCSelectedFolderList.Count - 1 do
      begin
        TempNode := AddFolderToTreeList(FDSTMailBox.ConvertUTF7ImapToWideString(FSRCSelectedFolderList[I]));
        FSRCSelectedFolderList.Objects[I] := TObject(Integer(TempNode));
        FThreadsData[0].SRCImap.SelectROFolder(FSRCSelectedFolderList[I]);
        TempNode.Texts[1] := IntToStr(FThreadsData[0].SRCImap.SelectedCount);
        TempNode.Texts[2] := '0';
        TempNode.Texts[3] := IntToStr(FThreadsData[0].SRCImap.SelectedCount);
        TempNode.Values[4] := 0;
      end;

      if TLFolders.Root <> nil then
        TLFolders.Root.Expand(True);
    end;
  end;
end;

procedure TFCopyProgress.BStartCopyClick(Sender: TObject);
begin
  MaxThreads := SEThreadsCount.Value;

  FThreadsData[0].DSTFolder := FDSTMailBox.GetOriginalFolderName(FDSTMailBox.TLFolders.FocusedNode);

  TEDSTFolder.Text := FDSTMailBox.GetFolderName(FDSTMailBox.TLFolders.FocusedNode);

  if not(FThreadsData[0].SRCImap.Capability) then
    FThreadsData[0].SRCImap.Login;
  if not(FThreadsData[0].DSTImap.Capability) then
    FThreadsData[0].DSTImap.Login;

  UpdateTreeList;

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
    TDoWorkTimer(Sender);
  end;
end;

procedure TFCopyProgress.BStopCopyClick(Sender: TObject);
var
  I: Integer;
begin
  StopWork;
  for I := Low(FThreads) to High(FThreads) do
  begin
    if FThreads[I]<>nil then
    begin
      FThreads[I].Terminate(100);
      try
        FThreadsData[I].SRCImap.Logout;
        FThreadsData[I].DSTImap.Logout;
        FThreads[I] := nil;
      except
      end;
    end;
  end;

  try
    FDSTMailBox.GetFolderList;
  except
    FDSTMailBox.Imap.Logout;
  end;
end;

procedure TFCopyProgress.BCloseClick(Sender: TObject);
begin
  BStopCopyClick(Sender);
  Close;
end;

procedure TFCopyProgress.TDoWorkTimer(Sender: TObject);
var
  S: string;
begin
  if InWork then
  begin
    S := 'Start Time: ' +
      FormatDateTime('yyyy.mm.dd hh:nn:ss', FStartTime) +
      ' | Work time: ' +
      FormatDateTime('hh:nn:ss', Now - FStartTime);
  end
  else
  begin
    S := 'Start Time: ' +
      FormatDateTime('yyyy.mm.dd hh:nn:ss', FStartTime) +
      ' | Stop time: ' +
      FormatDateTime('yyyy.mm.dd hh:nn:ss', FStopTime) +
      ' | Work time: ' +
      FormatDateTime('hh:nn:ss', Now - FStartTime);
    TDoWork.Enabled := False;
  end;
  StatusBar.Panels[0].Text := S;
end;

<<<<<<< HEAD
procedure TFCopyProgress.Log(const ALogMsg: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add(FormatDateTime('hh:nn:ss ', Now) + ALogMsg);
end;

procedure TFCopyProgress.OmniEventMonitorPoolThreadCreated(
  const pool: IOmniThreadPool; threadID: Integer);
begin
  Log(Format('MonitorPoolThreadCreated - Thread %d created in thread pool %d', [threadID, pool.UniqueID]));
end;

procedure TFCopyProgress.OmniEventMonitorPoolThreadDestroying(
  const pool: IOmniThreadPool; threadID: Integer);
begin
  Log(Format('MonitorPoolThreadDestroying - Thread %d destroyed in thread pool %d', [threadID, pool.UniqueID]));
end;

procedure TFCopyProgress.OmniEventMonitorPoolThreadKilled(
  const pool: IOmniThreadPool; threadID: Integer);
begin
  Log(Format('MonitorPoolThreadKilled - Thread %d killed in thread pool %d', [threadID, pool.UniqueID]));
end;

procedure TFCopyProgress.OmniEventMonitorPoolWorkItemCompleted(
  const pool: IOmniThreadPool; taskID: Int64);
begin
  Log(Format('MonitorPoolWorkItemCompleted - Task %d removed from pool', [taskID]));
  if pool.IsIdle then
    Log(Format('MonitorPoolWorkItemCompleted - Pool %d is empty', [pool.UniqueID]));
end;

procedure TFCopyProgress.OmniEventMonitorTaskMessage(
  const task: IOmniTaskControl; const msg: TOmniMessage);
begin
  case msg.MsgID of
    WM_CopyMessageWorker_Log:
    begin
      Log(Format('MonitorTaskMessage - WM_CopyMessageWorker_Log - msg.MsgData="%s"', [msg.MsgData.AsString]));
    end;
    WM_CopyMessageWorker_StartExecute:
    begin
      Log(Format('MonitorTaskMessage - WM_CopyMessageWorker_StartExecute - msg.MsgData="%s"', [msg.MsgData.AsString]));
    end;
    WM_CopyMessageWorker_StopExecute:
    begin
      Log(Format('MonitorTaskMessage - WM_CopyMessageWorker_StopExecute - msg.MsgData="%s"', [msg.MsgData.AsString]));
      UpdateState;
    end
    else
      Log(Format('MonitorTaskMessage - Unknown message msg.MsgID=%d, msg.MsgData="%s"', [msg.MsgID, msg.MsgData.AsString]));
  end;
end;

procedure TFCopyProgress.OmniEventMonitorTaskTerminated(
  const task: IOmniTaskControl);
begin
  Log(Format('MonitorTaskTerminated - Task %d terminated with status [%d]%s', [task.UniqueID, task.ExitCode, task.ExitMessage]));
end;

procedure TFCopyProgress.WMCopyMessageWorkerCreated(var msg: TMessage);
begin
  Log(Format('WM_CopyMessageWorker_Created - Task Created in thread %d, FTask=%d', [msg.LParam, msg.WParam]));
end;

procedure TFCopyProgress.WMCopyMessageWorkerDestroyed(var msg: TMessage);
begin
  Log(Format('WM_CopyMessageWorker_Destroyed - Task Destroyed in thread %d, FTask=%d', [msg.LParam, msg.WParam]));
  FThreads[msg.WParam] := nil;
=======
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
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
end;

end.

