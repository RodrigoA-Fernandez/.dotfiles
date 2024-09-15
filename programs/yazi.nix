{pkgs, ...}: let
	plugins-repo = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "06e5fe1c7a2a4009c483b28b298700590e7b6784";
		hash = "sha256-jg8+GDsHOSIh8QPYxCvMde1c1D9M78El0PljSerkLQc=";
	};
  compress-repo = pkgs.fetchFromGitHub {
    owner = "KKV9";
    repo = "compress.yazi";
    rev = "878b876b2ff0d48741eb3a4c4c2f149e962af43c";
    hash = "sha256-HDJ1qQtWzVZwv0AK4ZZoeMOIR+RAq0OvlMhYiV/CxHw=";
  };
in {
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			manager = {
				show_hidden = true;
			};
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

		plugins = {
      "chmod" = "${plugins-repo}/chmod.yazi";
      "compress" = "${compress-repo}";
      "full-border" = "${plugins-repo}/full-border.yazi";
			"max-preview" = "${plugins-repo}/max-preview.yazi";
		};


		keymap = {
			manager.prepend_keymap = [
				{
					on = ["c" "a"];
					run = "plugin compress";
					desc = "Comprimir los archivos seleccionados.";
				}
        {
					on = ["c" "p"];
					run = "plugin command";
					desc = "Run command Prompt";
				}
        {
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
    
			];
		};
	};
}
