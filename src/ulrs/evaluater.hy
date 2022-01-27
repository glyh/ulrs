(import nrepl)
(defclass Evaluater []
  (defn __init__ [self host port]
    (setv self.host host
          self.port port)
    (try
      (setv self.connection (nrepl.connect f"nrepl://{host}:{port}"))
      (except [ConnectionRefusedError]
        (print "Failed to connect to nREPL server")
        (exit 1))))
  (defn eval [self code]
    (try
      (self.connection.write
        {"op" "eval"
         "code" code})
      (let [result (self.connection.read)]
        (self.connection.read)
        (get result "value"))
      (except [BrokenPipeError]
        (print "Connection Lost")
        (exit 1)))))
