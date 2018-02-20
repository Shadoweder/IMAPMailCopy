object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'IMAP Mail Copy ('#169' shadoweder@gmail.com)'
  ClientHeight = 732
  ClientWidth = 883
  Color = clBtnFace
  Constraints.MinHeight = 700
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 883
    Height = 732
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
    object PDSTMailBox: TPanel
      Left = 454
      Top = 40
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Caption = 'PDSTMailBox'
      Color = 16775410
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
    end
    object PSRCMailBox: TPanel
      Left = 19
      Top = 40
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Caption = 'PSRCMailBox'
      Color = 16775410
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
    end
    object BCopyMessage: TcxButton
      Left = 19
      Top = 685
      Width = 120
      Height = 25
      Caption = 'Copy Message'
      TabOrder = 2
      OnClick = BCopyMessageClick
    end
    object BCopyFolder: TcxButton
      Left = 303
      Top = 685
      Width = 120
      Height = 25
      Caption = 'Copy Folder'
      TabOrder = 3
      OnClick = BCopyFolderClick
    end
    object BCopySelectedFolders: TcxButton
      Left = 586
      Top = 685
      Width = 120
      Height = 25
      Caption = 'Copy Selected Folders'
      TabOrder = 4
      OnClick = BCopySelectedFoldersClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
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
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Source MailBox'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Destination MailBox'
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Panel1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = PDSTMailBox
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Panel1'
      CaptionOptions.Visible = False
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      Control = PSRCMailBox
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BCopyMessage
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BCopyFolder
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = BCopySelectedFolders
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 252
    Top = 28
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
      LookAndFeel.SkinName = 'Office2007Blue'
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2007Blue'
    Left = 396
    Top = 28
  end
end
