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
    (import sys)
    (try
      (self.connection.write
        {"code" code
         "op" "eval"})
      (let [result (self.connection.read)]
        (print result :file sys.stderr)
        (print
          (self.connection.read)
          :file sys.stderr)
        (get result "value"))
      (except [BrokenPipeError]
        (print "Connection Lost")
        (exit 1)))))
