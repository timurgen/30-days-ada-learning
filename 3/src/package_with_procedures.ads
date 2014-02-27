package package_with_procedures is
   --
   -- public part of package that is exposed to "world"
   --
   procedure doSomething (input : String);
   --
   --
   procedure doSomethingElse (input : Integer; output : out Integer);

private -- (optional) private part of packager that are not visible to other packages, like private in Java
    procedure invisibleProc (input : Integer; output : out Integer);
   type Int_10 is new Integer range 0 .. 10;
end package_with_procedures;
