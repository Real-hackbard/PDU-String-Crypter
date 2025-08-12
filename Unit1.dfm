object Form1: TForm1
  Left = 394
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PDU String Crypter'
  ClientHeight = 514
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Original:'
  end
  object Label2: TLabel
    Left = 272
    Top = 8
    Width = 56
    Height = 13
    Caption = 'PDU Crypt :'
  end
  object Label3: TLabel
    Left = 8
    Top = 311
    Width = 90
    Height = 13
    Caption = 'Decrypted Strings :'
  end
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 241
    Height = 129
    TabStop = False
    Lines.Strings = (
      'Crypting is the practice of developing, '
      'purchasing, or using a specialized software '
      'program (sometimes known as a crypter) to '
      'encrypt, obfuscate, or modify a known '
      'malware program in order to evade signature '
      'detection by antivirus and other security '
      'programs.')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 8
    Top = 330
    Width = 449
    Height = 155
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo3: TMemo
    Left = 255
    Top = 24
    Width = 201
    Height = 129
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 171
    Top = 159
    Width = 78
    Height = 20
    Caption = 'Crypt'
    TabOrder = 3
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 379
    Top = 159
    Width = 78
    Height = 20
    Caption = 'Decode'
    TabOrder = 4
    TabStop = False
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 495
    Width = 465
    Height = 19
    Panels = <
      item
        Text = 'Text Line:'
        Width = 60
      end
      item
        Width = 70
      end
      item
        Text = 'Crypt Line:'
        Width = 70
      end
      item
        Text = '0'
        Width = 70
      end
      item
        Text = 'Decrypt Line:'
        Width = 80
      end
      item
        Text = '0'
        Width = 50
      end>
    ExplicitTop = 494
    ExplicitWidth = 461
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 200
    Width = 449
    Height = 105
    Caption = ' Unicode '
    Columns = 2
    ItemIndex = 7
    Items.Strings = (
      'ASCii'
      'ANSi'
      'UTF-7'
      'UTF-8'
      'UTF-16 BE'
      'UTF-16 LE'
      'UTF-8 Boom'
      'Default')
    TabOrder = 6
  end
  object Button3: TButton
    Left = 89
    Top = 159
    Width = 75
    Height = 20
    Caption = 'Clear'
    TabOrder = 7
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 159
    Width = 75
    Height = 20
    Caption = 'Text'
    TabOrder = 8
    TabStop = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 298
    Top = 159
    Width = 75
    Height = 20
    Caption = 'Clear'
    TabOrder = 9
    TabStop = False
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 40
  end
end
