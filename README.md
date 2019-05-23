# Yet another latex résumé template based on Adrien Friggeri's work.

## Credit

-   [Adrien Friggeri](https://github.com/afriggeri)
-   [Roald87](https://github.com/Roald87/xelatex-cv-roald)
-   [Deedy](https://github.com/deedy/Deedy-Resume)
-   [spagnuolocarmine](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex)

## Preview

Compiled the files in examples directory with `latexmk` to get following effects.

The résumé/CV class mainly include most basic information about the user.

![CV](https://i.imgur.com/Aga1DFo.png)

The Cover Letter class is of course, a letter descibring yourself.

![Cover Letter](https://i.imgur.com/YQiQtce.png)

## Command defined

### `simpler-cv.cls`

This is the résumé/curriculum vitae class

-   `\firstname`
-   `\lastname`
-   `\bio`
-   `\phone`
-   `\email`
-   `\section`
-   `\subsection`
-   `\entrylist`
-   `\entry`

The `entrylist` is an environment with which you wrap up `entry` which includes 3 parameters: DateRange, Institutions, Role.

You can also redefine the colors for section and subsection with `\definecolor` if you want, the possible colors are `green`, `orange`, `purple`, `red`, `blue`.

### `simpler-cl.cls`

This is the cover letter class

-   `\firstname`
-   `\lastname`
-   `\phone`
-   `\email`

You also have to specify your address with `\address`, call `\begin{letter}` with an additional argument about The addressee and other info. The `\opening` has to be called to make the header.

## I want more!

You can define more info in the header using `\node` from `tikz` library, along with some fontawesome icons.
