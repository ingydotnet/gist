gist
====

A command-line tool for creating GitHub Gists from files or stdin.


## Synopsis

```bash
$ gist file1 file2
$ cat file3 | gist
$ cat file4 | gist file5 file6 -
```


## Description

This tool allows you to quickly create GitHub Gists from the command line.
It supports creating gists from files or stdin input.


## Installation

The tool is written in YAMLScript and requires the [YAMLScript runtime](
https://yamlscript.org/install).

To install using the Makefile:

```bash
$ make install PREFIX=/usr/local
```

This will install the `gist` command to `$PREFIX/bin/` and automatically install
YAMLScript if not already present.

Alternatively, you can manually add `/path/to/gist/bin` to your `PATH`
environment variable.


## Usage

The `gist` command takes a list of files and outputs the URL of the created gist
to stdout.

```bash
# Create a gist from a file
$ gist path/to/file.txt
https://gist.github.com/you-sir/db9ad6ebfefd7016a38ef503df4f83e5

# Create a gist from stdin
$ cat file.txt | gist
https://gist.github.com/you-sir/353c4985ea8455aff1d104291338dd9d

# Create a gist from stdin with a file extension (for proper gist formatting)
$ cat file.md | gist -.md
https://gist.github.com/you-sir/88c4bdf058ee5a68d45fd319f8ec55d9

# Create a gist with multiple files (possibly including stdin)
$ cat file.md | gist file1.txt file2.txt -.md
https://gist.github.com/you-sir/a755020d3eac8f82759232bf17b7223c
```


## Authentication

The tool requires a GitHub API token for authentication.
You can provide it in one of these ways:

1. Place your token in `~/.gist-api-token` (default)
2. Set the `GIST_API_TOKEN` environment variable
3. Place your token in a file named by `GIST_API_TOKEN_FILE` variable
4. Enter it interactively when prompted



## Copyright and License

Copyright (c) 2025 — Ingy döt Net

MIT License.
