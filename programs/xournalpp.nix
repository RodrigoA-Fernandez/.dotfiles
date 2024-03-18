{pkgs, ...}:
{
  home.file.".config/xournalpp_tmp/template.tex".text = ''
    % This template uses the scontents package, which is only available on relatively recent TeX distributions. In case it is not available on your system, use the legacy_template.tex
    \documentclass[varwidth=true, crop, border=5pt]{standalone}

    % Packages
    \usepackage{amsmath}
    \usepackage{amssymb}

    % for storing in memory verbatim content to be reused later
    \usepackage{scontents}

    % Blank formula checking
    \usepackage{ifthen}
    \newlength{\pheight}

    % Color support
    \usepackage{xcolor}
    \definecolor{xpp_font_color}{HTML}{%%XPP_TEXT_COLOR%%}

    % User input
    \begin{scontents}[store-env=preview]
      \( 
      \displaystyle
        %%XPP_TOOL_INPUT%%
      \)
    \end{scontents}

    \begin{document}
      % Check if the formula is empty
      \settoheight{\pheight}{\getstored[1]{preview}}%
      \ifthenelse{\pheight=0}{\GenericError{}{xournalpp:blankformula}{}{}}

      % Render the user input
      \textcolor{xpp_font_color}{\getstored[1]{preview}}
    \end{document}
  '';
}
