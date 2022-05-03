; Inquiry commands
; Written by Joshua M Orth. February 2000

; Determines the angle between two lines
(defun c:ANGLINE   (/
                           a
                           b
                           c
                           ang
                           pt1
                           pt2
                           pt3
                           pt4
                           line1
                           line2
                           line1_DXF
                           line2_DXF
                           int1

                           acos
                           getline
                           correct
                        )
   (defun acos (x)
      (cond
         ((equal x 1.0 0.000001)
            0.0
         )
         ((equal x -1.0 0.000001)
            pi
         )
         ((< (abs x) 1.0)
            (- (/ pi 2.0) (atan (/ x (sqrt (- 1.0 (* x x))))))
         )
         (1
            (princ "\nerror (abs x) > 1.0") 
            nil
         )
      )
   )

   ;get line
   ;given:
   ; prompt message
   ;
   ;prompt user to pick line and do error check to make sure a line was picked
   ;
   (defun getline (  msg
                     /
                     e
                  )
      (while (not e)
         (setq e (entsel msg))
         (cond
            ((not e)
               (princ "\nWARNING(C:ANGLINE): no entity selected, try again") 
            )
            ((/= "LINE" (cdr (assoc 0 (entget (car e)))))
               (princ "\nWARNING(C:ANGLINE): entity selected not a LINE, try again") 
               (setq e nil)
            )
         )
      )
      e
   )

   ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ;objective:
   ; given return from entsel of a line, make sure that point is on the
   ; line.
   ;
   ;given:
   ; return from successful entsel
   ;
   ;return:
   ; entsel with pick point on the line entity
   ; NOTE: corrected point is 2D only
   (defun correct (  data     ;entsel of line
                     /
                     p1       ;1st point used to determine line equation for pipe
                     p2       ;2nd point used  ""       ""        ""
                     tmp
                     dy       ;delta y from point 1 to 2
                     dx       ;delta x from point 1 to 2
                     xi       ;x coordinate of intercept point
                     yi       ;y coordinate of intercept point
                     m1       ;slope of pipe line
                     m2       ;slope of line perp to pipe
                     b1       ;y intercept of pipe line
                     b2       ;y intercept of perp line to pipe
                     dxf      ;dxf codes
                     pick     ;original point from entsel
                  )
      (setq dxf (entget (car data))
            pick (mapcar '+ '(0.0 0.0) (trans (cadr data) 1 0))
            p1  (mapcar '+ '(0.0 0.0) (cdr (assoc 10 dxf)))
            p2  (mapcar '+ '(0.0 0.0) (cdr (assoc 11 dxf)))
      )

      ;sort line end points left to right
      ;
      (if (< (car p2) (car p1))
         (setq tmp p1
               p1 p2
               p2 tmp
         )
      )
      (cond
         ;is this a horizontal line?
         ;
         ((equal (setq dy (- (cadr p2) (cadr p1))) 0.0 0.01)
            (setq xi (car pick)
                  yi (cadr p1)
            )
         )
         ;is this a vertical line?
         ;
         ((equal (setq dx (- (car p2) (car p1))) 0.0 0.01)
            (setq xi (car p1)
                  yi (cadr pick)
            )
         )
         (1
            (setq m1 (/ dy dx)
                  m2 (- (/ 1.0 m1))
                  b1 (- (cadr p1) (* m1 (car p1)))
                  b2 (- (cadr pick) (* m2 (car pick)))
                  xi (/ (- b2 b1) (- m1 m2))
                  yi (+ (* m1 xi) b1)
            )
         )
      )
      (list (car data) (list xi yi))
   )
   ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (setvar "osmode" 512)
   (setq line1 (correct (getline "\nSelect first line: "))  
         line2 (correct (getline "\nSelect second line: "))  
   )
   (if (not (equal (car line1) (car line2)))
      (progn
         (setq line1_DXF (entget (car line1))
               line2_DXF (entget (car line2))
               pt1 (mapcar '+ '(0.0 0.0) (cdr (assoc 10 line1_DXF)))
               pt2 (mapcar '+ '(0.0 0.0) (cdr (assoc 11 line1_DXF)))
               pt3 (mapcar '+ '(0.0 0.0) (cdr (assoc 10 line2_DXF)))
               pt4 (mapcar '+ '(0.0 0.0) (cdr (assoc 11 line2_DXF)))
               int1 (inters pt1 pt2 pt3 pt4 nil)
         )
;(break "About to calc angle ")
         (if int1
            (progn
               (setq a  (distance (mapcar '+ '(0.0 0.0) (cadr line1)) int1)
                     b  (distance (mapcar '+ '(0.0 0.0) (cadr line2)) int1)
                     c  (distance (mapcar '+ '(0.0 0.0) (cadr line1))
                                  (mapcar '+ '(0.0 0.0) (cadr line2))
                        )
               )
               (if (setq ang (acos (/ (- (+ (* a a) (* b b)) (* c c)) (* 2.0 a b))))
                  (progn
                     (princ "\nAngle = ") 
                     (princ (angtos ang
                                    (cond
                                       ((= 2 (getvar "aunits"))   ;rads
                                          2
                                       )
                                       ((= 3 (getvar "aunits"))   ;grads
                                          3
                                       )
                                       (1                         ;degress
                                          0
                                       )
                                    )
                                    (getvar "auprec")
                           )
                     )
                  )
               )
            )
            (princ "\nLines do not intersect.") 
         )
      )
   )
   (princ)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Calculates a running distance
(defun C:RUNDIST (/ totdis num flag pt1 nextpt newdis)
   (graphscr)
   (initget 1)
   (setq totdis 0
         num 0
         flag 1
         pt1 (getpoint "\nStarting point: ") 
   )
   (while flag
      (setq nextpt (getpoint pt1 "\nNext point: "))  
      (if (/= (type nextpt) 'LIST)
         (setq flag nil)                ; STOP
         (setq flag 1)                  ;continuation point
      )
      (if flag
         (progn
            (grdraw (list (car pt1) (cadr pt1)) (list (car nextpt)
                                                      (cadr nextpt)
                                                ) -1 1
            )
            (setq newdis (distance pt1 nextpt)
                  totdis (+ newdis totdis)
                  num (1+ num)
                  pt1 nextpt
            )
            (princ "\nCurrent Distance is ")
            (princ (rtos totdis))
         )                           ;end progn
      )                              ;end if
   )                                 ; END flag WHILE
   (princ "\nTotal Distance is ")  
   (princ (rtos totdis))
   (princ " along ")  
   (princ num)
   (princ " segments.")
   (princ)  
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; SUMLAY program, modified by Joshua M Orth. February 2000

; What's going on?
; Spin.lsp by Jason Osgood from Cadalyst magazine 3/90


(defun spin ()
   (setq spin_global  (if (= (type spin_global) 'INT)
                              spin_global 
                              4
                           )
   )
   (princ
      (cond
         ((= (rem (setq spin_global (1+ spin_global)) 4) 0)
            "\010|"
         )
         ((= (rem spin_global 4) 1) 
            "\010/"
         )
         ((= (rem spin_global 4) 2) 
            "\010-"
         )
         ((= (rem spin_global 4) 3) 
            "\010\\"
         )
      )
   )
)
(if debug
   (progn
      (princ "\nLoaded: SPIN.LSP $Revision: 2 $")
      (PRINC)
   )
   (princ)
)





(defun C:SUMLAY ( / l what suml sump en

                  sumln
                  sumpln
                )



   (defun sumln ( / count ss1 e sxy exy)
      (setq suml 0.0)
      (if (=(type l)'STR)
         (progn
            (setq ss1 (ssget "_X" (list (cons 0 "LINE") (cons 8 l)))
                  count 0
            )
            (if ss1
               (progn
                  (princ "\n")(princ(sslength ss1))(princ " lines found") 
                  (princ "\nPlease be patient, I'm Working ") 
                  (repeat (sslength ss1)
                     (setq e (entget (ssname ss1 count))
                           sxy (cdr (assoc 10 e))
                           exy (cdr (assoc 11 e))
                           suml (+ suml (distance sxy exy))
                           count (1+ count)
                     )
                     (spin)
                  )
               )
               (princ (strcat "\nOUCH: No lines found on layer " l)) 
            )
         )
      )
   )

   (defun sumpln ( / count ss1)
      (setq sump 0.0)
      (if (=(type l)'STR)
         (progn
            (setq ss1   (ssget "_X" (list (cons -4 "<or")
                                             (cons 0 "LWPOLYLINE")
                                             (cons -4 "<and")
                                                (cons 0 "POLYLINE")
                                                (cons 8 l)
                                                (cons -4 "<not")
                                                   (cons -4 "&") (cons 70 (+ 16 32 64))
                                                (cons -4 "not>")
                                             (cons -4 "and>")
                                          (cons -4 "or>")
                                    )
                        )
                  count 0
            )
            (setvar "cmdecho" 0)
            (if ss1
               (progn
                  (princ "\n")(princ(sslength ss1))(princ " polylines found") 
                  (princ "\nWorking  ") 
                  (repeat (sslength ss1)
                     (command "_.area" "_E" (ssname ss1 count))
                     (setq sump (+ sump (getvar "perimeter"))
                           count (1+ count)
                     )
                  )
               )
               (princ (strcat "\nWARNING: No polylines found on layer " l)) 
            )
         )
      )
   )

   

   (while (not (setq en (entsel "\nSelect entity on layer to be processed: ")))) 
   (setq l (cdr (assoc 8 (entget (car en)))))

   (initget "Lines Plines Both") 
   (setq what (getkword (strcat "\nTotal: Lines/Plines/Both <Both> : "))) 
   (if (not what)
      (setq what "Both") 
   )

   (cond
      ((= what "Lines") 
         (sumln)
         (princ (strcat "\nTOTAL OF LINES: " (rtos suml)))
         (princ) 
      )
      ((= what "Plines") 
         (sumpln)
         (princ (strcat "\nTOTAL OF POLYLINES: " (rtos sump)))
	 (princ)
      )
      ((= what "Both") 
         (sumln)
         (sumpln)
         (princ (strcat "\nTOTAL OF LINES: " (rtos suml))) 
         (princ (strcat "\nTOTAL OF POLYLINES: "(rtos sump))) 
         (princ (strcat "\nTOTAL OF BOTH LINES AND POLYLINES: " (rtos (+ suml sump))))
         (princ)  
      )
   )
   (terpri)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sumlay will return the total distance of polylines and/or line on a given layer
(defun C:SUMAREA   (/
                           layn
                           ssarea
                           count
                           en
                           totarea
                        )
   (setvar "CMDECHO" 0)
   (while (not (setq en (entsel "\nSelect an object on layer to sum area: "))))  
   (setq layn (cdr (assoc 8 (entget (car en)))))
   (princ (strcat "\nLayer selected is " layn)) 
   (setq ssarea (ssget "_X" (list 
                              (cons -4 "<or")
                                 (cons 0 "LWPOLYLINE")
                                 (cons -4 "<and")
                                    (cons 0 "POLYLINE")
                                    (cons 8 layn)
                                    (cons -4 "&")
                                    (cons 70 (+ 1 2 4 128))
                                 (cons -4 "and>")
                              (cons -4 "or>"))))
   (if ssarea
      (progn
         (setq count 0
               totarea 0.0
         )
         (princ "\n")(princ (sslength ssarea))(princ " closed polylines found") 
         (princ "\nWorking please wait ...  ")  
         (repeat (sslength ssarea)
            (command "_.area" "_E" (ssname ssarea count))
            (setq totarea  (+ totarea (getvar "AREA"))
                  count (1+ count)
            )
         )
         (princ "Total area is: ") 
         (if (or (=(getvar"lunits")3) (=(getvar"lunits")4))
            (progn
               (princ (/ totarea 144.0))
               (princ " Sq.Ft.")
            )
            (princ totarea)
         )
      )
      (princ "\nError: No closed polyline entities found. But have a nice day anyway!") 
   )
   (princ)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sumlines returns the total distance of selected polylines and lines
(defun C:SUMLINES (/ p l e sxy exy sum)
   (setq p  (ssget   (list (cons -4 "<or")
                              (cons 0 "LINE")
                              (cons 0 "LWPOLYLINE")
                              (cons -4 "<and")
                                 (cons 0 "POLYLINE")
                                 (cons -4 "<not")
                                    (cons -4 "&") (cons 70 (+ 16 32 64))
                                 (cons -4 "not>")
                              (cons -4 "and>")
                           (cons -4 "or>")
                     )
            )
         sum 0.0
   )
   ;check for null selection set
   (if p
      (progn
         (setq l 0)
         (repeat (sslength p)
            (cond
               ((= "LINE" (cdr (assoc 0 (setq e (entget (ssname p l))))))
                  (setq sxy (cdr (assoc 10 e))
                        exy (cdr (assoc 11 e))
                        sum (+ sum (distance sxy exy))
                  )
                  (princ "\nSum is now: ") 
                  (princ (rtos sum))
                  (terpri)
               )
               ((= "LWPOLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum (+ sum (getvar "perimeter")))
                  (princ "\nSum is now: ") 
                  (princ (rtos sum))
                  (terpri)
               )
               ((= "POLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum (+ sum (getvar "perimeter")))
                  (princ "\nSum is now: ") 
                  (princ (rtos sum))
                  (terpri)
               )
            )
            (setq l (1+ l))
         )
         (princ "\nTOTAL: ")
         (princ (rtos sum))
      )
      (princ "\nOH BOY, I HATE TO TELL YOU THIS, BUT: No polylines or lines selected") 
   )
   (princ)
)