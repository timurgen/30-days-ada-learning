-----------------------------------
-- It is an package which contains some functions
-- package consist of two files ads - spec (like .h in C) and adb -- body
with Ada.Text_IO; use Ada.Text_IO;
package body Slave is

   function sayGoodBye (X : String) return Boolean is
      pragma Unreferenced (X); -- pragma, used to supress compiler warning about unreferenced function argument
   begin
      null; -- function doesn't do something
      return False;
   end sayGoodBye;
   --
   -- function that write X returns False, always
   --
   function sayHello (X : String) return Boolean is -- function MUST return something
   begin
      Put_Line (X);
      return False; -- something is needed to be returned
   end sayHello;
   --
   -- it is just a comment
   --
end Slave;
