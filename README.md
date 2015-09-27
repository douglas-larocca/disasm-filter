# disasm-filter

A filter script for disassembling ascii-encoded x86-64 machine code using gcc and gdb.
The original motivation arose in the context of working with JIT compilers, where
opcodes appear in code (static arrays of `char` bytes).

The input stream should match the pattern `^(0x[0-9a-f]{2})(, 0x[0-9]{2})*$`.

```
$ dis <<EOF
\ 0x48, 0x01, 0xf8
\ EOF
            40 01 f8        add     rax,rdi
$
```

The function `dis` in `dis.el` sends the selected region to `dis`.
