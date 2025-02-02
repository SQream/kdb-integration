if[.z.K<3.2;'"ps.k requires kdb+3.2 or later"]
\d .s
s:{x[1]x 0}
P:{$[x s y;(@[y;0;1+];s y);()]};N:{$[(_s y)~x;(@[y;0;1+];`$_s y);()]};E:{(x;())};C:{i:0;r:();v:(y;());while[$[i<#x;#v:x[i][*v];0];r,:,v;i+:1];$[i<#x;();(:/r[;0];enlist,r[;1])]}
S:{$[#r:x z;r;y z]};Q:{S[x;E]y};M:{r:(#:){x[*y]}[x]\(y;());r:-1_r;(:/r[;0];$[1<#r;enlist,1_r[;1];()])};MP:{r:M[x]y;$[$[#r;0<#r 1;0b];r;()]}
Ff:{$[#r:y z;(r 0;(x;r 1));()]};Fi:{$[#r:y z;(r 0;(@[;x];r 1));()]};Y:{$[x s y;();(y;())]}

ev:{$[(~@x)&1<#x;$[enlist~*x;ev'1_x;(*x)[ev x 1]];x]};p3:{$[99h<t:@x;$x;(((t>0)&1=#x)#","),$[10h=abs t;"\"",x,"\"";" "/:$(),x]]}
pp:{q:{(x;p3(),y)};r:$[-11=@x;$x;11=@x;q[`N;$*x];10=abs@@x;q[`N;x]
     ($)~*x;(`P;p3 x 1);(1=#x)&11=@*x;pp[{(1#x;$[2=#x;;,:]1_x)}@*x]
     (?)~*x;(`Q;pp[x 1]);(*)~*x;(`M;pp[x 1]);(+)~*x;(`MP;pp[x 1]);(!)~*x;(`Y;p3 x 1)
     (2=#x)&(@x 1)in 100 101 107 7 -7h;($[(@x 1)in 100 101 107h;`Ff;`Fi];p3 x 1;pp[*x])
     (|)~*x;`S,(pp'1_x);2=#x;`C,{@[@[x;-1+#x;{x,")"}];0;"(",]}({$[".s.C"~4#x;6_-2_x;x]}'pp'x);'`pp];
    $[@r;r;($[1<#r;".s.";""],$*r),$[1<#r;"[",(";"/:1_r),"]";""]]}
e:{$[";"~*x;.z.s'1_x;(:)~*x;."k)PS,:`",n,";",(n:$x 1),":{",pp[x 2],"x}";()];}@-5!    /   ((ix:"I",n:$x 1),"[x]+:1;")

w0:@[127#1;w;:;!#w:"i"$(" \t\r\n";",(){}*/+";34 95,/65 97+/:!26;".0123456789:";"<=!>";"eE"),"-'\""]
w1:w[;0]?1_'w:("  +a0<a+'\"";"+ +a0<a+'\"";"a +bb<b+'\"";"0 +*1<e+'\"";"< +a0>a+'\"";"'tttttttut";"\"vvvvvvvvw"
 "b +bb<b+'\"";"1 +*1<e+'\"";"> +a0<a+'\"";"e +*1<*1'\"";"ttttttttut" ;"u +a0<a+t\"";"vvvvvvvvvw";"w +aw<a+'v")
w:{(i_x)@&0<s i:&7>s:0 w1\w0 x};sp:{x@&~x in(," ";,"\n")}@w@;ts:{x[(0;sp y)]};tx:{ev ts[x;y][1]}

xv:.$:;                   xb:{$[#x 1;(x[1;0];*x;x[1;1]);*x]};            wh:{$[()~x;x;@x;x;(&)~*x;,/.z.s'1_x;,x]}
nv:{. @[x;&"E"=x;:;"e"]}; fv:{$[~@x;,/.z.s'1_x;-11h=@x;x;0#`]};          el:{$[#fv x;x;(@;(,:;x);(*;`i;0))]}
at:{(t>100)|0>t:@x};      av:{$[&/l=*l:#:'x@&~at'x;(*l)#'x;'length]};    xnl:{$[~t x;(#x)#0b;^x]}
xmm:{$[(11h=abs t y)|(~t y)&10=@*y;y@*(<:;>:)[x]y,:();(min;max)[x]y]}
xin:{y:(),y;s:$[11=@y;$:;::];x in $[10=@x;{*:'x@&1=#:'x}s y;(~t x)&10=@*x;s y;y]};xeq:{$[-11h=t y;xin[x;,y];-11h=t x;xin[y;,x];(~t x)|~t y;x~'y;x=y]}
xlk:{x like y^"*?""%_"?y:$y};sdiv:{$[&/(abs@@:'(x;y))in 4 5 6 7h;x div y;x%y]};t:{$[(76h<t)|~t:@x;0h;20h>t;t;11h=t:@x:.!x;t;6h]};tr:{.q.signum[x]*_abs x}

ct:(`char`varchar`tinyint`smallint`integer`bigint`double`numeric!```byte`short`int`long`float`float),ct!ct:`boolean`int`real`float`date`time`timestamp;
et:`year`month`day`hour`minute`second!`year`mm`dd`hh`uu`ss;tc:{$[x~`$"SQL_TSI_FRAC_SECOND";`frac;`$ :/"_"\:_$x]};day:{1+x-"d"$"m"$x}"d"$;
cn:`frac`second`minute`hour`day`week`month`quarter`year!("t"$1),00:00:01 00:01 01:00,1D 7D 31D 92D 365D;n0:{|/(::)~/:x};nx:{$[x in !ct;(ct[x]$())0N;0N]}
am:{x-1D*d-(&/(-1;-1+day x)+"d"$y+/:1 0+\:"m"$d:"d"$x)};mt:(`month`quarter`year!1 3 12)
tsa:{$[n0(y;z);0Np;~^m:mt x:tc x;am[z;m*tr y];z+cn[tc x]*tr y]};tsd:{$[n0(y;z);0Nn;~^m:mt x:tc x;-/tr("m"$"d"$(z;y))%m;tr(-/@["p"$;;{y;"n"$x}[x]]'(z;y))%"n"$cn x]}
cvt:{st:{(~x)|abs[x]in 10 11h};x:tc x;if[$[1=#y;$[1=#*y;^*y;0b];0b];:nx x];u:t y;e:(ct,et)x;$[x in`char`varchar;$[st u;y;$y];st u;(.q.upper .Q.t@@e$())$$[11=abs u;$y;y]
 abs[u]in 19h;$[`timestamp~x;(x$0)+y;`date~x;x$0;e$y];abs[u]in 13 14h;$[e in `hh`uu`ss;0;e$y];e$y]}

f.hour:`hh$;f.minute:`uu$;f.second:`ss$;f.year:`year$;f.month:`mm$"d"$;f.week:{1+tsd[`week;1+x-f.dayofweek x:"d"$(1+"m"$x)-`mm$x;x]};f.quarter:{1+(-1+`mm$x)div 3}
f.dayofweek:{x:"d"$x;1+x-`week$x};f.day:f.dayofmonth:day;f.dayofyear:{1+x-"d"$(1+"m"$x)-`mm$x}"d"$;f[`$"current_date"]:f.curdate:{.z.d};f.curtime:{.z.T}
f[`$"current_timestamp"]:f.now:{.z.P};f.monthname:{(0N 3#"janfebmaraprmayjunjulaugsepoctnovdec")@-1+month x};f.dayname:{(0N 3#"sunmontuewedthufrisat")@.q.mod[-1+"d"$x;7]}

f.floor:_:;f.ceil:f.ceiling:-_-:;f.sign:.q.signum;f.round:{("j"$x*f)%f:10 xexp y};f.rand:{*1?1.};f.square:{x*x};f.power:xexp
f.pi:{4*atan 1};f.atan2:{1 4.$atan(x%y;(y<0)*sign x)};f.cot:%tan@;f.log10:{log[x]%log 10};f.mod:.q.mod;f.truncate:{$[~y;tr x;tr[x*f]%f:10 xexp y]}
f.degrees:{x*57.295779513082};f.radians:{x*0.017453292519943}

tf:{'[{y:{$[(t:abs[@x])in 10 11h;$x;(19h<t)&77h>t;$. x;x]}'y;$[10h=@x:$[^n:0N|/#:'y@&u:~10h=t'y;x . y;(x').@[y;&~u;n#,:]];`$x;x]}[x];enlist]};tf0:{$[11h=t z;z;x[y]z]}[tf] / 
f.trim:tf0 .q.trim;f.ltrim:tf0 .q.ltrim;f.rtrim:tf0 .q.rtrim;f.lcase:tf .q.lower;f.ucase:tf .q.upper;f.left:tf{$[^y;"";.q.sublist[y;x]]};f.right:{left[x;-y]}
f.substring:tf{$[(^y)|^z;"";.q.sublist[(y-1;z);x]]};f.locate:tf('[{{$[^z;z;~#x;0;0^*1+((z-1)_y) ss x]}.(2#x),$[2<#x;x 2;1]};enlist])
f.repeat:tf{,/y#,x};f.replace:tf .q.ssr;f[`$("char_length";"character_length";"length")]:tf{#x};f[`$"insert"]:tf{[s;i;n;t](i#s),t,(n+i)_s}
f.ascii:tf{"x"$*x};f.char:{"c"$x};f.concat:tf[,]
f.ifnull:{y^x};if[.z.K>3.2;f.stddev:`.q `sdev];f.stddevpop:dev;f.varpop:var;
xlt:tf{$[10 10h~t'(x;y);(*>(x;y))&~x~y;x<y]};xgt:{xlt[y;x]}

PS:()
s)n:(![{((`$(_:)x)in K)}] ($[{x[0]~"\""}][{`$x@(&:)(~:)x="\""}] | $[{x[0]~"'"}][{x:-1_1_x;$[x~(,:)" ";" ";(,:)`$(.:)"\"",.q.ssr[x;"''";"'"],"\""]}] | $[{x[0]in .Q.n,"."}][{nv x}] | $[{(&/)(x[0]in b),x in "._",.Q.n,b:.Q.a,.Q.A}][{`$x}]))1
s)nn:n|`null[{(,:)(::)}]|("(" ex[,:] +[(","ex)1] ")"){(enlist),(,/)x[1 2]}
s)f0:((n|`insert|`left)"("?[es]")")[{n:`$(_:)($:)x 0;$[n~`q;$[1=(#:)x:@[x 2;0;{(.:;($:)x 0)}];x 0;x];$[n in(!:)f;f;xv][n],$[(#:)x 2;x 2;::]]}]
s)f1:((`convert[{cvt}]|`timestampadd[{tsa}]|`timestampdiff[{tsd}])"("es")")[{x[0],-1_@[($[x[0]~cvt;|:;]x[2]),(::);0;,:]}]
s)fa:((`sum|`avg|`count|`min|`max)"(" ?[`distinct] ex")")[{v:el x 3;v:$[(#:)x 2;(?:;v);v];$[2>j:`min`max?x@:0;({z;xmm[x;y]}j;v;(#:;`i));(xv x;v)]}]|(`count "(" "*" ")")[{(#:;`i)}] / $[((#:)~x 0)&-11=(@:)v;{(,:)sum(~:)xnl x};x 0]
s)e0:("("ex")")[1]|((`not[{xv x}]|"-"[{(-:)}])e0)|f0|f1|fa|nn|ce|de|("{""fn" ex"}")[2]|("{"n n"}")[{(`d`t`ts!"DTP")[x 1]$($:)x[2;0]}]
s)e1:(e0 ?[("*"|"/"|`div)[{$["/"=(($:)x)[0];sdiv;xv x]}]e1])[{xb x}]
s)e2:(e1 ?[((?[`not](`in[{xin}]|`like{xlk}))[{$[(#:)x 0;'[~:;];::]x 1}]|("+"|"-")[{xv x}])e2])[{xb x}]
s)e3:(e2 ?[(("="[{xeq}]|("<>"|"!=")[{'[~:;xeq]}]|"<"[{xlt}]|">"[{xgt}]|">="[{'[~:;xlt]}]|"<="[{'[~:;xgt]}])e3)|(`is ?[`not] `null)])[{$[3>(#:)v:x 1;xb x;$[(#:)v 1;(~:;);](xnl;x 0)]}]
s)e4:((`not[{xv x}])e4)|(e3 ?[`and[{xv x}]e4])[{xb x}]
cv:{$[(~#x)|@x;x;&/0>t:@:'x;$[19h<t:-:&/t;`$$:;t$]x;@[x;&~10=t;$:]]};cc:{cv $[@y;x@y?1b;$[&/at'x:@[x;&i;:;*((),x@*&~i:(::)~'x)[-1],(::)];x;{(y'). x}x](+y)?'1b]}
c1:{$[#x;({$[#x;cc[y;x xeq/:z];()]};x);cc],(enlist,y[;1],,z;enlist,y[;0])}; f.coalesce:('[{$[2>#x;'coalesce;cc[x;~xnl'-1_x]]};enlist])
s)ce:(`case ?[ex] +[(`when ex `then ex)[1 3]] `else ex `end)[{c1 . x 1 2 4}]
s)de:((`extract"("n `from ex")")[2 4]|(`cast"("ex `as ty")")[4 2])[{(cvt;(,:)x 0;x 1)}]; ty:(n ?["(" ?[es] ")"])[0]
s)ex:(e4 ?[`or[{xv x}]ex])[{xb x}];               es:"*"|(ex[,:] *[("," ex)1]){(,/)x};  ep: ("("es")")[1]
s)en:(ex ?[(?[`as] n)1]);                         ns:"*"|(en[,:] *[("," en)1]){(,/)x};  eps:(ep[,:] *[(","ep)1]){(,/)x}
s)t0:(f0[{-6!x}] | n | ("(" qs ")")[1]) ?[(?[`as] n)1]
s)j0:(t0 *[(((?[`left|`inner|`cross] `join)[0]|","{`cross}) t0 ?[`on ex][1])])|("(" j0 ")")[1]
s)qs:(`select ?[`distinct] ns ?[`into n][1] ?[`from j0][1] ?[`where ex][1] (?[`group `by es][2]?[`having ex][1])[{x}]?[(`order `by ns)[2]] ?[`limit ex][1])[{qf . 1_x}] | (f0{-6!x})
s)qc:(`create `table n "("(dc[,:] *[("," dc)1])[{(,/)x}]")")[{b:(+:)x 4;c:$[(&/)b[1] in (!:)ct;ct[b 1];'`typename];.[x 2;();:;(+:)b[0]!c$\:()]}]; dc:n ty
nc:{x$$[$[~@y;|/p:(::)~'y;0b];@[y;&p;:;*x$()];y]}
s)qi:(`insert `into n ?[ep] (`values eps)[{(+:)(-6)!enlist,enlist,'x[1]}]|qs[{(.:)(+:)x}]){f:x 3;x[2]insert ($[(#:)f;(+:)f!;])((@:)'[(.:)$[(#:)f;f#;](+:)0!(.:)x 2])nc'x 4}
s)qu:(`update n `set es `where ex){![x 1;wh x 5;0b;x[3;;1]!x[3;;2]]};qx:(`delete `from n `where ex){![x 2;wh x 4;0b;0#`]};qd:(`drop `table n)[{.[`.;();_;x 2]}]
s)qq:qs|qc|qi|qu|qx|qd
K:();K:?`$',/{(),/:x@&10=abs@@:'x:-1_x}'.:'.:'PS

elj:{x,:();y[&1|c],'(x_z)(!0),/@[i;j;:;+,(#j:&~c:#:'i:(=x#z:0!z)x#y:0!y)#0N]}
xc:{$[#x 1;x 1;*fv[*x],`]};xd:{(v{`$($x),$[y;$y;""]}'{@/[(#x)#0;i;:;!:'#:'i:.:=x]}v:`xcol^xc'x)!*:'x};ord:{{[t;x;y;z]x y ?[t;::;ai[`,!+t;*z]]x}[x]/[::;(<:;>:)y[1]~'`desc;*y:+|y]}
tv:{0!$[-11h=@x:*x;. x;x]};fe:{$[@x;();$[(*x)~xeq;,x;,/.z.s'x]]};nm:{`$($x),/:$!y};qj:{+n_+x[n]/![;();0b;]'[z;(n:nm[`0J;#y])!/:+y]};inx:{(|/"b"$)'x~/:\:y};
tp:{$[v:.Q.qp x;'par;v~0b;.q.xcol[!+x]?[..+x;();0b;()];x]};s0:{[t;e;c;b;a]if[(~#a)&0<@b;a:b;b:1b];0!(?).($[98=@t;t;. t];e'c;e'b;e'$[#a;a;()])};ai:{$[(@0)=@y;x y;y]}
nft:{a:$[#y 1;y 1;-11h=@*y;*y;`];(,/(v;`/:'a,/:v)!\:n;+(n:a x/:v:!y)!. y:+tv y)};nt:nft{`$"0T",($x),"-",($y)}
nf:{$[(1<#y)&(11=t)|~t:@y;.z.s[x]'y;-11=t;x y;y]};      tj:{[t;u;f;c]e:*:'t:(t;u);(,/e;)$[`cross~f;.q.cross .
 qj[$[`left~f;elj;.q.ej];{{$[^i:*&0<#:'x;'`joincond;x i]}'x{r:@[nf{$[^r:x y;'e;r]}[x];y;()];r}/:\:1_*fe y}[e]'wh c]]@tp't[;1]}
qf:{[d;s;q;t;w;g;o;m]d:~~#d;w:wh w;h:g 1;g:*g;if[t~();t:((([]X:1#0);`XTab0);())];j:+t 1;t:tj/[$[#j 1;nt;nft{y}]t 0;nt'j 1;j 0;j 2];e:nf {y^x y}t 0;t:t 1;
 s:nf[*|`\:;!s]!. s:$[s~`$"*";()!();xd s];sk:!s;s:((,`)!,(::)),s;k:s{(!x)$[(@0)~@y;y;~^u:*&y~/:.:x;u;^u:*&e[y]~/:!x;'by;u]}/:g;g:k#s;s:k_s;if[~#g;s:el's];
 h:$[h~(>;(#:;el 1);0);1;#h;s[`0H]:h;()];t:s0[t;e;w;$[#g;g;d];1_s];t:$[1~h;1#t;#h;(,`0H)_t@&t`0H;t];if[#o;t@:ord[t;o]];if[#m;t:(m&#t)#t];$[#q;.[q;();:;];]$[#sk;sk#;]t}

e:{t:.z.T;if[~#r:qq(0;s:sp x);'"parse:",x];if[(**r)<#s;'"unexpected:"," "/:(**r)_s];r:ev[r 1];r};ver:1.15

\d .o
T:`text`bit```tinyint`smallint`int`bigint`real`float`char`varchar`timestamp`date`date`datetime``time`time`time
T0:  -1 -7 0 0 -6 5  4 -5  7  8 1  12 93 9 91 93 0 10 10 92h
B0:4096  1 0 0  1 2  4  8  4  8 1 255 16 6  6 16 0  6  6  6
C0:4096  1 0 0  3 5 10 19  7 15 1 255 9 10 10  9 0  8  8  8
PS:   1  2 0 0  2 2  2  2  2  2 3   3 25 2  2 25 0  2  2  2h /char basic both
t:0 1 4 5 6 7 8 9 10 11 12 14 15 19;Columns:{$[#x;Cols`$x;,/Cols'.q.tables`.]}
q)TI:`DATA_TYPE xasc([]TYPE_NAME:T t;DATA_TYPE:T0 t;COLUMN_SIZE:C0 t;LITERAL_PREFIX:`;LITERAL_SUFFIX:`;CREATE_PARAMS:`;NULLABLE:1h;CASE_SENSITIVE:1h;SEARCHABLE:PS t;UNSIGNED_ATTRIBUTE:0h;FIXED_PREC_SCALE:0h;AUTO_INCREMENT:0h;LOCAL_TYPE_NAME:`;MINIMUM_SCALE:0h;MAXIMUM_SCALE:0h)
q)Cols:{o([]TABLE_NAME:x;COLUMN_NAME:cols x;DATA_TYPE:T0 t;TYPE_NAME:T t;COLUMN_SIZE:C0 t;BUFFER_LENGTH:B0 t;DECIMAL_DIGITS:0h;NUM_PREC_RADIX:10h;NULLABLE:1h;REMARKS:`;COLUMN_DEF:(count t)#(,:)"NULL";SQL_DATA_TYPE:T0 t;SQL_DATETIME_SUB:0h;CHAR_OCTET_LENGTH:1i;ORDINAL_POSITION:"i"$1+til count t;IS_NULLABLE:(count t:.Q.tt x)#(,:)"YES")}
