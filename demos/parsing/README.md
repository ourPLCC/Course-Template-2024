# Parsing in PLCC

Here we will learn to use PLCC's command-line tools to compile and run
the parser for a given grammar. To get started, do the in GitPod's
terminal.

```bash
cd "$GITPOD_REPO_ROOT"      # reposition to the root of your repo
begin parsing               # copy the parsing activity
cd parsing                  # reposition to the parsing directory
```


`grammar` contains a small grammar for an overly simplified
English sentence. Feel free to inspect its contents. To generate a parser
for this grammar, run plccmk on the file. You should see something like
the following.

```bash
$ plccmk -c grammar
Nonterminals (* indicates start symbol):
  <noun>
 *<sentence>
  <subject>
  <verb>

Abstract classes:

Java source files created:
  Noun.java
  Sentence.java
  Subject.java
  Verb.java
```

Note the classes that PLCC generated and the start symbol. Also take
a look at the contents of `Java/`. Notice that (among others) PLCC
also generated Scan.java. Scan.java contains the scanner as before.
Let's test our scanner as we did in the previous activity. There is a
`program` file that we can use to test it.

```
$ scan < program
   1: WORD 'this'
   1: WORD 'is'
   1: WORD 'an'
   1: PERIOD '.'
```

Looking again in `Java/` we also find Parse.java. This contains the parser.
Let's run it on the same file. This time we use PLCC's parse command.

```
$ parse < program
--> OK
-->
```

By default, when ran directly, the parser tells us if the file contains
a valid "program" based on the grammar.

1. In a file named `test2.sentence`, write an invalid "program" and run
    the parser on it. Note the error it reports.

By passing `-t` to the parse command, we can get it to print a trace
of its parsing process. Let's also pass `-n` to get rid of the `-->`
that it produces.

```
$ parse -t -n < program
   1: <sentence>
   1: | <subject>
   1: | | <noun>
   1: | | | WORD "this"
   1: | <verb>
   1: | | WORD "is"
   1: | <noun>
   1: | | WORD "an"
   1: | PERIOD "."
OK
```

Notice that this trace has the same structure as the parse tree that the
parser generates. In fact, that's why a parse tree is called a parse tree.
Printing the parser's trace can be useful when debugging a BNF grammar
or when implementing semantics.
