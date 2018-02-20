object FCopyProgress: TFCopyProgress
  Left = 0
  Top = 0
  Caption = 'Copy Progress'
  ClientHeight = 536
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 630
    Height = 536
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
    object BStartCopy: TcxButton
      Left = 19
      Top = 489
      Width = 75
      Height = 25
      Caption = 'Start Copy'
      TabOrder = 2
      OnClick = BStartCopyClick
    end
    object BStopCopy: TcxButton
      Left = 218
      Top = 489
      Width = 75
      Height = 25
      Caption = 'Stop Copy'
      TabOrder = 3
      OnClick = BStopCopyClick
    end
    object TEDSTFolder: TcxTextEdit
      Left = 111
      Top = 426
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object TLFolders: TcxTreeList
      Left = 19
      Top = 22
      Width = 250
      Height = 150
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.FocusRect = False
      TabOrder = 0
      TabStop = False
      Data = {
        00000500BC0000000F00000044617461436F6E74726F6C6C6572310500000012
        000000546378537472696E6756616C7565547970651200000054637853747269
        6E6756616C75655479706512000000546378537472696E6756616C7565547970
        6512000000546378537472696E6756616C756554797065120000005463785374
        72696E6756616C75655479706501000000445855464D54010100000000000000
        08080000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0A0801000000}
      object TLFoldersColumn1: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.Text = 'Folder Name'
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TLFoldersColumn2: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.Text = 'Total'
        DataBinding.ValueType = 'String'
        Options.Sizing = False
        Width = 40
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TLFoldersColumn3: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.Text = 'Copy'
        DataBinding.ValueType = 'String'
        Options.Sizing = False
        Width = 40
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TLFoldersColumn4: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.Text = 'Left'
        DataBinding.ValueType = 'String'
        Options.Sizing = False
        Width = 40
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TLFoldersColumn5: TcxTreeListColumn
        PropertiesClassName = 'TcxProgressBarProperties'
        Caption.Text = 'Copy Progress'
        DataBinding.ValueType = 'String'
        Options.Sizing = False
        Width = 200
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object BClose: TcxButton
      Left = 418
      Top = 489
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = BCloseClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'Separator'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = BStartCopy
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = BStopCopy
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Destination Folder'
      Control = TEDSTFolder
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxTreeList1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = TLFolders
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BClose
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2007Blue'
    Left = 216
    Top = 76
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 384
    Top = 68
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
  object SRCImap: TIdIMAP4
    IOHandler = SRCTLS
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 232
    Top = 216
  end
  object DSTImap: TIdIMAP4
    IOHandler = DSTTLS
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 364
    Top = 216
  end
  object MailMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 300
    Top = 216
  end
  object SRCTLS: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':143'
    MaxLineAction = maException
    Port = 143
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 231
    Top = 270
  end
  object DSTTLS: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':143'
    MaxLineAction = maException
    Port = 143
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 363
    Top = 274
  end
  object TSRCImapTimeout: TTimer
    Enabled = False
    OnTimer = TSRCImapTimeoutTimer
    Left = 136
    Top = 216
  end
  object TDSTImapTimeout: TTimer
    OnTimer = TDSTImapTimeoutTimer
    Left = 460
    Top = 216
  end
end
