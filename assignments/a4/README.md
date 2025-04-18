# A4

## Q1

Eval the following program in each of the following languages.
You may want to run it in each language. Be sure you understand how to
evaluate them manually. You'll need to be able to on an exam.

```
let
    x = 3
    f = proc(x) set x = 4
in {
    .f(x) ;
    x
}
```

a. SET

```
```

b. REF

```
```

c. NAME

```
```

d. NEED

```
```

## Q2

Eval the following program in each of the following languages.
You may want to run it in each language. Be sure you understand how to
evaluate them manually. You'll need to be able to on an exam.

```
let
    x = 3
    f = proc(x) { x ; x ; x }
in {
    .f(set x = sub1(x));
    x
}
```

a. SET

```
```

b. REF

```
```

c. NAME

```
```

d. NEED

```
```


## Q3  (CICO)

The "copy-in, copy-out" parameter passing semantics (also called
"call-by-value-result", "call-by-copy-restore", and "call-by-value-return")
combines the semantics of call-by-value with the ability to side-effect the
actual parameters if they are variables.  Specifically, if an actual parameter
is a variable and if its corresponding formal parameter is changed in the
procedure body (e.g., by a set expression), then the actual parameter value
should be changed to this new value, but only upon return from the procedure
call.  As in call-by-reference, any changes to formal parameters in the
procedure body that are bound to actual parameters (such as literals or other
expressions) that are not variables will have no effect on the calling
environment.  Note that if an actual parameter is a variable, any changes to
its corresponding formal parameter will NOT not have an effect on the actual
parameter variable UNTIL THE PROCEDURE RETURNS, at which point the actual
parameter will be changed to the last value that the formal parameter had.

Here's an example:

```
let
  x = 5
in
  let
    p = proc(t) {set x = add1(x) ; set t = +(t,t)}
  in
    { .p(x) ; x }
```

Using call-by-value semantics (SET), this evaluates to 6.  Using
call-by-reference semantics (REF), this evaluates to 12.  Using copy-in,
copy-out semantics (CICO), this evaluates to 10.

Your CICO directory has the REF implementation. You will only be making
modifications to the code, ref, and val files.  The grammar, prim, and
env files will be unchanged.

In call-by-reference, when an actual parameter is a variable, the corresponding
formal parameter is bound to the same reference as the actual parameter, so
changes to the formal parameter have direct effects on the actual parameter
value.

To implement copy-in, copy-out, we need to de-couple the direct
reference-to-reference relationship between an actual parameter variable and a
formal parameter variable, but we need to be able to copy the formal
parameter's new value into the actual parameter's reference once the procedure
returns.  We can accomplish this by creating a new kind of reference, a
'VarRef', that will have a value part (which will be used in the copy-in part)
and a reference part (which will be used in the copy-out part).  When an actual
parameter is a variable, we will create a VarRef object that contains the value
of the variable and its reference, and bind the formal parameter to this VarRef
object.  Inside the procedure body, values of and changes to the formal
parameter (using deRef and setRef) will apply to the value part of the
reference.  When the procedure returns, we will copy out all of these values to
their corresponding actual parameter references.  For any actual parameter that
isn't a variable, we will use a normal ValRef object with a copy out behavior
that does nothing.

Here's a start for the code for the VarRef class.  You should include this in
your 'ref' file, suitably named and bracketed by '%%%' lines.

```
public class VarRef extends Ref {

    public Val val; // for copy-in
    public Ref ref; // for copy-out

    public VarRef(Ref ref) {
        this.val = ref.deRef(); // local copy
        this.ref = ref;         // where to copy out
    }

    public Val deRef() {
        return val;
    }

    public Val setRef(Val v) {
        return val = v;
    }

    public void copyOut() {
        // FIXME LATER
    }

}
```

In the 'ref' file, you should add the following method to the Ref abstract
class:

```
public void copyOut() {
}
```

In the Ref class, this (empty) definition defaults to doing nothing when it is
called. In particular, this applies to instances of the ValRef derived class.

Now let's fix the 'code' file so that variable actual parameters will be
handled correctly according to the copy-in, copy-out methodology.  First,
observe that the evalRef() methods for expressions are used exclusively for
passing actual parameter expressions to their corresponding formal parameters
during procedure application.  Specifically, the default evalRef() method in
the REF language looks like this, as defined in the Exp abstract class:

```
public Ref evalRef(Env env) {
    return new ValRef(eval(env));
}
```

However, in the REF language, the evalRef() method for a VarExp
looks different:

```
public Ref evalRef(Env env) {
    return env.applyEnvRef(var);
}
```

This is exactly what makes call-by-reference work.  We need to CHANGE THIS in
the VarExp code for the CICO language so that it will return a suitably
instantiated VarRef instead.  Here is the code.  Notice that instead of
returning a reference to the variable, we return a 'VarRef' object based on
that reference:

```
public Ref evalRef(Env env) {
    return new VarRef(env.applyEnvRef(var));
}
```

You should be able to compile and run your modified language now, observing
that the result has call-by-value semantics.  (Try is using the above example
expression -- the value returned will be 6.) So haven't we gone a bit
backwards??

What we need to fix next is the behavior of the apply() method in the ProcVal
class in the val file.  Here the changes are straight-forward.  Currently the
last line of the apply() method in this class appears as follows:

```
return body.eval(nenv);
```

Instead of returning this value directly, we want to save this value, then copy
out all of the VarRefs to their corresponding actual parameter variables (this
is the "copy-out" part), and finally return the saved value.  Here's a start,
replacing the above 'return' statement:

```
Val val = body.eval(nenv);
// FIXME: copyOut all of the references
return val;
```

You are to replace the FIXME part with code that will  march through the
references in refList and call the copyOut() method on each of them.  For all
of the references that ARE NOT bound to variables that are actual parameters --
these are instances of ValRef -- the default (do-nothing) copyOut() method will
be called.  For the references that ARE bound to variables that are actual
parameters -- these are instances of VarRef -- the copyOut() method in the
VarRef class will be used.

You now can compile and run your program with the above example, but you will
STILL get the value 6.  That's because you haven't actually implemented the
copyOut() method in the VarRef class.  Go back to the 'ref' file and make the
appropriate change to the copyOut() method in the VarRef class.  It's a
one-liner: simply set the reference (saved in the ref instance variable) to the
value (what's in the val instance variable).

Your program should now properly evaluate the example expression above to 10.

