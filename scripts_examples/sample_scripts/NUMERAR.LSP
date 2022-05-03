;============================================================================
;  COMANDO (NUMERAR)
;  Rotina para colocacao de numeros no desenho
;============================================================================
;
(defun c:NUM (/ H NI P1)
(setq H (getreal "\nAltura da letra:"))
(setq NI (getint "\nNumero inicial <1>: "))
(if (= NI nil) (setq NI 1))
(setq P1 T)
(while (/= nil P1)
  (setq P1 (getpoint "\nPonto de Insercao:"))
  (if (= P1 nil)
      (prompt "\n ")
      (progn
	   (command "text" P1 H "0" NI)
	   (setq NI (+ NI 1))
	   )
      )
  )
  )

(defun c:NUMA (/ NI P1)
(setq NI (getint "\nNumero inicial <1>: "))
(if (= NI nil) (setq NI 1))
(setq P1 T)
(while (/= nil P1)
  (setq P1 (getpoint "\nPonto de Insercao:"))
  (if (= P1 nil)
      (prompt "\n ")
      (progn
	   (command "text" P1 "0" NI)
	   (setq NI (+ NI 1))
	   )
      )
  )
  )
