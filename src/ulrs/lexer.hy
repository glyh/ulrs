(import
  pygments.lexers [lisp jvm]
  inspect)
(setv lisp-lexers
      {"Clojure" jvm.ClojureLexer
       "ClojureScript" jvm.ClojureScriptLexer})
(for [[name obj] (inspect.getmembers lisp)]
  (when (in name lisp.__all__)
    (setv (get lisp-lexers (cut name -5)) obj)))
