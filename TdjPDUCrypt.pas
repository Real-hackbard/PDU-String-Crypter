unit TdjPDUCrypt;

interface

function EncodePDU7bits(const Source: String): String;
function DecodePDU7bits(const CodedStr: String): String;

implementation

procedure Bin2Hex(Buffer, Text: PChar; BufSize: Integer); assembler;
const
  Convert: array[0..15] of Char = '0123456789ABCDEF';
  p: array[1..7] of Byte = ($1, $3, $7, $F, $1F, $3F, $7F);
var
  i, Count: Integer;
  c, Tmp, r: Byte;
begin
  r:= Byte(Buffer[0]);
  Count:= 1;
  for i := 0 to BufSize - 1 do
    if Count < 8 then
    begin
      c:= r;
      if i < (BufSize - 1) then
      begin
        Tmp:= Byte(Buffer[I + 1]);
        r:= Tmp shr Count;
        c:= c or ((Tmp and p[Count]) shl (8 - Count));
        Inc(Count);
      end;
      Text[0] := Convert[c shr 4];
      Text[1] := Convert[c and $F];
      Inc(Text, 2);
    end
    else
    begin
      Count:= 1;
      if i < BufSize then
        r:= Byte(Buffer[i + 1]);
    end;
end;
      
function Hex2Bin(Text, Buffer: PChar; BufSize: Integer): Integer; assembler;
const
  Convert: array['0'..'f'] of SmallInt =
    ( 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
     -1,10,11,12,13,14,15);

  p: array[1..7] of Byte = ($7F, $3F, $1F, $F, $7, $3, $1);

var
  i, Count: Integer;
  Tmp, c, r: Byte;
begin
  I := BufSize;
  Count:= 1;

  while i > 0 do
  begin
    if not (Text[0] in ['0'..'f']) or not (Text[1] in ['0'..'f']) then Break;

    c:= (Convert[Text[0]] shl 4) + Convert[Text[1]];
    tmp:= c shr (8 - Count);
    c:= c and p[Count];

    if Count > 1 then
      c:= (c shl (Count - 1)) or r;

    r:= Tmp;
    Buffer[0] := Char(c);

    if Count = 7 then
    begin
      Inc(Buffer);
      Buffer[0] := Char(r);
      Count:= 1;
    end
    else
      Inc(Count);

    Inc(Buffer);
    Inc(Text, 2);
    Dec(i);
  end;
  Result := BufSize - i;
end;   

function EncodePDU7bits(const Source: String): String;
var Leng: Integer;
begin
  Leng:= Length(Source);
  Leng:= (Leng * 2)- ((Leng div 8) * 2);
  SetLength(Result, Leng);
  Bin2Hex(PChar(Source), PChar(Result), Length(Source));
end;

function DecodePDU7bits(const CodedStr: String): String;
var Leng: Integer;
begin
  Leng:= Length(CodedStr) div 2;
  SetLength(Result, Leng+ (Leng div 7));
  Hex2Bin(PChar(CodedStr), PChar(Result), Leng);
end;

end.