; Key Compose   version 0.2   february 2013   written by Fehérke
; key compose functionality and more
; configuration file

#If compose==0 ; None

#If compose>=1 ; Diacritical
  ::a'::á ; a with acute
  ::a`::à ; a with grave
  ::a^::â ; a with circumflex
  ::a;::ä ; a with diaeresis
  ::a~::ã ; a with tilde
  ::ae::æ ; ae
  ::c'::ç ; c with cedilla
  ::e'::é ; e with acute
  ::e`::è ; e with grave
  ::e^::ê ; e with circumflex
  ::e;::ë ; e with diaeresis
  ::i'::í ; i with acute
  ::i^::î ; i with circumflex
  ::i;::ï ; i with diaeresis
  ::n~::ñ ; n with tilde
  ::o'::ó ; o with acute
  ::o^::ô ; o with circumflex
  ::o;::ö ; o with diaeresis
  ::o~::õ ; o with tilde
  ::oe::œ ; oe
  ::sz::ß ; sharp s
  ::u'::ú ; u with acute
  ::u`::ù ; u with grave
  ::u^::û ; u with circumflex
  ::u;::ü ; u with diaeresis
  ::y;::ÿ ; y with diaeresis

#If compose>=2 ; Punctuation
  ::,,::„      ; low double comma quotation mark
  ::````::“    ; double turned comma quoation mark
  ::''::”      ; double comma quotation mark
  ::<<::«      ; left pointing guillemet
  ::>>::»      ; right pointing guillemet
  ::--::–      ; en dash
  ::...::…     ; horizontal ellipsis
  ::;;;::︙     ; vertical ellipsis
  ::!!::¡      ; inverted exclamation mark
  ::??::¿      ; inverted question mark
  ::!?::‽      ; interrobang

#If compose>=3 ; Math
  ::+-::±      ; plus-or-minus sign
  ::%%::‰      ; per mille sign
  ::inf::∞     ; infinity
  ::~~::≈      ; almost equal to
  ::<=::≤      ; less than or equal to
  ::>=::≥      ; greater than or equal to
  ::=/::≠      ; not equal to
  ::==::≡      ; identical to
  ::deg::°     ; degree sign

#If compose>=4 ; Sign
  ::mu::µ      ; micro sign
  ::(c)::©     ; copyright sign
  ::(R)::®     ; registered sign
  ::tm::™      ; trade mark sign
  ::cent::¢    ; cent sign
  ::pound::£   ; pund sign
  ::euro::€    ; euro sign
  ::dagger::†  ; dagger
  ::ddagger::‡ ; double dagger
  ::numero::№  ; numero
  ::currency::¤ ; currency sign
  ::section::§ ; section sign
  ::pilcrow::¶ ; pilcrow sign 
  ::bullet::•  ; bullet

#If compose>=5 ; Arrow
  ::->::→      ; rightwards arrow
  ::<-::←      ; leftwards arrow
  ::=>::⇒      ; rightwards double arrow
  ::<=::⇐      ; leftwards double arrow
  ::o>::⇨      ; rightwards white arrow
  ::<o::⇦      ; leftwards white arrow
  ::+>::➟      ; dashed triangle headed rightwards arrow
  ::#>::➠      ; heavy dashed triangle headed rightwards arrow
  ::%>::➡      ; black rightwards arrow
  ::_>::➤      ; black rightwards arrowhead
  ::.>::➧      ; squat black rightwards arrow
  ::~>::➨     ; heavy concave pointed black rightwards arrow
  ::|>::▶      ; black right pointing triangle
  ::<|::◀      ; black left pointing triangle

#If compose>=6 ; Glyph
  ::wsmile::☺  ; white smiling face
  ::bsmile::☻  ; black smiling face
  ::check::✓   ; check mark
  ::hcheck::✔  ; heavy check mark
  ::ballot::✗  ; ballot x
  ::hballot::✘ ; heavy ballot x
