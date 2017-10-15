IO Tester
=========

[![Build status](https://travis-ci.org/Vovan-VE/iotester.svg)](https://travis-ci.org/Vovan-VE/iotester)

Basic idea of tests as same as in [Tush][]. This project uses a different
format for test files and it is designed to test only one program run by each
test file.

So, here is example test file to test `cat` without arguments:

```
---- IN ----
lorem ipsum
dolor
---- OUT ----
lorem ipsum
dolor
```

Each test file contains `IN` section to pass to stdin, `OUT` section with
expected output to stdout, optional `ERR` section with expected output to stderr
and `EXIT` section for expected failure status.

Test files must be named `*.t` and placed somewhere under directories provided
by config.


Running tests
-------------

Create config file:

```
tests/unit    command arguments
```

**Note:** relative paths in config file are relative to the directory where
config is.

Run:

```sh
# use default config
$ iotester

# specify custom config path
$ iotester -c iotester.conf
```


Updating test files
-------------------

```sh
$ iotester -u
```


Test file format
----------------

File contains up to 4 sections: `IN`, `OUT`, `ERR` and `EXIT` in the order.
Sections cannot be duplicated in the file.

Section head line is `left-decor NAME right-decor` on separate line. Here `NAME`
is one of sections names above case sensitive. Spaces around the `NAME` are
optional. Both `left-decor` and `right-decor` must be any non-empty string of
any characters other then letters, digits and whitespaces.

First line in the file must match to `IN` section head line and can use any
decorators. I prefer `----IN----`, but you may use anything you want (for
example `====< IN >====`).

Other section heads **must** use exactly the same decorators with same
whitespaces arount the `NAME` as `IN` section uses.

All lines other than section head forms content for the section which they goes
under.

Section `IN` is required even in case of empty input.

Section `OUT` is required to pass the test even in case of empty output.

Section `ERR` is required to pass the test, but is must absent in case of empty
stderr.

Section `EXIT` is required to pass the test for failure. It must absent for test
with success status.

Example to test success status:

```
----IN----
Input content
 to pass
  to stdin
 to the program
which is testing.
----OUT----
Expected output
from the program
```

Example to test failure status:

```
----IN----
Some bad input
which will cause the program
to fail
----OUT----
Some normal expected output if any before the failure happend
----ERR----
Expected output to stderr
----EXIT----
2
```

See also [test files](./tests/) as examples. This project is testing by itself.


License
-------

This project is under [MIT License][mit].


[mit]: https://opensource.org/licenses/MIT
[Tush]: https://github.com/darius/tush
