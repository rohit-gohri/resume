# Resume

[![Build Status](https://cloud.drone.io/api/badges/rohit-smpx/resume/status.svg)](https://cloud.drone.io/rohit-smpx/resume)

Automatically built resume with LaTeX. The structure for sections is defined in `resume.cls` file. While the content is in `resume.tex'.

> Based on the [CV For Freshers](https://www.overleaf.com/latex/templates/cv-for-freshers/jkpwvnrdrxpm) template on Overleaf.

### [Preview latest version](https://go.boring.download/resume-preview)

### [Download latest version](https://go.boring.download/resume)


## Resources

- [Begin Latex](https://github.com/luong-komorebi/Begin-Latex-in-minutes)
- [Latex Advice](https://github.com/dspinellis/latex-advice)
- [Useful Packages](https://tex.stackexchange.com/questions/553/what-packages-do-people-load-by-default-in-latex)
- [Overleaf](https://www.overleaf.com/): Online Editor
- [Original Template](https://www.overleaf.com/latex/templates/cv-for-freshers/jkpwvnrdrxpm)
- Automatic [builds](https://cloud.drone.io/rohit-smpx/resume) with [Drone.io](https://cloud.drone.io) on publishing tag


## Included Commands

### \mydate

Create new date and displays it according to `{shortmonthname}. {year}` format

```tex
% Default day is 01
\mydate{3}{2017}
% Feb. 2017

% Use full date so that format can be changed in future without having to change all dates
\mydate[1]{3}{2017}
% Mar. 2017

% Only print year by providing empty month
\mydate{}{2017}
% 2017
```

### \rSubsectionHeading

Command to print subsection heading. Output depends on number of non empty arguments

```tex
% 2 Params
\rSubsectionHeading
    {Netaji Subhas Institute of Technology}
    { \mydate{8}{2013} - \mydate{6}{2017} }
    {}{}
```
![2ParamsPreview](./docs/2ParamSubSectionHeading.PNG)

```tex
% 3 Params
\rSubsectionHeading
    {Netaji Subhas Institute of Technology}
    { \mydate{8}{2013} - \mydate{6}{2017} }
    {B.E. in Computer Engineering}
    {}
```

![3ParamsPreview](./docs/3ParamSubSectionHeading.PNG)

```tex
% 4 Params
\rSubsectionHeading
    {Netaji Subhas Institute of Technology}
    { \mydate{8}{2013} - \mydate{6}{2017} }
    {\normalfont B.E. in Computer Engineering}
    {Delhi, IN}
```

![4ParamsPreview](./docs/4ParamSubSectionHeading.PNG)

### \showif

Instead of commenting out blocks skip content conditionally so that atleast it is checked by latex to be valid.

```tex
% Default is false
\showif{Test Content}
%
\showif[false]{Test Content}
%
\showif[true]{Test Content}
% Test Content
```

Also works for blocks of content:

```tex
\showif[false]{
\begin{rSection}{Activities} \itemsep -2pt
    \item XXXXXXXXXXXXXXX
    \item YYYYYYYYYYYYYYY
    \item ZZZZZZZZZZZZZZZ
\end{rSection}
}
%
```

## Packages Used

### [FontAwesome](https://github.com/xdanaux/fontawesome-latex)

Use icons from fontawesome. List of available icons in [docs](http://ctan.imsc.res.in/fonts/fontawesome/doc/fontawesome.pdf).

### [DateTime](https://ctan.org/pkg/datetime)

Used to setup custom date format and custom [date command](#mydate).

### [hyperref](https://github.com/ho-tex/hyperref)

For `\href` links and PDF metadata.

### [mathpazo](https://ctan.org/pkg/mathpazo)

For `Palatino` font for the whole document.

### [geometry](https://ctan.org/pkg/geometry)

For setting Document margins.

### [ifthen](https://ctan.org/pkg/ifthen)

For conditional logic in [`showif` command](#showif).
