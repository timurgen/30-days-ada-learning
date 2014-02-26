-- Second day i work with control statements such as if - else statements, case statements and loops
with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
-- define entry point to a program
procedure Second is
   --------------------------------------------
   -- variable, types and constants declaration
   --------------------------------------------

   -- integer variable iniatilized
   a : Integer := 1;

   -- integer constant
   a_const : constant Integer := 33;

   -- define new own type based on float but with range restrictions
   type Degrees is new Float range -273.15 .. Float'Last;

   -- define new subtype, not sure what difference between type and subtype
   subtype Kelvin is Integer range 0 .. Integer'Last;

   -- new variable of this Degrees type, not iniatialized
   temp : Degrees;

   -- new constant of kelvin subtype, iniatialized
   tempK : constant Kelvin := 5;
-- start execution of program
begin
   -- print integer as integer with help of Ada.Integer_Text_IO
   Put (tempK);
   New_Line;
   -- print integer as string with help of Ada.Text_IO
   Put_Line (a_const'Img);

   <<comeback>> -- use label
   if a /= a_const then -- if else statement
      Put_Line ("a not equal a_const will fix it"); -- print string
      a := a_const; -- assign value of one variable to another
      goto comeback; -- comeback to label "comeback"
   else
      Put_Line ("a equal a_const");
   end if;

   Put_Line ("Check temp");
   temp := -273.15;
   Put_Line ("Absoulute zero is reached "&temp'Img);

   -- rise exseption cause range overflow
   -- temp := temp - 5.0;
   -- Put_Line ("Could it be colder? "&temp'Img);
   temp := temp + 10.5;
   Put_Line ("Could it be warmer after that? "&temp'Img);

   -- conditional statement if with multiple conditions
   if a = 33 and then temp < 0.0 then
      Put_Line ("a = 33 and temp < 0");
   else
      Put_Line ("It shouldn't happend");
   end if;

   -- conditional statement if with or condition
   if a = 33 or else temp < 0.0 then
      Put_Line ("It was expected");
   else
      Put_Line ("It shouldn't happend");
   end if;

   -- case statement
   case a is
      when 2 =>
         Put_Line ("it will not be printed");
      when 33 =>
         Put_Line ("It will be printed");
      when others =>
         Put_Line ("It will NOT be printed");
   end case;

   -- loops

   -- endless loop
   -- (We are wnat actually to aprup loop)
   Loop_without_end :
   loop
      Put_Line ("I'm a loop");
      a := a - 1;
      if a = 0 then
         goto Loop_without_end_label;
      end if;
   end loop Loop_without_end;
   <<Loop_without_end_label>>

   -- while loop
   While_Loop :
   while a <= 5 loop
      a := a + 1;
   end loop While_Loop;
   Put_Line (a'Img);

   -- loop with exit condition
   Loop_3 :
   loop
      Put_Line ("Ima loop nr 3");
      a := a - 1;
      exit Loop_3 when a = 0; -- exit condition may occurs both in begining, middle or at the end of loop
   end loop Loop_3;

   -- for loop
   For_loop :
   for I in Integer range 0 .. 5 loop
      Put_Line ("For loop iteration"&I'Img);
      -- I := I + 1; -- assignment to loop parameter is not allowed in Ada
   end loop For_loop;
   -- only functions can return something, but procedure can just return

   return;
end Second;
