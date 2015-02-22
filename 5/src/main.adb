with Ada.Command_Line;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Containers;        use Ada.Containers;
with Ada.Strings.Fixed.Hash;
with Ada.Strings.Equal_Case_Insensitive;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
procedure Main is

   a                                                                           : String(1..21); -- if arg 1 is null will rise CONSTRAINT_ERROR that will be catched
   b                                                                           : String(1 .. 21);
   c                                                                           : Hash_Type;
   d                                                                           : Boolean;
   e                                                                           : Natural;
   --
   f                                                                           : Ada.Strings.Unbounded.Unbounded_String;

   boundedString                                                               : String(1..3);
   unboundedStr                                                                : Ada.Strings.Unbounded.Unbounded_String;
   lengthOfThisStr                                                             : Natural;
   lengthOfThisStrInt                                                          : Integer;
   stringToReverse: String := "String to reverse";
   reversedStr: Ada.Strings.Unbounded.Unbounded_String;
   lengthOfStrToReverse: Integer;

         procedure reverseIt is
         Result : String (stringToReverse'Range);
      begin
      for I in stringToReverse'range loop
         Result (Result'Last - I + stringToReverse'First) := stringToReverse (I);
      end loop;
      Put_Line(Result);
      end reverseIt;

begin
   a := Ada.Command_Line.Argument(1);
exception
   when Constraint_Error =>
      a := "Did not find argument";
      Put_Line(a);

      -- copy Strings
      Ada.Strings.Fixed.Move(a,b); --copy string
      Put_Line("old line "&a);
      Put_Line("new line "&b); -- but remember range restrictions

      c:= Ada.Strings.Fixed.Hash(Key => a); -- compute hash
      Put_Line(c'Img); -- hash is an integer

      d := Ada.Strings.Equal_Case_Insensitive(Left  => a,
                                              Right => b);
      Put_Line(d'Img); -- return true, coz b is copied from a

      e := Ada.Strings.Fixed.Index(a,"ui");
      Put_Line(e'Img);

      f := To_Unbounded_String("hhh");
      Put_Line("3 symbols here");
      -- read line from stin
      boundedString := (Ada.Text_IO.Get_Line);--only 3 symbols ( boundedString : String(1..3);)
      Put_Line("readed: "& boundedString);
      --unbounded string we use specail version Get/Put line for unbounded strings
      unboundedStr := Ada.Strings.Unbounded.Text_IO.Get_Line;
      Ada.Strings.Unbounded.Text_IO.Put_Line(unboundedStr);
      lengthOfThisStr := Ada.Strings.Unbounded.Length(unboundedStr);
      lengthOfThisStrInt := Integer(lengthOfThisStr);
      Put_Line(lengthOfThisStr'Img);
      Put_LIne("the same, but converted from Natrual to Integer"&lengthOfThisStrInt'Img);

      --reveerse Str
      lengthOfStrToReverse := stringToReverse'Length;
      Put_Line("reverse string of "& lengthOfStrToReverse'Img&" char length");
      reverseIt; --procedure that are defined in decalration section of this file



end Main;
