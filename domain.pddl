(define (domain match3-hogwarts)
    (:requirements :strips :typing :equality :negative-preconditions :conditional-effects :disjunctive-preconditions)

    (:types 
        tile - object
        tiletype
    )

    (:constants
        G H R S - tiletype
        empty - tiletype 
    )

    (:predicates
        (pos-has-type ?pos - tile ?type - tiletype)         ; Position has a type (G, H, R, S, empty)
        (adjacent ?t1 ?t2 - tile)                  ; Tiles are adjacent
        (can-match ?pos1 ?pos2 ?pos3 - tile)       ; Three positions can form a match
    )

(:action swap-normal
    :parameters (?pos1 ?pos2 - tile ?type1 ?type2 - tiletype)
    :precondition (and 
        (adjacent ?pos1 ?pos2)
        (pos-has-type ?pos1 ?type1)
        (pos-has-type ?pos2 ?type2)
        (not (= ?type1 empty))
        (not (= ?type2 empty))
        (not (= ?type1 ?type2))
        (not (and (= ?type1 G) (= ?type2 S)))  ; Special case handled separately
        (not (and (= ?type1 S) (= ?type2 G)))
    )
    :effect (and 
        (not (pos-has-type ?pos1 ?type1))
        (not (pos-has-type ?pos2 ?type2))
        (pos-has-type ?pos1 ?type2)
        (pos-has-type ?pos2 ?type1)
    )
)

(:action swap-special
    :parameters (?pos1 ?pos2 - tile)
    :precondition (and 
        (adjacent ?pos1 ?pos2)
        (or 
            (and (pos-has-type ?pos1 G) (pos-has-type ?pos2 S))
            (and (pos-has-type ?pos1 S) (pos-has-type ?pos2 G))
        )
    )
    :effect (and 
        (when (pos-has-type ?pos1 G)
            (and 
                (not (pos-has-type ?pos1 G))
                (not (pos-has-type ?pos2 S))
                (pos-has-type ?pos1 S)
                (pos-has-type ?pos2 empty)
            )
        )
        (when (pos-has-type ?pos1 S)
            (and 
                (not (pos-has-type ?pos1 S))
                (not (pos-has-type ?pos2 G))
                (pos-has-type ?pos1 G)
                (pos-has-type ?pos2 empty)
            )
        )
    )
)

(:action match-tiles
    :parameters (?pos1 ?pos2 ?pos3 - tile ?type - tiletype)
    :precondition (and 
        (can-match ?pos1 ?pos2 ?pos3)
        (pos-has-type ?pos1 ?type)
        (pos-has-type ?pos2 ?type)
        (pos-has-type ?pos3 ?type)
        (not (= ?type empty))
    )
    :effect (and 
        (not (pos-has-type ?pos1 ?type))
        (not (pos-has-type ?pos2 ?type))
        (not (pos-has-type ?pos3 ?type))
        (pos-has-type ?pos1 empty)
        (pos-has-type ?pos2 empty)
        (pos-has-type ?pos3 empty)
    )
)
)

