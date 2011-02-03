%% this is file statbook.cls
\ProvidesClass{rubbesch}[03/02/11 12:54:31]

% Minimale LaTeX-Version
\NeedsTeXFormat{LaTeX2e}

% Die Einstellungen von Koma-Script laden und auf die Version 33 fixieren.
\PassOptionsToClass{version=3.05}{scrlttr2} 
\LoadClassWithOptions{scrlttr2}

% Seitenränder
\RequirePackage{geometry} 
\geometry{a4paper, bottom=25mm, left=25mm, right=20mm, top=45mm, headheight=22mm, headsep=16mm, footskip=17mm} %headsep muss für die erste Seite wieder mit vspace*{} am Dokumentanfang verkürzt werden.

% TTF-Schriften für sans und serif setzen
\RequirePackage[newstyle]{rubscala}
\RequirePackage{rubflama}


\RequirePackage[ngerman]{babel}

\fontsize{11pt}{14pt} % Schriftgröße für den Fließtext
\RequirePackage{microtype}

%  Keine Einzüge, dafür aber größere Absätze
\setlength{\parindent}{0ex}
\setlength{\parskip}{11pt}

% Kopfzeile und Seitennummern ab Seite zwei formatieren.
\RequirePackage{scrpage2}
\pagestyle{scrheadings}

% Berechnungen
\RequirePackage{calc}

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
  \textbf{ADRESSE} &Universit\"{a}tsstra\"{ss}e 150 | 44801 Bochum, Germany\\
  \textbf{ANFAHRT} &U-Bahn: U35 | Auto: A43, Abfahrt (19) Bochum Witten\\
  \end{tabular}\hfill
\ifthenelse{\boolean{vordruck}}{}{\fontsize{11pt}{11pt}\selectfont\color{gelbgruen}{WWW.RUB.DE}}}
}

% Schriftart für die Fußzeile setzen
\setkomafont{pagehead}{\normalfont\sffamily\fontsize{8pt}{8pt}\selectfont}
\renewcommand{\pnumfont}{\sffamily\fontsize{8pt}{8pt}\selectfont}

% Farben
\RequirePackage{color}
\definecolor{gelbgruen}{cmyk}{0.5,0,1,0}
\definecolor{lichtgrau}{cmyk}{.03,.03,.03,.1}
\definecolor{saphierblau}{cmyk}{1,0.5,0,.6}

% Auszeichnungskommandos
% Formatierung der Betreffzeile, feste Höhe um den Text bei der richtigen Höhe beginnen zu lassen
\newcommand{\betreff}[1]{\parbox[t][16.117mm][t]{\textwidth}{\textbf{#1}}}


% Formatierung für den Absenderbereich
\newkomavar{frominstitute}
\newkomavar{frombuilding}
\newkomavar{fromfaculty}

\newcommand{\absender}{
\hspace{1.5cm} % Der Absenderblock wird wie das Logo um 1.5cm nach recht verschoben
\parbox[t][68mm][t]{5.68cm}{
\sffamily 
\fontsize{8pt}{12pt}
\selectfont
\textbf{\color{gelbgruen} \textls*[100]{\usekomavar{fromfaculty}} }\\[2mm]
\fontsize{8pt}{12pt}
\selectfont
\textbf{\usekomavar{frominstitute}}\\
\usekomavar{frombuilding}\\
\usekomavar{fromaddress}\\
\\
\textbf{\usekomavar{fromname}}\\
Fon  \usekomavar{fromphone}\\
Fax  \usekomavar{fromfax}\\
\usekomavar{fromemail}\\
\usekomavar{fromurl}\\
\\
\textbf{\@date}
}}

%Deklaration der Variable "vordruck", um vorgedruckte Elemente auszublenden
% TODO: Falls der Name der Fakultät ebenfalls vorgedruckt wird, diesen ebenfalls einbeziehen.
\RequirePackage{ifthen} %Paket einbinden
\newboolean{vordruck}  

\DeclareOption{vordruck=true}{\setboolean{vordruck}{true}}
\DeclareOption{vordruck=false}{\setboolean{vordruck}{false}}
\ExecuteOptions{vordruck=false}
\ProcessOptions\relax


    % Hier wird der Stil für die erste Seite festgelegt
\AtBeginDocument{\thispagestyle{firstpage}
                \hspace{10.2cm}\absender
                }
\AtEndDocument{\label{LastPage}}

