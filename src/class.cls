%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class File
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------
% DEFINITION
%--------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Colombaro}[22/01/2021, v2.0]

%--------------------------------
% MAIN
%--------------------------------
\LoadClass[11pt, a4paper]{article}
\RequirePackage[french]{babel}
\RequirePackage{fontspec}

%--------------------------------
% TYPOGRAPHY
%--------------------------------
\RequirePackage[xetex, bookmarks, colorlinks, breaklinks]{hyperref}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{eurosym}
\RequirePackage{numprint}
\RequirePackage{verbatim}
\RequirePackage{moreverb}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}

% Custom fint
\setsansfont{SourceSansPro}[
  Path = assets/fonts/,
  Extension = .otf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-It,
  BoldItalicFont = *-BoldIt
]
\renewcommand{\familydefault}{\sfdefault}

% French typeset
\RequirePackage{polyglossia}
\setmainlanguage{french}

% Set paragraph break
\setlength{\parskip}{1em}

% Command required by how Pandoc handles the list conversion
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

%--------------------------------
% LAYOUT
%--------------------------------
% Margins
\RequirePackage[a4paper,left=25mm,right=25mm,top=15mm,bottom=25mm]{geometry}

% Page numbers
\RequirePackage{lastpage}

% Left align
\RequirePackage[document]{ragged2e}

% Columns
\RequirePackage{multicol}

%--------------------------------
% Header / Footer
%--------------------------------
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{
  \color{gray}
  \footnotesize
  \thepage/\pageref{LastPage}
}

%--------------------------------
% TABLE CUSTOMIZATION
%--------------------------------
\RequirePackage{spreadtab}

% For customizing title sections
\RequirePackage[compact]{titlesec}
% Remove margin bottom from the title
\titlespacing*{\section}{0pt}{3pt}{-7pt}

% For the dotted line on the table
\RequirePackage{arydshln}

% Apply vertical padding to table cells
\renewcommand{\arraystretch}{1.5}

% For single-cell borders
\RequirePackage{hhline}

% For customizing lists
\RequirePackage{enumitem}

% No whitespace around list items
\setlist{nolistsep}

% Reduce list left indent
\setlist[itemize]{leftmargin=0.5cm}

% Larger gutter between columns
\setlength{\tabcolsep}{9pt}

%--------------------------------
% CUSTOME COMMANDS
%--------------------------------
\IfFileExists{/opt/style.sty}{\RequirePackage{/opt/style}}{}
