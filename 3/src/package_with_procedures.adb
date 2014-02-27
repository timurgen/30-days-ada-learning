with Ada.Text_IO; use Ada.Text_IO;
package body package_with_procedures is

   ---
   ---
   ---
   procedure doSomething (input : String) is
   begin
     Put_Line (input);
   end doSomething;

   --
   --
   procedure doSomethingElse (input : Integer; output : out Integer) is

   begin
      output := input * 2;
      return;
   end doSomethingElse;

   procedure invisibleProc (input : Integer; output : out Integer) is
   begin
      null;
   end invisibleProc;

end package_with_procedures;
