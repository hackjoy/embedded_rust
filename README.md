### Embedded Rust

Calls Rust code from within Ruby using Foreign Function Interface (FFI).

The task:

>Start ten threads. Inside each thread, count from one to five million. After All ten threads are finished, print out ‘done!’.

#### Installation

You may need to `gem install ffi` before running the example.

#### Running the example

Run `ruby embed.rb` from the command line and you should see the comparison between Embedded Rust called from within Ruby and a pure Ruby implementation of the above task.

#### Sample result

```
user     system      total        real
Embedded Rust
0.000000   0.000000   0.000000 (  0.000584)

user     system      total        real
Pure Ruby
2.730000   0.000000   2.730000 (  2.732160)
```
