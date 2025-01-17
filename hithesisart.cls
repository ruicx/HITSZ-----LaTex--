%%
%% This is file `examples/hitart/reports/hithesisart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hithesis.dtx  (with options: `artcls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2017-2021 by Chu Yanshuo <yanshuoc@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hithesisart}
[2020/12/22 3.0.14 Harbin Institute of Technology Thesis Template]
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=hit,
  prefix=hit@,
  setkeys=\kvsetkeys}

\newif\ifhit@bachelor
\newif\ifhit@master
\newif\ifhit@doctor
\define@key{hit}{type}{%
  \hit@bachelorfalse
  \hit@masterfalse
  \hit@doctorfalse
  \expandafter\csname hit@#1true\endcsname}

\newif\ifhit@shenzhen
\newif\ifhit@weihai
\newif\ifhit@harbin
\define@key{hit}{campus}{%
  \hit@shenzhenfalse
  \hit@weihaifalse
  \hit@harbinfalse
  \expandafter\csname hit@#1true\endcsname}
\ifhit@weihai\relax\else
\ifhit@shenzhen\relax\else
\hit@harbintrue
\fi
\fi

\newif\ifhit@opening
\newif\ifhit@midterm
\define@key{hit}{stage}{%
  \hit@openingfalse
  \hit@midtermfalse
  \expandafter\csname hit@#1true\endcsname}

\DeclareBoolOption[true]{raggedbottom}
\DeclareBoolOption[false]{pifootnote}
\DeclareBoolOption[false]{debug}
\DeclareBoolOption[true]{toc}
\DeclareBoolOption[true]{newtxmath}
\DeclareBoolOption[false]{printWithe}

\DeclareStringOption{fontset}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}

\ProcessKeyvalOptions*
\PassOptionsToPackage{no-math}{fontspec}

\ifhit@bachelor\relax\else
\ifhit@master\relax\else
\ifhit@doctor\relax\else
\ClassError{hithesisart}%
{
  \MessageBreak Please specify thesis type in option:
  \MessageBreak type=[bachelor | master | doctor]
}
\fi
\fi
\fi

\ifhit@opening\relax\else
\ifhit@midterm\relax\else
\ClassError{hithesisart}%
{
  \MessageBreak Please specify stage in option:
  \MessageBreak stage=<opening|midterm>
}
\fi
\fi

\ifhit@doctor
\ifhit@midterm
\ifhit@shenzhen
\ClassError{hithesisart}%
{
  \MessageBreak This document class does not support midterm report for doctor
  in shenzhen campus.
  \MessageBreak please use \string\documentclass{hithesisartplus}
}
\fi
\fi
\fi

\ifthenelse%
{\equal{\hit@fontset}{}}%
{%
  \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
}%
{%
  \ifthenelse%
  {\equal{\hit@fontset}{siyuan}}%
  {\relax}%
  {%
    \PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
  }%
  \PassOptionsToClass{fontset=\hit@fontset}{ctexart}
}%
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain]{ctexart}

\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\ifxetex
\else
        \ClassError{hithesis}%
                   {Please use: \MessageBreak
                    xelatex}{}
\fi
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{amssymb}
\RequirePackage[defaultsups]{newtxtext}
\ifhit@newtxmath
\RequirePackage{newtxmath}
\fi
\RequirePackage{courier}
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{enumitem}       %使用enumitem宏包,改变列表项的格式
\RequirePackage{environ}
\ifhit@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifhit@pifootnote
  \RequirePackage{pifont}
\fi
\RequirePackage{xeCJKfntef}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[sort&compress,numbers]{natbib}
\RequirePackage[subfigure]{tocloft}
\RequirePackage{lipsum}
\RequirePackage{hyperref}
\hypersetup{%
  CJKbookmarks=true,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0}
\urlstyle{same}

\ifhit@debug
\RequirePackage[showframe]{geometry}
\else
\RequirePackage{geometry}
\fi

\geometry{%根据PlutoThesis 原版定义而来
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar,
  centering,
  text={150true mm,236true mm},
  left=30true mm,
  head=5true mm,
  voffset=-7mm,
  headheight=12mm,
  headsep=2true mm,
  footskip=0true mm,
  foot=5.2true mm
}

\ifhit@debug%
\RequirePackage{layout}
\RequirePackage{layouts}
\RequirePackage{lineno}
\fi

\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{varwidth}
\RequirePackage{changepage}
\RequirePackage{multicol}
\RequirePackage{placeins}%允许上一个section的浮动图形出现在下一个section的开始部分,还提供\FloatBarrier命令,使所有未处理的浮动图形立即被处理
\RequirePackage{flafter}       % 使得所有浮动体不能被放置在其浮动环境之前，以免浮动体在引述它的文本之前出现.
\RequirePackage{multirow}       %使用Multirow宏包，使得表格可以合并多个row格
\RequirePackage{subfigure}%支持子图 %centerlast 设置最后一行是否居中
\RequirePackage[subfigure]{ccaption} %支持双语标题
\RequirePackage{xltxtra}
\RequirePackage{color}
\RequirePackage{mathtools}
\RequirePackage{bbm} % for \mathbbm{1}
\RequirePackage[indentafter]{titlesec}
\RequirePackage{caption}


\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20.50398bp}%
  \abovedisplayskip=8pt
  \abovedisplayshortskip=8pt
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}

\def\hit@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}



\ctexset{%
  section={
    afterindent=true,
    beforeskip={7.5bp},%上下空0.5行
    afterskip={7.5bp},
    format={\heiti\xiaosan[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsection={
    afterindent=true,
    beforeskip={7bp},
    afterskip={7bp},
    format={\heiti\sihao[1.25]},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  subsubsection={
    afterindent=true,
    beforeskip={6bp},
    afterskip={6bp},
    format={\heiti\normalsize},
    aftername=\enspace,
    fixskip=true,
    break={},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true
}

\def\hit@def@term#1{%
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hit@#1\endcsname{##1}}
  \csname #1\endcsname{}}

\hit@def@term{ctitlecover} %中文标题封面
\hit@def@term{csubject}
\hit@def@term{cauthor}
\hit@def@term{cstudentid}
\hit@def@term{cclassid}
\hit@def@term{caffil}
\hit@def@term{csupervisor}
\hit@def@term{cassosupervisor}
\hit@def@term{ccosupervisor}
\hit@def@term{cdate}

\hit@def@fontsize{dachu}{58bp}
\hit@def@fontsize{chuhao}{42bp}
\hit@def@fontsize{xiaochu}{36bp}
\hit@def@fontsize{yihao}{26bp}
\hit@def@fontsize{xiaoyi}{24bp}
\hit@def@fontsize{erhao}{22bp}
\hit@def@fontsize{xiaoer}{18bp}
\hit@def@fontsize{sanhao}{16bp}
\hit@def@fontsize{xiaosan}{15bp}
\hit@def@fontsize{sihao}{14bp}
\hit@def@fontsize{banxiaosi}{13bp}
\hit@def@fontsize{xiaosi}{12bp}
\hit@def@fontsize{dawu}{11bp}
\hit@def@fontsize{wuhao}{10.5bp}
\hit@def@fontsize{xiaowu}{9bp}
\hit@def@fontsize{liuhao}{7.5bp}
\hit@def@fontsize{xiaoliu}{6.5bp}
\hit@def@fontsize{qihao}{5.5bp}
\hit@def@fontsize{bahao}{5bp}

\def\hit@parse@keywords#1{
  \define@key{hit}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname hit@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname hit@#1\endcsname\@empty\else
      \expandafter\g@addto@macro\csname hit@#1\endcsname{%
        \ignorespaces\csname hit@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
      \expandafter\csname hit@#1\expandafter\endcsname\expandafter{\reserved@a}}}}

\def\hitsetup{\kvsetkeys{hit}}

\newcommand{\hit@report@titlepage@graduate}{
  \ifthenelse%
  {\equal{\hit@fontset}{siyuan}}%
  {\xiaosi[1]\vspace*{0.65em}}%
  {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\hit@hi}}}%
  \vspace*{10mm}
  \begin{center}
    \kaishu\xiaoer\textbf{\hit@cschoolname}
  \end{center}
  \vspace{5mm}
  \begin{center}
    \songti\erhao\textbf{\hit@cxuewei\hit@cthesisname
      \ifhit@opening
      \hit@stage@opening
      \else
      \ifhit@midterm
      \hit@stage@midterm
      \fi
      \fi
      \hit@stage@doctype
    }
  \end{center}
   \vspace{10mm}
   \parbox[t][3cm][t]{\textwidth}{
     \begin{center}
       \songti\xiaoer\textbf{\hit@cthesistitleprefix\hit@title@csep\hit@ctitlecover}
     \end{center}
   }
     \parbox[b][3cm][t]{\textwidth}{
       \begin{center}\songti\sanhao
       \renewcommand{\arraystretch}{2.1}
       \begin{tabular}{l@{\ \ }c}
         \textbf{\hit@graduate@caffiltitle} & \underline{\makebox[6.1cm]{\textbf{\hit@caffil}}}\\
         \textbf{\hit@graduate@cmajortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csubject}}}\\
         \textbf{\hit@graduate@supervisor} & \underline{\makebox[6.1cm]{\textbf{\hit@csupervisor}}}\\
         \ifx\hit@cassosupervisor\@empty\else%
           \textbf{\hit@graduate@cassosupervisor} & \underline{\makebox[6.1cm]{\textbf{\hit@cassosupervisor}}}\\
         \fi
         \ifx\hit@ccosupervisor\@empty\else%
           \textbf{\hit@graduate@ccosupervisor} & \underline{\makebox[6.1cm]{\textbf{\hit@ccosupervisor}}}\\
         \fi
         \textbf{\hit@graduate@studenttitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cauthor}}}\\
         \textbf{\hit@graduate@studentid} & \underline{\makebox[6.1cm]{\textbf{\hit@cstudentid}}}\\
         \textbf{\hit@graduate@datetitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cdate}}}\\
       \end{tabular}\renewcommand{\arraystretch}{1}
     \end{center}
     }
   \vfill
   \ifhit@harbin
   \hit@harbin@schoolbottommark
   \else
   \ifhit@shenzhen
   \hit@shenzhen@schoolbottommark
   \fi
   \fi
}

\newcommand{\hit@report@titlepage@bachelor}{
   \ifthenelse%
   {\equal{\hit@fontset}{siyuan}}%
   {\xiaosi[1]\vspace*{0.65em}}%
   {\xiaosi[1]\textcolor[rgb]{1,1,1}{\songti{\hit@hi}}}%
   \vspace*{10mm}
   \begin{center}
     \includegraphics[width=6.2cm]{hitlogo}
   \end{center}
   \begin{center}
     \songti\xiaoyi\textbf{\hit@bachelor@cthesisname
       \ifhit@opening
       \hit@stage@opening
       \else
       \ifhit@midterm
       \hit@stage@midterm
       \fi
       \fi
       \hit@stage@doctype
     }
   \end{center}
   \vspace{15mm}
   \parbox[t][6.5cm][t]{\textwidth}{
     \begin{center}
       \songti\xiaoer\textbf{\hit@cthesistitleprefix\hit@title@csep\hit@ctitlecover}
     \end{center}
   }
     \parbox[b][6cm][t]{\textwidth}{
       \begin{center}\songti\sanhao
       \renewcommand{\arraystretch}{2.1}
       \begin{tabular}{l@{\ \ }c}
         \textbf{\hit@bachelor@cmajortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csubject}}}\\
         \textbf{\hit@bachelor@cstudenttitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cauthor}}}\\
         \textbf{\hit@bachelor@cstudentidtitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cstudentid}}}\\
         \ifhit@weihai % 威海校区特有
         \textbf{\hit@bachelor@cclass} & \underline{\makebox[6.1cm]{\textbf{\hit@cclassid}}}\\
         \fi
         \textbf{\hit@bachelor@csupervisortitle} & \underline{\makebox[6.1cm]{\textbf{\hit@csupervisor}}}\\
         \textbf{\hit@bachelor@cdatetitle} & \underline{\makebox[6.1cm]{\textbf{\hit@cdate}}}\\
       \end{tabular}\renewcommand{\arraystretch}{1}
     \end{center}
     }
   \vfill
   \ifhit@weihai
   \relax
   \else
   \hit@harbin@bachelor@schoolbottommark
   \fi
}

\newcommand{\hit@report@backpage@bachelor}{
  \thispagestyle{empty}
  \noindent\parbox[t][6.5cm][t]{\textwidth}{\hit@bachelor@teachercomment}
  \noindent\parbox[b][6cm][t]{\textwidth}{\hit@bachelor@teachersign\underline{\makebox[3cm]{}}\hfill\hit@bachelor@checkdate\underline{\makebox[3cm]{}}}
}

% ====================================

\def\maketoc{
  \renewcommand{\cftdotsep}{1}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
  \renewcommand{\cftbeforesecskip}{2mm}
  \renewcommand{\cftbeforesubsecskip}{2mm}
  \renewcommand{\cftbeforesubsubsecskip}{2mm}
  \renewcommand{\contentsname}{\hfill\heiti\xiaoer[1.57481] 目\hspace{\ccwd}录 \hfill}
  \renewcommand{\cftaftertoctitle}{\hfill}
  \renewcommand{\cftaftertoctitleskip}{28.34646bp}
  \renewcommand{\cftsubsubsecindent}{2.3em}
  \tocloftpagestyle{empty}
  \tableofcontents
}

\def\makecover{
  \begin{titlepage}
    \ifhit@bachelor
    \hit@report@titlepage@bachelor
    \else
    \hit@report@titlepage@graduate
    \fi
    \clearpage
    \ifhit@printWithe
      \thispagestyle{empty}
      \null\clearpage
    \fi
    \ifhit@toc
    \maketoc
    \clearpage
    \ifhit@printWithe
      \thispagestyle{empty}
      \null\clearpage
    \fi
    \fi
  \end{titlepage}
}

\def\makebackcover{
    \clearpage
    \hit@report@backpage@bachelor
}

\fancypagestyle{hit@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{hit@plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\xiaowu-~\thepage~-}
}

\fancypagestyle{hit@headingsmunual}{
  \fancyhead[C]{\songti\xiaowu[0]哈尔滨工业大学（深圳）中期报告}
  \fancyhead[R]{}
  \fancyhead[L]{}
  \renewcommand{\headrule}{
    \vskip 1.190132pt
    \hrule\@height2.276208pt\@width\headwidth
    \vskip 0.75pt
    \hrule\@height.75pt\@width\headwidth
  }
  \fancyfoot[C]{\xiaowu-~\thepage~-}
}

% paragraph style
\setcounter{secnumdepth}{4}
\titleformat{\paragraph}[hang]{\heiti\normalsize}{\arabic{paragraph}) }{2pt}{}[]

% publication list: [P1]
\newlist{publicationList}{enumerate}{1}
\setlist[publicationList]{resume, label={[P\arabic*]},
    topsep=0pt, parsep=0pt, partopsep=0pt, itemsep=0pt}

% semi quote list: 1)
\newlist{semiQuotList}{enumerate}{1}
\setlist[semiQuotList]{label={\arabic*)},
    topsep=0pt, parsep=0pt, partopsep=0pt, itemsep=0pt}

% unorder list with \textbullet
\newlist{closeItemize}{itemize}{1}
\setlist[closeItemize]{label={\textbullet},
    topsep=0pt, parsep=0pt, partopsep=0pt, itemsep=0pt}

% close description
\newlist{closeDescription}{description}{1}
\setlist[closeDescription]{topsep=0pt, parsep=0pt, partopsep=0pt, itemsep=0pt}

% equation numbering in style likes "(2-1)"
\numberwithin{equation}{section}
\renewcommand{\theequation}{\thesection-\arabic{equation}}

% figure numbering in style likes "图 2-1 "
\numberwithin{figure}{section}
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\captionsetup[figure]{labelsep=space}

% table numbering in style likes "表 2-1 "
\numberwithin{table}{section}
\renewcommand{\thetable}{\thesection-\arabic{table}}
\captionsetup[table]{labelsep=space}

% ====================================


\newcommand\bibstyle@numerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{\hit@inline@sep}}

\citestyle{numerical}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\citestyle{inline}\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite

\renewenvironment{thebibliography}[1]{%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\renewcommand{\makelabel}[1]{##1\hfill}
    \settowidth{\labelwidth}{\@biblabel{#1}}
    \setlength{\labelsep}{0.5em}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelsep+\labelwidth}
    \addtolength{\itemsep}{-0.8em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\frenchspacing
  \flushbottom
  \clubpenalty0
  \@clubpenalty \clubpenalty
  \widowpenalty0%
  \interlinepenalty-50%
\sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist\frenchspacing}
\AtEndOfClass{\input{hithesisart.cfg}}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `examples/hitart/reports/hithesisart.cls'.
