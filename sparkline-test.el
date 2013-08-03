;;; sparkline-ert.el -- Tests for the spark lines package
;;
;; Copyright (C) 2013 Willem Rein Oudshoorn
;; Created: 3 August 2013
;; Version: 0.1
;;
;; Ths file is not part of GNU Emacs
;; Standard GPL v3 or higher license applies.
;; 
;;
;;; Code:
(require 'ert)
(require 'sparkline)


(ert-deftest sparkline-draw-case ()
  (should (eq :1 (sparkline-draw-case 100 0)))
  (should (eq :4 (sparkline-draw-case -100 0)))
  (should (eq :2 (sparkline-draw-case 0 100)))
  (should (eq :8 (sparkline-draw-case 100 -10)))
  (should (eq :7 (sparkline-draw-case 0 -100)))
  (should (eq :5 (sparkline-draw-case -100 -10)))
  (should (eq :6 (sparkline-draw-case -10 -100)))
  (should (eq :3 (sparkline-draw-case -10 100))))

(defun sparkline-ert-coordinates-to-dir (coordinates)
  (list
   (- (nth 2 coordinates) (nth 0 coordinates))
   (- (nth 3 coordinates) (nth 1 coordinates))))

(ert-deftest sparkline-transform-1 ()
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 100 0 :1)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 -100 0 :4)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 0 100 :2)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 100 -10 :8)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 0 -100 :7)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 -100 -10 :5)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 -10 -100 :6)))))
  (should (eq :1 (apply 'sparkline-draw-case (sparkline-ert-coordinates-to-dir (sparkline-transformed-coordinates 0 0 -10 100 :3))))))

(provide 'sparkline-ert)

;;; sparkline-ert.el ends here
