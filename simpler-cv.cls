% vim:set et ft=tex sw=4 ts=4:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpler-cv}[2019/05/20]

\LoadClass[a4paper]{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{gray}{HTML}{4D4D4D}

\colorlet{fillheader}{black}
\colorlet{header}{white}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{xeCJK}
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

% You need to define some basic infos
\newcommand*{\firstname}[1]{\def\firstname{#1}}
\newcommand*{\lastname}[1]{\def\lastname{#1}}
\newcommand*{\bio}[1]{\def\bio{#1}}
\newcommand*{\phone}[1]{\def\phone{#1}}
\newcommand*{\email}[1]{\def\email{#1}}

\newcommand{\header}{%
    \begin{tikzpicture}[remember picture,overlay]
        \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
        \node [anchor=center] (name) at (box) {%
                \fontsize{40pt}{72pt}\color{header}%
                {\thinfont \firstname }~{\bodyfont \lastname}
            };
        \node [anchor=north] (bio) at (name.south) {%
                \fontsize{14pt}{24pt}\color{header}%
                {\thinfont \bio}
            };
        \node [anchor=east] (phone) at (box.east) {%
                \fontsize{12pt}{24pt}\color{header}%
                {\faPhone~\phone}
            };
        \node [anchor=north east] (email) at (phone.south east) {%
                \fontsize{12pt}{24pt}\color{header}%
                {\faEnvelope~\email}
            };
    \end{tikzpicture}
    \vspace{4cm}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\RequirePackage{parskip}
\RequirePackage{ifthen}

\newcounter{colorCounter}
\def\sectioncolor#1{%
    {%
        \color{%
            \ifcase\value{colorCounter}%
                blue\or%
                red\or%
                orange\or%
                green\or%
                purple%
            \fi%
        } #1%
    }%
    \stepcounter{colorCounter}%
    \ifthenelse{\equal{\value{colorCounter}}{5}}{
        \setcounter{colorCounter}{0}
    }{}
}

\renewcommand{\section}[1]{%
    \par\vspace{\parskip}%
    {%
        \LARGE\headingfont\color{headercolor}%
        \sectioncolor{ #1}%
    }
    \par\vspace{\parskip}%
}

\renewcommand{\subsection}[1]{
    \par\vspace{.5\parskip}%
    {\Large\headingfont\color{headercolor} \sectioncolor{ #1}}
    \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newenvironment{entrylist}{%
    \begin{table}[htpb]
        \begin{tabular}{p{0.2\textwidth}p{0.6\textwidth}r}
        }%
        {
        \end{tabular}
    \end{table}
}

% Insert entries into each entrylist, takes 3 variables
% #1 Date range
% #2 Institutions or items
% #3 Role or title
\newcommand{\entry}[3]{{#1}&{#2}&{\textbf{#3}}\\}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[hmargin=1.25cm,vmargin=0.75cm,nohead,nofoot]{geometry}
