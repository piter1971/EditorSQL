object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Editor SQL'
  ClientHeight = 336
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 205
    Width = 50
    Height = 13
    Caption = 'Columnas:'
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 29
    Height = 13
    Caption = 'tablas'
  end
  object Label3: TLabel
    Left = 32
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Base de Datos'
  end
  object DBGrid1: TDBGrid
    Left = 144
    Top = 176
    Width = 513
    Height = 145
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CBDB: TComboBox
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    TabOrder = 1
    Text = 'tienda'
    OnChange = CBDBChange
    Items.Strings = (
      'tienda'
      'prueba'
      'agenda')
  end
  object LBTablas: TListBox
    Left = 8
    Top = 78
    Width = 105
    Height = 121
    ItemHeight = 13
    TabOrder = 2
    OnClick = LBTablasClick
  end
  object LBColumnas: TListBox
    Left = 8
    Top = 224
    Width = 105
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object MemoSentencias: TMemo
    Left = 144
    Top = 8
    Width = 369
    Height = 129
    TabOrder = 4
  end
  object BtnOK: TButton
    Left = 519
    Top = 8
    Width = 138
    Height = 129
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnOKClick
  end
  object conexion: TFDConnection
    Params.Strings = (
      'Database=tienda.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 688
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 696
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 688
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = conexion
    SQL.Strings = (
      'select * from factura')
    Left = 688
    Top = 136
  end
end
