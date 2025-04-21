(define (problem match3-problem3)
    (:domain match3-hogwarts)
    
    (:objects 
        a1 a2 a3 a4  ; First row
        b1 b2 b3 b4  ; Second row
        c1 c2 c3 c4  ; Third row
        d1 d2 d3 d4  ; Fourth row
        - tile
    )

    (:init
        ; Initial tile types
        (pos-has-type a1 empty)
        (pos-has-type a2 S)
        (pos-has-type a3 G)
        (pos-has-type a4 H)
        (pos-has-type b1 S)
        (pos-has-type b2 H)
        (pos-has-type b3 G)
        (pos-has-type b4 R)
        (pos-has-type c1 S)
        (pos-has-type c2 H)
        (pos-has-type c3 R)
        (pos-has-type c4 G)
        (pos-has-type d1 H)
        (pos-has-type d2 H)
        (pos-has-type d3 H)
        (pos-has-type d4 R)

        ; Horizontal adjacencies
        (adjacent a1 a2) (adjacent a2 a3) (adjacent a3 a4)
        (adjacent b1 b2) (adjacent b2 b3) (adjacent b3 b4)
        (adjacent c1 c2) (adjacent c2 c3) (adjacent c3 c4)
        (adjacent d1 d2) (adjacent d2 d3) (adjacent d3 d4)
        ; Reverse horizontal adjacencies
        (adjacent a2 a1) (adjacent a3 a2) (adjacent a4 a3)
        (adjacent b2 b1) (adjacent b3 b2) (adjacent b4 b3)
        (adjacent c2 c1) (adjacent c3 c2) (adjacent c4 c3)
        (adjacent d2 d1) (adjacent d3 d2) (adjacent d4 d3)

        ; Vertical adjacencies
        (adjacent a1 b1) (adjacent b1 c1) (adjacent c1 d1)
        (adjacent a2 b2) (adjacent b2 c2) (adjacent c2 d2)
        (adjacent a3 b3) (adjacent b3 c3) (adjacent c3 d3)
        (adjacent a4 b4) (adjacent b4 c4) (adjacent c4 d4)
        ; Reverse vertical adjacencies
        (adjacent b1 a1) (adjacent c1 b1) (adjacent d1 c1)
        (adjacent b2 a2) (adjacent c2 b2) (adjacent d2 c2)
        (adjacent b3 a3) (adjacent c3 b3) (adjacent d3 c3)
        (adjacent b4 a4) (adjacent c4 b4) (adjacent d4 c4)

        ; Possible matches (horizontal)
        (can-match a1 a2 a3) (can-match a2 a3 a4)
        (can-match b1 b2 b3) (can-match b2 b3 b4)
        (can-match c1 c2 c3) (can-match c2 c3 c4)
        (can-match d1 d2 d3) (can-match d2 d3 d4)

        ; Possible matches (vertical)
        (can-match a1 b1 c1) (can-match b1 c1 d1)
        (can-match a2 b2 c2) (can-match b2 c2 d2)
        (can-match a3 b3 c3) (can-match b3 c3 d3)
        (can-match a4 b4 c4) (can-match b4 c4 d4)
    )

    (:goal 
        (and 
            ; All positions should be empty
            (pos-has-type a1 empty)
            (pos-has-type a2 empty)
            (pos-has-type a3 empty)
            (pos-has-type a4 empty)
            (pos-has-type b1 empty)
            (pos-has-type b2 empty)
            (pos-has-type b3 empty)
            (pos-has-type b4 empty)
            (pos-has-type c1 empty)
            (pos-has-type c2 empty)
            (pos-has-type c3 empty)
            (pos-has-type c4 empty)
            (pos-has-type d1 empty)
            (pos-has-type d2 empty)
            (pos-has-type d3 empty)
            (pos-has-type d4 empty)
        )
    )
)