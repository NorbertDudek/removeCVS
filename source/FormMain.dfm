object FrmMain: TFrmMain
  Left = 358
  Top = 221
  BorderStyle = bsDialog
  Caption = 'removeCVS'
  ClientHeight = 376
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labRootDirectory: TLabel
    Left = 8
    Top = 8
    Width = 537
    Height = 13
    AutoSize = False
    Caption = 'labRootDirectory'
  end
  object Label1: TLabel
    Left = 8
    Top = 316
    Width = 54
    Height = 13
    Caption = 'Root string:'
  end
  object lbxDirectoryList: TListBox
    Left = 8
    Top = 24
    Width = 537
    Height = 281
    ItemHeight = 13
    TabOrder = 0
  end
  object btnRemove: TButton
    Left = 8
    Top = 344
    Width = 145
    Height = 25
    Caption = 'Remove CVS directory'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnRemoveClick
  end
  object btnClose: TButton
    Left = 344
    Top = 344
    Width = 201
    Height = 25
    Cancel = True
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnUpdateRoot: TButton
    Left = 160
    Top = 343
    Width = 145
    Height = 25
    Caption = 'Update CVS root'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnUpdateRootClick
  end
  object edtRootString: TEdit
    Left = 72
    Top = 312
    Width = 473
    Height = 21
    TabOrder = 4
    Text = ':ssh;username=norbert;hostname=80.48.44.58:/usr/cvs'
  end
end
