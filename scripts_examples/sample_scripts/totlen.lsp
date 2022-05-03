; TOTLEN.LSP    c.2000  Rob Herr    robherr@hotmail.com
; 'Add selected lines, plines, splines, and arcs for total length'
; v 1.0    10 Feb 2000
; 
;  ___________________________________________________________________
;  |     PERMISSION HEREBY GRANTED BLA, BLA, BLA, TO MODIFY ETC.     |
;  |   As long as name and email remain with the original program    |
;  | unaltered. However I would like to know of any bugs or problems |
;  |   that arise with the actual program. And of course I take no   |
;  |  responsibility for lost limbs, auto repair bills, mechanical   |
;  |         or electronic difficulties, or snake venom.             |
;  -------------------------------------------------------------------

(defun tlines ()
  (setq lbeg (cdr (assoc '10 ent)))
  (setq lend (cdr (assoc '11 ent)))
  (setq llen (distance lbeg lend))
  (setq tlen (+ tlen llen))
  (ssdel sn ss1)
)

(defun tarcs ()
 (setq cen (cdr (assoc '10 ent)))
 (setq rad (cdr (assoc '40 ent)))
 (setq dia (* rad 2.0))
 (setq circ (* (* rad pi) 2.0))
 (setq sang (cdr (assoc '50 ent)))
 (setq eang (cdr (assoc '51 ent)))
 (if (< eang sang)
  (setq eang (+ eang (* pi 2.0)))
 )
 (setq tang (- eang sang))
 (setq tang2 (* (/ tang pi) 180.0))
 (setq circ2 (/ tang2 360.0))
 (setq alen (* circ2 circ))
 (setq tlen (+ tlen alen))
 (princ)
 (ssdel sn ss1)
)

(defun tplines ()
 (command "area" "e" sn)
 (setq tlen (+ tlen (getvar "perimeter")))
 (ssdel sn ss1)
)

(defun tsplines ()
 (command "area" "e" sn)
 (setq tlen (+ tlen (getvar "perimeter")))
 (ssdel sn ss1)
)

(DEFUN C:TOTLEN (/ tlen ss1 sn sn2 et)
 (setq cmdecho (getvar "cmdecho"))
 (setvar "cmdecho" 0)
 (setq tlen 0)  
 (prompt "\nSelect only those entities you want for total length: ")
 (setq ss1 (ssget))
 (while (> (sslength ss1) 0)
  (setq sn (ssname ss1 0))
  (setq ent (entget sn))
  (setq et (cdr (assoc '0 ent)))
  (cond
   ((= et "LINE") (tlines))
   ((= et "ARC") (tarcs))
   ((= et "LWPOLYLINE") (tplines))
   ((= et "POLYLINE") (tplines))
   ((= et "SPLINE") (tsplines))
   ((or
     (/= et "LINE")
     (/= et "ARC")
     (/= et "LWPOLYLINE")
     (/= et "POLYLINE")
     (/= et "SPLINE")
    )
    (ssdel sn ss1)
   )
  )
 )
 (alert (strcat "\nThe Total Length of Selected Lines, Polylines, and Arcs is: " (rtos tlen 2 2)))
 (setvar "cmdecho" cmdecho)
 (prompt "\nBy Rob Herr   robherr@hotmail.com  ")
 (princ)
)
