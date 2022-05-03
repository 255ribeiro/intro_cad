(defun c:alcm (/ po1 po2 pd1 pd2 ssvar )

 
 (setq ssvar (ssget))
 (setq po1 (getpoint "\nponto base 1:"))
 (setq po2 (getpoint "\nponto base 2:"))



 (setq pd1 (getpoint "\n Ponto destino 1:"))
 (setq pd2 (getpoint "\n Ponto destino 2:"))
 (while (/= nil pd1)
	(command "_copy" ssvar "" po1 po1 )
	(command "_align" ssvar "" po1 pd1 po2 pd2 "" "")
	(setq po1 pd1)
	(setq po2 pd2)
	(setq pd1 (getpoint "\n Ponto destino 1:"))
 	(setq pd2 (getpoint "\n Ponto destino 2:"))
	
 )
)		









