(define (problem match3-problem1)
    (:domain match3-hogwarts)
    
    (:objects 
        a1 a2 a3  ; First row
        b1 b2 b3  ; Second row
        c1 c2 c3  ; Third row
        - tile
    )

    (:init
        ; Initial tile types
        (pos-has-type a1 G)
        (pos-has-type a2 G)
        (pos-has-type a3 G)
        (pos-has-type b1 H)
        (pos-has-type b2 H)
        (pos-has-type b3 H)
        (pos-has-type c1 R)
        (pos-has-type c2 R)
        (pos-has-type c3 R)

        ; Horizontal adjacencies
        (adjacent a1 a2) (adjacent a2 a3)
        (adjacent b1 b2) (adjacent b2 b3)
        (adjacent c1 c2) (adjacent c2 c3)
        ; Reverse horizontal adjacencies
        (adjacent a2 a1) (adjacent a3 a2)
        (adjacent b2 b1) (adjacent b3 b2)
        (adjacent c2 c1) (adjacent c3 c2)

        ; Vertical adjacencies
        (adjacent a1 b1) (adjacent b1 c1)
        (adjacent a2 b2) (adjacent b2 c2)
        (adjacent a3 b3) (adjacent b3 c3)
        ; Reverse vertical adjacencies
        (adjacent b1 a1) (adjacent c1 b1)
        (adjacent b2 a2) (adjacent c2 b2)
        (adjacent b3 a3) (adjacent c3 b3)

        ; Possible matches (horizontal)
        (can-match a1 a2 a3)
        (can-match b1 b2 b3)
        (can-match c1 c2 c3)

        ; Possible matches (vertical)
        (can-match a1 b1 c1)
        (can-match a2 b2 c2)
        (can-match a3 b3 c3)
    )

    (:goal 
        (and 
            ; All positions should be empty
            (pos-has-type a1 empty)
            (pos-has-type a2 empty)
            (pos-has-type a3 empty)
            (pos-has-type b1 empty)
            (pos-has-type b2 empty)
            (pos-has-type b3 empty)
            (pos-has-type c1 empty)
            (pos-has-type c2 empty)
            (pos-has-type c3 empty)
        )
    )
)