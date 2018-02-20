object FMailBox: TFMailBox
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FMailBox'
  ClientHeight = 500
  ClientWidth = 362
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PCMailBox: TcxPageControl
    Left = 0
    Top = 0
    Width = 362
    Height = 480
    Align = alClient
    Color = 16775410
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    Properties.ActivePage = TSSettings
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 474
    ClientRectLeft = 3
    ClientRectRight = 356
    ClientRectTop = 26
    object TSSettings: TcxTabSheet
      Caption = 'Settings'
      ImageIndex = 1
      object dxLayoutControl2: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 353
        Height = 448
        Align = alClient
        TabOrder = 0
        LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
        object CBServerType: TcxComboBox
          Left = 74
          Top = 10
          Enabled = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'IMAP Mail Server'
            'GMail')
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
        end
        object TEServer: TcxTextEdit
          Left = 74
          Top = 49
          Style.HotTrack = False
          TabOrder = 1
          Width = 121
        end
        object TEUser: TcxTextEdit
          Left = 74
          Top = 76
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        object TEPassword: TcxTextEdit
          Left = 74
          Top = 103
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object TEPort: TcxTextEdit
          Left = 74
          Top = 130
          Style.HotTrack = False
          TabOrder = 4
          Width = 121
        end
        object ChBUseSASL: TcxCheckBox
          Left = 277
          Top = 130
          Caption = 'Use SASL'
          Style.HotTrack = False
          TabOrder = 6
          Transparent = True
        end
        object BLogout: TcxButton
          Left = 10
          Top = 227
          Width = 75
          Height = 25
          Caption = 'Logout'
          TabOrder = 9
          OnClick = BLogoutClick
        end
        object BLogin: TcxButton
          Left = 10
          Top = 196
          Width = 75
          Height = 25
          Caption = 'Login'
          TabOrder = 8
          OnClick = BLoginClick
        end
        object ChBUseTLS: TcxCheckBox
          Left = 191
          Top = 130
          Caption = 'Use TLS/SSL'
          Style.HotTrack = False
          TabOrder = 5
          Transparent = True
        end
        object BSaveProfile: TcxButton
          Left = 10
          Top = 413
          Width = 75
          Height = 25
          Caption = 'Save Profile'
          TabOrder = 12
          OnClick = BSaveProfileClick
        end
        object BDeleteProfile: TcxButton
          Left = 236
          Top = 413
          Width = 75
          Height = 25
          Caption = 'Delete Profile'
          TabOrder = 14
          OnClick = BDeleteProfileClick
        end
        object BLoadProfile: TcxButton
          Left = 123
          Top = 413
          Width = 75
          Height = 25
          Caption = 'Load Profile'
          TabOrder = 13
          OnClick = BLoadProfileClick
        end
        object LCBProfiles: TcxLookupComboBox
          Left = 74
          Top = 386
          Properties.DropDownListStyle = lsFixedList
          Properties.HideSelection = False
          Properties.ListColumns = <
            item
              Caption = 'Server'
              Width = 120
              FieldName = 'Server'
            end
            item
              Caption = 'Port'
              Fixed = True
              MinWidth = 28
              Width = 28
              FieldName = 'Port'
            end
            item
              Caption = 'User'
              Width = 120
              FieldName = 'User'
            end
            item
              Caption = 'Password'
              Width = 64
              FieldName = 'Password'
            end
            item
              Caption = 'UseTLS'
              Fixed = True
              Width = 20
              FieldName = 'UseTLS'
            end
            item
              Caption = 'UseSASL'
              Fixed = True
              Width = 20
              FieldName = 'UseSASL'
            end>
          Properties.ListSource = DSProfiles
          Properties.ReadOnly = True
          Style.HotTrack = False
          TabOrder = 10
          Width = 145
        end
        object IReloadProfiles: TcxImage
          Left = 323
          Top = 386
          Picture.Data = {
            0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
            0000001008060000001FF3FF61000000017352474200AECE1CE9000000046741
            4D410000B18F0BFC610500000027744558745469746C6500526566726573683B
            5265706561743B426172733B526962626F6E3B52656C6F6164CD4DF6E9000003
            0149444154384FA5937B2C95611CC71FE4B8E70F97508DA11D496EB396501DA2
            0B328424E4E432C299E6124735F7EB662A9CE8E49CC339D552D92CE4925B724D
            912C76682E656D35ABE37238F4EB79E48F2EDADAFA6D9FBDCFBEEFF7FB7DDFFD
            F6BE0800FE8BBF8D1446FA3788F6E730F97D8859D9478EC420B57D8F8D8C5BF2
            7D7A22AFB71DEBCB84446E77473CBB3DE6043D499178889F59D9BF9E45B19C9E
            F57050BA60676C79F75850FA5D435A44D9B1E0FCFAB52991186644CBD035F119
            B86D42B8C87E3EE47F85A38FFDD2B3E26F288E641937BB48816C64717BD38BC9
            39389D5AD3AE6D60AA624D2F2DB40DAF00078600A26E3C85C18FF3F0A0771A22
            8B3B46CC685E5BC943A37F64D19673397509BCB671185D5A03D6E361708CE65C
            D5D965A16C60CFD035A04552CDBC0B320F4554AE74CC88E05AED5BF0CFA8BE44
            7261D79F21E412536A9550DE2B112E48A05FB40A63F32B1094552BB1F048A111
            13862C50C1F4545E66405E03DC19988533597564690A01F92D08D904735EDB9C
            E7814F4623B4CC2E42405E0BECA773605FE02D213651360A94B6193B99D98670
            E1E1C43CF8A437AC604D0B43968AE431EAAEC9752BCD1F16C03BAD0934A88EE6
            5853C6C860E49C936ADEB85EAE07CF9446E08E7E0572764DAE07E7C49A094475
            2BC21EA468CFA87AC5EA9C8638761F1CB9509EFF5301C5F464A2835F4EABA4E9
            BD18F8EFC4D030B304B4D08A554DF340176417F58814C859F917A78694F440C5
            D027F04A6B92D0C258B9D483FEE6468703A9722A1ADA96BE05D9A1EC0128132E
            824F660368584617E29C0AB20AAD2205D2CA5ABBB52DE995C270EE20F047BE40
            F4ED01F0CE6C05F7D466D8EB5B24C01E7DF300761FF3C914A859C6BD94A6A86A
            634D069906DE43D553625222AB65E16365E2573EEE99DB09C93542600DCD016B
            700E1CE26B41CF2181AE66E4646D72963749D1B43B80FD1465E37884A8BE7C8C
            60FD4A447935C31DBA47D3F30CDD4B86B00E5807430FD6B0DEF16CA60C454915
            7BC84724276FC04084CD862C4E09A38621AFA98351DFD0C8BD5F67B35FF4DF01
            F41D02F6B0BAF7DD5EE20000000049454E44AE426082}
          Style.HotTrack = False
          TabOrder = 11
          Transparent = True
          OnClick = IReloadProfilesClick
          Height = 20
          Width = 20
        end
        object SETimeout: TcxSpinEdit
          Left = 74
          Top = 157
          Properties.MaxValue = 600.000000000000000000
          Properties.MinValue = 10.000000000000000000
          Properties.Nullstring = '10'
          Style.HotTrack = False
          TabOrder = 7
          Value = 10
          Width = 121
        end
        object dxLayoutControl2Group_Root: TdxLayoutGroup
          AlignHorz = ahClient
          AlignVert = avClient
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem3: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Server Type'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = CBServerType
          ControlOptions.ShowBorder = False
          Enabled = False
          Index = 0
        end
        object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Separator'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Index = 1
        end
        object dxLayoutItem5: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Server'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = TEServer
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem6: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'User'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = TEUser
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object dxLayoutItem7: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Password'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = TEPassword
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object dxLayoutGroup5: TdxLayoutGroup
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 5
        end
        object dxLayoutItem8: TdxLayoutItem
          Parent = dxLayoutGroup5
          AlignHorz = ahClient
          CaptionOptions.Text = 'Port'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = TEPort
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem4: TdxLayoutItem
          Parent = dxLayoutGroup5
          CaptionOptions.Text = 'cxCheckBox1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = ChBUseSASL
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem11: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'cxButton2'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BLogout
          ControlOptions.ShowBorder = False
          Index = 9
        end
        object dxLayoutItem10: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BLogin
          ControlOptions.ShowBorder = False
          Index = 8
        end
        object dxLayoutItem12: TdxLayoutItem
          Parent = dxLayoutGroup5
          CaptionOptions.Text = 'cxCheckBox1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = ChBUseTLS
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutSeparatorItem5: TdxLayoutSeparatorItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Separator'
          Index = 7
        end
        object dxLayoutGroup4: TdxLayoutGroup
          Parent = dxLayoutControl2Group_Root
          AlignVert = avBottom
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 12
        end
        object dxLayoutItem24: TdxLayoutItem
          Parent = dxLayoutGroup4
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          Control = BSaveProfile
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem25: TdxLayoutItem
          Parent = dxLayoutGroup4
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxButton2'
          CaptionOptions.Visible = False
          Control = BDeleteProfile
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem26: TdxLayoutItem
          Parent = dxLayoutGroup4
          AlignHorz = ahClient
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          Control = BLoadProfile
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutSeparatorItem6: TdxLayoutSeparatorItem
          Parent = dxLayoutControl2Group_Root
          AlignVert = avBottom
          CaptionOptions.Text = 'Separator'
          Index = 10
        end
        object dxLayoutGroup8: TdxLayoutGroup
          Parent = dxLayoutControl2Group_Root
          AlignVert = avBottom
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 11
        end
        object LCMLoginProfiles: TdxLayoutItem
          Parent = dxLayoutGroup8
          AlignHorz = ahClient
          CaptionOptions.Text = 'Profile'
          Control = LCBProfiles
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem27: TdxLayoutItem
          Parent = dxLayoutGroup8
          AlignHorz = ahRight
          CaptionOptions.Text = 'cxImage1'
          CaptionOptions.Visible = False
          Control = IReloadProfiles
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutItem30: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'Timeout (s)'
          Control = SETimeout
          ControlOptions.ShowBorder = False
          Index = 6
        end
      end
    end
    object TSFolders: TcxTabSheet
      Caption = 'Folders'
      ImageIndex = 0
      object dxLayoutControl4: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 353
        Height = 448
        Align = alClient
        TabOrder = 0
        LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
        object TLFolders: TcxTreeList
          Left = 10
          Top = 10
          Width = 207
          Height = 150
          Bands = <
            item
            end>
          Navigator.Buttons.CustomButtons = <>
          OptionsData.Deleting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          TabOrder = 0
          OnDblClick = TLFoldersDblClick
          OnFocusedNodeChanged = TLFoldersFocusedNodeChanged
          object TLFoldersColumn1: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Caption.Text = 'Folder Name'
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 145
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
            SortIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object TLFoldersColumn2: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            BestFitMaxWidth = 36
            Caption.Text = 'Total'
            DataBinding.ValueType = 'String'
            Options.Sizing = False
            Options.Editing = False
            Width = 36
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object TLFoldersColumn3: TcxTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'True'
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            BestFitMaxWidth = 20
            Caption.Text = 'Subscribed'
            DataBinding.ValueType = 'Boolean'
            Options.Sizing = False
            Options.Editing = False
            Options.TabStop = False
            Width = 20
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object TLFoldersColumn4: TcxTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'True'
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            BestFitMaxWidth = 20
            Caption.Text = 'Copy selection'
            DataBinding.ValueType = 'Boolean'
            Options.Sizing = False
            Width = 20
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
        object BGetFoldersList: TcxButton
          Left = 243
          Top = 10
          Width = 100
          Height = 25
          Caption = 'Get Folders List'
          TabOrder = 1
          OnClick = BGetFoldersListClick
        end
        object BNewFolder: TcxButton
          Left = 243
          Top = 53
          Width = 100
          Height = 25
          Caption = 'New Folder'
          TabOrder = 2
          OnClick = BNewFolderClick
        end
        object BDeleteFolder: TcxButton
          Left = 243
          Top = 84
          Width = 100
          Height = 25
          Caption = 'Delete Folder'
          TabOrder = 3
          OnClick = BDeleteFolderClick
        end
        object BSubscribeFolder: TcxButton
          Left = 243
          Top = 115
          Width = 100
          Height = 25
          Caption = 'Subscribe Folder'
          TabOrder = 4
          OnClick = BSubscribeFolderClick
        end
        object BUnSubscribeFolder: TcxButton
          Left = 243
          Top = 146
          Width = 100
          Height = 25
          Caption = 'UnSubscribe Folder'
          TabOrder = 5
          OnClick = BUnSubscribeFolderClick
        end
        object BPurge: TcxButton
          Left = 243
          Top = 189
          Width = 100
          Height = 25
          Caption = 'Purge Deleted'
          TabOrder = 6
          OnClick = BPurgeClick
        end
        object BClearFolder: TcxButton
          Left = 243
          Top = 232
          Width = 100
          Height = 25
          Caption = 'Clear Folder'
          TabOrder = 7
          OnClick = BClearFolderClick
        end
        object BSelectAllFolders: TcxButton
          Left = 243
          Top = 275
          Width = 100
          Height = 25
          Caption = 'Select All Folders'
          TabOrder = 8
          OnClick = BSelectAllFoldersClick
        end
        object BUnSelectAllFolders: TcxButton
          Left = 243
          Top = 306
          Width = 100
          Height = 25
          Caption = 'UnSelect All Folders'
          TabOrder = 9
          OnClick = BUnSelectAllFoldersClick
        end
        object dxLayoutControl4Group_Root: TdxLayoutGroup
          AlignHorz = ahClient
          AlignVert = avClient
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutGroup6: TdxLayoutGroup
          Parent = dxLayoutControl4Group_Root
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 0
        end
        object dxLayoutItem13: TdxLayoutItem
          Parent = dxLayoutGroup6
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'cxTreeList1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = TLFolders
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutGroup7: TdxLayoutGroup
          Parent = dxLayoutGroup6
          AlignHorz = ahRight
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          ShowBorder = False
          Index = 1
        end
        object dxLayoutItem14: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BGetFoldersList
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'Separator'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Index = 1
        end
        object dxLayoutItem1: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BNewFolder
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem2: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton2'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BDeleteFolder
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object dxLayoutItem15: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton3'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BSubscribeFolder
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object dxLayoutItem16: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton4'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BUnSubscribeFolder
          ControlOptions.ShowBorder = False
          Index = 5
        end
        object dxLayoutSeparatorItem3: TdxLayoutSeparatorItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'Separator'
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Index = 6
        end
        object dxLayoutItem17: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BPurge
          ControlOptions.ShowBorder = False
          Index = 7
        end
        object dxLayoutSeparatorItem4: TdxLayoutSeparatorItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'Separator'
          Index = 8
        end
        object dxLayoutItem22: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BClearFolder
          ControlOptions.ShowBorder = False
          Index = 9
        end
        object dxLayoutSeparatorItem7: TdxLayoutSeparatorItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'Separator'
          Index = 10
        end
        object dxLayoutItem28: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          Control = BSelectAllFolders
          ControlOptions.ShowBorder = False
          Index = 11
        end
        object dxLayoutItem29: TdxLayoutItem
          Parent = dxLayoutGroup7
          CaptionOptions.Text = 'cxButton2'
          CaptionOptions.Visible = False
          Control = BUnSelectAllFolders
          ControlOptions.ShowBorder = False
          Index = 12
        end
      end
    end
    object TSMessages: TcxTabSheet
      Caption = 'Messages'
      ImageIndex = 2
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 353
        Height = 448
        Align = alClient
        TabOrder = 0
        LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
        object MMessage: TcxMemo
          Left = 10
          Top = 267
          ParentFont = False
          Properties.ReadOnly = True
          Properties.ScrollBars = ssBoth
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Courier New'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 4
          Height = 89
          Width = 185
        end
        object LVMessages: TcxListView
          Left = 10
          Top = 37
          Width = 271
          Height = 183
          Columns = <
            item
              Caption = 'Index'
              MaxWidth = 36
              MinWidth = 36
              Width = 36
            end
            item
              Caption = 'UID'
              MaxWidth = 40
              MinWidth = 40
              Width = 40
            end
            item
              AutoSize = True
              Caption = 'From'
              MaxWidth = 200
              MinWidth = 100
              WidthType = (
                -95)
            end
            item
              AutoSize = True
              Caption = 'Subject'
              MinWidth = 150
              WidthType = (
                -94)
            end
            item
              Caption = 'Data'
              MaxWidth = 120
              MinWidth = 120
              Width = 120
            end
            item
              Caption = 'Size'
              MaxWidth = 60
              MinWidth = 60
              Width = 60
            end
            item
              Caption = 'Flags'
              Width = 200
            end>
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = LVMessagesDblClick
        end
        object BGetMessagesList: TcxButton
          Left = 10
          Top = 226
          Width = 90
          Height = 25
          Caption = 'Get Messages List'
          TabOrder = 2
          OnClick = BGetMessagesListClick
        end
        object BDeleteMessage: TcxButton
          Left = 253
          Top = 226
          Width = 90
          Height = 25
          Caption = 'Delete Message'
          TabOrder = 3
          OnClick = BDeleteMessageClick
        end
        object TEFolderName: TcxTextEdit
          Left = 10
          Top = 10
          Enabled = False
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
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
          AlignVert = avTop
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          ShowBorder = False
          Index = 0
        end
        object dxLayoutGroup2: TdxLayoutGroup
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          ShowBorder = False
          Index = 2
        end
        object dxLayoutItem18: TdxLayoutItem
          Parent = dxLayoutGroup2
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'cxMemo1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = MMessage
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem19: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'cxListView1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = LVMessages
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutGroup3: TdxLayoutGroup
          Parent = dxLayoutGroup1
          AlignHorz = ahClient
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          ButtonOptions.Buttons = <>
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = 2
        end
        object dxLayoutItem20: TdxLayoutItem
          Parent = dxLayoutGroup3
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
          Control = BGetMessagesList
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem21: TdxLayoutItem
          Parent = dxLayoutGroup3
          AlignHorz = ahRight
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          Control = BDeleteMessage
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutSplitterItem1: TdxLayoutSplitterItem
          Parent = dxLayoutControl1Group_Root
          CaptionOptions.Text = 'Splitter'
          SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
          SizeOptions.SizableHorz = False
          SizeOptions.SizableVert = False
          Index = 1
        end
        object dxLayoutItem23: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'cxTextEdit1'
          CaptionOptions.Visible = False
          Control = TEFolderName
          ControlOptions.ShowBorder = False
          Enabled = False
          Index = 0
        end
      end
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 480
    Width = 362
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 124
    Top = 352
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
      LookAndFeel.SkinName = 'Office2007Blue'
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2007Blue'
    Left = 36
    Top = 372
  end
  object Imap: TIdIMAP4
    IOHandler = TLS
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 27
    Top = 294
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
    Left = 123
    Top = 294
  end
  object TLS: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':143'
    MaxLineAction = maException
    Port = 143
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 75
    Top = 294
  end
  object MDProfiles: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 175
    Top = 330
    object MDProfilesServer: TStringField
      FieldName = 'Server'
      Size = 100
    end
    object MDProfilesUser: TStringField
      FieldName = 'User'
      Size = 100
    end
    object MDProfilesPassword: TStringField
      FieldName = 'Password'
      Size = 100
    end
    object MDProfilesPort: TStringField
      FieldName = 'Port'
      Size = 10
    end
    object MDProfilesUseTLS: TBooleanField
      FieldName = 'UseTLS'
    end
    object MDProfilesUseSASL: TBooleanField
      FieldName = 'UseSASL'
    end
  end
  object DSProfiles: TDataSource
    DataSet = MDProfiles
    Left = 215
    Top = 330
  end
  object TImapTimeout: TTimer
    Enabled = False
    OnTimer = TImapTimeoutTimer
    Left = 275
    Top = 290
  end
end
