%% this is file statbook.cls
\ProvidesClass{rubbrief}[20/04/11 14:33:46]

% Minimale LaTeX-Version
\NeedsTeXFormat{LaTeX2e}

% Die Einstellungen von Koma-Script laden und auf die Version 33 fixieren.
%\DeclareOption{parskip}{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\LoadClass{scrlttr2}

% Seitenränder
\RequirePackage{geometry} 
\geometry{a4paper, bottom=25mm, left=25mm, right=20mm, top=45mm, headheight=22mm, headsep=16mm, footskip=17mm} %headsep muss für die erste Seite wieder mit vspace*{} am Dokumentanfang verkürzt werden.

% Standardschriftart anpassen
% TTF-Schriften für sans und serif setzen
\RequirePackage{ifxetex,ifluatex}
\ifnum 0=\ifxetex 1\else\ifluatex 1\else 0\fi\fi\relax
  \RequirePackage[newstyle]{rubscala}
  \RequirePackage{rubflama}
  \RequirePackage{microtype}
  \newcommand{\makels}[1]{\textls*{#1}}
\else
  \RequirePackage{fontspec}
  \setmainfont{RUB Scala TZ} % Standardschrift (Dateiname oder Schriftname)
  \setsansfont{RubFlama} % Serifenlose Schrift
  \newcommand{\makels}[1]{{\addfontfeature{LetterSpace=12}#1}}
\fi



\fontsize{11pt}{14pt} % Schriftgröße für den Fließtext

%  Keine Einzüge, dafür aber größere Absätze
\setlength{\parindent}{0ex}
\setlength{\parskip}{11pt}

% Kopfzeile und Seitennummern ab Seite zwei formatieren.
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}

% Berechnungen
\RequirePackage{calc}

% Farben definieren
\RequirePackage{xcolor}
\definecolor{gelbgruen}{cmyk}{0.5,0,1,0}
\definecolor{lichtgrau}{cmyk}{.03,.03,.03,.1}
\definecolor{saphierblau}{cmyk}{1,0.5,0,.6}

% Grafiken
\RequirePackage{graphicx}

% Das Logo um 1.5cm nach rechts verschieben
\setheadwidth[0pt]{\textwidth+1cm} 

% Definition der Kopf- und Fußzeilen
\ohead{\ifthenelse{\boolean{vordruck}}{}{\includegraphics[width=5.7cm]{logo.pdf}}}
\cofoot{}
\ofoot{}
\ifoot{\sffamily\fontsize{8pt}{8pt}\selectfont SEITE \pagemark ~| \pageref{LastPage}}

 % Definiton des Seitenstils für die erste Seite
\newpagestyle{firstpage}{
% Kopfzeile
{}{}{
\ifthenelse{\boolean{vordruck}} {} {\hfill\includegraphics[width=5.68cm]{logo.pdf}}}
} 
{
% Fußzeile
{}{}{
\hspace{-3mm}
\begin{tabular}{ll}
  \textbf{ADRESSE} &Universitätsstraße 150 | 44801 Bochum, Germany\\
  \textbf{ANFAHRT} &U-Bahn: U35 | Auto: A43, Abfahrt (19) Bochum Witten\\
  \end{tabular}\hfill
\ifthenelse{\boolean{vordruck}}{}{\fontsize{11pt}{11pt}\selectfont\textcolor{gelbgruen}{WWW.RUB.DE}}}
}

% Schriftart für die Fußzeile setzen
\setkomafont{pagehead}{\normalfont\sffamily\fontsize{8pt}{8pt}\selectfont}
\setkomafont{pagefoot}{\normalfont\sffamily\fontsize{8pt}{8pt}\selectfont}
\renewcommand{\pnumfont}{\sffamily\fontsize{8pt}{8pt}\selectfont}

%Auszeichnungskommandos
\RequirePackage{ifthen} %Paket einbinden

% Falzmarken
\newboolean{fm}  
\DeclareOption{foldmarks=on}{\setboolean{fm}{true}}
\DeclareOption{foldmarks=off}{\setboolean{fm}{false}}
\ExecuteOptions{foldmarks=on}

\newcommand{\faltmarken}{
\begin{picture}(0,0)
\unitlength1mm
 \put(-20,-60.16){\line(1,0){3}}
      \put(-20,-160.16){\line(1,0){3}}
\end{picture}\hspace{-1.5mm}
}

%Deklaration der Variable "vordruck", um vorgedruckte Elemente auszublenden
\newboolean{vordruck}  
\DeclareOption{vorlage=true}{\setboolean{vordruck}{true}}
\DeclareOption{vorlage=false}{\setboolean{vordruck}{false}}
\ExecuteOptions{vorlage=false}


% Formatierung für den Adressbereich
% Option für die Antwortadresse
\newboolean{backaddress}
\DeclareOption{backaddress=on}{\setboolean{backaddress}{true}}
\DeclareOption{backaddress=off}{\setboolean{backaddress}{false}}

\newcommand{\antwortadresse}{
\ifthenelse{\boolean{backaddress}}{
\sffamily \fontsize{7pt}{8pt} \selectfont
\Ifkomavarempty{backaddress}{}{\textbf{RUHR-UNIVERSITÄT} BOCHUM | 44780 Bochum | Germany\\[-4pt]
\usekomavar{backaddress}\\[3mm]}
}{}
}

% Option für das Adressfeld
\newboolean{addrfield}
\DeclareOption{addrfield=on}{\setboolean{addrfield}{true}}
\DeclareOption{addrfield=off}{\setboolean{addrfield}{false}}
\ExecuteOptions{addrfield=on}

% Bereich für Adressfeld reservieren
\newcommand{\adressfeld}[1]{\parbox[t][68mm][t]{10.3cm}{#1}} % 58mm bis zum Anfang + 63mm bis zum betreff
\newcommand{\adressfeldempty}{\parbox[t][1mm][t]{10.3cm}{~}} % 58mm bis zum Anfang + 63mm bis zum betreff

% Adresse inkl. Rückantwortadresse setzen
\newcommand{\adresse}{
\antwortadresse
% Adresse
\fontsize{11pt}{14pt}\selectfont\rmfamily
\usekomavar{toname}\\[0.5ex]
\usekomavar{toaddress}}



% Standardmäßig das heutige Datum verwenden
\date{\today}

% Formatierung für den Absenderbereich
\newkomavar{frominstitute}
\newkomavar{frombuilding}
\newkomavar{fromfaculty}


% Größe des Absenderbereichs anpassen, wenn keine Adresse angegeben wurde.
\newcommand{\absender}{
% Der Absenderblock wird wie das Logo um 1.5cm nach recht verschoben
\parbox[t][45mm][t]{5.68cm}{ % Keine Feste Breite vorgeben
\sffamily 
\fontsize{8pt}{12pt}
\selectfont
\textbf{\textcolor{gelbgruen}{\makels{\usekomavar{fromfaculty}}}}\\[2mm]
\fontsize{8pt}{12pt}
\selectfont
\Ifkomavarempty{frominstitute}{}{\textbf{\usekomavar{frominstitute}}\\}
\Ifkomavarempty{fromaddress}{}{\Ifkomavarempty{frombuilding}{}{\usekomavar{frombuilding}\\}\usekomavar{fromaddress}\\[1em]}
\Ifkomavarempty{fromname}{}{\textbf{\usekomavar{fromname}}\\}
\Ifkomavarempty{fromphone}{}{Fon  \usekomavar{fromphone}\\}
\Ifkomavarempty{fromfax}{}{Fax  \usekomavar{fromfax}\\}
\Ifkomavarempty{fromemail}{}{\usekomavar{fromemail}\\}
\Ifkomavarempty{fromurl}{}{\usekomavar{fromurl}\\}
\\
\textbf{\@date}
}}

% Gliederungsbefehle in Briefen verfügbar machen
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\renewcommand*{\thesection}{\Alph{section}.}
\renewcommand*{\thesubsection}{\Roman{subsection}.}
\renewcommand*{\thesubsubsection}{\arabic{subsubsection}.}
\renewcommand*{\theparagraph}{\alph{paragraph})}
\renewcommand*{\p@subsection}{\thesection}
\renewcommand*{\p@subsubsection}{\p@subsection\thesubsection}
\renewcommand*{\p@paragraph}{\p@subsubsection\thesubsubsection}
\newcommand*\addsec{\secdef\@addsec\@saddsec}
\newcommand*{\@addsec}{}
\def\@addsec[#1]#2{\section*{#2}\addcontentsline{toc}{section}{#1}
  \if@twoside \@mkboth{#1}{}\else \@mkboth{#1}{#1}\fi}
\newcommand*{\@saddsec}[1]{\section*{#1}\@mkboth{}{}}
\let\size@section\normalsize
\let\size@subsection\normalsize
\let\size@subsubsection\normalsize
\let\size@paragraph\normalsize
\newcommand*{\scr@fnt@section}{\size@section}
\newcommand*{\scr@fnt@subsection}{\size@subsection}
\newcommand*{\scr@fnt@subsubsection}{\size@subsubsection}
\newcommand*{\scr@fnt@paragraph}{\size@paragraph}
\newkomafont{minisec}{}
\newcommand*\sectfont{\normalcolor\sffamily\bfseries}
\newcommand*{\scr@fnt@disposition}{\sectfont}
\aliaskomafont{sectioning}{disposition}
\setcounter{secnumdepth}{4}
\newcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\setlength{\parfillskip}{\z@ \@plus 1fil}%
    \raggedsection\normalfont\usekomafont{disposition}\nobreak
    \usekomafont{section}\nobreak}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\setlength{\parfillskip}{\z@ \@plus 1fil}%
    \raggedsection\normalfont\usekomafont{disposition}\nobreak
    \usekomafont{subsection}\nobreak}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\setlength{\parfillskip}{\z@ \@plus 1fil}%
    \raggedsection\normalfont\usekomafont{disposition}\nobreak
    \usekomafont{subsubsection}\nobreak}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\setlength{\parfillskip}{\z@ \@plus 1fil}%
    \raggedsection\normalfont\usekomafont{disposition}\nobreak
    \usekomafont{paragraph}\nobreak}}
\newcommand\minisec[1]{\@afterindentfalse \vskip 1.5ex
  {\parindent \z@
    \raggedsection\normalfont\usekomafont{disposition}\nobreak%
    \usekomafont{minisec}#1\par\nobreak}\nobreak
  \@afterheading}
\let\raggedsection\raggedright



% Betreff und Titel


 
\ProcessOptions\relax
% Hier wird der Stil für die erste Seite festgelegt


\AtBeginDocument{\thispagestyle{firstpage}
                \ifthenelse{\boolean{fm}}{\faltmarken}{}
                \ifthenelse{\boolean{addrfield}}{\adressfeld{\adresse}}{\adressfeldempty}\hspace{1.5cm}\absender 
             
                % Formatierung der Betreffzeile, feste Höhe um den Text bei der richtigen Höhe beginnen zu lassen
                \parbox[t][16.117mm][t]{\textwidth}{
                \Ifkomavarempty{subject}{\newline}{\textbf{\sffamily \usekomavar{subject}}\\[0.2em]}
                \Ifkomavarempty{title}{}{\textbf{\large\sffamily \usekomavar{title}}\par}}
                }

\AtEndDocument{\label{LastPage}}
