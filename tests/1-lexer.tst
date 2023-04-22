!compiler_flags: --dump LEX --exec LEX

!name: Prazen dokument
!code:
!expected:
EOF:$
!end

!name: Whitespace
!code:





!expected:
EOF:$
!end

!name: New line na koncu
!code:
arr

!expected:
[1:1-1:4] KW_ARR:arr
EOF:$
!end

!name: 2 new line na koncu
!code:
arr


!expected:
[1:1-1:4] KW_ARR:arr
EOF:$
!end

!name: Ključne besede
!code:
arr
else
for
fun
if
then
typ
var
where
while

arr else for fun if then typ var where while typ where while fun arr for for typ else
		arr while  fun  	var
  typ      while  if
!expected:
[1:1-1:4] KW_ARR:arr
[2:1-2:5] KW_ELSE:else
[3:1-3:4] KW_FOR:for
[4:1-4:4] KW_FUN:fun
[5:1-5:3] KW_IF:if
[6:1-6:5] KW_THEN:then
[7:1-7:4] KW_TYP:typ
[8:1-8:4] KW_VAR:var
[9:1-9:6] KW_WHERE:where
[10:1-10:6] KW_WHILE:while
[12:1-12:4] KW_ARR:arr
[12:5-12:9] KW_ELSE:else
[12:10-12:13] KW_FOR:for
[12:14-12:17] KW_FUN:fun
[12:18-12:20] KW_IF:if
[12:21-12:25] KW_THEN:then
[12:26-12:29] KW_TYP:typ
[12:30-12:33] KW_VAR:var
[12:34-12:39] KW_WHERE:where
[12:40-12:45] KW_WHILE:while
[12:46-12:49] KW_TYP:typ
[12:50-12:55] KW_WHERE:where
[12:56-12:61] KW_WHILE:while
[12:62-12:65] KW_FUN:fun
[12:66-12:69] KW_ARR:arr
[12:70-12:73] KW_FOR:for
[12:74-12:77] KW_FOR:for
[12:78-12:81] KW_TYP:typ
[12:82-12:86] KW_ELSE:else
[13:9-13:12] KW_ARR:arr
[13:13-13:18] KW_WHILE:while
[13:20-13:23] KW_FUN:fun
[13:29-13:32] KW_VAR:var
[14:3-14:6] KW_TYP:typ
[14:12-14:17] KW_WHILE:while
[14:19-14:21] KW_IF:if
EOF:$
!end

!name: Atomic
!code:
logical
integer
string

logical string integer integer logical
!expected:
[1:1-1:8] AT_LOGICAL:logical
[2:1-2:8] AT_INTEGER:integer
[3:1-3:7] AT_STRING:string
[5:1-5:8] AT_LOGICAL:logical
[5:9-5:15] AT_STRING:string
[5:16-5:23] AT_INTEGER:integer
[5:24-5:31] AT_INTEGER:integer
[5:32-5:39] AT_LOGICAL:logical
EOF:$
!end

!name: Operatorji
!code:
+-*/%!|==!=<><=>=()[]{}:;.,=
!expected:
[1:1-1:2] OP_ADD:+
[1:2-1:3] OP_SUB:-
[1:3-1:4] OP_MUL:*
[1:4-1:5] OP_DIV:/
[1:5-1:6] OP_MOD:%
[1:6-1:7] OP_NOT:!
[1:7-1:8] OP_OR:|
[1:8-1:10] OP_EQ:==
[1:10-1:12] OP_NEQ:!=
[1:12-1:13] OP_LT:<
[1:13-1:14] OP_GT:>
[1:14-1:16] OP_LEQ:<=
[1:16-1:18] OP_GEQ:>=
[1:18-1:19] OP_LPARENT:(
[1:19-1:20] OP_RPARENT:)
[1:20-1:21] OP_LBRACKET:[
[1:21-1:22] OP_RBRACKET:]
[1:22-1:23] OP_LBRACE:{
[1:23-1:24] OP_RBRACE:}
[1:24-1:25] OP_COLON::
[1:25-1:26] OP_SEMICOLON:;
[1:26-1:27] OP_DOT:.
[1:27-1:28] OP_COMMA:,
[1:28-1:29] OP_ASSIGN:=
EOF:$
!end

!name: Atomic konstante
!code:

t 123    -897
 wh ere while      true
'??' = '$' whiletest ++

true
false
1
11
0145
+457
+067687
-484
-02454
'Hello world!'
'This is a numbers test: 12346'
'Who''s this guy?'

true false 1 54 46543 -2 +422 -0002240+00645-0978 'Hello world!' 'A' '' 'Hi' '' '*?=)=?(=)()(/(&/(&%&$%&%$#%' 'd5f4gdf4gw644234+-(/(/%#)?*[]{}'  'What''s the car you drive again?'
	879    -424 true
		false    'Why must I suffer????'
!expected:
[2:1-2:2] IDENTIFIER:t
[2:3-2:6] C_INTEGER:123
[2:10-2:11] OP_SUB:-
[2:11-2:14] C_INTEGER:897
[3:2-3:4] IDENTIFIER:wh
[3:5-3:8] IDENTIFIER:ere
[3:9-3:14] KW_WHILE:while
[3:20-3:24] C_LOGICAL:true
[4:1-4:5] C_STRING:??
[4:6-4:7] OP_ASSIGN:=
[4:8-4:11] C_STRING:$
[4:12-4:21] IDENTIFIER:whiletest
[4:22-4:23] OP_ADD:+
[4:23-4:24] OP_ADD:+
[6:1-6:5] C_LOGICAL:true
[7:1-7:6] C_LOGICAL:false
[8:1-8:2] C_INTEGER:1
[9:1-9:3] C_INTEGER:11
[10:1-10:5] C_INTEGER:0145
[11:1-11:2] OP_ADD:+
[11:2-11:5] C_INTEGER:457
[12:1-12:2] OP_ADD:+
[12:2-12:8] C_INTEGER:067687
[13:1-13:2] OP_SUB:-
[13:2-13:5] C_INTEGER:484
[14:1-14:2] OP_SUB:-
[14:2-14:7] C_INTEGER:02454
[15:1-15:15] C_STRING:Hello world!
[16:1-16:32] C_STRING:This is a numbers test: 12346
[17:1-17:19] C_STRING:Who's this guy?
[19:1-19:5] C_LOGICAL:true
[19:6-19:11] C_LOGICAL:false
[19:12-19:13] C_INTEGER:1
[19:14-19:16] C_INTEGER:54
[19:17-19:22] C_INTEGER:46543
[19:23-19:24] OP_SUB:-
[19:24-19:25] C_INTEGER:2
[19:26-19:27] OP_ADD:+
[19:27-19:30] C_INTEGER:422
[19:31-19:32] OP_SUB:-
[19:32-19:39] C_INTEGER:0002240
[19:39-19:40] OP_ADD:+
[19:40-19:45] C_INTEGER:00645
[19:45-19:46] OP_SUB:-
[19:46-19:50] C_INTEGER:0978
[19:51-19:65] C_STRING:Hello world!
[19:66-19:69] C_STRING:A
[19:70-19:72] C_STRING:
[19:73-19:77] C_STRING:Hi
[19:78-19:80] C_STRING:
[19:81-19:110] C_STRING:*?=)=?(=)()(/(&/(&%&$%&%$#%
[19:111-19:144] C_STRING:d5f4gdf4gw644234+-(/(/%#)?*[]{}
[19:146-19:180] C_STRING:What's the car you drive again?
[20:5-20:8] C_INTEGER:879
[20:12-20:13] OP_SUB:-
[20:13-20:16] C_INTEGER:424
[20:17-20:21] C_LOGICAL:true
[21:9-21:14] C_LOGICAL:false
[21:18-21:41] C_STRING:Why must I suffer????
EOF:$
!end

!name: Identifierji
!code:
test
test123
test_123
_test_123
_123_test
!expected:
[1:1-1:5] IDENTIFIER:test
[2:1-2:8] IDENTIFIER:test123
[3:1-3:9] IDENTIFIER:test_123
[4:1-4:10] IDENTIFIER:_test_123
[5:1-5:10] IDENTIFIER:_123_test
EOF:$
!end

!name: Komentarji
!code:
#this is a test comment
# This is also a test123
        #Komentar # # ##
test#test1
!expected:
[4:1-4:5] IDENTIFIER:test
EOF:$
!end

!name: Preprost program 1
!code:
fun f( i : integer) : integer = ({x=10}, x) {where var x : integer}
!expected:
[1:1-1:4] KW_FUN:fun
[1:5-1:6] IDENTIFIER:f
[1:6-1:7] OP_LPARENT:(
[1:8-1:9] IDENTIFIER:i
[1:10-1:11] OP_COLON::
[1:12-1:19] AT_INTEGER:integer
[1:19-1:20] OP_RPARENT:)
[1:21-1:22] OP_COLON::
[1:23-1:30] AT_INTEGER:integer
[1:31-1:32] OP_ASSIGN:=
[1:33-1:34] OP_LPARENT:(
[1:34-1:35] OP_LBRACE:{
[1:35-1:36] IDENTIFIER:x
[1:36-1:37] OP_ASSIGN:=
[1:37-1:39] C_INTEGER:10
[1:39-1:40] OP_RBRACE:}
[1:40-1:41] OP_COMMA:,
[1:42-1:43] IDENTIFIER:x
[1:43-1:44] OP_RPARENT:)
[1:45-1:46] OP_LBRACE:{
[1:46-1:51] KW_WHERE:where
[1:52-1:55] KW_VAR:var
[1:56-1:57] IDENTIFIER:x
[1:58-1:59] OP_COLON::
[1:60-1:67] AT_INTEGER:integer
[1:67-1:68] OP_RBRACE:}
EOF:$
!end

!name: Preprost program 2
!code:
fun id (a:integer, b:integer) : integer = { for i = 0, i < a, { i = i + 1 } : { c = c + i * a * b } }
!expected:
[1:1-1:4] KW_FUN:fun
[1:5-1:7] IDENTIFIER:id
[1:8-1:9] OP_LPARENT:(
[1:9-1:10] IDENTIFIER:a
[1:10-1:11] OP_COLON::
[1:11-1:18] AT_INTEGER:integer
[1:18-1:19] OP_COMMA:,
[1:20-1:21] IDENTIFIER:b
[1:21-1:22] OP_COLON::
[1:22-1:29] AT_INTEGER:integer
[1:29-1:30] OP_RPARENT:)
[1:31-1:32] OP_COLON::
[1:33-1:40] AT_INTEGER:integer
[1:41-1:42] OP_ASSIGN:=
[1:43-1:44] OP_LBRACE:{
[1:45-1:48] KW_FOR:for
[1:49-1:50] IDENTIFIER:i
[1:51-1:52] OP_ASSIGN:=
[1:53-1:54] C_INTEGER:0
[1:54-1:55] OP_COMMA:,
[1:56-1:57] IDENTIFIER:i
[1:58-1:59] OP_LT:<
[1:60-1:61] IDENTIFIER:a
[1:61-1:62] OP_COMMA:,
[1:63-1:64] OP_LBRACE:{
[1:65-1:66] IDENTIFIER:i
[1:67-1:68] OP_ASSIGN:=
[1:69-1:70] IDENTIFIER:i
[1:71-1:72] OP_ADD:+
[1:73-1:74] C_INTEGER:1
[1:75-1:76] OP_RBRACE:}
[1:77-1:78] OP_COLON::
[1:79-1:80] OP_LBRACE:{
[1:81-1:82] IDENTIFIER:c
[1:83-1:84] OP_ASSIGN:=
[1:85-1:86] IDENTIFIER:c
[1:87-1:88] OP_ADD:+
[1:89-1:90] IDENTIFIER:i
[1:91-1:92] OP_MUL:*
[1:93-1:94] IDENTIFIER:a
[1:95-1:96] OP_MUL:*
[1:97-1:98] IDENTIFIER:b
[1:99-1:100] OP_RBRACE:}
[1:101-1:102] OP_RBRACE:}
EOF:$
!end

!name: Preprost program 3
!code:
# preprost program
num:integer = 2;
zmnozek:integer = num*num;
sum:integer = 0;

# je to zanka?
for (i:integer = 0; (i > zmnozek) == false; i = i + 1) {
    sum = sum + i;
}

typ x: integer = 1345;
!expected:
[2:1-2:4] IDENTIFIER:num
[2:4-2:5] OP_COLON::
[2:5-2:12] AT_INTEGER:integer
[2:13-2:14] OP_ASSIGN:=
[2:15-2:16] C_INTEGER:2
[2:16-2:17] OP_SEMICOLON:;
[3:1-3:8] IDENTIFIER:zmnozek
[3:8-3:9] OP_COLON::
[3:9-3:16] AT_INTEGER:integer
[3:17-3:18] OP_ASSIGN:=
[3:19-3:22] IDENTIFIER:num
[3:22-3:23] OP_MUL:*
[3:23-3:26] IDENTIFIER:num
[3:26-3:27] OP_SEMICOLON:;
[4:1-4:4] IDENTIFIER:sum
[4:4-4:5] OP_COLON::
[4:5-4:12] AT_INTEGER:integer
[4:13-4:14] OP_ASSIGN:=
[4:15-4:16] C_INTEGER:0
[4:16-4:17] OP_SEMICOLON:;
[7:1-7:4] KW_FOR:for
[7:5-7:6] OP_LPARENT:(
[7:6-7:7] IDENTIFIER:i
[7:7-7:8] OP_COLON::
[7:8-7:15] AT_INTEGER:integer
[7:16-7:17] OP_ASSIGN:=
[7:18-7:19] C_INTEGER:0
[7:19-7:20] OP_SEMICOLON:;
[7:21-7:22] OP_LPARENT:(
[7:22-7:23] IDENTIFIER:i
[7:24-7:25] OP_GT:>
[7:26-7:33] IDENTIFIER:zmnozek
[7:33-7:34] OP_RPARENT:)
[7:35-7:37] OP_EQ:==
[7:38-7:43] C_LOGICAL:false
[7:43-7:44] OP_SEMICOLON:;
[7:45-7:46] IDENTIFIER:i
[7:47-7:48] OP_ASSIGN:=
[7:49-7:50] IDENTIFIER:i
[7:51-7:52] OP_ADD:+
[7:53-7:54] C_INTEGER:1
[7:54-7:55] OP_RPARENT:)
[7:56-7:57] OP_LBRACE:{
[8:5-8:8] IDENTIFIER:sum
[8:9-8:10] OP_ASSIGN:=
[8:11-8:14] IDENTIFIER:sum
[8:15-8:16] OP_ADD:+
[8:17-8:18] IDENTIFIER:i
[8:18-8:19] OP_SEMICOLON:;
[9:1-9:2] OP_RBRACE:}
[11:1-11:4] KW_TYP:typ
[11:5-11:6] IDENTIFIER:x
[11:6-11:7] OP_COLON::
[11:8-11:15] AT_INTEGER:integer
[11:16-11:17] OP_ASSIGN:=
[11:18-11:22] C_INTEGER:1345
[11:22-11:23] OP_SEMICOLON:;
EOF:$
!end

!name: Uber program
!code:
typ prvic:string;
typ drugic: integer;
typ tretjic : besedilo;
typ cetrtic: arr[7] arr[7] logical;
var petic : arr [ 10 ] integer;

fun prvaFunkcija (prvic:string, drugic:integer, cetrtic:arr[7] logical) : integer =
5 + 3 - 2 == 10 & true | beseda / drugabeseda * 'danesjelepdanaaaaa' % cetrtic != petic + 5 - !e
- (-10) + (+(+(-10))) / (!cetrtic) + 100 - false | nekaj & nekaj == bla | nekaj >= blabla &
nekaj <= blablabla | nekaj + nekaj < bla & nekaj - nekaj > nekajbla { where
    fun drugaFunkcija(nekaj:integer):integer=
        {
            { if haha then {
                    if nekaj then 5+3-1-4+2 * true else {
                        while nekaj >= nekaj * (-5323223) + -44545    : {
                            for nekaj = 1, nekaj >= -9999999, nekajnekaj-1-1-1-1:nekaj
                        }
                    }
                }
             }
        = celotenprogramtideluje69 { where
            fun epicBubblesort(polje:arr[10]integer):void =
                n == dolzinaPolja &
                temp == 0 & {
                for i=0,i<n,i + 1:
                    { for j=0, j<(n-i),j + 1:
                        {
                            if polje[j-1] > polje[j] then
                                temp == polje[j-1] &
                                polje[j-1] == polje[j] &
                                polje[j] == temp &
                                blablabla #neki komentarji
                        }
                    }
                }
            }
         }
    }
#lololololol
!expected:
[1:1-1:4] KW_TYP:typ
[1:5-1:10] IDENTIFIER:prvic
[1:10-1:11] OP_COLON::
[1:11-1:17] AT_STRING:string
[1:17-1:18] OP_SEMICOLON:;
[2:1-2:4] KW_TYP:typ
[2:5-2:11] IDENTIFIER:drugic
[2:11-2:12] OP_COLON::
[2:13-2:20] AT_INTEGER:integer
[2:20-2:21] OP_SEMICOLON:;
[3:1-3:4] KW_TYP:typ
[3:5-3:12] IDENTIFIER:tretjic
[3:13-3:14] OP_COLON::
[3:15-3:23] IDENTIFIER:besedilo
[3:23-3:24] OP_SEMICOLON:;
[4:1-4:4] KW_TYP:typ
[4:5-4:12] IDENTIFIER:cetrtic
[4:12-4:13] OP_COLON::
[4:14-4:17] KW_ARR:arr
[4:17-4:18] OP_LBRACKET:[
[4:18-4:19] C_INTEGER:7
[4:19-4:20] OP_RBRACKET:]
[4:21-4:24] KW_ARR:arr
[4:24-4:25] OP_LBRACKET:[
[4:25-4:26] C_INTEGER:7
[4:26-4:27] OP_RBRACKET:]
[4:28-4:35] AT_LOGICAL:logical
[4:35-4:36] OP_SEMICOLON:;
[5:1-5:4] KW_VAR:var
[5:5-5:10] IDENTIFIER:petic
[5:11-5:12] OP_COLON::
[5:13-5:16] KW_ARR:arr
[5:17-5:18] OP_LBRACKET:[
[5:19-5:21] C_INTEGER:10
[5:22-5:23] OP_RBRACKET:]
[5:24-5:31] AT_INTEGER:integer
[5:31-5:32] OP_SEMICOLON:;
[7:1-7:4] KW_FUN:fun
[7:5-7:17] IDENTIFIER:prvaFunkcija
[7:18-7:19] OP_LPARENT:(
[7:19-7:24] IDENTIFIER:prvic
[7:24-7:25] OP_COLON::
[7:25-7:31] AT_STRING:string
[7:31-7:32] OP_COMMA:,
[7:33-7:39] IDENTIFIER:drugic
[7:39-7:40] OP_COLON::
[7:40-7:47] AT_INTEGER:integer
[7:47-7:48] OP_COMMA:,
[7:49-7:56] IDENTIFIER:cetrtic
[7:56-7:57] OP_COLON::
[7:57-7:60] KW_ARR:arr
[7:60-7:61] OP_LBRACKET:[
[7:61-7:62] C_INTEGER:7
[7:62-7:63] OP_RBRACKET:]
[7:64-7:71] AT_LOGICAL:logical
[7:71-7:72] OP_RPARENT:)
[7:73-7:74] OP_COLON::
[7:75-7:82] AT_INTEGER:integer
[7:83-7:84] OP_ASSIGN:=
[8:1-8:2] C_INTEGER:5
[8:3-8:4] OP_ADD:+
[8:5-8:6] C_INTEGER:3
[8:7-8:8] OP_SUB:-
[8:9-8:10] C_INTEGER:2
[8:11-8:13] OP_EQ:==
[8:14-8:16] C_INTEGER:10
[8:17-8:18] OP_AND:&
[8:19-8:23] C_LOGICAL:true
[8:24-8:25] OP_OR:|
[8:26-8:32] IDENTIFIER:beseda
[8:33-8:34] OP_DIV:/
[8:35-8:46] IDENTIFIER:drugabeseda
[8:47-8:48] OP_MUL:*
[8:49-8:69] C_STRING:danesjelepdanaaaaa
[8:70-8:71] OP_MOD:%
[8:72-8:79] IDENTIFIER:cetrtic
[8:80-8:82] OP_NEQ:!=
[8:83-8:88] IDENTIFIER:petic
[8:89-8:90] OP_ADD:+
[8:91-8:92] C_INTEGER:5
[8:93-8:94] OP_SUB:-
[8:95-8:96] OP_NOT:!
[8:96-8:97] IDENTIFIER:e
[9:1-9:2] OP_SUB:-
[9:3-9:4] OP_LPARENT:(
[9:4-9:5] OP_SUB:-
[9:5-9:7] C_INTEGER:10
[9:7-9:8] OP_RPARENT:)
[9:9-9:10] OP_ADD:+
[9:11-9:12] OP_LPARENT:(
[9:12-9:13] OP_ADD:+
[9:13-9:14] OP_LPARENT:(
[9:14-9:15] OP_ADD:+
[9:15-9:16] OP_LPARENT:(
[9:16-9:17] OP_SUB:-
[9:17-9:19] C_INTEGER:10
[9:19-9:20] OP_RPARENT:)
[9:20-9:21] OP_RPARENT:)
[9:21-9:22] OP_RPARENT:)
[9:23-9:24] OP_DIV:/
[9:25-9:26] OP_LPARENT:(
[9:26-9:27] OP_NOT:!
[9:27-9:34] IDENTIFIER:cetrtic
[9:34-9:35] OP_RPARENT:)
[9:36-9:37] OP_ADD:+
[9:38-9:41] C_INTEGER:100
[9:42-9:43] OP_SUB:-
[9:44-9:49] C_LOGICAL:false
[9:50-9:51] OP_OR:|
[9:52-9:57] IDENTIFIER:nekaj
[9:58-9:59] OP_AND:&
[9:60-9:65] IDENTIFIER:nekaj
[9:66-9:68] OP_EQ:==
[9:69-9:72] IDENTIFIER:bla
[9:73-9:74] OP_OR:|
[9:75-9:80] IDENTIFIER:nekaj
[9:81-9:83] OP_GEQ:>=
[9:84-9:90] IDENTIFIER:blabla
[9:91-9:92] OP_AND:&
[10:1-10:6] IDENTIFIER:nekaj
[10:7-10:9] OP_LEQ:<=
[10:10-10:19] IDENTIFIER:blablabla
[10:20-10:21] OP_OR:|
[10:22-10:27] IDENTIFIER:nekaj
[10:28-10:29] OP_ADD:+
[10:30-10:35] IDENTIFIER:nekaj
[10:36-10:37] OP_LT:<
[10:38-10:41] IDENTIFIER:bla
[10:42-10:43] OP_AND:&
[10:44-10:49] IDENTIFIER:nekaj
[10:50-10:51] OP_SUB:-
[10:52-10:57] IDENTIFIER:nekaj
[10:58-10:59] OP_GT:>
[10:60-10:68] IDENTIFIER:nekajbla
[10:69-10:70] OP_LBRACE:{
[10:71-10:76] KW_WHERE:where
[11:5-11:8] KW_FUN:fun
[11:9-11:22] IDENTIFIER:drugaFunkcija
[11:22-11:23] OP_LPARENT:(
[11:23-11:28] IDENTIFIER:nekaj
[11:28-11:29] OP_COLON::
[11:29-11:36] AT_INTEGER:integer
[11:36-11:37] OP_RPARENT:)
[11:37-11:38] OP_COLON::
[11:38-11:45] AT_INTEGER:integer
[11:45-11:46] OP_ASSIGN:=
[12:9-12:10] OP_LBRACE:{
[13:13-13:14] OP_LBRACE:{
[13:15-13:17] KW_IF:if
[13:18-13:22] IDENTIFIER:haha
[13:23-13:27] KW_THEN:then
[13:28-13:29] OP_LBRACE:{
[14:21-14:23] KW_IF:if
[14:24-14:29] IDENTIFIER:nekaj
[14:30-14:34] KW_THEN:then
[14:35-14:36] C_INTEGER:5
[14:36-14:37] OP_ADD:+
[14:37-14:38] C_INTEGER:3
[14:38-14:39] OP_SUB:-
[14:39-14:40] C_INTEGER:1
[14:40-14:41] OP_SUB:-
[14:41-14:42] C_INTEGER:4
[14:42-14:43] OP_ADD:+
[14:43-14:44] C_INTEGER:2
[14:45-14:46] OP_MUL:*
[14:47-14:51] C_LOGICAL:true
[14:52-14:56] KW_ELSE:else
[14:57-14:58] OP_LBRACE:{
[15:25-15:30] KW_WHILE:while
[15:31-15:36] IDENTIFIER:nekaj
[15:37-15:39] OP_GEQ:>=
[15:40-15:45] IDENTIFIER:nekaj
[15:46-15:47] OP_MUL:*
[15:48-15:49] OP_LPARENT:(
[15:49-15:50] OP_SUB:-
[15:50-15:57] C_INTEGER:5323223
[15:57-15:58] OP_RPARENT:)
[15:59-15:60] OP_ADD:+
[15:61-15:62] OP_SUB:-
[15:62-15:67] C_INTEGER:44545
[15:71-15:72] OP_COLON::
[15:73-15:74] OP_LBRACE:{
[16:29-16:32] KW_FOR:for
[16:33-16:38] IDENTIFIER:nekaj
[16:39-16:40] OP_ASSIGN:=
[16:41-16:42] C_INTEGER:1
[16:42-16:43] OP_COMMA:,
[16:44-16:49] IDENTIFIER:nekaj
[16:50-16:52] OP_GEQ:>=
[16:53-16:54] OP_SUB:-
[16:54-16:61] C_INTEGER:9999999
[16:61-16:62] OP_COMMA:,
[16:63-16:73] IDENTIFIER:nekajnekaj
[16:73-16:74] OP_SUB:-
[16:74-16:75] C_INTEGER:1
[16:75-16:76] OP_SUB:-
[16:76-16:77] C_INTEGER:1
[16:77-16:78] OP_SUB:-
[16:78-16:79] C_INTEGER:1
[16:79-16:80] OP_SUB:-
[16:80-16:81] C_INTEGER:1
[16:81-16:82] OP_COLON::
[16:82-16:87] IDENTIFIER:nekaj
[17:25-17:26] OP_RBRACE:}
[18:21-18:22] OP_RBRACE:}
[19:17-19:18] OP_RBRACE:}
[20:14-20:15] OP_RBRACE:}
[21:9-21:10] OP_ASSIGN:=
[21:11-21:35] IDENTIFIER:celotenprogramtideluje69
[21:36-21:37] OP_LBRACE:{
[21:38-21:43] KW_WHERE:where
[22:13-22:16] KW_FUN:fun
[22:17-22:31] IDENTIFIER:epicBubblesort
[22:31-22:32] OP_LPARENT:(
[22:32-22:37] IDENTIFIER:polje
[22:37-22:38] OP_COLON::
[22:38-22:41] KW_ARR:arr
[22:41-22:42] OP_LBRACKET:[
[22:42-22:44] C_INTEGER:10
[22:44-22:45] OP_RBRACKET:]
[22:45-22:52] AT_INTEGER:integer
[22:52-22:53] OP_RPARENT:)
[22:53-22:54] OP_COLON::
[22:54-22:58] IDENTIFIER:void
[22:59-22:60] OP_ASSIGN:=
[23:17-23:18] IDENTIFIER:n
[23:19-23:21] OP_EQ:==
[23:22-23:34] IDENTIFIER:dolzinaPolja
[23:35-23:36] OP_AND:&
[24:17-24:21] IDENTIFIER:temp
[24:22-24:24] OP_EQ:==
[24:25-24:26] C_INTEGER:0
[24:27-24:28] OP_AND:&
[24:29-24:30] OP_LBRACE:{
[25:17-25:20] KW_FOR:for
[25:21-25:22] IDENTIFIER:i
[25:22-25:23] OP_ASSIGN:=
[25:23-25:24] C_INTEGER:0
[25:24-25:25] OP_COMMA:,
[25:25-25:26] IDENTIFIER:i
[25:26-25:27] OP_LT:<
[25:27-25:28] IDENTIFIER:n
[25:28-25:29] OP_COMMA:,
[25:29-25:30] IDENTIFIER:i
[25:31-25:32] OP_ADD:+
[25:33-25:34] C_INTEGER:1
[25:34-25:35] OP_COLON::
[26:21-26:22] OP_LBRACE:{
[26:23-26:26] KW_FOR:for
[26:27-26:28] IDENTIFIER:j
[26:28-26:29] OP_ASSIGN:=
[26:29-26:30] C_INTEGER:0
[26:30-26:31] OP_COMMA:,
[26:32-26:33] IDENTIFIER:j
[26:33-26:34] OP_LT:<
[26:34-26:35] OP_LPARENT:(
[26:35-26:36] IDENTIFIER:n
[26:36-26:37] OP_SUB:-
[26:37-26:38] IDENTIFIER:i
[26:38-26:39] OP_RPARENT:)
[26:39-26:40] OP_COMMA:,
[26:40-26:41] IDENTIFIER:j
[26:42-26:43] OP_ADD:+
[26:44-26:45] C_INTEGER:1
[26:45-26:46] OP_COLON::
[27:25-27:26] OP_LBRACE:{
[28:29-28:31] KW_IF:if
[28:32-28:37] IDENTIFIER:polje
[28:37-28:38] OP_LBRACKET:[
[28:38-28:39] IDENTIFIER:j
[28:39-28:40] OP_SUB:-
[28:40-28:41] C_INTEGER:1
[28:41-28:42] OP_RBRACKET:]
[28:43-28:44] OP_GT:>
[28:45-28:50] IDENTIFIER:polje
[28:50-28:51] OP_LBRACKET:[
[28:51-28:52] IDENTIFIER:j
[28:52-28:53] OP_RBRACKET:]
[28:54-28:58] KW_THEN:then
[29:33-29:37] IDENTIFIER:temp
[29:38-29:40] OP_EQ:==
[29:41-29:46] IDENTIFIER:polje
[29:46-29:47] OP_LBRACKET:[
[29:47-29:48] IDENTIFIER:j
[29:48-29:49] OP_SUB:-
[29:49-29:50] C_INTEGER:1
[29:50-29:51] OP_RBRACKET:]
[29:52-29:53] OP_AND:&
[30:33-30:38] IDENTIFIER:polje
[30:38-30:39] OP_LBRACKET:[
[30:39-30:40] IDENTIFIER:j
[30:40-30:41] OP_SUB:-
[30:41-30:42] C_INTEGER:1
[30:42-30:43] OP_RBRACKET:]
[30:44-30:46] OP_EQ:==
[30:47-30:52] IDENTIFIER:polje
[30:52-30:53] OP_LBRACKET:[
[30:53-30:54] IDENTIFIER:j
[30:54-30:55] OP_RBRACKET:]
[30:56-30:57] OP_AND:&
[31:33-31:38] IDENTIFIER:polje
[31:38-31:39] OP_LBRACKET:[
[31:39-31:40] IDENTIFIER:j
[31:40-31:41] OP_RBRACKET:]
[31:42-31:44] OP_EQ:==
[31:45-31:49] IDENTIFIER:temp
[31:50-31:51] OP_AND:&
[32:33-32:42] IDENTIFIER:blablabla
[33:25-33:26] OP_RBRACE:}
[34:21-34:22] OP_RBRACE:}
[35:17-35:18] OP_RBRACE:}
[36:13-36:14] OP_RBRACE:}
[37:10-37:11] OP_RBRACE:}
[38:5-38:6] OP_RBRACE:}
EOF:$
!end

------------------------------------------------------

-- Javni testi za leksikalno analizo
!name: Javni test 1 - Števila
!code:
10+0020
!expected:
[1:1-1:3] C_INTEGER:10
[1:3-1:4] OP_ADD:+
[1:4-1:8] C_INTEGER:0020
EOF:$
!end

!name: Javni test 2 - Ključne besede in operacije
!code:
while != { if true
!expected:
[1:1-1:6] KW_WHILE:while
[1:7-1:9] OP_NEQ:!=
[1:10-1:11] OP_LBRACE:{
[1:12-1:14] KW_IF:if
[1:15-1:19] C_LOGICAL:true
EOF:$
!end

!name: Javni test 3 - Stringi
!code:
    'danes je ''lep'' dan'
!expected:
[1:5-1:27] C_STRING:danes je 'lep' dan
EOF:$
!end

!name: Javni test 4 - Indentacije
!code:
true

  <=&

     false
!expected:
[1:1-1:5] C_LOGICAL:true
[3:3-3:5] OP_LEQ:<=
[3:5-3:6] OP_AND:&
[5:6-5:11] C_LOGICAL:false
EOF:$
!end

!name: Javni test 5 - Nezaključen string
!code:
'
!failure:
99
!end

