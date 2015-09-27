(require 's)

(defun dis (start end)
  "disassembles regions of raw bytes (x86/x86-64)

This uses a bash script to send a region of bytes to gcc
 to generate an object file which is then passed through gdb.

Here we capture the output and insert it in the buffer."
  (interactive "r")
  (let* ((opc (buffer-substring-no-properties start end))
         (cmd (s-with opc
                s-collapse-whitespace
                s-trim
                (s-split " ")
                (mapcar '(lambda (s)
                           (s-with s
                             (s-chop-prefix "0x")
                             (s-chop-suffix ","))))
                (s-join ", 0x")                
                (s-prepend "0x")))
         (result (shell-command-to-string (s-wrap cmd
                                                  "echo '" "' | dis"))))
    (save-excursion
      (end-of-line)
      (insert "\n/*\n")
      (insert (s-wrap cmd "char opc[] = {\n" "\n};\n"))
      (insert result)
      (insert "*/\n"))))
