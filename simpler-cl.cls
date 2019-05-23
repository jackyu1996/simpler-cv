% vim:set et ft=tex sw=4 ts=4:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpler-cl}[2019/05/20]

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax

\LoadClass{letter}

\newcommand*{\firstname}[1]{\def\firstname{#1}}
\newcommand*{\lastname}[1]{\def\lastname{#1}}
\newcommand*{\phone}[1]{\def\phone{#1}}
\newcommand*{\email}[1]{\def\email{#1}}

\name{\firstname~\lastname}
\telephone{\phone}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage[usecolor]{xcolor}

\colorlet{headerbg}{black}
\colorlet{headerfg}{white}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\usepackage{xeCJK}
\setCJKmainfont{Noto Sans CJK SC}

\newfontfamily\bodyfont[]{NotoSans-Bold}
\newfontfamily\thinfont[]{NotoSans-Thin}
\newfontfamily\headingfont[]{NotoSans-Medium}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Noto Sans-Light}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\RequirePackage{fontawesome5}

%The letter template changes where current page.north is
%let's reset it
\setlength\headheight{0\p@}

\renewcommand*{\opening}[1]{
    \begin{tikzpicture}[remember picture,overlay]
        \node [rectangle, fill=headerbg, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
        \node [anchor=center] (name) at (box) {%
                \fontsize{40pt}{72pt}\color{headerfg}%
                {\thinfont \firstname}{\bodyfont \lastname}
            };
        \node [anchor=east] (phone) at (box.east) {%
                \fontsize{12pt}{24pt}\color{headerfg}%
                {\faPhone~\phone}
            };
        \node [anchor=north east] (email) at (phone.south east) {%
                \fontsize{12pt}{24pt}\color{headerfg}%
                {\faEnvelope~\email}
            };
    \end{tikzpicture}
    \thispagestyle{empty}%

    {\raggedleft\begin{tabular}{l@{}}\ignorespaces
            \fromaddress \\*[2\parskip]%
    \@date \end{tabular}\par}%
    {\raggedright \toname \\ \toaddress \par}%
    \vspace{2\parskip}%\\
#1\par\nobreak}
