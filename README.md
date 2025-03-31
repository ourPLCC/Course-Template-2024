# Course Template 2024

This repository is a GitHub template that contains materials that Stoney Jackson
used to teach CS 351 Programming Languages in Fall 2024.

The materials in the repository are licensed under the GNU Free Documentation License 1.3 or later and/or GPL 3.0 or later. These are open-source licenses. Enjoy!

To create a copy of this repository, click the green `Use this template` button ([instructions](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template)).


## Codespace

This repository is designed to be opened in a Codespace. PLCC will automatically
be installed within your Codespace as will a PDF viewer and a PlantUML previewer.

## `languages/`

<https://github.com/ourPLCC/languages> is a repository of example langauges
written in PLCC. Many are referenced in the readings and assignments. For
convenience, this repository redistributes these langugaes under the
GPL-3.0-or-later license.

## `readings/`

`slides/` contains a textbook in slide format written by Timothy Fossum,
the creator of PLCC. Source for these files is available at <https://github.com/ourPLCC/course>.

`markdown/` contians files that are intended to replace a couple of the early
chapters in `slides/` and supplement others. Specifically:

* `00-introduction.md` through `06-semenatic-specification.md` replaces
    `slides-0.pdf` and `slides-1.pdf`.
* `07-environments.md` supplements `slides-2.pdf`.
* `V3-LetExp.md` through `V6-Define.md` supplements `slides3.pdf`.

The remaining slides stand on their own. It's also useful to know that
`slides-1a.pdf` is considered the user manual for the PLCC toolset.
So if you are having trouble with the toolkit, start here.

`qna/` contains questions and answers (Q&A). The questions were posed
by students on reading quizzes. I answer all questions in `qna/` and
I'll update it with new questions as they arise. Because of time constraints,
I may not address all questions during class. I will prioritize those questions
that many are struggling with and those that students are expected to
learn. I hope these serve as a good learning aide for students.

`demos/` are code examples I use in class when lecturing on specific topics.

The markdown files contain diagrams written in PlantUML. GitHub will render the
markdown files, but not the PlantUML diagrams. To view the diagrams, open the
repository in Codespaces or locally in a Dev Container. Then open the file
and open it in VS Code's previewer (CTRL+SHIFT+V).
