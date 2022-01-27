(import
  pygments
  pygments.lexers [lisp]
  prompt-toolkit.formatted-text [PygmentsTokens]
  prompt-toolkit [print-formatted-text]

  ulrs.lexer [lisp-lexers])
(defclass Printer []
  (defn __init__ [self language]
    (setv self.lexer ((get lisp-lexers language))))
  (defn print [self output]
    (let [tokens (list (pygments.lex output :lexer self.lexer))]
      (print-formatted-text (PygmentsTokens tokens) :end ""))))
