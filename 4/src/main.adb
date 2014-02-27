with Ada.Text_IO; use Ada.Text_IO;

with Ada.Characters.Conversions; use Ada.Characters.Conversions;

with GNAT.Calendar.Time_IO; use GNAT.Calendar.Time_IO;

with Ada.Calendar; use Ada.Calendar;

with Ada.Strings.Unbounded;
with System; use System;
with System.Storage_Elements; use System.Storage_Elements;


procedure Main is

   a : Integer;

   b : Float;

   c : Duration;

   d : Character; -- 8 bit char

   e : Wide_Character; -- 16 bit char

   f : Wide_Wide_Character; -- 32 bit char

   g : String (1 .. 6); -- bounded string MUST be iniatilized or have range (from 1 to 6 in this case)

   h: Ada.Strings.Unbounded.Unbounded_String; -- unbounded String , looks most like usual String

   i: Boolean; -- boolean in Ada is just True, False enumeration
   j: Boolean := True;

   k: System.Address; -- address in memory

   l: System.Storage_Elements.Storage_Count; -- represent size of variable

   -- own defined types
   type Own_Int is range -(2**63) .. (2**63-1); --64 bit int
   m : Own_Int;

begin
   a := 1;
   Put_Line ("Integer a = "&a'Img);

   b := 1.00001; -- float pont
   Put_Line ("Float b = "&b'Img);

   c := 55.000000001; -- fixed point
   b := Float (c); -- convert duration to Float
   Put_Line ("Duration c ="&b'Img);

   d := 'd'; -- the same as Java "" - string '' - char
   Put_Line ("Char 8 bit d = "&d);

   e := 'e';
   -- Put_Line("Char 16 bit e = "&e); -- will throw fail cause concatenation of wide char  and string will give wide string
   Put_Line ("Char 16 bit e = "&To_Character (e)); -- need to convert between chars

   f := 'f';
   Put_Line ("Char 32 bit f = "&To_Character (f)); -- need to convert between chars

   g := "String";
   Put_Line (g);

   -- g := "Another String"; --compiler warning "wrong length of array"
   -- Put_Line(g);

   g := "Strin2"; -- it will work
   Put_Line (g);

   -- g := "Strin"; -- it will NOT work work even length is shorter
   -- Put_Line(g);

   h := Ada.Strings.Unbounded.To_Unbounded_String("Just a String"); -- so complicated  (you can of coz rename package name to make it shorter)
   Put_Line(Ada.Strings.Unbounded.To_String(h));

   h := Ada.Strings.Unbounded.To_Unbounded_String("Just another one, much longer String"); --But! you can reassign variable without thinking about length of string
   Put_Line(Ada.Strings.Unbounded.To_String(h));

   i := False; -- don't mix it with Win32 constant FALSE (generally Ada is not case sens..)
   Put_Line("Boolean i = "&i'Img&" j="&j'Img); -- need 'Img to concate it with string

   k := i'Address; -- Address uses to obtain address variable hmm... CO
   Put_Line("i has address "&To_Integer(k)'Img);

   -- boolean size
   l := i'Size;
   Put_Line("Size of boolen is "&l'Img&" bit");

   --integer size
   l := a'Size;
   Put_Line("Size of integer is "&l'Img&" bit");

   -- float size
   l := b'Size;
   Put_Line("Size of float is "&l'Img&" bit");

   -- Duration size
   l := c'Size;
   Put_Line("Size of duration is "&l'Img&" bit");

   -- Character size (8)
   l := d'Size;
   Put_Line("Size of char8 is "&l'Img&" bit");

   --Character size (16)
   l := e'Size;
   Put_Line("Size of char16 is "&l'Img&" bit");

    --Character size (32)
   l := f'Size;
   Put_Line("Size of char32 is "&l'Img&" bit");

    --String(6) size
   l := g'Size;
   Put_Line("Size of bounded string of 6 chars is "&l'Img&" bit");

   --String unbounded size
   l := h'Size;
   Put_Line("Size of unbounded string of a lot of chars is "&l'Img&" bit"); -- hmm, probably size of pointer?
   -- do we try to read direct from memory then?
   k := h'Address;
   Put_Line("Address of this string has only "&k'Size'Img&" bits");

   -- own defined big integer size
   l := m'Size;
   Put_Line("Size of own defined big integer is "&l'Img&" bit");

   return;
end Main;
