{pkgs, lib, inputs, ...}: 
{
programs.git = {
    enable = true;
    userName  = "John Doe";
    userEmail = "johndoe@example.com";
  };
}
