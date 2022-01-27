(import
  prompt-toolkit [PromptSession]
  prompt-toolkit.lexers [PygmentsLexer]
  prompt_toolkit.auto_suggest [AutoSuggestFromHistory]

  ulrs.lexer [lisp-lexers]
  ulrs.ui [bottom-toolbar])
(defclass Reader []
  (defn __init__ [self language]
    (setv self.session (PromptSession)
          self.lexer (PygmentsLexer (get lisp-lexers language))
          self.suggest (AutoSuggestFromHistory)))
  (defn read [self]
    (try
      (self.session.prompt
       "> "
       :lexer self.lexer
       :bottom-toolbar bottom-toolbar
       :mouse_support True
       :auto_suggest self.suggest)
      (except [EOFError]
        (exit 0)))))
