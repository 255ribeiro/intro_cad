# Rodando scripts

[exemplos de scripts](./sample_scripts.zip)



### Exemplos simples de Autolisp

#### quick_align.lsp

```lisp
; type qal to run Quick align
(defun c:qal (/ po1 po2 pd1 pd2 ssvar )

 ; select opjects
 (setq ssvar (ssget))
 ; base point 1
 (setq po1 (getpoint "\nponto base 1:"))
 ; base point 2
 (setq po2 (getpoint "\nponto base 2:"))
 ; destination point 1
 (setq pd1 (getpoint "\n Ponto destino 1:"))
 ; destination point 2
 (setq pd2 (getpoint "\n Ponto destino 2:"))
 ; while loop
 (while (/= nil pd1)
	(command "_copy" ssvar "" po1 po1 )
	(command "_align" ssvar "" po1 pd1 po2 pd2 "" "")
	(setq po1 pd1)
	(setq po2 pd2)
	(setq pd1 (getpoint "\n Ponto destino 1:"))
 	(setq pd2 (getpoint "\n Ponto destino 2:"))
; end while loop	
 )
; end function
)	 


```

#### quick_rotate.lsp


```lisp
; type qal to run Quick align


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


```