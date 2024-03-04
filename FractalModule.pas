unit FractalModule;
interface
uses GraphABC;
procedure DrawFractal(startX, startY, p: integer; scale: real);
implementation
const u = 10;

procedure p1(dx, dy: integer; scale: real);
begin
  LineTo(PenX + Round(dx * scale), PenY + Round(dy * scale))
end;

procedure a(i: integer; scale: real); forward;
procedure b(i: integer; scale: real); forward;
procedure c(i: integer; scale: real); forward;
procedure d(i: integer; scale: real); forward;

procedure a(i: integer; scale: real);
begin
  if i > 0 then
  begin
    d(i - 1, scale);
    p1(+u, 0, scale);
    a(i - 1, scale);
    p1(0, u, scale);
    a(i - 1, scale);
    p1(-u, 0, scale);
    c(i - 1, scale);
  end;
end;

procedure b(i: integer; scale: real);
begin
  if i > 0 then
  begin
    c(i - 1, scale);
    p1(-u, 0, scale);
    b(i - 1, scale);
    p1(0, -u, scale);
    b(i - 1, scale);
    p1(u, 0, scale);
    d(i - 1, scale);
  end;
end;

procedure c(i: integer; scale: real);
begin
  if i > 0 then
  begin
    b(i - 1, scale);
    p1(0, -u, scale);
    c(i - 1, scale);
    p1(-u, 0, scale);
    c(i - 1, scale);
    p1(0, u, scale);
    a(i - 1, scale);
  end;
end;

procedure d(i: integer; scale: real);
begin
  if i > 0 then
  begin
    a(i - 1, scale);
    p1(0, u, scale);
    d(i - 1, scale);
    p1(u, 0, scale);
    d(i - 1, scale);
    p1(0, -u, scale);
    b(i - 1, scale);
  end;
end;

procedure DrawFractal(startX, startY, p: integer; scale: real);
begin
  ClearWindow;
  MoveTo(startX, startY);
  a(p, scale);
end;

end.