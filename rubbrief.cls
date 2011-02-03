%% this is file statbook.cls
\ProvidesClass{rubbiref}[2011/01/13 v1.0 Book template LS Statistik]

% Minimale LaTeX-Version
\NeedsTeXFormat{LaTeX2e}

% Die Einstellungen von Koma-Script laden und auf die Version 33 fixieren.
\PassOptionsToClass{version=3.05}{scrartcl} 
\LoadClassWithOptions{scrartcl}

% Seitenränder
\RequirePackage{geometry} 
\geometry{a4paper, bottom=25mm, left=25mm, right=20mm, top=45mm, headheight=22mm, headsep=16mm, footskip=17mm} %headsep muss für die erste Seite wieder mit vspace*{} am Dokumentanfang verkürzt werden.

% TTF-Schriften für sans und serif setzen
\RequirePackage[newstyle]{rubscala}
\RequirePackage{rubflama}

\fontsize{11pt}{14pt} % Schriftgröße für den Fließtext
\RequirePackage{soulutf8}


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
  \textbf{ADRESSE} &Universitätsstraße 150 | 44801 Bochum, Germany\\
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

% Formatierung für den Adressbereich
\newcommand{\adresse}[1]{
\parbox[t][68mm][t]{10.3cm}{ % 58mm bis zum Anfang + 63mm bis zum betreff
\fontsize{7pt}{10pt}
\selectfont
\sffamily \textbf{RUHR-UNIVERSITÄT} BOCHUM | 44780 Bochum | Germany\\[-3pt]
2. Absenderzeile\\[3mm]
% Adresse
\fontsize{11pt}{14pt}
\selectfont
\rmfamily
#1}}
\date{\today}
% Formatierung für den Absenderbereich
\newcommand{\absender}[1]{
\hspace{1.5cm} % Der Absenderblock wird wie das Logo um 1.5cm nach recht verschoben
\parbox[t][68mm][t]{5.68cm}{
\sffamily 
\fontsize{8pt}{12pt}
\selectfont
\textbf{\color{gelbgruen} \so{FAKULTÄT FÜR\\ SOZIALWISSENSCHAFT} }\\[2mm]
\fontsize{8pt}{12pt}
\selectfont
#1
\\
\textbf{\today}
% TODO: Möglichkeit finden mit \date ein Datum anzugeben
}}

%Deklaration der Variable "vordruck", um vorgedruckte Elemente auszublenden
% TODO: Falls der Name der Fakultät ebenfalls vorgedruckt wird, diesen ebenfalls einbeziehen.
\RequirePackage{ifthen} %Paket einbinden
\newboolean{vordruck}  
    
    % Hier wird der Stil für die erste Seite festgelegt
\AtBeginDocument{\thispagestyle{firstpage}}
\AtEndDocument{\label{LastPage}}
