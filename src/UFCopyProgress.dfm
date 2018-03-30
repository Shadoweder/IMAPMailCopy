object FCopyProgress: TFCopyProgress
  Left = 0
  Top = 0
  Caption = 'Copy Progress'
  ClientHeight = 600
  ClientWidth = 600
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 600
    Height = 580
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
    ExplicitWidth = 630
    ExplicitHeight = 536
    object BStartCopy: TcxButton
      Left = 19
      Top = 533
      Width = 75
      Height = 25
      Caption = 'Start Copy'
      TabOrder = 4
      OnClick = BStartCopyClick
    end
    object BStopCopy: TcxButton
      Left = 208
      Top = 533
      Width = 75
      Height = 25
      Caption = 'Stop Copy'
      TabOrder = 5
      OnClick = BStopCopyClick
    end
    object TEDSTFolder: TcxTextEdit
      Left = 111
<<<<<<< HEAD
      Top = 419
=======
      Top = 470
>>>>>>> 0a145d93f599060a4f79c3f9372842351522ec00
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object TLFolders: TcxTreeList
      Left = 19
      Top = 223
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
      TabOrder = 1
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
      Left = 398
      Top = 533
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 6
      OnClick = BCloseClick
    end
    object SEThreadsCount: TcxSpinEdit
      Left = 111
      Top = 482
      Properties.MaxValue = 10.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Style.HotTrack = False
      TabOrder = 3
      Value = 1
      Width = 121
    end
    object LBLog: TcxListBox
      Left = 19
      Top = 22
      Width = 562
      Height = 195
      ItemHeight = 13
      TabOrder = 0
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
      Index = 4
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
      Index = 1
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
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Threads Count'
      Control = SEThreadsCount
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxListBox1'
      CaptionOptions.Visible = False
      Visible = False
      Control = LBLog
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 580
    Width = 600
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 580
    Width = 600
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitLeft = 108
    ExplicitTop = 560
    ExplicitWidth = 0
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
  object TDoWork: TTimer
    OnTimer = TDoWorkTimer
    Left = 60
    Top = 80
  end
  object OmniEventMonitor: TOmniEventMonitor
    OnPoolThreadCreated = OmniEventMonitorPoolThreadCreated
    OnPoolThreadDestroying = OmniEventMonitorPoolThreadDestroying
    OnPoolThreadKilled = OmniEventMonitorPoolThreadKilled
    OnPoolWorkItemCompleted = OmniEventMonitorPoolWorkItemCompleted
    OnTaskMessage = OmniEventMonitorTaskMessage
    OnTaskTerminated = OmniEventMonitorTaskTerminated
    Left = 160
    Top = 164
  end
  object IdLogEvent1: TIdLogEvent
    Left = 300
    Top = 152
  end
  object TDoWork: TTimer
    Enabled = False
    OnTimer = TDoWorkTimer
    Left = 60
    Top = 80
  end
end
