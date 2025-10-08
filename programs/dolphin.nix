{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.ark
    unzip
    zip
  ];

  home.file."bin/abrir-terminal.sh".text = ''
    #!/usr/bin/env bash
    kitty --directory "$PWD"
  '';
  home.file."bin/abrir-terminal.sh".executable = true; # ejecutable

  home.file.".local/share/kio/servicemenus/abrir-terminal-here.desktop".text = ''
    [Desktop Entry]
    Type=Service
    MimeType=inode/directory;
    Actions=OpenTerminalHere;

    [Desktop Action OpenTerminalHere]
    Name=Abrir Kitty aquí
    Icon=utilities-terminal
    Exec=/home/rodrigo/bin/abrir-terminal.sh %u
  '';
  home.file.".local/share/kio/servicemenus/abrir-terminal-here.desktop".executable = true;

  home.file.".local/share/kio/servicemenus/extract-zip-here.desktop".text = ''
    [Desktop Entry]
    Type=Service
    MimeType=application/zip;application/x-zip-compressed;
    Actions=ExtractZipHere;

    [Desktop Action ExtractZipHere]
    Name=Extraer ZIP aquí
    Icon=folder
    Exec=unzip %f -d %d
  '';
  home.file.".local/share/kio/servicemenus/extract-zip-here.desktop".executable = true;

  # Script para montar ZIP con kio-fuse
  home.file."bin/mount-zip.sh".text = ''
    #!/usr/bin/env bash
    ZIP="$1"
    TARGET="$HOME/.local/share/kio-fuse/$(basename "$ZIP" .zip)"
    mkdir -p "$TARGET"
    kio-fuse "zip:/$ZIP" "$TARGET"
    echo "Montado en $TARGET"
  '';
  home.file."bin/mount-zip.sh".executable = true;

  # Montar ZIP con KIO-FUSE
  home.file.".local/share/kio/servicemenus/mount-zip.desktop".text = ''
    [Desktop Entry]
    Type=Service
    MimeType=application/zip;application/x-zip-compressed;
    Actions=MountZipHere;

    [Desktop Action MountZipHere]
    Name=Montar ZIP aquí (kio-fuse)
    Icon=folder
    Exec=/home/rodrigo/bin/mount-zip.sh %f
  '';
  home.file.".local/share/kio/servicemenus/mount-zip.desktop".executable = true;
}
