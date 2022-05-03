; quick rotate
; type qr to run the file
(defun c:qr (/ PC P1 P2 ssvar ssal)


 (setq ssvar (ssget))
 (setq PC (getpoint "\nPonto central:"))
 (setq P1 (getpoint "\nponto de origem:"))



 (setq P2 (getpoint "\n Ponto destino:"))

 (while (/= nil P2)
	
	(Command "_rotate" ssvar "" pc "_copy" "_reference" pc p1 p2)
	
	(setq P2 (getpoint "\n Ponto destino:"))
 )
)		









