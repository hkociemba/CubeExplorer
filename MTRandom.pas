
(**********************************************************************
 *                                                                    *
 *   Mersenne Twister Pseudo-Random Number Generator (Secure)         *
 *                                                                    *
 *   It was inspired by C code, released under the GNU Library        *
 *   General Public License, written by Makoto Matsumoto              *
 *   <matumoto@math.keio.ac.jp> and Takuji Nishimura, considering     *
 *   the suggestions by Topher Cooper and Marc Rieffel in July-Aug.   *
 *   1997. See: http://www.math.keio.ac.jp/~matumoto/emt.html         *
 *                                                                    *
 *   Cryptographically secure provided by using of the following      *
 *   algorithms:                                                      *
 *                                                                    *
 *   The CAST-256 cipher is available worldwide on a royalty-free     *
 *   and licence-free basis for commercial and non-commercial uses.   *
 *   His authors are Carlisle Adams <carlisle.adams@entrust.com>      *
 *   and Jeff Gilchrist <jeff.gilchrist@entrust.com> (Canada).        *
 *                                                                    *
 *   Secure Hash Standard-1 (SHA-1) has been developed by the NIST    *
 *   (National Institute of Standards and Technology) and been        *
 *   published in FIPS180-1 (Federal Information Processing           *
 *   Standards Publication 180-1). The export of programs using       *
 *   this algorithm might be restricted by the US government. Any     *
 *   citizen of the USA should contact the State Department's         *
 *   Office of Defense Trade Controls before they try to export       *
 *   programs using SHA-1. Implementations using SHA-1 algorithm      *
 *   may be covered by U.S. and other patents. The user of this       *
 *   unit is responsible to make sure he is not violating any         *
 *   patents by using SHA-1.                                          *
 *                                                                    *
 *   Copyright (C) 2000, Andrew N. Driazgov <andrey@asp.tstu.ru>      *
 *                                                                    *
 *   This library is distributed in the hope that it will be useful,  *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of   *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.             *
 *                                                                    *
 *   When you use this, send an email to: matumoto@math.keio.ac.jp    *
 *   with an appropriate reference to your work.                      *
 *                                                                    *
 *   This unit can be used with Borland Delphi 4.0/5.0                *
 *                                                                    *
 *   Last updated: July 27, 2000                                      *
 *                                                                    *
 **********************************************************************)

unit MTRandom;

interface

{ This unit for MT19937 (integer version) allows to generate a sequence
  of pseudorandom unsigned integers (32bit) which is uniformly distributed
  among 0 to 2^32-1 for each call. The Mersenne Twister is "designed with
  consideration of the flaws of various existing generators," has a period
  of 2^19937 - 1, gives a sequence that is 623-dimensionally equidistributed,
  and "has passed many stringent tests, including the die-hard test of
  G. Marsaglia and the load test of P. Hellekalek and S. Wegenkittl."

  The initialization phase of this generator based on CAST-256 encryption
  algorithm, a DES-like Substitution-Permutation Network (SPN) cryptosystem
  built upon the CAST-128 encryption algorithm which appears to have good
  resistance to differential cryptanalysis, linear cryptanalysis, and
  related-key cryptanalysis. This cipher also possesses a number of other
  desirable cryptographic properties, including avalanche, Strict Avalanche
  Criterion (SAC), Bit Independence Criterion (BIC), no complementation
  property, and an absence of weak and semi-weak keys. The theoretical minimal
  number of secure rounds for this cipher is 35 for pseudorandomness and 50
  for super-pseudorandomness (see: Comparison of Randomness Provided by
  Several Schemes for Block Ciphers. Shiho Moriai and Serge Vaudenay. (The
  paper submitted to AES3 conference)). The general version of CAST-256 has
  48 rounds which seems to be enough to ensure both randomness and sequrity.

  SHA-1 produces a 160-Bit output (the message digest) of a message or a byte
  array. SHA-1 is called secure because it is computationally infeasible to
  find a message corresponding to a given message digest or to find a second
  (different) message which produces the same message digest. SHA-1 is used
  to noninvertible convertion of the output of MT random number generator in
  MT_SecureRandNext function (each fifty-five bytes from the random generator
  are replaced with twenty bytes of their secure hash).

  Before using of this generator you must initialize it at first and update
  with some random string (using MT_RandInit and MT_RandUpdate routines).
  For generaion of the random initialization string you can use the current
  value of time-stamp counter (returned by MT_TimeStamp), the current date
  and time, user ID and system ID, arbitrary sequence of characters typed by
  user and so on (see: Randomness Recommendations for Security, RFC 1750,
  December 1994). Only after that the output sequence of the random number
  generator (of MT_SecureRandNext) may be used in security subsystem. }

type
  TRandVector = array[0..623] of LongWord;
  TMTID = type Pointer;

  TCAST6InitVector = array[0..15] of Byte;
  TCASTID = type Pointer;

  TSHA1Digest = array[0..4] of LongWord;
  TSHAID = type Pointer;

{ MT_RandInit initialize the random number generator. Identificator of this
  generator is returned in ID parameter. It is used as the first parameter
  at calling of all ather subsequent routines. For initialization you need to
  pass into MT_RandInit some Seed value or the initial vector InitVector.
  The ID identificator must be destroyed by MT_RandDone at the end of work
  with this random generator. }

procedure MT_RandInit(var ID: TMTID; Seed: LongWord); overload;
procedure MT_RandInit(var ID: TMTID; const InitVector: TRandVector); overload;

{ MT_RandUpdate updates the internal contents (vector) of the pseudo random
  number generator. The current value of the vector encrypted with CAST-256
  algorithm. The second parameter of MT_RandUpdate is used as the key of
  encryption. It may be a string S, an array of bytes addressed by P of L
  bytes in length or a digest signature SHA-1 which is passed by Digest
  parameter. If the length of string S or byte array P is greater than 32 bytes
  encryption will proceeds several times with parts of the key up to 32 bytes
  in length. }

procedure MT_RandUpdate(ID: TMTID; const S: string); overload;
procedure MT_RandUpdate(ID: TMTID; P: Pointer; L: Cardinal); overload;
procedure MT_RandUpdate(ID: TMTID; const Digest: TSHA1Digest); overload;

{ MT_RandGetVector copies the current contents of the vector into the array
  passed by Vector parameter. Later the random generator may be initialized
  with this vector and its output sequence will be reproduced. }

procedure MT_RandGetVector(ID: TMTID; var Vector: TRandVector);

{ MT_RandSetVector set the value of random generator vector according with
  the array which is passed by Vector parameter. }

procedure MT_RandSetVector(ID: TMTID; const Vector: TRandVector);

{ MT_RandNext returns the next pseudo random number which is uniformly
  distributed in the range [0..$FFFFFFFF] for generator identified by ID.
  This generator does not create cryptographically secure random numbers.
  By a simple linear transformation the output of MT19937 becomes a linear
  recurring sequence. Then, one can easily guess the present state from a
  sufficiently large size of the output (see the paper: Mersenne Twister:
  A 623-dimensionally equidistributed uniform pseudorandom number generator.
  Makoto Matsumoto and Takuji Nishimura). }

function MT_RandNext(ID: TMTID): LongWord;

{ MT_SecureRandNext returns the next secure pseudo random number which is
  uniformly distributed in the range [0..$FFFFFFFF] for generator identified
  by ID. This number formed as the result of application of noninvertible
  function (SHA-1) for the output sequence of Mersenne Twister random number
  generator. To be ensured in the secure output you must initialize and
  update generator with the random string. }

function MT_SecureRandNext(ID: TMTID): LongWord;

{ MT_RandFill fills the memory region addressed by P of L bytes in length
  with the uniformly distributed random numbers. Generator is identified by
  ID. The output sequence of this function is not cryptographically strong. }

procedure MT_RandFill(ID: TMTID; P: Pointer; L: Cardinal);

{ MT_SecureRandFill fills the memory pointed by P with L bytes in length
  by secure output sequence of random generator identified by ID. This
  sequence produced by noninvertible mapping (SHA-1) of the output sequence
  of Mersenne Twister random number generator. During computation each twenty
  bytes of results are formed from fifty-five bytes of random numbers. }

procedure MT_SecureRandFill(ID: TMTID; P: Pointer; L: Cardinal);

{ MT_SecureRandXOR combines the contents of the memory region pointed by P
  of L bytes in length with the output sequence of cryptographically strong
  random number generator which is identified by ID. It process XOR-operation
  with each bytes of memory and the corresponding bytes of the sequence.
  Repeated application of this procedure on the same memory region with the
  same random sequence will reproduce source contents of the memory region.
  Please take into account that size of the memory fragments (in bytes) must
  be equal (or be divisible by 4) in both cases. Don't use the same sequence
  with an other data. }

procedure MT_SecureRandXOR(ID: TMTID; P: Pointer; L: Cardinal);

{ MT_RandDone releases all memory resources which is occupied by the random
  number generator identified by ID. After that you cann't pass this ID into
  any functions. }

procedure MT_RandDone(ID: TMTID);

{ Some additional routines. }

{ MT_TimeStamp reads the current value of the processor's time-stamp counter
  using the RDTSC instruction. This instruction first came with the Pentium
  processor. The result of this function can be used during initialization
  of the MT random number generator (pass ...+IntToStr(MT_TimeStamp)+... into
  MT_RandUpdate procedure). It gives about 32 bits of random information. }

function MT_TimeStamp: Int64;

{ Q_CAST6SelfTest checks the CAST6-256 algorithm implementation by test
  vectors from RFC 2612. If this test passed successfully the function returns
  True else it returns False. The single specific feature of this CAST-256
  implementation is an inverse byte-ordering (endianess). This feature
  is not affected on security but some improve performance of the algorithm
  on PC-platform. }

function MT_CAST6SelfTest: Boolean;

{ Q_SHA1SelfTest checks the implementation of SHA-1 algorithm by test vectors
  which have been published by NIST (National Institute of Standards and
  Technology) in FIPS180-1 (Federal Information Processing Standards
  Publication 180-1). If this test has been passed successfully the function
  returns True else it returns False. }

function MT_SHA1SelfTest: Boolean;

{ Also you may add the definitions of other MT_XXX routines (which you can
  find in the implementation section) into the interface section of the unit. }

implementation

uses SysUtils;

type
  PByte = ^Byte;
  PLong = ^LongWord;

function MT_SameStr(const S1, S2: string): Boolean;
asm
        CMP     EAX,EDX
        JE      @@08
        TEST    EAX,EAX
        JE      @@qt2
        TEST    EDX,EDX
        JE      @@qt1
        MOV     ECX,[EAX-4]
        CMP     ECX,[EDX-4]
        JE      @@01
@@qt1:  XOR     EAX,EAX
@@qt2:  RET
@@01:   TEST    ECX,ECX
        JE      @@07
        PUSH    ESI
        PUSH    EBX
        MOV     ESI,ECX
@@lp1:  SUB     ECX,4
        JS      @@cb
        MOV     EBX,DWORD PTR [EAX+ECX]
        CMP     EBX,DWORD PTR [EDX+ECX]
        JE      @@lp1
        JMP     @@zq
@@cb:   TEST    ESI,3
        JE      @@eq
        DEC     ESI
        MOV     BL,BYTE PTR [EAX+ESI]
        XOR     BL,BYTE PTR [EDX+ESI]
        JE      @@cb
@@zq:   POP     EBX
        POP     ESI
@@07:   XOR     EAX,EAX
        RET
@@eq:   POP     EBX
        POP     ESI
@@08:   MOV     EAX,1
end;

function MT_TimeStamp: Int64;
asm
        DB      $0F,$31  // RDTSC
end;

procedure MT_ConvertError(const Msg: string);
begin
  raise EConvertError.Create(Msg);
end;

function MT_StrToCodes(const S: string): string;
asm
        TEST    EAX,EAX
        JE      @@cl
        MOV     ECX,[EAX-4]
        TEST    ECX,ECX
        JE      @@cl
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EBX,ECX
        MOV     EAX,EDX
        SHL     ECX,1
        XOR     EDX,EDX
        CALL    System.@LStrFromPCharLen
        MOV     EDI,[EDI]
@@lp:   MOV     AL,BYTE PTR [ESI]
        MOV     DL,AL
        SHR     AL,4
        AND     DL,$0F
        CMP     AL,$09
        JA      @@bd1
        ADD     AL,$30
        JMP     @@nx1
@@bd1:  ADD     AL,$37
@@nx1:  MOV     BYTE PTR [EDI],AL
        INC     EDI
        CMP     DL,$09
        JA      @@bd2
        ADD     DL,$30
        JMP     @@nx2
@@bd2:  ADD     DL,$37
@@nx2:  MOV     BYTE PTR [EDI],DL
        INC     ESI
        INC     EDI
        DEC     EBX
        JNE     @@lp
        POP     EDI
        POP     ESI
        POP     EBX
        RET
@@cl:   MOV     EAX,EDX
        CALL    System.@LStrClr
end;

function MT_CodesToStr(const S: string): string;
const
  Msg: string = 'Error during convertion string of hexadecimal codes into the string of characters';
asm
        TEST    EAX,EAX
        JE      @@cl
        MOV     ECX,[EAX-4]
        SHR     ECX,1
        JC      @@err1
        JE      @@cl
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EBX,ECX
        MOV     EAX,EDX
        XOR     EDX,EDX
        CALL    System.@LStrFromPCharLen
        MOV     EDI,[EDI]
@@lp:   MOV     AL,BYTE PTR [ESI]
        MOV     DL,BYTE PTR [ESI+1]
        SUB     AL,$30
        JB      @@err0
        SUB     DL,$30
        JB      @@err0
        CMP     AL,$09
        JBE     @@ct1
        SUB     AL,$11
        JB      @@err0
        CMP     AL,$05
        JBE     @@pt1
        SUB     AL,$20
        JB      @@err0
        CMP     AL,$05
        JA      @@err0
@@pt1:  ADD     AL,$0A
@@ct1:  SHL     AL,4
        CMP     DL,$09
        JBE     @@ct2
        SUB     DL,$11
        JB      @@err0
        CMP     DL,$05
        JBE     @@pt2
        SUB     DL,$20
        JB      @@err0
        CMP     DL,$05
        JA      @@err0
@@pt2:  ADD     DL,$0A
@@ct2:  OR      AL,DL
        MOV     BYTE PTR [EDI],AL
        ADD     ESI,2
        INC     EDI
        DEC     EBX
        JNE     @@lp
        POP     EDI
        POP     ESI
        POP     EBX
        RET
@@cl:   MOV     EAX,EDX
        CALL    System.@LStrClr
        RET
@@err0: POP     EDI
        POP     ESI
        POP     EBX
@@err1: MOV     EAX,Msg
        CALL    MT_ConvertError
end;

procedure MT_TinyFill(P: Pointer; L: Cardinal; Value: LongWord);
asm
        JMP     DWORD PTR @@tV[EDX*4]
@@tV:   DD      @@tu00, @@tu01, @@tu02, @@tu03
        DD      @@tu04, @@tu05, @@tu06, @@tu07
        DD      @@tu08, @@tu09, @@tu10, @@tu11
        DD      @@tu12, @@tu13, @@tu14, @@tu15
        DD      @@tu16, @@tu17, @@tu18, @@tu19
        DD      @@tu20, @@tu21, @@tu22, @@tu23
        DD      @@tu24, @@tu25, @@tu26, @@tu27
        DD      @@tu28, @@tu29, @@tu30, @@tu31
        DD      @@tu32
@@tu00: RET
@@tu01: MOV     BYTE PTR [EAX],CL
        RET
@@tu02: MOV     WORD PTR [EAX],CX
        RET
@@tu03: MOV     WORD PTR [EAX],CX
        MOV     BYTE PTR [EAX+2],CL
        RET
@@tu04: MOV     DWORD PTR [EAX],ECX
        RET
@@tu05: MOV     DWORD PTR [EAX],ECX
        MOV     BYTE PTR [EAX+4],CL
        RET
@@tu06: MOV     DWORD PTR [EAX],ECX
        MOV     WORD PTR [EAX+4],CX
        RET
@@tu07: MOV     DWORD PTR [EAX],ECX
        MOV     WORD PTR [EAX+4],CX
        MOV     BYTE PTR [EAX+6],CL
        RET
@@tu08: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        RET
@@tu09: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     BYTE PTR [EAX+8],CL
        RET
@@tu10: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     WORD PTR [EAX+8],CX
        RET
@@tu11: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     WORD PTR [EAX+8],CX
        MOV     BYTE PTR [EAX+10],CL
        RET
@@tu12: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        RET
@@tu13: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     BYTE PTR [EAX+12],CL
        RET
@@tu14: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     WORD PTR [EAX+12],CX
        RET
@@tu15: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     WORD PTR [EAX+12],CX
        MOV     BYTE PTR [EAX+14],CL
        RET
@@tu16: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        RET
@@tu17: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     BYTE PTR [EAX+16],CL
        RET
@@tu18: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     WORD PTR [EAX+16],CX
        RET
@@tu19: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     WORD PTR [EAX+16],CX
        MOV     BYTE PTR [EAX+18],CL
        RET
@@tu20: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        RET
@@tu21: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     BYTE PTR [EAX+20],CL
        RET
@@tu22: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     WORD PTR [EAX+20],CX
        RET
@@tu23: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     WORD PTR [EAX+20],CX
        MOV     BYTE PTR [EAX+22],CL
        RET
@@tu24: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        RET
@@tu25: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     BYTE PTR [EAX+24],CL
        RET
@@tu26: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     WORD PTR [EAX+24],CX
        RET
@@tu27: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     WORD PTR [EAX+24],CX
        MOV     BYTE PTR [EAX+26],CL
        RET
@@tu28: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     DWORD PTR [EAX+24],ECX
        RET
@@tu29: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     DWORD PTR [EAX+24],ECX
        MOV     BYTE PTR [EAX+28],CL
        RET
@@tu30: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     DWORD PTR [EAX+24],ECX
        MOV     WORD PTR [EAX+28],CX
        RET
@@tu31: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     DWORD PTR [EAX+24],ECX
        MOV     WORD PTR [EAX+28],CX
        MOV     BYTE PTR [EAX+30],CL
        RET
@@tu32: MOV     DWORD PTR [EAX],ECX
        MOV     DWORD PTR [EAX+4],ECX
        MOV     DWORD PTR [EAX+8],ECX
        MOV     DWORD PTR [EAX+12],ECX
        MOV     DWORD PTR [EAX+16],ECX
        MOV     DWORD PTR [EAX+20],ECX
        MOV     DWORD PTR [EAX+24],ECX
        MOV     DWORD PTR [EAX+28],ECX
end;

procedure MT_ZeroMem(P: Pointer; L: Cardinal);
asm
        CMP     EDX,32
        JA      @@nx
        XOR     ECX,ECX
        CALL    MT_TinyFill
        RET
@@nx:   PUSH    EDI
        MOV     ECX,EAX
        XOR     EAX,EAX
        MOV     EDI,ECX
        NEG     ECX
        AND     ECX,7
        SUB     EDX,ECX
        JMP     DWORD PTR @@bV[ECX*4]
@@bV:   DD      @@bu00, @@bu01, @@bu02, @@bu03
        DD      @@bu04, @@bu05, @@bu06, @@bu07
@@bu07: MOV     [EDI+06],AL
@@bu06: MOV     [EDI+05],AL
@@bu05: MOV     [EDI+04],AL
@@bu04: MOV     [EDI+03],AL
@@bu03: MOV     [EDI+02],AL
@@bu02: MOV     [EDI+01],AL
@@bu01: MOV     [EDI],AL
        ADD     EDI,ECX
@@bu00: MOV     ECX,EDX
        AND     EDX,3
        SHR     ECX,2
        REP     STOSD
        JMP     DWORD PTR @@tV[EDX*4]
@@tV:   DD      @@tu00, @@tu01, @@tu02, @@tu03
@@tu03: MOV     [EDI+02],AL
@@tu02: MOV     [EDI+01],AL
@@tu01: MOV     [EDI],AL
@@tu00: POP     EDI
end;

procedure MT_CopyMem(Source, Dest: Pointer; L: Cardinal);
asm
        PUSH    EDI
        PUSH    ESI
        MOV     EDI,EDX
        MOV     EDX,ECX
        MOV     ESI,EAX
        TEST    EDI,3
        JNE     @@cl
        SHR     ECX,2
        AND     EDX,3
        CMP     ECX,16
        JBE     @@cw
        REP     MOVSD
        JMP     DWORD PTR @@tV[EDX*4]
@@cl:   MOV     EAX,EDI
        MOV     EDX,3
        SUB     ECX,4
        JB      @@bc
        AND     EAX,3
        ADD     ECX,EAX
        JMP     DWORD PTR @@lV[EAX*4-4]
@@bc:   JMP     DWORD PTR @@tV[ECX*4+16]
@@cw:   JMP     DWORD PTR @@wV[ECX*4]
@@lV:   DD      @@l1, @@l2, @@l3
@@l1:   AND     EDX,ECX
        MOV     AL,[ESI]
        MOV     [EDI],AL
        MOV     AL,[ESI+1]
        MOV     [EDI+1],AL
        MOV     AL,[ESI+2]
        SHR     ECX,2
        MOV     [EDI+2],AL
        ADD     ESI,3
        ADD     EDI,3
        CMP     ECX,16
        JBE     @@cw
        REP     MOVSD
        JMP     DWORD PTR @@tV[EDX*4]
@@l2:   AND     EDX,ECX
        MOV     AL,[ESI]
        MOV     [EDI],AL
        MOV     AL,[ESI+1]
        SHR     ECX,2
        MOV     [EDI+1],AL
        ADD     ESI,2
        ADD     EDI,2
        CMP     ECX,16
        JBE     @@cw
        REP     MOVSD
        JMP     DWORD PTR @@tV[EDX*4]
@@l3:   AND     EDX,ECX
        MOV     AL,[ESI]
        MOV     [EDI],AL
        INC     ESI
        SHR     ECX,2
        INC     EDI
        CMP     ECX,16
        JBE     @@cw
        REP     MOVSD
        JMP     DWORD PTR @@tV[EDX*4]
@@wV:   DD      @@w0, @@w1, @@w2, @@w3
        DD      @@w4, @@w5, @@w6, @@w7
        DD      @@w8, @@w9, @@w10, @@w11
        DD      @@w12, @@w13, @@w14, @@w15
        DD      @@w16
@@w16:  MOV     EAX,[ESI+ECX*4-64]
        MOV     [EDI+ECX*4-64],EAX
@@w15:  MOV     EAX,[ESI+ECX*4-60]
        MOV     [EDI+ECX*4-60],EAX
@@w14:  MOV     EAX,[ESI+ECX*4-56]
        MOV     [EDI+ECX*4-56],EAX
@@w13:  MOV     EAX,[ESI+ECX*4-52]
        MOV     [EDI+ECX*4-52],EAX
@@w12:  MOV     EAX,[ESI+ECX*4-48]
        MOV     [EDI+ECX*4-48],EAX
@@w11:  MOV     EAX,[ESI+ECX*4-44]
        MOV     [EDI+ECX*4-44],EAX
@@w10:  MOV     EAX,[ESI+ECX*4-40]
        MOV     [EDI+ECX*4-40],EAX
@@w9:   MOV     EAX,[ESI+ECX*4-36]
        MOV     [EDI+ECX*4-36],EAX
@@w8:   MOV     EAX,[ESI+ECX*4-32]
        MOV     [EDI+ECX*4-32],EAX
@@w7:   MOV     EAX,[ESI+ECX*4-28]
        MOV     [EDI+ECX*4-28],EAX
@@w6:   MOV     EAX,[ESI+ECX*4-24]
        MOV     [EDI+ECX*4-24],EAX
@@w5:   MOV     EAX,[ESI+ECX*4-20]
        mov     [EDI+ECX*4-20],EAX
@@w4:   MOV     EAX,[ESI+ECX*4-16]
        MOV     [EDI+ECX*4-16],EAX
@@w3:   MOV     EAX,[ESI+ECX*4-12]
        MOV     [EDI+ECX*4-12],EAX
@@w2:   MOV     EAX,[ESI+ECX*4-8]
        MOV     [EDI+ECX*4-8],EAX
@@w1:   MOV     EAX,[ESI+ECX*4-4]
        MOV     [EDI+ECX*4-4],EAX
        LEA     EAX,[ECX*4]
        ADD     ESI,EAX
        ADD     EDI,EAX
@@w0:   JMP     DWORD PTR @@tV[EDX*4]
@@tV:   DD      @@t0, @@t1, @@t2, @@t3
@@t0:   POP     ESI
        POP     EDI
        RET
@@t1:   MOV     AL,[ESI]
        MOV     [EDI],AL
        POP     ESI
        POP     EDI
        RET
@@t2:   MOV     AL,[ESI]
        MOV     [EDI],AL
        MOV     AL,[ESI+1]
        MOV     [EDI+1],AL
        POP     ESI
        POP     EDI
        RET
@@t3:   MOV     AL,[ESI]
        MOV     [EDI],AL
        MOV     AL,[ESI+1]
        MOV     [EDI+1],AL
        MOV     AL,[ESI+2]
        MOV     [EDI+2],AL
        POP     ESI
        POP     EDI
end;

procedure MT_CopyLongs(Source, Dest: Pointer; Count: Cardinal);
asm
        XCHG    ESI,EAX
        XCHG    EDI,EDX
        REP     MOVSD
        MOV     ESI,EAX
        MOV     EDI,EDX
end;

procedure MT_BSwapLongs(P: Pointer; Count: Cardinal);
asm
        PUSH    EBX
        MOV     ECX,EDX
        SHR     EDX,3
        JE      @@nx
@@lp1:  MOV     EBX,[EAX]
        BSWAP   EBX
        MOV     [EAX],EBX
        MOV     EBX,[EAX+4]
        BSWAP   EBX
        MOV     [EAX+4],EBX
        MOV     EBX,[EAX+8]
        BSWAP   EBX
        MOV     [EAX+8],EBX
        MOV     EBX,[EAX+12]
        BSWAP   EBX
        MOV     [EAX+12],EBX
        MOV     EBX,[EAX+16]
        BSWAP   EBX
        MOV     [EAX+16],EBX
        MOV     EBX,[EAX+20]
        BSWAP   EBX
        MOV     [EAX+20],EBX
        MOV     EBX,[EAX+24]
        BSWAP   EBX
        MOV     [EAX+24],EBX
        MOV     EBX,[EAX+28]
        BSWAP   EBX
        MOV     [EAX+28],EBX
        ADD     EAX,32
        DEC     EDX
        JNE     @@lp1
@@nx:   AND     ECX,7
        JE      @@qt
@@lp2:  MOV     EBX,DWORD PTR [EAX]
        BSWAP   EBX
        MOV     DWORD PTR [EAX],EBX
        ADD     EAX,4
        DEC     ECX
        JNE     @@lp2
@@qt:   POP     EBX
end;

procedure IntFill16(P: Pointer; V: LongWord);
asm
        MOV     [EAX],EDX
        MOV     [EAX+4],EDX
        MOV     [EAX+8],EDX
        MOV     [EAX+12],EDX
        MOV     [EAX+16],EDX
        MOV     [EAX+20],EDX
        MOV     [EAX+24],EDX
        MOV     [EAX+28],EDX
        MOV     [EAX+32],EDX
        MOV     [EAX+36],EDX
        MOV     [EAX+40],EDX
        MOV     [EAX+44],EDX
        MOV     [EAX+48],EDX
        MOV     [EAX+52],EDX
        MOV     [EAX+56],EDX
        MOV     [EAX+60],EDX
end;

procedure IntFill32(P: Pointer; V: LongWord);
asm
        MOV     [EAX],EDX
        MOV     [EAX+4],EDX
        MOV     [EAX+8],EDX
        MOV     [EAX+12],EDX
        MOV     [EAX+16],EDX
        MOV     [EAX+20],EDX
        MOV     [EAX+24],EDX
        MOV     [EAX+28],EDX
        MOV     [EAX+32],EDX
        MOV     [EAX+36],EDX
        MOV     [EAX+40],EDX
        MOV     [EAX+44],EDX
        MOV     [EAX+48],EDX
        MOV     [EAX+52],EDX
        MOV     [EAX+56],EDX
        MOV     [EAX+60],EDX
        MOV     [EAX+64],EDX
        MOV     [EAX+68],EDX
        MOV     [EAX+72],EDX
        MOV     [EAX+76],EDX
        MOV     [EAX+80],EDX
        MOV     [EAX+84],EDX
        MOV     [EAX+88],EDX
        MOV     [EAX+92],EDX
        MOV     [EAX+96],EDX
        MOV     [EAX+100],EDX
        MOV     [EAX+104],EDX
        MOV     [EAX+108],EDX
        MOV     [EAX+112],EDX
        MOV     [EAX+116],EDX
        MOV     [EAX+120],EDX
        MOV     [EAX+124],EDX
end;

const
  CAST_S1_SBox: array[0..255] of LongWord =
    ($30FB40D4,$9FA0FF0B,$6BECCD2F,$3F258C7A,$1E213F2F,$9C004DD3,$6003E540,$CF9FC949,
     $BFD4AF27,$88BBBDB5,$E2034090,$98D09675,$6E63A0E0,$15C361D2,$C2E7661D,$22D4FF8E,
     $28683B6F,$C07FD059,$FF2379C8,$775F50E2,$43C340D3,$DF2F8656,$887CA41A,$A2D2BD2D,
     $A1C9E0D6,$346C4819,$61B76D87,$22540F2F,$2ABE32E1,$AA54166B,$22568E3A,$A2D341D0,
     $66DB40C8,$A784392F,$004DFF2F,$2DB9D2DE,$97943FAC,$4A97C1D8,$527644B7,$B5F437A7,
     $B82CBAEF,$D751D159,$6FF7F0ED,$5A097A1F,$827B68D0,$90ECF52E,$22B0C054,$BC8E5935,
     $4B6D2F7F,$50BB64A2,$D2664910,$BEE5812D,$B7332290,$E93B159F,$B48EE411,$4BFF345D,
     $FD45C240,$AD31973F,$C4F6D02E,$55FC8165,$D5B1CAAD,$A1AC2DAE,$A2D4B76D,$C19B0C50,
     $882240F2,$0C6E4F38,$A4E4BFD7,$4F5BA272,$564C1D2F,$C59C5319,$B949E354,$B04669FE,
     $B1B6AB8A,$C71358DD,$6385C545,$110F935D,$57538AD5,$6A390493,$E63D37E0,$2A54F6B3,
     $3A787D5F,$6276A0B5,$19A6FCDF,$7A42206A,$29F9D4D5,$F61B1891,$BB72275E,$AA508167,
     $38901091,$C6B505EB,$84C7CB8C,$2AD75A0F,$874A1427,$A2D1936B,$2AD286AF,$AA56D291,
     $D7894360,$425C750D,$93B39E26,$187184C9,$6C00B32D,$73E2BB14,$A0BEBC3C,$54623779,
     $64459EAB,$3F328B82,$7718CF82,$59A2CEA6,$04EE002E,$89FE78E6,$3FAB0950,$325FF6C2,
     $81383F05,$6963C5C8,$76CB5AD6,$D49974C9,$CA180DCF,$380782D5,$C7FA5CF6,$8AC31511,
     $35E79E13,$47DA91D0,$F40F9086,$A7E2419E,$31366241,$051EF495,$AA573B04,$4A805D8D,
     $548300D0,$00322A3C,$BF64CDDF,$BA57A68E,$75C6372B,$50AFD341,$A7C13275,$915A0BF5,
     $6B54BFAB,$2B0B1426,$AB4CC9D7,$449CCD82,$F7FBF265,$AB85C5F3,$1B55DB94,$AAD4E324,
     $CFA4BD3F,$2DEAA3E2,$9E204D02,$C8BD25AC,$EADF55B3,$D5BD9E98,$E31231B2,$2AD5AD6C,
     $954329DE,$ADBE4528,$D8710F69,$AA51C90F,$AA786BF6,$22513F1E,$AA51A79B,$2AD344CC,
     $7B5A41F0,$D37CFBAD,$1B069505,$41ECE491,$B4C332E6,$032268D4,$C9600ACC,$CE387E6D,
     $BF6BB16C,$6A70FB78,$0D03D9C9,$D4DF39DE,$E01063DA,$4736F464,$5AD328D8,$B347CC96,
     $75BB0FC3,$98511BFB,$4FFBCC35,$B58BCF6A,$E11F0ABC,$BFC5FE4A,$A70AEC10,$AC39570A,
     $3F04442F,$6188B153,$E0397A2E,$5727CB79,$9CEB418F,$1CACD68D,$2AD37C96,$0175CB9D,
     $C69DFF09,$C75B65F0,$D9DB40D8,$EC0E7779,$4744EAD4,$B11C3274,$DD24CB9E,$7E1C54BD,
     $F01144F9,$D2240EB1,$9675B3FD,$A3AC3755,$D47C27AF,$51C85F4D,$56907596,$A5BB15E6,
     $580304F0,$CA042CF1,$011A37EA,$8DBFAADB,$35BA3E4A,$3526FFA0,$C37B4D09,$BC306ED9,
     $98A52666,$5648F725,$FF5E569D,$0CED63D0,$7C63B2CF,$700B45E1,$D5EA50F1,$85A92872,
     $AF1FBDA7,$D4234870,$A7870BF3,$2D3B4D79,$42E04198,$0CD0EDE7,$26470DB8,$F881814C,
     $474D6AD7,$7C0C5E5C,$D1231959,$381B7298,$F5D2F4DB,$AB838653,$6E2F1E23,$83719C9E,
     $BD91E046,$9A56456E,$DC39200C,$20C8C571,$962BDA1C,$E1E696FF,$B141AB08,$7CCA89B9,
     $1A69E783,$02CC4843,$A2F7C579,$429EF47D,$427B169C,$5AC9F049,$DD8F0F00,$5C8165BF);

  CAST_S2_SBox: array[0..255] of LongWord =
    ($1F201094,$EF0BA75B,$69E3CF7E,$393F4380,$FE61CF7A,$EEC5207A,$55889C94,$72FC0651,
     $ADA7EF79,$4E1D7235,$D55A63CE,$DE0436BA,$99C430EF,$5F0C0794,$18DCDB7D,$A1D6EFF3,
     $A0B52F7B,$59E83605,$EE15B094,$E9FFD909,$DC440086,$EF944459,$BA83CCB3,$E0C3CDFB,
     $D1DA4181,$3B092AB1,$F997F1C1,$A5E6CF7B,$01420DDB,$E4E7EF5B,$25A1FF41,$E180F806,
     $1FC41080,$179BEE7A,$D37AC6A9,$FE5830A4,$98DE8B7F,$77E83F4E,$79929269,$24FA9F7B,
     $E113C85B,$ACC40083,$D7503525,$F7EA615F,$62143154,$0D554B63,$5D681121,$C866C359,
     $3D63CF73,$CEE234C0,$D4D87E87,$5C672B21,$071F6181,$39F7627F,$361E3084,$E4EB573B,
     $602F64A4,$D63ACD9C,$1BBC4635,$9E81032D,$2701F50C,$99847AB4,$A0E3DF79,$BA6CF38C,
     $10843094,$2537A95E,$F46F6FFE,$A1FF3B1F,$208CFB6A,$8F458C74,$D9E0A227,$4EC73A34,
     $FC884F69,$3E4DE8DF,$EF0E0088,$3559648D,$8A45388C,$1D804366,$721D9BFD,$A58684BB,
     $E8256333,$844E8212,$128D8098,$FED33FB4,$CE280AE1,$27E19BA5,$D5A6C252,$E49754BD,
     $C5D655DD,$EB667064,$77840B4D,$A1B6A801,$84DB26A9,$E0B56714,$21F043B7,$E5D05860,
     $54F03084,$066FF472,$A31AA153,$DADC4755,$B5625DBF,$68561BE6,$83CA6B94,$2D6ED23B,
     $ECCF01DB,$A6D3D0BA,$B6803D5C,$AF77A709,$33B4A34C,$397BC8D6,$5EE22B95,$5F0E5304,
     $81ED6F61,$20E74364,$B45E1378,$DE18639B,$881CA122,$B96726D1,$8049A7E8,$22B7DA7B,
     $5E552D25,$5272D237,$79D2951C,$C60D894C,$488CB402,$1BA4FE5B,$A4B09F6B,$1CA815CF,
     $A20C3005,$8871DF63,$B9DE2FCB,$0CC6C9E9,$0BEEFF53,$E3214517,$B4542835,$9F63293C,
     $EE41E729,$6E1D2D7C,$50045286,$1E6685F3,$F33401C6,$30A22C95,$31A70850,$60930F13,
     $73F98417,$A1269859,$EC645C44,$52C877A9,$CDFF33A6,$A02B1741,$7CBAD9A2,$2180036F,
     $50D99C08,$CB3F4861,$C26BD765,$64A3F6AB,$80342676,$25A75E7B,$E4E6D1FC,$20C710E6,
     $CDF0B680,$17844D3B,$31EEF84D,$7E0824E4,$2CCB49EB,$846A3BAE,$8FF77888,$EE5D60F6,
     $7AF75673,$2FDD5CDB,$A11631C1,$30F66F43,$B3FAEC54,$157FD7FA,$EF8579CC,$D152DE58,
     $DB2FFD5E,$8F32CE19,$306AF97A,$02F03EF8,$99319AD5,$C242FA0F,$A7E3EBB0,$C68E4906,
     $B8DA230C,$80823028,$DCDEF3C8,$D35FB171,$088A1BC8,$BEC0C560,$61A3C9E8,$BCA8F54D,
     $C72FEFFA,$22822E99,$82C570B4,$D8D94E89,$8B1C34BC,$301E16E6,$273BE979,$B0FFEAA6,
     $61D9B8C6,$00B24869,$B7FFCE3F,$08DC283B,$43DAF65A,$F7E19798,$7619B72F,$8F1C9BA4,
     $DC8637A0,$16A7D3B1,$9FC393B7,$A7136EEB,$C6BCC63E,$1A513742,$EF6828BC,$520365D6,
     $2D6A77AB,$3527ED4B,$821FD216,$095C6E2E,$DB92F2FB,$5EEA29CB,$145892F5,$91584F7F,
     $5483697B,$2667A8CC,$85196048,$8C4BACEA,$833860D4,$0D23E0F9,$6C387E8A,$0AE6D249,
     $B284600C,$D835731D,$DCB1C647,$AC4C56EA,$3EBD81B3,$230EABB0,$6438BC87,$F0B5B1FA,
     $8F5EA2B3,$FC184642,$0A036B7A,$4FB089BD,$649DA589,$A345415E,$5C038323,$3E5D3BB9,
     $43D79572,$7E6DD07C,$06DFDF1E,$6C6CC4EF,$7160A539,$73BFBE70,$83877605,$4523ECF1);

  CAST_S3_SBox: array[0..255] of LongWord =
    ($8DEFC240,$25FA5D9F,$EB903DBF,$E810C907,$47607FFF,$369FE44B,$8C1FC644,$AECECA90,
     $BEB1F9BF,$EEFBCAEA,$E8CF1950,$51DF07AE,$920E8806,$F0AD0548,$E13C8D83,$927010D5,
     $11107D9F,$07647DB9,$B2E3E4D4,$3D4F285E,$B9AFA820,$FADE82E0,$A067268B,$8272792E,
     $553FB2C0,$489AE22B,$D4EF9794,$125E3FBC,$21FFFCEE,$825B1BFD,$9255C5ED,$1257A240,
     $4E1A8302,$BAE07FFF,$528246E7,$8E57140E,$3373F7BF,$8C9F8188,$A6FC4EE8,$C982B5A5,
     $A8C01DB7,$579FC264,$67094F31,$F2BD3F5F,$40FFF7C1,$1FB78DFC,$8E6BD2C1,$437BE59B,
     $99B03DBF,$B5DBC64B,$638DC0E6,$55819D99,$A197C81C,$4A012D6E,$C5884A28,$CCC36F71,
     $B843C213,$6C0743F1,$8309893C,$0FEDDD5F,$2F7FE850,$D7C07F7E,$02507FBF,$5AFB9A04,
     $A747D2D0,$1651192E,$AF70BF3E,$58C31380,$5F98302E,$727CC3C4,$0A0FB402,$0F7FEF82,
     $8C96FDAD,$5D2C2AAE,$8EE99A49,$50DA88B8,$8427F4A0,$1EAC5790,$796FB449,$8252DC15,
     $EFBD7D9B,$A672597D,$ADA840D8,$45F54504,$FA5D7403,$E83EC305,$4F91751A,$925669C2,
     $23EFE941,$A903F12E,$60270DF2,$0276E4B6,$94FD6574,$927985B2,$8276DBCB,$02778176,
     $F8AF918D,$4E48F79E,$8F616DDF,$E29D840E,$842F7D83,$340CE5C8,$96BBB682,$93B4B148,
     $EF303CAB,$984FAF28,$779FAF9B,$92DC560D,$224D1E20,$8437AA88,$7D29DC96,$2756D3DC,
     $8B907CEE,$B51FD240,$E7C07CE3,$E566B4A1,$C3E9615E,$3CF8209D,$6094D1E3,$CD9CA341,
     $5C76460E,$00EA983B,$D4D67881,$FD47572C,$F76CEDD9,$BDA8229C,$127DADAA,$438A074E,
     $1F97C090,$081BDB8A,$93A07EBE,$B938CA15,$97B03CFF,$3DC2C0F8,$8D1AB2EC,$64380E51,
     $68CC7BFB,$D90F2788,$12490181,$5DE5FFD4,$DD7EF86A,$76A2E214,$B9A40368,$925D958F,
     $4B39FFFA,$BA39AEE9,$A4FFD30B,$FAF7933B,$6D498623,$193CBCFA,$27627545,$825CF47A,
     $61BD8BA0,$D11E42D1,$CEAD04F4,$127EA392,$10428DB7,$8272A972,$9270C4A8,$127DE50B,
     $285BA1C8,$3C62F44F,$35C0EAA5,$E805D231,$428929FB,$B4FCDF82,$4FB66A53,$0E7DC15B,
     $1F081FAB,$108618AE,$FCFD086D,$F9FF2889,$694BCC11,$236A5CAE,$12DECA4D,$2C3F8CC5,
     $D2D02DFE,$F8EF5896,$E4CF52DA,$95155B67,$494A488C,$B9B6A80C,$5C8F82BC,$89D36B45,
     $3A609437,$EC00C9A9,$44715253,$0A874B49,$D773BC40,$7C34671C,$02717EF6,$4FEB5536,
     $A2D02FFF,$D2BF60C4,$D43F03C0,$50B4EF6D,$07478CD1,$006E1888,$A2E53F55,$B9E6D4BC,
     $A2048016,$97573833,$D7207D67,$DE0F8F3D,$72F87B33,$ABCC4F33,$7688C55D,$7B00A6B0,
     $947B0001,$570075D2,$F9BB88F8,$8942019E,$4264A5FF,$856302E0,$72DBD92B,$EE971B69,
     $6EA22FDE,$5F08AE2B,$AF7A616D,$E5C98767,$CF1FEBD2,$61EFC8C2,$F1AC2571,$CC8239C2,
     $67214CB8,$B1E583D1,$B7DC3E62,$7F10BDCE,$F90A5C38,$0FF0443D,$606E6DC6,$60543A49,
     $5727C148,$2BE98A1D,$8AB41738,$20E1BE24,$AF96DA0F,$68458425,$99833BE5,$600D457D,
     $282F9350,$8334B362,$D91D1120,$2B6D8DA0,$642B1E31,$9C305A00,$52BCE688,$1B03588A,
     $F7BAEFD5,$4142ED9C,$A4315C11,$83323EC5,$DFEF4636,$A133C501,$E9D3531C,$EE353783);

  CAST_S4_SBox: array[0..255] of LongWord =
    ($9DB30420,$1FB6E9DE,$A7BE7BEF,$D273A298,$4A4F7BDB,$64AD8C57,$85510443,$FA020ED1,
     $7E287AFF,$E60FB663,$095F35A1,$79EBF120,$FD059D43,$6497B7B1,$F3641F63,$241E4ADF,
     $28147F5F,$4FA2B8CD,$C9430040,$0CC32220,$FDD30B30,$C0A5374F,$1D2D00D9,$24147B15,
     $EE4D111A,$0FCA5167,$71FF904C,$2D195FFE,$1A05645F,$0C13FEFE,$081B08CA,$05170121,
     $80530100,$E83E5EFE,$AC9AF4F8,$7FE72701,$D2B8EE5F,$06DF4261,$BB9E9B8A,$7293EA25,
     $CE84FFDF,$F5718801,$3DD64B04,$A26F263B,$7ED48400,$547EEBE6,$446D4CA0,$6CF3D6F5,
     $2649ABDF,$AEA0C7F5,$36338CC1,$503F7E93,$D3772061,$11B638E1,$72500E03,$F80EB2BB,
     $ABE0502E,$EC8D77DE,$57971E81,$E14F6746,$C9335400,$6920318F,$081DBB99,$FFC304A5,
     $4D351805,$7F3D5CE3,$A6C866C6,$5D5BCCA9,$DAEC6FEA,$9F926F91,$9F46222F,$3991467D,
     $A5BF6D8E,$1143C44F,$43958302,$D0214EEB,$022083B8,$3FB6180C,$18F8931E,$281658E6,
     $26486E3E,$8BD78A70,$7477E4C1,$B506E07C,$F32D0A25,$79098B02,$E4EABB81,$28123B23,
     $69DEAD38,$1574CA16,$DF871B62,$211C40B7,$A51A9EF9,$0014377B,$041E8AC8,$09114003,
     $BD59E4D2,$E3D156D5,$4FE876D5,$2F91A340,$557BE8DE,$00EAE4A7,$0CE5C2EC,$4DB4BBA6,
     $E756BDFF,$DD3369AC,$EC17B035,$06572327,$99AFC8B0,$56C8C391,$6B65811C,$5E146119,
     $6E85CB75,$BE07C002,$C2325577,$893FF4EC,$5BBFC92D,$D0EC3B25,$B7801AB7,$8D6D3B24,
     $20C763EF,$C366A5FC,$9C382880,$0ACE3205,$AAC9548A,$ECA1D7C7,$041AFA32,$1D16625A,
     $6701902C,$9B757A54,$31D477F7,$9126B031,$36CC6FDB,$C70B8B46,$D9E66A48,$56E55A79,
     $026A4CEB,$52437EFF,$2F8F76B4,$0DF980A5,$8674CDE3,$EDDA04EB,$17A9BE04,$2C18F4DF,
     $B7747F9D,$AB2AF7B4,$EFC34D20,$2E096B7C,$1741A254,$E5B6A035,$213D42F6,$2C1C7C26,
     $61C2F50F,$6552DAF9,$D2C231F8,$25130F69,$D8167FA2,$0418F2C8,$001A96A6,$0D1526AB,
     $63315C21,$5E0A72EC,$49BAFEFD,$187908D9,$8D0DBD86,$311170A7,$3E9B640C,$CC3E10D7,
     $D5CAD3B6,$0CAEC388,$F73001E1,$6C728AFF,$71EAE2A1,$1F9AF36E,$CFCBD12F,$C1DE8417,
     $AC07BE6B,$CB44A1D8,$8B9B0F56,$013988C3,$B1C52FCA,$B4BE31CD,$D8782806,$12A3A4E2,
     $6F7DE532,$58FD7EB6,$D01EE900,$24ADFFC2,$F4990FC5,$9711AAC5,$001D7B95,$82E5E7D2,
     $109873F6,$00613096,$C32D9521,$ADA121FF,$29908415,$7FBB977F,$AF9EB3DB,$29C9ED2A,
     $5CE2A465,$A730F32C,$D0AA3FE8,$8A5CC091,$D49E2CE7,$0CE454A9,$D60ACD86,$015F1919,
     $77079103,$DEA03AF6,$78A8565E,$DEE356DF,$21F05CBE,$8B75E387,$B3C50651,$B8A5C3EF,
     $D8EEB6D2,$E523BE77,$C2154529,$2F69EFDF,$AFE67AFB,$F470C4B2,$F3E0EB5B,$D6CC9876,
     $39E4460C,$1FDA8538,$1987832F,$CA007367,$A99144F8,$296B299E,$492FC295,$9266BEAB,
     $B5676E69,$9BD3DDDA,$DF7E052F,$DB25701C,$1B5E51EE,$F65324E6,$6AFCE36C,$0316CC04,
     $8644213E,$B7DC59D0,$7965291F,$CCD6FD43,$41823979,$932BCDF6,$B657C34D,$4EDFD282,
     $7AE5290C,$3CB9536B,$851E20FE,$9833557E,$13ECF0B0,$D3FFB372,$3F85C5C1,$0AEF7ED2);

procedure CAST_Qi(BETA, KrKm: Pointer);
asm
        MOV     EAX,[EDI+12]
        MOV     ECX,[ESI]
        MOV     EDX,[ESI+4]
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[ESI+8]
        XOR     EAX,[EDI+8]
        MOV     EDX,[ESI+12]
        MOV     [EDI+8],EAX
        XOR     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        SUB     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        ADD     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        XOR     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[ESI+16]
        XOR     EAX,[EDI+4]
        MOV     EDX,[ESI+20]
        MOV     [EDI+4],EAX
        SUB     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        ADD     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        XOR     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        SUB     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[ESI+24]
        XOR     EAX,[EDI]
        MOV     EDX,[ESI+28]
        MOV     [EDI],EAX
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        XOR     [EDI+12],EAX
end;

procedure CAST_QBARi(BETA, KrKm: Pointer);
asm
        MOV     EAX,[EDI]
        MOV     EDX,[ESI+28]
        MOV     ECX,[ESI+24]
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     EDX,[ESI+20]
        XOR     [EDI+12],EAX
        MOV     EAX,[EDI+4]
        MOV     ECX,[ESI+16]
        SUB     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        ADD     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        XOR     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        SUB     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     EDX,[ESI+12]
        XOR     [EDI],EAX
        MOV     EAX,[EDI+8]
        MOV     ECX,[ESI+8]
        XOR     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        SUB     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        ADD     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        XOR     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     EDX,[ESI+4]
        XOR     [EDI+4],EAX
        MOV     EAX,[EDI+12]
        MOV     ECX,[ESI]
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        XOR     [EDI+8],EAX
end;

procedure CAST_Wi(KAPPA, TmTrAdr: Pointer);
asm
	MOV	EAX,[EDI+64]
	MOV	EDX,[EDI+68]
        MOV     [EDI],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+4],ECX
        ADD     EDX,17
        MOV     [EDI+8],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+12],ECX
        ADD     EDX,17
        MOV     [EDI+16],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+20],ECX
        ADD     EDX,17
        MOV     [EDI+24],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+28],ECX
        ADD     EDX,17
        MOV     [EDI+32],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+36],ECX
        ADD     EDX,17
        MOV     [EDI+40],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+44],ECX
        ADD     EDX,17
        MOV     [EDI+48],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+52],ECX
        ADD     EDX,17
        MOV     [EDI+56],EAX
        LEA     ECX,[EDX+16]
        ADD     EAX,$6ED9EBA1
        MOV     [EDI+60],ECX
        ADD     EDX,17
	MOV	[EDI+64],EAX
	MOV	[EDI+68],EDX
        MOV     EAX,[ESI+28]
        MOV     EDX,[EDI]
        MOV     ECX,[EDI+4]
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+12]
        XOR     EAX,[ESI+24]
        MOV     EDX,[EDI+8]
        MOV     [ESI+24],EAX
        XOR     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        SUB     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        ADD     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        XOR     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+20]
        XOR     EAX,[ESI+20]
        MOV     EDX,[EDI+16]
        MOV     [ESI+20],EAX
        SUB     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        ADD     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        XOR     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        SUB     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+28]
        XOR     EAX,[ESI+16]
        MOV     EDX,[EDI+24]
        MOV     [ESI+16],EAX
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+36]
        XOR     EAX,[ESI+12]
        MOV     EDX,[EDI+32]
        MOV     [ESI+12],EAX
        XOR     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        SUB     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        ADD     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        XOR     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+44]
        XOR     EAX,[ESI+8]
        MOV     EDX,[EDI+40]
        MOV     [ESI+8],EAX
        SUB     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        ADD     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        XOR     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        SUB     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+52]
        XOR     EAX,[ESI+4]
        MOV     EDX,[EDI+48]
        MOV     [ESI+4],EAX
        ADD     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        XOR     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        SUB     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        ADD     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        MOV     ECX,[EDI+60]
        XOR     EAX,[ESI]
        MOV     EDX,[EDI+56]
        MOV     [ESI],EAX
        XOR     EDX,EAX
        ROL     EDX,CL
        MOVZX   ECX,DH
        MOV     EAX,DWORD PTR [ECX*4+CAST_S1_SBox]
        MOVZX   ECX,DL
        SHR     EDX,16
        SUB     EAX,DWORD PTR [ECX*4+CAST_S2_SBox]
        MOVZX   ECX,DH
        MOVZX   EDX,DL
        ADD     EAX,DWORD PTR [ECX*4+CAST_S3_SBox]
        XOR     EAX,DWORD PTR [EDX*4+CAST_S4_SBox]
        XOR     [ESI+28],EAX
end;

type
  PCAST6Data = ^TCAST6Data;
  TCAST6Data = record
    Vec: TCAST6InitVector;
    KeyData: array[0..95] of LongWord;
  end;

procedure IntCAST6KeySchedule(ID: TCASTID; Key: Pointer; KeyLen: Cardinal);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        XOR     EBX,EBX
        SUB     ESP,$20
        MOV     ESI,ESP
        MOV     [EAX],EBX
        MOV     [EAX+4],EBX
        MOV     [EAX+8],EBX
        MOV     [EAX+12],EBX
        MOV     [ESI],EBX
        MOV     [ESI+4],EBX
        MOV     [ESI+8],EBX
        MOV     [ESI+12],EBX
        MOV     [ESI+16],EBX
        MOV     [ESI+20],EBX
        MOV     [ESI+24],EBX
        MOV     [ESI+28],EBX
        LEA     EBX,[EAX+16]
        MOV     EDI,ECX
        SHR     ECX,2
        JE      @@nu1
@@m1:   MOV     EAX,[EDX]
        MOV     [ESI],EAX
        ADD     EDX,4
        ADD     ESI,4
        DEC     ECX
        JNE     @@m1
@@nu1:  AND     EDI,3
        JMP     DWORD PTR @@DtV[EDI*4]
@@DtV:  DD      @@Dt0,@@Dt1,@@Dt2,@@Dt3
@@Dt3:  MOV     AL,[EDX+2]
        MOV     [ESI+2],AL
@@Dt2:  MOV     AL,[EDX+1]
        MOV     [ESI+1],AL
@@Dt1:  MOV     AL,[EDX]
        MOV     [ESI],AL
@@Dt0:  MOV     ESI,ESP
	SUB	ESP,$48
	MOV	EDI,ESP
	MOV	EAX,$5A827999
	MOV	ECX,19
	MOV	[EDI+64],EAX
	MOV	[EDI+68],ECX
        MOV     EBP,12
@@lp:   CALL    CAST_Wi
        CALL    CAST_Wi
        MOV     EAX,[ESI]
        ADD     EAX,16
        MOV     [EBX],EAX
        MOV     EDX,[ESI+28]
        MOV     [EBX+4],EDX
        MOV     EAX,[ESI+8]
        ADD     EAX,16
        MOV     [EBX+8],EAX
        MOV     EDX,[ESI+20]
        MOV     [EBX+12],EDX
        MOV     EAX,[ESI+16]
        ADD     EAX,16
        MOV     [EBX+16],EAX
        MOV     EDX,[ESI+12]
        MOV     [EBX+20],EDX
        MOV     EAX,[ESI+24]
        ADD     EAX,16
        MOV     [EBX+24],EAX
        MOV     EDX,[ESI+4]
        MOV     [EBX+28],EDX
        ADD     EBX,32
        DEC     EBP
        JNE     @@lp
        XOR     EDX,EDX
        MOV     [EDI],EDX
        MOV     [EDI+4],EDX
        MOV     [EDI+8],EDX
        MOV     [EDI+12],EDX
        MOV     [EDI+16],EDX
        MOV     [EDI+20],EDX
        MOV     [EDI+24],EDX
        MOV     [EDI+28],EDX
        MOV     [EDI+32],EDX
        MOV     [EDI+36],EDX
        LEA     EAX,[EDI+40]
        CALL    IntFill16
        ADD     ESP,$68
        POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure MT_CAST6Init(var ID: TCASTID; Key: Pointer; KeyLen: Cardinal);
begin
  GetMem(PCAST6Data(ID),SizeOf(TCAST6Data));
  if KeyLen <= 32 then
    IntCAST6KeySchedule(ID,Key,KeyLen)
  else
    IntCAST6KeySchedule(ID,Key,32);
end;

procedure IntCAST6EncryptECB(ID: TCASTID; P: Pointer);
asm
        PUSH    ESI
        PUSH    EDI
        LEA     ESI,[EAX+16]
        MOV     EDI,EDX
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_Qi
        ADD     ESI,32
        CALL    CAST_QBARi
        ADD     ESI,32
        CALL    CAST_QBARi
        ADD     ESI,32
        CALL    CAST_QBARi
        ADD     ESI,32
        CALL    CAST_QBARi
        ADD     ESI,32
        CALL    CAST_QBARi
        ADD     ESI,32
        CALL    CAST_QBARi
        POP     EDI
        POP     ESI
end;

procedure IntCAST6DecryptECB(ID: TCASTID; P: Pointer);
asm
        PUSH    ESI
        PUSH    EDI
        LEA     ESI,[EAX+368]
        MOV     EDI,EDX
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_Qi
        SUB     ESI,32
        CALL    CAST_QBARi
        SUB     ESI,32
        CALL    CAST_QBARi
        SUB     ESI,32
        CALL    CAST_QBARi
        SUB     ESI,32
        CALL    CAST_QBARi
        SUB     ESI,32
        CALL    CAST_QBARi
        SUB     ESI,32
        CALL    CAST_QBARi
        POP     EDI
        POP     ESI
end;

{procedure MT_CAST6SetOrdinaryVector(ID: TCASTID);
asm
        MOV     EDX,$FFFFFFFF
        MOV     [EAX],EDX
        MOV     [EAX+4],EDX
        MOV     [EAX+8],EDX
        MOV     [EAX+12],EDX
        MOV     EDX,EAX
        CALL    IntCAST6EncryptECB
end;

procedure MT_CAST6SetInitVector(ID: TCASTID; const IV: TCAST6InitVector);
asm
        MOV     ECX,[EDX]
        MOV     [EAX],ECX
        MOV     ECX,[EDX+4]
        MOV     [EAX+4],ECX
        MOV     ECX,[EDX+8]
        MOV     [EAX+8],ECX
        MOV     ECX,[EDX+12]
        MOV     [EAX+12],ECX
end;

procedure MT_CAST6EncryptCBC(ID: TCASTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    ECX
        MOV     EBX,EAX
        MOV     ESI,ECX
        MOV     EDI,EDX
        SHR     ESI,4
        JE      @@nx
@@lp1:  MOV     EAX,[EDI]
        XOR     [EBX],EAX
        MOV     EAX,[EDI+4]
        XOR     [EBX+4],EAX
        MOV     EAX,[EDI+8]
        XOR     [EBX+8],EAX
        MOV     EAX,[EDI+12]
        XOR     [EBX+12],EAX
        MOV     EAX,EBX
        MOV     EDX,EBX
        CALL    IntCAST6EncryptECB
        MOV     EAX,[EBX]
        MOV     [EDI],EAX
        MOV     EAX,[EBX+4]
        MOV     [EDI+4],EAX
        MOV     EAX,[EBX+8]
        MOV     [EDI+8],EAX
        MOV     EAX,[EBX+12]
        MOV     [EDI+12],EAX
        ADD     EDI,$10
        DEC     ESI
        JNE     @@lp1
@@nx:   POP     ESI
        AND     ESI,$F
        JE      @@qt
        MOV     EAX,EBX
        MOV     EDX,EBX
        CALL    IntCAST6EncryptECB
        MOV     ECX,ESI
        SHR     ESI,2
        JE      @@uu
@@lp2:  MOV     EAX,[EBX]
        XOR     EAX,[EDI]
        MOV     [EBX],EAX
        MOV     [EDI],EAX
        ADD     EBX,4
        ADD     EDI,4
        DEC     ESI
        JNE     @@lp2
@@uu:   AND     ECX,3
        JE      @@qt
@@lp3:  MOV     AL,[EBX]
        XOR     AL,[EDI]
        MOV     [EBX],AL
        MOV     [EDI],AL
        INC     EBX
        INC     EDI
        DEC     ECX
        JNE     @@lp3
@@qt:   POP     EDI
        POP     ESI
        POP     EBX
end;

procedure MT_CAST6DecryptCBC(ID: TCASTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        MOV     EBX,EAX
        MOV     EBP,ECX
        SUB     ESP,$10
        MOV     EDI,EDX
        MOV     ESI,ESP
        PUSH    ECX
        SHR     EBP,4
        JE      @@nx
@@lp1:  MOV     EAX,[EDI]
        MOV     [ESI],EAX
        MOV     EAX,[EDI+4]
        MOV     [ESI+4],EAX
        MOV     EAX,[EDI+8]
        MOV     [ESI+8],EAX
        MOV     EAX,[EDI+12]
        MOV     [ESI+12],EAX
        MOV     EAX,EBX
        MOV     EDX,EDI
        CALL    IntCAST6DecryptECB
        MOV     EAX,[EBX]
        XOR     [EDI],EAX
        MOV     EAX,[EBX+4]
        XOR     [EDI+4],EAX
        MOV     EAX,[EBX+8]
        XOR     [EDI+8],EAX
        MOV     EAX,[EBX+12]
        XOR     [EDI+12],EAX
        MOV     EAX,[ESI]
        MOV     [EBX],EAX
        MOV     EAX,[ESI+4]
        MOV     [EBX+4],EAX
        MOV     EAX,[ESI+8]
        MOV     [EBX+8],EAX
        MOV     EAX,[ESI+12]
        MOV     [EBX+12],EAX
        ADD     EDI,$10
        DEC     EBP
        JNE     @@lp1
@@nx:   XOR     EDX,EDX
        POP     EBP
        MOV     [ESI],EDX
        MOV     [ESI+4],EDX
        MOV     [ESI+8],EDX
        MOV     [ESI+12],EDX
        ADD     ESP,$10
        AND     EBP,$F
        JE      @@qt
        MOV     EAX,EBX
        MOV     EDX,EBX
        CALL    IntCAST6EncryptECB
        MOV     ECX,EBP
        SHR     EBP,2
        JE      @@uu
@@lp2:  MOV     EAX,[EBX]
        MOV     EDX,[EDI]
        MOV     [EBX],EDX
        XOR     EAX,EDX
        MOV     [EDI],EAX
        ADD     EBX,4
        ADD     EDI,4
        DEC     EBP
        JNE     @@lp2
@@uu:   AND     ECX,3
        JE      @@qt
@@lp3:  MOV     AL,[EBX]
        MOV     DL,[EDI]
        MOV     [EBX],DL
        XOR     AL,DL
        MOV     [EDI],AL
        INC     EBX
        INC     EDI
        DEC     ECX
        JNE     @@lp3
@@qt:   POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure MT_CAST6EncryptCFB(ID: TCASTID; P: Pointer; L: Cardinal);
asm
        TEST    ECX,ECX
        JE      @@qt
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        MOV     EBX,EAX
        SUB     ESP,$10
        MOV     EDI,EDX
        MOV     ESI,ESP
        MOV     EBP,ECX
@@lp:   MOV     EAX,[EBX]
        MOV     [ESI],EAX
        MOV     EAX,[EBX+4]
        MOV     [ESI+4],EAX
        MOV     EAX,[EBX+8]
        MOV     [ESI+8],EAX
        MOV     EAX,[EBX+12]
        MOV     EDX,ESI
        MOV     [ESI+12],EAX
        MOV     EAX,EBX
        CALL    IntCAST6EncryptECB
        MOV     DL,[EDI]
        XOR     DL,[ESI]
        MOV     [EDI],DL
        MOV     AL,[EBX+1]
        MOV     [EBX],AL
        MOV     AL,[EBX+2]
        MOV     [EBX+1],AL
        MOV     AL,[EBX+3]
        MOV     [EBX+2],AL
        MOV     AL,[EBX+4]
        MOV     [EBX+3],AL
        MOV     AL,[EBX+5]
        MOV     [EBX+4],AL
        MOV     AL,[EBX+6]
        MOV     [EBX+5],AL
        MOV     AL,[EBX+7]
        MOV     [EBX+6],AL
        MOV     AL,[EBX+8]
        MOV     [EBX+7],AL
        MOV     AL,[EBX+9]
        MOV     [EBX+8],AL
        MOV     AL,[EBX+10]
        MOV     [EBX+9],AL
        MOV     AL,[EBX+11]
        MOV     [EBX+10],AL
        MOV     AL,[EBX+12]
        MOV     [EBX+11],AL
        MOV     AL,[EBX+13]
        MOV     [EBX+12],AL
        MOV     AL,[EBX+14]
        MOV     [EBX+13],AL
        MOV     AL,[EBX+15]
        MOV     [EBX+14],AL
        INC     EDI
        MOV     [EBX+15],DL
        DEC     EBP
        JNE     @@lp
        MOV     [ESI],EBP
        MOV     [ESI+4],EBP
        MOV     [ESI+8],EBP
        MOV     [ESI+12],EBP
        ADD     ESP,$10
        POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
@@qt:
end;

procedure MT_CAST6DecryptCFB(ID: TCASTID; P: Pointer; L: Cardinal);
asm
        TEST    ECX,ECX
        JE      @@qt
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        SUB     ESP,$10
        MOV     EBX,EAX
        MOV     EDI,EDX
        MOV     ESI,ESP
        MOV     EBP,ECX
@@lp:   MOV     EAX,[EBX]
        MOV     [ESI],EAX
        MOV     EAX,[EBX+4]
        MOV     [ESI+4],EAX
        MOV     EAX,[EBX+8]
        MOV     [ESI+8],EAX
        MOV     EAX,[EBX+12]
        MOV     EDX,ESI
        MOV     [ESI+12],EAX
        MOV     EAX,EBX
        CALL    IntCAST6EncryptECB
        MOV     DH,[EDI]
        MOV     DL,[ESI]
        XOR     [EDI],DL
        MOV     AL,[EBX+1]
        MOV     [EBX],AL
        MOV     AL,[EBX+2]
        MOV     [EBX+1],AL
        MOV     AL,[EBX+3]
        MOV     [EBX+2],AL
        MOV     AL,[EBX+4]
        MOV     [EBX+3],AL
        MOV     AL,[EBX+5]
        MOV     [EBX+4],AL
        MOV     AL,[EBX+6]
        MOV     [EBX+5],AL
        MOV     AL,[EBX+7]
        MOV     [EBX+6],AL
        MOV     AL,[EBX+8]
        MOV     [EBX+7],AL
        MOV     AL,[EBX+9]
        MOV     [EBX+8],AL
        MOV     AL,[EBX+10]
        MOV     [EBX+9],AL
        MOV     AL,[EBX+11]
        MOV     [EBX+10],AL
        MOV     AL,[EBX+12]
        MOV     [EBX+11],AL
        MOV     AL,[EBX+13]
        MOV     [EBX+12],AL
        MOV     AL,[EBX+14]
        MOV     [EBX+13],AL
        MOV     AL,[EBX+15]
        MOV     [EBX+14],AL
        INC     EDI
        MOV     [EBX+15],DH
        DEC     EBP
        JNE     @@lp
        MOV     [ESI],EBP
        MOV     [ESI+4],EBP
        MOV     [ESI+8],EBP
        MOV     [ESI+12],EBP
        ADD     ESP,$10
        POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
@@qt:
end;

procedure MT_CAST6ApplyOFB(ID: TCASTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI
        PUSH    EBP
        MOV     EBX,EAX
        SUB     ESP,$10
        MOV     EDI,EDX
        MOV     ESI,ESP
        PUSH    ECX
        MOV     EBP,ECX
        SHR     EBP,2
        JE      @@nx
@@lp1:  MOV     EAX,[EBX]
        MOV     [ESI],EAX
        MOV     EAX,[EBX+4]
        MOV     [ESI+4],EAX
        MOV     EAX,[EBX+8]
        MOV     [ESI+8],EAX
        MOV     EAX,[EBX+12]
        MOV     EDX,ESI
        MOV     [ESI+12],EAX
        MOV     EAX,EBX
        CALL    IntCAST6EncryptECB
        MOV     EDX,[ESI]
        XOR     [EDI],EDX
        MOV     EAX,[EBX+4]
        MOV     [EBX],EAX
        MOV     EAX,[EBX+8]
        MOV     [EBX+4],EAX
        MOV     EAX,[EBX+12]
        MOV     [EBX+8],EAX
        ADD     EDI,4
        MOV     [EBX+12],EDX
        DEC     EBP
        JNE     @@lp1
@@nx:   POP     EBP
        AND     EBP,3
        JE      @@qt
        MOV     EAX,[EBX]
        MOV     [ESI],EAX
        MOV     EAX,[EBX+4]
        MOV     [ESI+4],EAX
        MOV     EAX,[EBX+8]
        MOV     [ESI+8],EAX
        MOV     EAX,[EBX+12]
        MOV     EDX,ESI
        MOV     [ESI+12],EAX
        MOV     EAX,EBX
        CALL    IntCAST6EncryptECB
        MOV     EAX,[EBX+4]
        MOV     [EBX],EAX
        MOV     EAX,[EBX+8]
        MOV     [EBX+4],EAX
        MOV     EAX,[EBX+12]
        MOV     [EBX+8],EAX
        MOV     EDX,[ESI]
        MOV     [EBX+12],EDX
@@lp2:  XOR     BYTE PTR [EDI],DL
        SHR     EDX,8
        INC     EDI
        DEC     EBP
        JNE     @@lp2
@@qt:   MOV     [ESI],EBP
        MOV     [ESI+4],EBP
        MOV     [ESI+8],EBP
        MOV     [ESI+12],EBP
        ADD     ESP,$10
        POP     EBP
        POP     EDI
        POP     ESI
        POP     EBX
end;}

procedure IntCAST6Clear(ID: TCASTID);
asm
        XOR     EDX,EDX
        CALL    IntFill32
        ADD     EAX,128
        CALL    IntFill32
        ADD     EAX,128
        CALL    IntFill32
        MOV     [EAX+128],EDX
        MOV     [EAX+132],EDX
        MOV     [EAX+136],EDX
        MOV     [EAX+140],EDX
end;

procedure MT_CAST6Done(ID: TCASTID);
begin
  IntCAST6Clear(ID);
  FreeMem(PCAST6Data(ID));
end;

function MT_CAST6SelfTest: Boolean;
const
  PlainText: string = '00000000000000000000000000000000';
var
  ID: TCASTID;
  K,S,S1: string;
begin
  S1 := MT_CodesToStr(PlainText);
  K := MT_CodesToStr('2342BB9EFA38542C0AF75647F29F615D');
  MT_BSwapLongs(Pointer(K),4);
  MT_CAST6Init(ID,Pointer(K),Length(K));
  IntCAST6EncryptECB(ID,Pointer(S1));
  MT_BSwapLongs(Pointer(S1),4);
  S := MT_StrToCodes(S1);
  if not MT_SameStr(S,'C842A08972B43D20836C91D1B7530F6B') then
  begin
    MT_CAST6Done(ID);
    Result := False;
    Exit;
  end;
  MT_BSwapLongs(Pointer(S1),4);
  IntCAST6DecryptECB(ID,Pointer(S1));
  MT_CAST6Done(ID);
  S := MT_StrToCodes(S1);
  if not MT_SameStr(S,PlainText) then
  begin
    Result := False;
    Exit;
  end;
  K := MT_CodesToStr('2342BB9EFA38542CBED0AC83940AC298BAC77A7717942863');
  MT_BSwapLongs(Pointer(K),6);
  MT_CAST6Init(ID,Pointer(K),Length(K));
  IntCAST6EncryptECB(ID,Pointer(S1));
  MT_BSwapLongs(Pointer(S1),4);
  S := MT_StrToCodes(S1);
  if not MT_SameStr(S,'1B386C0210DCADCBDD0E41AA08A7A7E8') then
  begin
    MT_CAST6Done(ID);
    Result := False;
    Exit;
  end;
  MT_BSwapLongs(Pointer(S1),4);
  IntCAST6DecryptECB(ID,Pointer(S1));
  MT_CAST6Done(ID);
  S := MT_StrToCodes(S1);
  if not MT_SameStr(S,PlainText) then
  begin
    Result := False;
    Exit;
  end;
  K := MT_CodesToStr('2342BB9EFA38542CBED0AC83940AC2988D7C47CE264908461CC1B5137AE6B604');
  MT_BSwapLongs(Pointer(K),8);
  MT_CAST6Init(ID,Pointer(K),Length(K));
  IntCAST6EncryptECB(ID,Pointer(S1));
  MT_BSwapLongs(Pointer(S1),4);
  S := MT_StrToCodes(S1);
  if not MT_SameStr(S,'4F6A2038286897B9C9870136553317FA') then
  begin
    MT_CAST6Done(ID);
    Result := False;
    Exit;
  end;
  MT_BSwapLongs(Pointer(S1),4);
  IntCAST6DecryptECB(ID,Pointer(S1));
  MT_CAST6Done(ID);
  S := MT_StrToCodes(S1);
  Result := MT_SameStr(S,PlainText);
end;

type
  PSHA1Data = ^TSHA1Data;
  TSHA1Data = record
    Buffer: array[0..63] of Byte;
    LHi,LLo,Index: LongWord;
    Hash: TSHA1Digest;
    Tmp: array[0..79] of LongWord;
  end;

procedure IntSHA1Compress(ID: TSHAID);
asm
        PUSH    EBX
        PUSH    ESI
        XOR     ECX,ECX
        PUSH    EDI
        MOV     [EAX+72],ECX
        PUSH    EBP
        LEA     ESI,[EAX].TSHA1Data.Tmp
        MOV     EBX,[EAX]
        BSWAP   EBX
        MOV     [ESI],EBX
        MOV     EBX,[EAX+4]
        BSWAP   EBX
        MOV     [ESI+4],EBX
        MOV     EBX,[EAX+8]
        BSWAP   EBX
        MOV     [ESI+8],EBX
        MOV     EBX,[EAX+12]
        BSWAP   EBX
        MOV     [ESI+12],EBX
        MOV     EBX,[EAX+16]
        BSWAP   EBX
        MOV     [ESI+16],EBX
        MOV     EBX,[EAX+20]
        BSWAP   EBX
        MOV     [ESI+20],EBX
        MOV     EBX,[EAX+24]
        BSWAP   EBX
        MOV     [ESI+24],EBX
        MOV     EBX,[EAX+28]
        BSWAP   EBX
        MOV     [ESI+28],EBX
        MOV     EBX,[EAX+32]
        BSWAP   EBX
        MOV     [ESI+32],EBX
        MOV     EBX,[EAX+36]
        BSWAP   EBX
        MOV     [ESI+36],EBX
        MOV     EBX,[EAX+40]
        BSWAP   EBX
        MOV     [ESI+40],EBX
        MOV     EBX,[EAX+44]
        BSWAP   EBX
        MOV     [ESI+44],EBX
        MOV     EBX,[EAX+48]
        BSWAP   EBX
        MOV     [ESI+48],EBX
        MOV     EBX,[EAX+52]
        BSWAP   EBX
        MOV     [ESI+52],EBX
        MOV     EBX,[EAX+56]
        BSWAP   EBX
        MOV     [ESI+56],EBX
        MOV     EBX,[EAX+60]
        BSWAP   EBX
        LEA     EDI,[ESI+64]
        MOV     [ESI+60],EBX
        PUSH    EAX
        LEA     EDX,[EAX].TSHA1Data.Hash
        MOV     ECX,16
@@lp0:  MOV     EAX,[EDI-64]
        MOV     EBX,[EDI-56]
        XOR     EAX,[EDI-32]
        XOR     EBX,[EDI-12]
        XOR     EAX,EBX
        ROL     EAX,1
        MOV     [EDI],EAX
        MOV     EAX,[EDI-60]
        MOV     EBX,[EDI-52]
        XOR     EAX,[EDI-28]
        XOR     EBX,[EDI-8]
        XOR     EAX,EBX
        ROL     EAX,1
        MOV     [EDI+4],EAX
        MOV     EAX,[EDI-56]
        XOR     EAX,[EDI-24]
        MOV     EBX,[EDI-48]
        XOR     EBX,[EDI-4]
        XOR     EAX,EBX
        ROL     EAX,1
        MOV     [EDI+8],EAX
        MOV     EAX,[EDI-52]
        MOV     EBX,[EDI-44]
        XOR     EAX,[EDI-20]
        XOR     EBX,[EDI]
        XOR     EAX,EBX
        ROL     EAX,1
        MOV     [EDI+12],EAX
        ADD     EDI,16
        DEC     ECX
        JNE     @@lp0
        MOV     ECX,5
        MOV     EAX,[EDX]
        PUSH    ECX
        MOV     EDI,[EDX+4]
        MOV     EBX,[EDX+8]
        MOV     EBP,[EDX+12]
        MOV     ECX,[EDX+16]
        MOV     EDX,EAX
@@lp1:  ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBX
        XOR     ECX,EBP
        ADD     EAX,[ESI]
        AND     ECX,EDI
        XOR     ECX,EBP
        ADD     ECX,$5A827999
        ADD     EAX,ECX
        MOV     ECX,EBP
        ROR     EDI,2
        MOV     EBP,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDI
        XOR     ECX,EBX
        AND     ECX,EDX
        ADD     EAX,[ESI+4]
        XOR     ECX,EBX
        ROR     EDX,2
        ADD     ECX,$5A827999
        ADD     EAX,ECX
        MOV     ECX,EBX
        MOV     EBX,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDX
        ADD     EAX,[ESI+8]
        XOR     ECX,EDI
        AND     ECX,EBP
        ROR     EBP,2
        XOR     ECX,EDI
        ADD     ECX,$5A827999
        ADD     EAX,ECX
        MOV     ECX,EDI
        MOV     EDI,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBP
        ADD     EAX,[ESI+12]
        XOR     ECX,EDX
        AND     ECX,EBX
        XOR     ECX,EDX
        ADD     ECX,$5A827999
        ROR     EBX,2
        ADD     EAX,ECX
        MOV     ECX,EDX
        MOV     EDX,EAX
        ADD     ESI,16
        DEC     DWORD PTR [ESP]
        JNE     @@lp1
        MOV     DWORD PTR [ESP],5
@@lp2:  ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDI
        ADD     EAX,[ESI]
        XOR     ECX,EBX
        XOR     ECX,EBP
        ADD     ECX,$6ED9EBA1
        ADD     EAX,ECX
        MOV     ECX,EBP
        ROR     EDI,2
        MOV     EBP,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDX
        XOR     ECX,EDI
        XOR     ECX,EBX
        ADD     ECX,$6ED9EBA1
        ROR     EDX,2
        ADD     EAX,[ESI+4]
        ADD     EAX,ECX
        MOV     ECX,EBX
        MOV     EBX,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBP
        XOR     ECX,EDX
        ROR     EBP,2
        XOR     ECX,EDI
        ADD     EAX,[ESI+8]
        ADD     ECX,$6ED9EBA1
        ADD     EAX,ECX
        MOV     ECX,EDI
        MOV     EDI,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBX
        XOR     ECX,EBP
        XOR     ECX,EDX
        ADD     EAX,[ESI+12]
        ADD     ECX,$6ED9EBA1
        ADD     EAX,ECX
        MOV     ECX,EDX
        ROR     EBX,2
        MOV     EDX,EAX
        ADD     ESI,16
        DEC     DWORD PTR [ESP]
        JNE     @@lp2
        MOV     DWORD PTR [ESP],5
        PUSH    ECX
@@lp3:  MOV     EAX,EDI
        MOV     ECX,EDI
        AND     EAX,EBX
        OR      ECX,EBX
        AND     ECX,EBP
        OR      EAX,ECX
        MOV     ECX,EDX
        ADD     EAX,[ESI]
        ROL     ECX,5
        ADD     EAX,$8F1BBCDC
        ADD     ECX,[ESP]
        ADD     EAX,ECX
        ROR     EDI,2
        MOV     [ESP],EBP
        MOV     EBP,EAX
        MOV     EAX,EDX
        MOV     ECX,EDX
        AND     EAX,EDI
        OR      ECX,EDI
        AND     ECX,EBX
        OR      EAX,ECX
        MOV     ECX,EBP
        ADD     EAX,[ESI+4]
        ROL     ECX,5
        ADD     EAX,$8F1BBCDC
        ADD     ECX,[ESP]
        ADD     EAX,ECX
        ROR     EDX,2
        MOV     [ESP],EBX
        MOV     EBX,EAX
        MOV     EAX,EBP
        MOV     ECX,EBP
        AND     EAX,EDX
        OR      ECX,EDX
        AND     ECX,EDI
        OR      EAX,ECX
        MOV     ECX,EBX
        ADD     EAX,[ESI+8]
        ROL     ECX,5
        ADD     EAX,$8F1BBCDC
        ADD     ECX,[ESP]
        ADD     EAX,ECX
        ROR     EBP,2
        MOV     [ESP],EDI
        MOV     EDI,EAX
        MOV     EAX,EBX
        MOV     ECX,EBX
        AND     EAX,EBP
        OR      ECX,EBP
        AND     ECX,EDX
        OR      EAX,ECX
        MOV     ECX,EDI
        ADD     EAX,[ESI+12]
        ROL     ECX,5
        ADD     EAX,$8F1BBCDC
        ADD     ECX,[ESP]
        ADD     EAX,ECX
        ROR     EBX,2
        MOV     [ESP],EDX
        MOV     EDX,EAX
        ADD     ESI,16
        DEC     DWORD PTR [ESP+4]
        JNE     @@lp3
        POP     ECX
        MOV     DWORD PTR [ESP],5
@@lp4:  ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDI
        XOR     ECX,EBX
        XOR     ECX,EBP
        ROR     EDI,2
        ADD     EAX,[ESI]
        ADD     ECX,$CA62C1D6
        ADD     EAX,ECX
        MOV     ECX,EBP
        MOV     EBP,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EDX
        ADD     EAX,[ESI+4]
        XOR     ECX,EDI
        XOR     ECX,EBX
        ADD     ECX,$CA62C1D6
        ADD     EAX,ECX
        MOV     ECX,EBX
        ROR     EDX,2
        MOV     EBX,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBP
        ADD     EAX,[ESI+8]
        XOR     ECX,EDX
        XOR     ECX,EDI
        ROR     EBP,2
        ADD     ECX,$CA62C1D6
        ADD     EAX,ECX
        MOV     ECX,EDI
        MOV     EDI,EAX
        ROL     EAX,5
        ADD     EAX,ECX
        MOV     ECX,EBX
        ADD     EAX,[ESI+12]
        XOR     ECX,EBP
        XOR     ECX,EDX
        ADD     ECX,$CA62C1D6
        ADD     EAX,ECX
        MOV     ECX,EDX
        ROR     EBX,2
        MOV     EDX,EAX
        ADD     ESI,16
        DEC     DWORD PTR [ESP]
        JNE     @@lp4
        POP     EAX
        POP     EAX
        ADD     [EAX+76],EDX
        ADD     [EAX+80],EDI
        ADD     [EAX+84],EBX
        ADD     [EAX+88],EBP
        ADD     [EAX+92],ECX
        POP     EBP
        POP     EDI
        XOR     EDX,EDX
        CALL    IntFill16
        POP     ESI
        POP     EBX
end;

procedure IntSHA1Clear(ID: TSHAID);
asm
        XOR     EDX,EDX
        MOV     [EAX+64],EDX
        MOV     [EAX+68],EDX
        MOV     [EAX+72],EDX
        MOV     [EAX+76],EDX
        MOV     [EAX+80],EDX
        MOV     [EAX+84],EDX
        MOV     [EAX+88],EDX
        MOV     [EAX+92],EDX
        LEA     EAX,[EAX].TSHA1Data.Tmp
        CALL    IntFill32
        ADD     EAX,128
        CALL    IntFill32
        ADD     EAX,128
        CALL    IntFill16
end;

procedure MT_SHA1Init(var ID: TSHAID);
begin
  GetMem(PSHA1Data(ID),SizeOf(TSHA1Data));
  IntFill16(Pointer(ID),0);
  with PSHA1Data(ID)^ do
  begin
    LHi := 0;
    LLo := 0;
    Index := 0;
    Hash[0]:= $67452301;
    Hash[1]:= $EFCDAB89;
    Hash[2]:= $98BADCFE;
    Hash[3]:= $10325476;
    Hash[4]:= $C3D2E1F0;
  end;
end;

procedure MT_SHA1Update(ID: TSHAID; P: Pointer; L: Cardinal);
var
  N: LongWord;
begin
  with PSHA1Data(ID)^ do
  begin
    N := L shl 3;
    Inc(LLo, N);
    if LLo < N then
      Inc(LHi);
    Inc(LHi, L shr 29);
    while L <> 0 do
    begin
      N := SizeOf(Buffer)-Index;
      if N <= L then
      begin
        MT_CopyMem(P,@Buffer[Index],N);
        Inc(PByte(P), N);
        Dec(L, N);
        IntSHA1Compress(ID);
      end else
      begin
        MT_CopyMem(P,@Buffer[Index],L);
        Inc(Index, L);
        Break;
      end;
    end;
  end;
end;

procedure MT_SHA1Final(ID: TSHAID; var Digest: TSHA1Digest);
var
  U: LongWord;
begin
  with PSHA1Data(ID)^ do
  begin
    Buffer[Index]:= $80;
    if Index>= 56 then
      IntSHA1Compress(ID);
    U := LHi;
    asm
        MOV     EAX,U
        BSWAP   EAX
        MOV     U,EAX
    end;
    PLong(@Buffer[56])^:= U;
    U := LLo;
    asm
        MOV     EAX,U
        BSWAP   EAX
        MOV     U,EAX
    end;
    PLong(@Buffer[60])^:= U;
    IntSHA1Compress(ID);
    Digest[0] := Hash[0];
    Digest[1] := Hash[1];
    Digest[2] := Hash[2];
    Digest[3] := Hash[3];
    Digest[4] := Hash[4];
  end;
  IntSHA1Clear(ID);
  FreeMem(PSHA1Data(ID));
end;

procedure MT_SHA1(const S: string; var Digest: TSHA1Digest); overload;
var
  ID: TSHAID;
begin
  MT_SHA1Init(ID);
  MT_SHA1Update(ID, Pointer(S), Length(S));
  MT_SHA1Final(ID, Digest);
end;

procedure MT_SHA1(P: Pointer; L: Cardinal; var Digest: TSHA1Digest); overload;
var
  ID: TSHAID;
begin
  MT_SHA1Init(ID);
  MT_SHA1Update(ID, P, L);
  MT_SHA1Final(ID, Digest);
end;

procedure MT_SHA1(const SourceDigest: TSHA1Digest; var Digest: TSHA1Digest); overload;
var
  ID: TSHAID;
begin
  MT_SHA1Init(ID);
  MT_SHA1Update(ID, @SourceDigest, SizeOf(TSHA1Digest));
  MT_SHA1Final(ID, Digest);
end;

function MT_SHA1SelfTest: Boolean;
var
  ID: TSHAID;
  Dig: TSHA1Digest;
  S: string;
begin
  MT_SHA1('abc',Dig);
  if not ((Dig[0]=$A9993E36) and (Dig[1]=$4706816A) and (Dig[2]=$BA3E2571) and
    (Dig[3]=$7850C26C) and (Dig[4]=$9CD0D89D)) then
  begin
    Result := False;
    Exit;
  end;
  S := StringOfChar('a',200000);
  MT_SHA1Init(ID);
  MT_SHA1Update(ID,Pointer(S),200000);
  MT_SHA1Update(ID,Pointer(S),200000);
  MT_SHA1Update(ID,Pointer(S),200000);
  MT_SHA1Update(ID,Pointer(S),200000);
  MT_SHA1Update(ID,Pointer(S),200000);
  MT_SHA1Final(ID,Dig);
  if not ((Dig[0]=$34AA973C) and (Dig[1]=$D4C4DAA4) and (Dig[2]=$F61EEB2B)
    and (Dig[3]=$DBAD2731) and (Dig[4]=$6534016F)) then
  begin
    Result := False;
    Exit;
  end;
  MT_SHA1Init(ID);
  S := 'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq';
  MT_SHA1Update(ID,Pointer(S),Length(S));
  MT_SHA1Final(ID,Dig);
  Result := (Dig[0]=$84983E44) and (Dig[1]=$1C3BD26E) and (Dig[2]=$BAAE4AA1) and
    (Dig[3]=$F95129E5) and (Dig[4]=$E54670F1);
end;

type
  PRandData = ^TRandData;
  TRandData = record
    MT: TRandVector;
    Index: Integer;
    SHAID: TSHAID;
    Ps: Integer;
  end;
  
procedure IntRandInit(P: Pointer; Seed: LongWord; Count: Cardinal);
asm
        PUSH    EDI
        PUSH    ESI
        MOV     EDI,EAX
        MOV     EAX,EDX
        MOV     ESI,69069
@@lp:   MOV     [EDI],EAX
        MUL     ESI
        MOV     [EDI+4],EAX
        MUL     ESI
        MOV     [EDI+8],EAX
        MUL     ESI
        MOV     [EDI+12],EAX
        MUL     ESI
        MOV     [EDI+16],EAX
        MUL     ESI
        MOV     [EDI+20],EAX
        MUL     ESI
        MOV     [EDI+24],EAX
        MUL     ESI
        MOV     [EDI+28],EAX
        MUL     ESI
        ADD     EDI,32
        DEC     ECX
        JNE     @@lp
        POP     ESI
        POP     EDI
end;

procedure MT_RandInit(var ID: TMTID; Seed: LongWord); overload;
begin
  GetMem(PRandData(ID),SizeOf(TRandData));
  with PRandData(ID)^ do
  begin
    IntRandInit(@MT,Seed,78);
    Index := 624;
    SHAID := TSHAID(nil);
    Ps := -1;
  end;
end;

procedure MT_RandInit(var ID: TMTID; const InitVector: TRandVector); overload;
begin
  GetMem(PRandData(ID),SizeOf(TRandData));
  with PRandData(ID)^ do
  begin
    MT_CopyLongs(@InitVector,@MT,624);
    Index := 624;
    SHAID := TSHAID(nil);
    Ps := -1;
  end;
end;

procedure IntCAST6RandEncrypt(ID: TCASTID; P: Pointer);
asm
        PUSH    EBX
        PUSH    ESI
        MOV     EBX,EAX
        PUSH    EDI
        PUSH    EDX
        MOV     EDI,EDX
        MOV     ESI,62
@@lp:   MOV     EAX,EBX
        MOV     EDX,EDI
        CALL    IntCAST6EncryptECB
        MOV     EAX,EBX
        LEA     EDX,[EDI+8]
        CALL    IntCAST6EncryptECB
        MOV     EAX,EBX
        LEA     EDX,[EDI+16]
        CALL    IntCAST6EncryptECB
        MOV     EAX,EBX
        LEA     EDX,[EDI+24]
        CALL    IntCAST6EncryptECB
        MOV     EAX,EBX
        LEA     EDX,[EDI+32]
        CALL    IntCAST6EncryptECB
        ADD     EDI,40
        DEC     ESI
        JNE     @@lp
        MOV     EAX,EBX
        MOV     EDX,EDI
        CALL    IntCAST6EncryptECB
        POP     ESI
        LEA     EDX,[ESP-16]
        MOV     ESP,EDX
        MOV     EAX,[EDI+8]
        MOV     [EDX],EAX
        MOV     EAX,[EDI+12]
        MOV     [EDX+4],EAX
        MOV     EAX,[ESI]
        MOV     [EDX+8],EAX
        MOV     EAX,[ESI+4]
        MOV     [EDX+12],EAX
        MOV     EAX,EBX
        MOV     EBX,EDX
        CALL    IntCAST6EncryptECB
        MOV     EAX,[EBX]
        MOV     [EDI+8],EAX
        MOV     EAX,[EBX+4]
        MOV     [EDI+12],EAX
        MOV     EAX,[EBX+8]
        MOV     [ESI],EAX
        MOV     EAX,[EBX+12]
        MOV     [ESI+4],EAX
        XOR     EAX,EAX
        MOV     [EBX],EAX
        MOV     [EBX+4],EAX
        MOV     [EBX+8],EAX
        MOV     [EBX+12],EAX
        ADD     ESP,16
        POP     EDI
        POP     ESI
        POP     EBX
end;

procedure MT_RandUpdate(ID: TMTID; const S: string); overload;
var
  L: LongWord;
  CsID: TCASTID;
  P: PByte;
begin
  L := Length(S);
  if L <> 0 then
  begin
    P := Pointer(S);
    while L > 32 do
    begin
      MT_CAST6Init(CsID,P,32);
      IntCAST6RandEncrypt(CsID,PRandData(ID));
      MT_CAST6Done(CsID);
      Inc(P,32);
      Dec(L,32);
    end;
    MT_CAST6Init(CsID,P,L);
    with PRandData(ID)^ do
    begin
      IntCAST6RandEncrypt(CsID,@MT);
      Index := 624;
      Ps := -1;
    end;
    MT_CAST6Done(CsID);
  end;
end;

procedure MT_RandUpdate(ID: TMTID; P: Pointer; L: Cardinal); overload;
var
  CsID: TCASTID;
begin
  if L <> 0 then
  begin
    while L > 32 do
    begin
      MT_CAST6Init(CsID,P,32);
      IntCAST6RandEncrypt(CsID,PRandData(ID));
      MT_CAST6Done(CsID);
      Inc(PByte(P),32);
      Dec(L,32);
    end;
    MT_CAST6Init(CsID,P,L);
    with PRandData(ID)^ do
    begin
      IntCAST6RandEncrypt(CsID,@MT);
      Index := 624;
      Ps := -1;
    end;
    MT_CAST6Done(CsID);
  end;
end;

procedure MT_RandUpdate(ID: TMTID; const Digest: TSHA1Digest); overload;
var
  CsID: TCASTID;
begin
  MT_CAST6Init(CsID,@Digest,SizeOf(TSHA1Digest));
  with PRandData(ID)^ do
  begin
    IntCAST6RandEncrypt(CsID,@MT);
    Index := 624;
    Ps := -1;
  end;
  MT_CAST6Done(CsID);
end;

procedure MT_RandGetVector(ID: TMTID; var Vector: TRandVector);
begin
  with PRandData(ID)^ do
  begin
    MT_CopyLongs(@MT,@Vector,624);
    Index := 624;
    Ps := -1;
  end;
end;

procedure MT_RandSetVector(ID: TMTID; const Vector: TRandVector);
begin
  with PRandData(ID)^ do
  begin
    MT_CopyLongs(@Vector,@MT,624);
    Index := 624;
    Ps := -1;
  end;
end;

function MT_RandNext(ID: TMTID): LongWord;
asm
        MOV     ECX,[EAX].TRandData.Index
        CMP     ECX,624
        JE      @@mk
@@nx:   MOV     EDX,[EAX+ECX*4]
        INC     ECX
        MOV     [EAX].TRandData.Index,ECX
        MOV     EAX,EDX
        SHR     EDX,11
        XOR     EAX,EDX
        MOV     EDX,EAX
        SHL     EAX,7
        AND     EAX,$9D2C5680
        XOR     EDX,EAX
        MOV     EAX,EDX
        SHL     EDX,15
        AND     EDX,$EFC60000
        XOR     EDX,EAX
        MOV     EAX,EDX
        SHR     EDX,18
        XOR     EAX,EDX
        RET
@@ku:   DD      0,$9908B0DF
@@mk:   PUSH    EDI
        PUSH    ESI
        PUSH    EBX
        MOV     EDI,EAX
        MOV     ECX,227
        PUSH    EAX
@@lp1:  MOV     EAX,[EDI]
        MOV     EDX,[EDI+4]
        AND     EAX,$80000000
        AND     EDX,$7FFFFFFF
        OR      EAX,EDX
        MOV     EDX,EAX
        MOV     EBX,[EDI+1588]
        SHR     EAX,1
        AND     EDX,1
        XOR     EBX,EAX
        XOR     EBX,DWORD PTR @@ku[EDX*4]
        MOV     [EDI],EBX
        ADD     EDI,4
        DEC     ECX
        JNE     @@lp1
        MOV     ECX,198
        MOV     EAX,[EDI]
@@lp2:  MOV     EDX,[EDI+4]
        MOV     ESI,EDX
        AND     EDX,$7FFFFFFF
        AND     EAX,$80000000
        OR      EAX,EDX
        MOV     EBX,[EDI-908]
        MOV     EDX,EAX
        AND     EDX,1
        SHR     EAX,1
        XOR     EBX,EAX
        XOR     EBX,DWORD PTR @@ku[EDX*4]
        MOV     [EDI],EBX
        MOV     EDX,[EDI+8]
        MOV     EAX,EDX
        AND     EDX,$7FFFFFFF
        AND     ESI,$80000000
        OR      ESI,EDX
        MOV     EBX,[EDI-904]
        MOV     EDX,ESI
        AND     EDX,1
        SHR     ESI,1
        XOR     EBX,ESI
        XOR     EBX,DWORD PTR @@ku[EDX*4]
        MOV     [EDI+4],EBX
        ADD     EDI,8
        DEC     ECX
        JNE     @@lp2
        AND     EAX,$80000000
        POP     EDI
        MOV     EDX,[EDI]
        AND     EDX,$7FFFFFFF
        OR      EAX,EDX
        MOV     EBX,[EDI+1584]
        MOV     EDX,EAX
        AND     EDX,1
        SHR     EAX,1
        XOR     EBX,EAX
        XOR     EBX,DWORD PTR @@ku[EDX*4]
        MOV     [EDI+2492],EBX
        MOV     EAX,EDI
        POP     EBX
        POP     ESI
        POP     EDI
        JMP     @@nx
end;

function MT_SecureRandNext(ID: TMTID): LongWord;
begin
  with PRandData(ID)^ do
  begin
    if Ps >= 0 then
    begin
      with PSHA1Data(SHAID)^ do
        Result := Hash[Ps];
      Dec(Ps);
    end else
    begin
      if Pointer(SHAID) <> nil then
        with PSHA1Data(SHAID)^ do
        begin
          Hash[0]:= $67452301;
          Hash[1]:= $EFCDAB89;
          Hash[2]:= $98BADCFE;
          Hash[3]:= $10325476;
          Hash[4]:= $C3D2E1F0;
        end
      else
        MT_SHA1Init(SHAID);
      with PSHA1Data(SHAID)^ do
      begin
        PLong(@Buffer[0])^ := MT_RandNext(ID);
        PLong(@Buffer[4])^ := MT_RandNext(ID);
        PLong(@Buffer[8])^ := MT_RandNext(ID);
        PLong(@Buffer[12])^ := MT_RandNext(ID);
        PLong(@Buffer[16])^ := MT_RandNext(ID);
        PLong(@Buffer[20])^ := MT_RandNext(ID);
        PLong(@Buffer[24])^ := MT_RandNext(ID);
        PLong(@Buffer[28])^ := MT_RandNext(ID);
        PLong(@Buffer[32])^ := MT_RandNext(ID);
        PLong(@Buffer[36])^ := MT_RandNext(ID);
        PLong(@Buffer[40])^ := MT_RandNext(ID);
        PLong(@Buffer[44])^ := MT_RandNext(ID);
        PLong(@Buffer[48])^ := MT_RandNext(ID);
        PLong(@Buffer[52])^ := MT_RandNext(ID);
        Buffer[55] := $80;
        Buffer[62] := $01;
        Buffer[63] := $B8;
        IntSHA1Compress(SHAID);
        Result := Hash[4];
      end;
      Ps := 3;
    end;
  end;
end;

procedure MT_RandFill(ID: TMTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    EDI
        PUSH    ESI
        MOV     EDI,ECX
        AND     ECX,7
        MOV     ESI,EAX
        MOV     EBX,EDX
        PUSH    ECX
        SHR     EDI,3
        JE      @@nx
@@lp:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        ADD     EBX,4
        MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        ADD     EBX,4
        DEC     EDI
        JNE     @@lp
@@nx:   POP     ECX
        JMP     DWORD PTR @@tV[ECX*4]
@@tV:   DD      @@qt, @@t1, @@t2, @@t3
        DD      @@t4, @@t5, @@t6, @@t7
@@t1:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     BYTE PTR [EBX],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t2:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     WORD PTR [EBX],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t3:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     WORD PTR [EBX],AX
        SHR     EAX,16
        MOV     BYTE PTR [EBX+2],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t4:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t5:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     BYTE PTR [EBX+4],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t6:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     WORD PTR [EBX+4],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t7:   MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_RandNext
        MOV     WORD PTR [EBX+4],AX
        SHR     EAX,16
        MOV     BYTE PTR [EBX+6],AL
@@qt:   POP     ESI
        POP     EDI
        POP     EBX
end;

procedure MT_SecureRandFill(ID: TMTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    EDI
        PUSH    ESI
        MOV     EDI,ECX
        MOV     EBX,EDX
        AND     ECX,7
        MOV     ESI,EAX
        PUSH    ECX
        SHR     EDI,3
        JE      @@nx
@@lp:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        ADD     EBX,4
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        ADD     EBX,4
        DEC     EDI
        JNE     @@lp
@@nx:   POP     ECX
        JMP     DWORD PTR @@tV[ECX*4]
@@tV:   DD      @@qt, @@t1, @@t2, @@t3
        DD      @@t4, @@t5, @@t6, @@t7
@@t1:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     BYTE PTR [EBX],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t2:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     WORD PTR [EBX],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t3:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     WORD PTR [EBX],AX
        SHR     EAX,16
        MOV     BYTE PTR [EBX+2],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t4:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t5:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     BYTE PTR [EBX+4],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t6:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     WORD PTR [EBX+4],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t7:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        MOV     WORD PTR [EBX+4],AX
        SHR     EAX,16
        MOV     BYTE PTR [EBX+6],AL
@@qt:   POP     ESI
        POP     EDI
        POP     EBX
end;

procedure MT_SecureRandXOR(ID: TMTID; P: Pointer; L: Cardinal);
asm
        PUSH    EBX
        PUSH    EDI
        PUSH    ESI
        MOV     EDI,ECX
        MOV     EBX,EDX
        AND     ECX,7
        MOV     ESI,EAX
        PUSH    ECX
        SHR     EDI,3
        JE      @@nx
@@lp:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        ADD     EBX,4
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        ADD     EBX,4
        DEC     EDI
        JNE     @@lp
@@nx:   POP     ECX
        JMP     DWORD PTR @@tV[ECX*4]
@@tV:   DD      @@qt, @@t1, @@t2, @@t3
        DD      @@t4, @@t5, @@t6, @@t7
@@t1:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     BYTE PTR [EBX],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t2:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     WORD PTR [EBX],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t3:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     WORD PTR [EBX],AX
        SHR     EAX,16
        XOR     BYTE PTR [EBX+2],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t4:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t5:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     BYTE PTR [EBX+4],AL
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t6:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     WORD PTR [EBX+4],AX
        POP     ESI
        POP     EDI
        POP     EBX
        RET
@@t7:   MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     [EBX],EAX
        MOV     EAX,ESI
        CALL    MT_SecureRandNext
        XOR     WORD PTR [EBX+4],AX
        SHR     EAX,16
        XOR     BYTE PTR [EBX+6],AL
@@qt:   POP     ESI
        POP     EDI
        POP     EBX
end;

procedure MT_RandDone(ID: TMTID);
begin
  with PRandData(ID)^ do
    if SHAID <> TSHAID(nil) then
    begin
      IntSHA1Clear(SHAID);
      FreeMem(PSHA1Data(SHAID));
    end;
  MT_ZeroMem(PRandData(ID),SizeOf(TRandData));
  FreeMem(PRandData(ID));
end;

end.

