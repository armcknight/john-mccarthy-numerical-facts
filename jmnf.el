;;; Originally from http://www-formal.stanford.edu/jmc/facts.txt

;;; This file was made for my own (John McCarthy, jmc@cs.stanford.edu)
;;; use, and I wasn't thinking of other people when I did it.
;;; Therefore, some of its feature may be obscure.  It contains a lot
;;; of units conversions and also astronomical facts that I needed for
;;; some research on moving Mars to a more temperate location.  I
;;; would not be surprised if there aren't better programs out there.
;;; It has two advantages.  (1) It is entirely transparent if you know
;;; Lisp.  (2) It can be used within either the Xemacs or the FSF
;;; Emacs editors or can be loaded into Common Lisp.

;;; To use this file in a Emacs, rename it to facts.el and load it
;;; with the command (load "...facts.el"), where ... stood for what ever
;;; prefix you may need for the directory you put it in.  Then run the
;;; defun command and then the facts command.  After that it is just Emacs
;;; Lisp.  I attached a couple F keys to evaluating and printing
;;; Lisp expressions.


(defun facts (&optional units)
  "Miscellaneous numerical facts for use in elisp programs.
Units default to mks unless other units, cgs, english or DU
are given as an argument."
  (interactive)
  (setq units1 (or units 'mks))
  (setq float-output-format "%.3e")
  (setq pi (* 2.0 (asin 1.0)))
  (setq degree (/ pi 180.0))
  (setq kg (cond ((eq units1 'mks) 1.0)
                 ((eq units1 'cgs) 1000.0)
                 ((eq units1 'english) 2.2)))
  (setq kg* kg)
  (setq g (* 0.001 kg))
  (setq sec 1.0)
  (setq minute (* sec 60.0))
  (setq hour (* sec 3600.0))
  (setq day (* 86400.0 sec))
  (setq year (* 365.2425 day))    ; calendar year
  (setq day* 1.0)
  (setq m (cond ((eq units1 'mks) 1.0)
                ((eq units1 'cgs) 100.0)
                ((eq units1 'english) (/ 1.0 0.3048))))
  (setq km (* m 1000.0))
  (setq cm (* m 0.01))
  (setq foot (* 0.3048 m))
  (setq ft (* 0.3048 m))
  (setq mile (* 5280 foot))
  (setq mph (/ mile hour))
  (setq J (* 1.0 kg (expt m 2) (expt sec -2)))
  (setq joule J)
  (setq erg (* joule 1.0e-7))
  (setq calorie (* 4.184 joule))
  (setq degreek 1.0)
  (setq kwh (* 3.6e6 J))
  (setq watt (/ J sec))
  (setq cc (expt cm 3))
  (setq gpcc (* 1000.0 (/ kg (expt m 3))))
  (setq gpcc* 1.0)        ; alternatively (setq gpcc* gpcc)
  (setq c (* 2.99792458e8 (/ m sec)))    ;  m/sec  velocity of light
  (setq G 6.67259e-11)    ;  m^3kg^(-1)s^(-2) gravitational constant
  (setq avogadro 6.0221367e23)  ; Avogadro number
  (setq planck (* 6.6260755e-34 J sec))   ; Js Planck's constant
  (setq k (* 1.38e-16 erg (/ 1 degreek)))  ; Boltzmann' constant
  (setq hbar (/ planck (* 2 pi)))      ; h/2pi
  (setq emass (* 9.1093897e-31 kg))    ; kg mass of electron
  (setq pmass (* 1.6726231e-27 kg))    ; kg mass of proton
  (setq coulomb 1.0)
  (setq e (* 1.60217733e-19 coulomb))       ; C charge of electron
  (setq eV (* 1.60217733e-19 J))      ; J electron volt  (non-SI unit)

  (setq au (* 1.4959965e11 m)) ;  m     astronomical unit
  (setq au* 1.0)         ; alternatively (setq au* au)
  (setq mu (* 1.3271544e11 (expt km 3) (expt sec -3))) ; MG, gravitational parameter for sun
  (setq musq (* mu mu))  ; something I didn't want to keep computing
  (setq mue (* 3.986012e5 (expt km 3) (expt sec -3))) ;  m^3sec^(-3) MG, gravitational parameter for earth
  (setq r-earth (* 6378.145e3 m))   ;  m   radius of earth
  (setq r-earth* 1.0)      ; alternatively (setq r-earth* r-earth)
  (setq mmercury 0.05)           ; earth masses
  (setq mvenus 0.82)             ; earth masses
  (setq mearth 1.0)              ; earth masses
  (setq mmars 0.11)              ; earth masses
  (setq mjupiter 318.0)         ; earth masses
  (setq mmoon 0.0123)            ; earth masses
  (setq dmercury (* 0.387 au*))           ; AU
  (setq dvenus (* 0.723 au*))             ; AU ; equals semi-major axis
  (setq dearth (* 1.0 au*))              ; AU
  (setq dmars (* 1.524 au*))             ; AU
  (setq djupiter (* 5.203 au*))          ; AU
  (setq dceres (* 2.7672 au*))          ; AU
  (setq eccentricity-ceres 0.0784)   ;
  (setq eccentricity-mercury 0.206)   ;
  (setq eccentricity-venus 0.007)   ;
  (setq eccentricity-earth 0.017)   ;
  (setq eccentricity-mars 0.093)   ;
  (setq eccentricity-jupiter 0.048)   ;
  (setq rmercury (* 0.38 r-earth*))           ; earth radii
  (setq rvenus (* 0.72 r-earth*))             ; earth radii
  (setq rearth (* 1.0 r-earth*))              ; earth radii
  (setq rmars (* 0.53 r-earth*))              ; earth radii
  (setq rjupiter (* 10.8 r-earth*))          ; earth radii
  (setq rmoon (* 0.27 r-earth*))             ; earth radii
  (setq density-mercury (* 5.43 gpcc*))    ; g/cc
  (setq density-venus 5.24)      ; g/cc
  (setq density-earth 5.515)      ; g/cc
  (setq density-mars 3.94)       ; g/cc
  (setq density-jupiter 1.33)    ; g/cc
  (setq density-moon 3.3)       ; g/cc
  (setq density-ceres (* 2.7 (/ g cc)))
  (setq density-pallas (* 2.6 (/ g cc)))
  (setq density-vesta (* 3.3 (/ g cc)))
  (setq m-mercury 0.3022e24)           ; kg
  (setq m-venus 4.8690e24)             ; kg
  (setq m-mars 0.64191e24)              ; kg
  (setq m-earth 5.9742e24)        ; kg
  (setq m-jupiter 1898.8e24)          ; kg
  (setq m-moon 0.073483e24)       ; kg
  (setq m-sun 1.99e30)                ; kg
  (setq m-ceres (* 1.18e21 kg*))          ; kg from Cunningham _Asteroids_ p.75
  (setq m-pallas (* 2.16e20 kg*))          ; kg
  (setq m-vesta (* 2.76e20 kg*))          ; kg
  (setq d-mercury 56.8e9)           ; AU
  (setq d-venus 107.7e9)             ; AU
  (setq d-earth 150.0e9)            ; m
  (setq d-mars 227.4e9)              ; AU
  (setq d-jupiter 778.0e9)           ; AU
  (setq d-ceres (* dceres au))
  (setq d-moon 3.84e8)             ; m (from earth)
  (setq r-mercury 2439.0e3)           ; m
  (setq r-venus 6052.0e3)             ; m
  (setq r-earth 6371.0e3)             ; m
  (setq r-mars 3393.4e3)              ; m
  (setq r-jupiter 71398.0e3)           ; m
  (setq r-moon 1738.0e3)              ; m
  (setq r-ceres 501.5e3)              ; m
  (setq r-sun 6.96e8)                 ; m
  (setq v-earth (* 30.0e3 (/ m sec)))               ; m/sec
  (setq t-mercury (* 87.96 day*))                   ; days sidereal period
  (setq t-venus (* 224.7 day*))
  (setq t-earth (* 365.26 day*))
  (setq t-mars (* 686.98 day*))
  (setq t-jupiter (* 4333.0 day*))
  (setq esc-mercury (* 4.2e3 (/ m sec)))        ; m/sec escape velocity
  (setq esc-venus (* 10.3e3 (/ m sec)))
  (setq esc-earth (* 11.2e3 (/ m sec)))
  (setq esc-mars (* 5.1e3 (/ m sec)))
  (setq orbital-mars (* 3.6e3 (/ m sec)))
  (setq v-mars (* 24.3e3 (/ m sec)))
  (setq v-venus (* 3.510e+04 (/ m sec)))
  (setq esc-jupiter (* 61.0e3 (/ m sec)))
  (setq esc-moon (* 2.4e3 (/ m sec)))
  ;;; miscellaneous
  (setq btu (* 1054.35 J))                   ; J
  (setq quad (* 1.0e15 btu))
  (setq horse-power (* 745.7 watt))                  ; watts
  (setq horsepower (* 745.7 watt))                  ; watts
  (setq ton-tnt (* 5.0e9 J))
  (setq barrel* 1.0)      ; alternatively (setq barrel* barrel)
  (setq liter (* 1.0e-3 (expt m 3)))
  (setq liter* 1.0)  ; alternatively (setq liter* liter)
  (setq gallon (* 3.7854 liter))
  (setq gallon* 1.0) ; alternativel (setq gallon* gallon)
  (setq barrel (* 42 gallon))  ; of petroleum, otherwise 31 gallon
  (setq acrefoot (* 1233.0 (expt m 3)))
  (setq acre-foot (* 1233.0 (expt m 3)))
  (setq pound (* 0.45 kg))
  (setq inch (* 0.0254 m))
  (setq nautical-mile (* 6076.1155 foot))
  (setq g (* 9.81 m (expt sec -2)))
  (setq mole 1.0)                   ;; not clear this is the right thing to do
  (setq K 1.0) ;; also not obvious
  (setq R (/ (* 8.314 joule)  (* mole K))) ; gas constant
  ;;; energy equivalents (from Beckmann Energy Data Sheet)
  (setq oil-barrel-energy  (* btu 1e6 (/ 1 0.17)))
  (setq natural-gas-cu-ft-energy (* btu 1.0e6 (/ 1.0 (* 1000 0.95))))
  (setq coal-ton-energy (* btu 1e6 (/ 1 0.38)))
  (setq gram-u235-energy (* btu 1e6 (/ 1 0.013)))
  (setq energy-generate-kwh (* btu 1e6 (/ 1 100.0)))



  (setq insea '((oxygen . 8.57e5) (hydrogen . 1.08e5) (chlorine . 1.90e4)
                (sodium . 1.05e4) (magnesium . 1.35e3) (sulfur . 8.85e2)
                (calcium . 4.00e3) (potassium . 3.80e2) (bromine . 6.5e1)
                (carbon . 2.8e1) (strontium . 8.1e0) (boron . 4.6e0)
                (silicon . 3e0) (fluorine . 1.3e0) (argon . 6e-1)
                (nitrogen . 5e-1) (lithium . 1.8e-1) (rubidium . 1.2e-1)
                (phosphorus . 7e-2) (iodine . 6e-2) (barium . 3e-2)
                (aluminum . 1e-2) (iron . 1e-2) (indium . 2e-2) ; < 2e-2
                (molybdenum . 1e-2) (zinc . 1e-2) (nickel . 5.4e-3)
                (arsenic . 3e-3) (copper . 3e-3) (tin . 3e-3)
                (uranium . 3e-3) (krypton . 2.5e-3) (manganese . 2e-3)
                (vanadium . 2e-3) (titanium . 1e-3) (cesium . 5e-4)
                (cerium . 4e-4) (antimony . 3.3e-4) (silver . 3e-4)
                (yttrium . 3e-4) (cobalt . 2.7e-4) (neon . 1.4e-4)
                (cadmium . 1.1e-4) (tungsten . 1e-4) (selenium . 9e-5)
                (germanium . 7e-5) (xenon . 5.2e-5) (chromium . 5e-5)
                (thorium . 5e-5) (gallium . 3e-5) (mercury . 3e-5)
                (lead . 3e-5) (zirconium . 2.2e-5) (bismuth . 1.7e-5)
                (lanthanum . 1.2e-5) (gold . 1.1e-5) (niobium . 1e-5)
                (thallium . 1e-5) ; <
                (hafnium . 8e-6) ; <
                (helium . 6.9e-6) (tantalum . 2.5e-6) ; <
                (beryllium . 6e-7) (protoactinium . 2e-9) (radium . 6e-11)
                (radon . 6e-16)))
  ;;; The above are in mg/liter.
  ;;; See 14-7 for earth's crust. mg/kg
  ;;; thermal gradient 30 degrees C/km
  (setq incrust '((oxygen . 4.64e5) (silicon . 2.82e5) (aluminum . 8.32e4)
                  (iron . 5.63e4) (uranium  . 2.7e0) (thorium . 9.6e0) (copper . 5.5e1)
                  (chromium . 1.0e2) (nickel . 7.5e1) (tungsten . 1.5e0) (tin . 2.0e0)
                  (uranium . 2.7e0)))

  (setq weights '((iron . 55.847) (copper . 63.546) (chromium . 51.9961)
                  (nickel . 58.6934) (tin . 118.710) (tungsten . 183.85)
                  (uranium . 238.0289) (hydrogen . 1.00794) (helium . 4.002602)
                  (lithium . 6.941) (beryllium . 9.012182) (boron . 10.811)
                  (carbon . 12.011) (nitrogen . 14.00674) (oxygen . 15.9994)
                  (fluorine . 18.9984032) (neon . 20.1797) (sodium 22.9897)
                  (magnesium . 24.3050) (aluminum . 26.9815) (silicon . 28.0855)
                  (phosphorus . 30.973762) (sulfur . 32.066) (chlorine . 35.4527)
                  ))
  ;;; River flows from statistical abstract, 1991 table 353 p.206
  (setq mississippi-flow (* 593e3 (/ (expt foot 3) sec)))
                                        ; comes to (/ mississippi-flow (/ acre-foot year))  ; =>4.298e+08
  (setq columbia-flow (* 265e3 (/ (expt foot 3) sec)))
                                        ; comes to (/ columbia-flow (/ acre-foot year))  ; =>1.921e+08

  )
;;; end of facts

(facts)

;;; Astrodynamic functions

(defun period (a) (* 2.0 pi (expt mu -0.5) (expt a 1.5)))

;;; Functions for computing with 2-d Euclidean vectors


;;; the rotation matrix through an angle delta
(defun rot (delta)
  (list (list (cos delta) (sin delta))
        (list (- (sin delta)) (cos delta))))

;;; multiplying a matrix by a column vector
(defun mvmult (matrix vector)
  (list (scap (nth 0 matrix) vector) (scap (nth 1 matrix) vector)))

;;; sum of two vectors
(defun vplus (vec1 vec2) (list (+ (nth 0 vec1) (nth 0 vec2))
                               (+ (nth 1 vec1) (nth 1 vec2))))

;;; difference of two vectors
(defun vminus (vec1 vec2) (list (- (nth 0 vec1) (nth 0 vec2))
                                (- (nth 1 vec1) (nth 1 vec2))))

;;; scalar product of two vectors
(defun scap (vec1 vec2) (+ (* (nth 0 vec1) (nth 0 vec2))
                           (* (nth 1 vec1) (nth 1 vec2))))

;;; product of scalar and vector
(defun svmult (sca vec) (list (* sca (nth 0 vec)) (* sca (nth 1 vec))))

;;; sum of a list of vectors
(defun addup (veclist)
  (if (null veclist)
      zerovec
    (vplus (car veclist) (addup (cdr veclist)))))


(defconst zerovec '(0 0) "zero vector with two components"1)

;;; length of a vector
(defun length (x) (sqrt (+ (expt (nth 0 x) 2) (expt (nth 1 x) 2))))

(defconst Imatrix '((1.0 0.0) (0.0 1.0)) "unit 2x2 matrix")

(defun smmult (sca matrix) (list (svmult sca (nth 0 matrix))
                                 (svmult sca (nth 1 matrix))))

(defun mplus (mat1 mat2) (list (vplus (nth 0 mat1) (nth 0 mat2))
                               (vplus (nth 1 mat1) (nth 1 mat2))))

(defun mminus (mat1 mat2) (list (vminus (nth 0 mat1) (nth 0 mat2))
                                (vminus (nth 1 mat1) (nth 1 mat2))))

(defun mmult (mat1 mat2)
  (list
   (list (scap (nth 0 mat1) (col 0 mat1)) (scap (nth 0 mat1) (col 1 mat1)))
   (list (scap (nth 1 mat1) (col 0 mat1)) (scap (nth 1 mat1) (col 1 mat1)))))

(defun multiplyup (matlist)
  (if (null matlist)
      Imatrix
    (mmult (car matlist) (multiplyup (car matlist)
                                     (multiplyup (cdr (matlist)))))))
                                        ;Energy content of fuels
                                        ;   fuelKjoule/gKjoule/cc
                                        ;Hydrogen124.78.7
                                        ;Methanol 20.115.9
                                        ;Gasoline 44.330.9
                                        ;HydrideVH3  4.728.4
                                        ;Coal C28H42 32.241.8
                                        ;Wood C.32H.40O.22 17.514.2
                                        ;H2 gas124.7  .0010
                                        ;methane gas 61.1  .0044

(setq Hydrogen(* 124.7e6 (/ J kg)))
(setq Gasoline1(* 30.9e6 (/ J liter)))   ; => 3.090e+10

(setq Gasoline(* 44.3e6 (/ J kg)))

                                        ;(facts)

(setq foo (/ (* Gasoline1 10.0) kwh))   ; => 8.583e+04

;;; Gibbs energy of formation of metal oxides J/mol

                                        ;Li2O
                                        ;2{Li} + 1/2 {O2} => Li2O

                                        ; 300K-450K
                                        ;(setq DeltaG (+ -598424 (* 124.50 T)))   ; => -498824.0 for (setq T 800)

                                        ; 500K-1550K
                                        ;(setq DeltaG (+ -603513 (* 137.41 T)))   ; => -493585.0

(setq solar-constant (* 1368.0 watt (expt m -2)));  The 1991-92 CRC Handbook
                                        ; gives 1368 (+-) 7 as the 1985 figure.

;;; (load "/u/jmc/1/facts.el")

(setq area-earth (* 5.1e14 (expt m 2)))

(defun wind-power (diameter velocity)
  (* 0.016 (expt (/ diameter foot) 2) (expt (/ velocity mph) 3) watt))
                                        ; diameter in feet ; velocity in mph in original formula

;;; from Bruce Hamilton /u/jmc/1/facts=44756

(setq megatonoil (* 40e12 btu))

(setq worldenergyuse1993 (* 7804.3 megatonoil))

(setq primarypower (* 1.04e13 watt))
