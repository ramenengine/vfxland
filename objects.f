256 constant max-objdescs

/OBJECT
    getset objtype objtype!
    getset action# action#!
    fgetset vx vx!
    fgetset vy vy!
drop


max-objdescs /objslot array objdesc
max-objdescs  256 cells array sdata  \ static data

: objdesc: ( n - <name> ) ( - n )
    dup constant dup objdesc {{
    objtype!
    true en!
;

: ;objdesc }} ;

: (vector!) create dup , does> @ objtype sdata + ! ;
: (vector) create dup , does> @ objtype sdata + @ execute ;
: vector  (vector) (vector!) cell+ ;
: ::  ( objdesc - <vector> )
    objdesc {{ :noname ' >body @ objtype sdata + ! }} ;


( TODO: actions )

0
    vector start start!
    vector think think!   \ temporary
value /sdata

: become  objdesc me /objslot move ;

0 include lemming.f