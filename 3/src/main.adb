with Slave; use Slave;
with package_with_procedures; use package_with_procedures;
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   x, y : Boolean;
   output : Integer;
   package short renames package_with_procedures; -- we don't wanna use so long name of package
begin

   -- will use some functions from package Slave
   x := Slave.sayHello ("Hello World!"); -- returned value MUST be assigned to something
   -- Slave.sayHello ("Hello World!"); --will throw compile error "cannot use blah blah in procedure call"
   y := Slave.sayGoodBye ("Bye Bye!");
   if x = False and then y = False then
      Put_Line ("both function returned false");
   end if;
   -------------------------------------
   -- package package_with_procedures;
   -------------------------------------
   New_Line; -- just line break
   short.doSomething (input => "Do it");
   New_Line;
   doSomethingElse (5, output);
   Put_Line (output'Img);

end Main;
