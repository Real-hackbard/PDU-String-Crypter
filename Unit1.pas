unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XPMan, TdjPDUCrypt, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);

var
  text : TStringList;
  UTF8Str: UTF8String;
  FS: TFileStream;
begin
  try
      text := TStringList.Create;
      text.Text := (Memo1.Text);

      case RadioGroup1.ItemIndex of
      0 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ASCII);
      1 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ANSI);
      2 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF7);
      3 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF8);
      4 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.BigEndianUnicode);
      5 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Unicode);
      6 : begin
            UTF8Str := UTF8Encode(Memo1.Text);
            FS := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'text.txt', fmCreate);
            try
              FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
              FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
            finally
            FS.Free;
          end;
          end;
      7 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Default);
      end;

      Memo1.Clear;
      Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'text.txt');
    finally
    text.Free;
    end;

  Memo1.Lines.Delete(0);
  Memo3.Text:= EncodePDU7bits(Memo1.Text);
  StatusBar1.Panels[3].Text := IntToStr(Memo3.Lines.Count);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo2.Text:= DecodePDU7bits(Memo3.Text);
  StatusBar1.Panels[5].Text := IntToStr(Memo2.Lines.Count);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo3.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
end;

end.
 