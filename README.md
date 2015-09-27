# disasm-filter

A filter script for disassembling raw machine code using gcc and gdb.

The input stream should match the pattern `(0x[0-9a-f]{2})(, 0x[0-9]{2})*`.

An example of transforming and validating input to be passed through `dis` is given in `dis.el`.
