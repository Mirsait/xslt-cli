# mirsait/xslt-cli

Transformation XML with XSL to HTML

+ XSLT 1.0

## Installation

Download from https://github.com/mirsait/xslt-cli

```bash
$ git clone https://github.com/mirsait/xslt-cli
$ cd xslt-cli
```

## Usage

Run the project directly, via `:main-opts` (`-m mirsait.xslt-cli`):

```bash
$ clojure -M:run-m file.xml file.xls file.html
```

Run the project's tests (they'll fail until you edit them):

```bash
$ clojure -T:build test
```

Run the project's CI pipeline and build an uberjar (this will fail until you edit the tests to pass):

    $ clojure -T:build ci

This will produce an updated `pom.xml` file with synchronized dependencies inside the `META-INF`
directory inside `target/classes` and the uberjar in `target`. You can update the version (and SCM tag)
information in generated `pom.xml` by updating `build.clj`.

If you don't want the `pom.xml` file in your project, you can remove it. The `ci` task will
still generate a minimal `pom.xml` as part of the `uber` task, unless you remove `version`
from `build.clj`.

Run that uberjar:

```bash
$ java -jar target/net.clojars.mirsait/xslt-cli-0.1.0-SNAPSHOT.jar file.xml file.xsl file.html
```

## Examples

Run uberjar:

```bash
$ clojure -T:build ci
$ java -jar target/net.clojars.mirsait/xslt-cli-0.1.0-SNAPSHOT.jar examples/book.xml examples/book.xsl examples/book.html
```

or using a shell-script `transform.sh` in examples directory:

```bash
$ clojure -T:build ci
$ cd examples
$ ./transform.sh book
```
> The script will create the output folder using files XML and XSL and place the HTML-result in it.
> The names of all three files are the same. In this case, book.xml, book.xsl and output/book.html.

...

### Bugs

...

## License

Copyright © 2025 Mirsait

Distributed under MIT license.
