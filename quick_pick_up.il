;one line comment
/*
multi-line comment
*/
True = t
False = nil
;operation support ++

;list:
A = '(1,2,(1,2,3))
B = list(1,2,(1,2,3))
C = append(A,B)
D = cons(1,A) ;python append
bBox = list(300:400, 500:450)
L = '(1,2,3)
;python list generator
L_square = foreach(mapcar x L x**2);L_square = [x**2 for x in L]
;or
procedure(x_square(x) x**2)
L_square = mapcar('x_square, L)
;filter list or object
L_odd = setof(x,L,odd(x))
cv = geGetWindowCellView()
rect_shape = setof(shape,cv-> shapes,shape.objType=="rect")
;head element: car, tail element: cdr
;nth element
L_0 = nth(0,L)
L_length = length(L)
L_reverse = reverse(L)
;assign new data
setf(car(L),1)
setf(nth(1,L),1)

;string
A = "this is a string"
B = "It is true"
;L = list(A,B)
L = nil
L = cons(A,L)
L = cons(B,L)
C = strcat(A,B);C = A + B
C = buildString(L,"");C = ''.join(L)
A_L = parseString(A," ");A_L = A.split(" ")

;struct-liked: disembodied property list
aCard = '(nil
    rank "ace"
    suit "spades")
aCard = list(nil
    rank "ace"
    suit "spades")
;a symbol is used by 'symbol_name
slot_name = 'suit
get(aCard,slot_name)
getq(aCard,suit)

;hash table (dict) liked:, the key can be list
dict = makeTable("table_name" nil);nil used to init
dict["metal1"] = '(nil width 1.0)
foreach(key dict
    printf("Key: %L, Value: %L\n",key,MyTable[key])
)
dict_len = length(dict)

;associated list 
assocList = '(("A",1),("B",2),("C",3))
B_code = assoc("B",assocList)
B_code_replace = "b"
if(B_code != nil then
    ;replace the value of B in assocList
    rplaca(cdr(assoc("B",assocList)),B_code_replace)
)

;structure
defstruct(struct_name
    rank
    suit
    faceup
);all will be nil by default

newStruct = make_struct_nmae(?rank "ace" ?suit "spades" ?faceup nil)
newStruct->rank ;access the slot of structure
newStruct->?;get slot names(symbols) of the structure
newStruct->??;get slot names and values of the structure

;array
declare(array_name[20])

;binary branching
;if-else
if(t then
    printf("True branch executed\n")
else
    printf("False branch executed\n")
)

;when,unless
when(t
    printf("When branch executed\n")
)
unless(nil
    printf("This will not be printed\n")
)

;multiway branching
;case
case(case_obj
    (1
        printf("case 1 executed\n")
    )
    (2
        printf("case 2 executed\n")
    )
    (3
        printf("case 3 executed\n")
    )
    (t
        printf("default case executed\n")
    ) ; t is used as default
)

;cond
cond(
    (cond1 cond1_if_true)
    (cond2 cond2_if_true)
    (cond3 cond3_if_true)
    (t ; t is used as default
        printf("default cond executed\n")
    )
)

;for
for(i 1 10 ; i from 1 to 10
    printf("i = %d\n" i)
)
;foreach
foreach(item L
    printf("item = %L\n" item)
)
;while
i = 1
while(i <= 10
    printf("i = %d\n" i)
    i = i + 1 ; increment i
)



procedure( TrShiftBoxll(bBox,@optional (X_shift,0),(Y_shift,0))
    let((ll,ur,lly,ury)
        ll = lowerLeft(bBox)
        list(xCoord(ll)+X_shift,yCoord(ll)+Y_shift);no assignment, this is return
    )
)

bBox = list(300:400, 500:450) ; define a bounding box
TrShiftBoxll(bBox,10) ; shift the lower left corner of bBox by (10,20)
;keyword arguments
TrShiftBoxll(
    ?bBox bBox ; pass the bounding box
    ?X_shift 10 ; shift by 10 in x direction
    ?Y_shift 20 ; shift by 20 in y direction
)

