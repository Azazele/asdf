(in-package :asdf)

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; CLISP 2.48 has a bug that makes this test fail.
  ;; The ECL bytecode compiler also fails.
  ;; Work around:
  #+(or clisp ecl)
  (when (and (eq asdf:*compile-file-failure-behaviour* :error)
             #+ecl (equal (compile-file-type) "fasc"))
    (error 'compile-file-error :description "faking it"))
  (warn "Warning."))
