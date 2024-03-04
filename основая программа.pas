program zd;
uses GraphABC, FractalModule;
var startX, startY, N: integer;
scale: real;

procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Left:  Dec(startX, 10 + 20);
    VK_Right: Inc(startX, 10 + 20);
    VK_Up:    Dec(startY, 10 + 20);
    VK_Down:  Inc(startY, 10 + 20);
  end;
  DrawFractal(startX, startY, N, scale);
end;

procedure KeyUP(KeyR: integer);
begin
  case KeyR of
    187, 107: // +
      begin
        scale := scale * 1.1;
        DrawFractal(startX, startY, N, scale);
      end;
    189, 109: // -
      begin
        scale := scale / 1.1;
        DrawFractal(startX, startY, N, scale);
      end;
  end;
end;

begin
  writeln('Введите глубину рекурсии: ');
  read(N);
  startX := 100;
  startY := 100;
  scale := 1.0;
  SetWindowSize(520, 520);
  OnKeyDown := KeyDown;
  OnKeyUp := KeyUP;
  DrawFractal(startX, startY, N, scale);
end.