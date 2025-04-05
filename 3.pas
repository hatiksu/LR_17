  type
  PNode = ^TNode;
  TNode = record
    Data: Integer;
    Next: PNode;
  end;

var
  InputFile, OutputFile: Text;
  StackTop, TempNode: PNode;
  Number: Integer;

procedure Push(var Top: PNode; Value: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.Data := Value;
  NewNode^.Next := Top;
  Top := NewNode;
end;

function Pop(var Top: PNode): Integer;
begin
  if Top = nil then
  begin
    Writeln('Ошибка: стек пуст.');
    Halt(1);
  end;
  Pop := Top^.Data;
  TempNode := Top;
  Top := Top^.Next;
  Dispose(TempNode);
end;

begin
  Assign(InputFile, 'input1.txt');
  Assign(OutputFile, 'output1.txt');
  Reset(InputFile);
  Rewrite(OutputFile);

  StackTop := nil;

  while not Eof(InputFile) do
  begin
    Readln(InputFile, Number);
    Push(StackTop, Number);
  end;

  while StackTop <> nil do
  begin
    Number := Pop(StackTop);
    Writeln(OutputFile, Number);
  end;

  Close(InputFile);
  Close(OutputFile);
end.
