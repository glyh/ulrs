(import
  reader
  evaluater
  printer)
(require hyrule *)


(setv lang "Clojure")
(defn run [port [host "localhost"]]
  (let [r (reader.Reader lang)
        e (evaluater.Evaluater host port)
        p (printer.Printer lang)]
    (while True
      (-> (r.read) e.eval p.print))))

(when (= __name__ "__main__") ;; For easier testing
  (import fire)
  (fire.Fire run))
