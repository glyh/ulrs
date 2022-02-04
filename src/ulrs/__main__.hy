(import
  fire [Fire]

  ulrs [reader evaluater printer])
(require hyrule *)


(setv lang "Clojure")
(defn run [port [host "localhost"]]
  (let [r (reader.Reader lang)
        e (evaluater.Evaluater host port)
        p (printer.Printer lang)]
    (->> (r.read) e.eval p.print (while True))))

(defmain [#* args]
  (Fire run :name "ulrs"))
