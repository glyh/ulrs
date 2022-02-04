(import
  prompt-toolkit [PromptSession]
  prompt-toolkit.lexers [PygmentsLexer]
  prompt-toolkit.auto-suggest [AutoSuggestFromHistory]
  prompt-toolkit.completion [Completer Completion]

  ulrs.lexer [lisp-lexers]
  ulrs.ui [bottom-toolbar])

(defclass Reader []
  (defn __init__ [self language]
    (setv self.session (PromptSession)
          self.lexer (PygmentsLexer (get lisp-lexers language))
          self.suggest (AutoSuggestFromHistory)))
  (defn read [self]
    (while True
      (try
        (return
          (self.session.prompt
           "> "
           :lexer self.lexer
           :bottom-toolbar bottom-toolbar
           :mouse_support True
           :auto_suggest self.suggest))
       (except [KeyboardInterrupt]
         (continue))
       (except [EOFError]
         (exit 0))))))
