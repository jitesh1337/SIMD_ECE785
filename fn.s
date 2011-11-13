	.cpu cortex-a8
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"fn.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	make_tables
	.type	make_tables, %function
make_tables:
	.fnstart
.LFB0:
	.file 1 "fn.c"
	.loc 1 6 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	str	r4, [sp, #-4]!
	.save {r4}
	vpush	{q4-q7}
.LCFI0:
	.cfi_def_cfa_offset 4
	fmsr	s15, r3
	.loc 1 21 0
	cmp	r2, #0
	beq	.L4
	.cfi_offset 4, -4
.LVL1:
	.loc 1 22 0
	fmsr	s3, r2	@ int
	fuitos	s14, s3
	mov	r3, #0
	mov	ip, r3
.LVL2:
	fdivs	s0, s15, s14  @s15 : range, @s14 : count
	.loc 1 25 0
	ldr	r3, =.L6
	vld1.32	{d8[], d9[]}, [r3]!	@load cc4 in q4
	vld1.32	{d6[], d7[]}, [r3]!	@load cc3 in q3
	vld1.32	{d4[], d5[]}, [r3]!	@load cc2 in q2
	vld1.32	{d2[], d3[]}, [r3]!	@load cc1 in q1

	vld1.32 {d0[1]}, [r3]!		@load FOUR_BY_PI in d0[1]
	vld1.32 {d10[], d11[]}, [r3]!	@load tc2 in q5
	vld1.32 {d12[], d13[]}, [r3]!	@load tc1 in q6
	vld1.32 {d14[], d15[]}, [r3]!	@load -tc3 in q7

	mov	r4, #4
	vdup.32	q8, r4	
	vcvt.f32.u32 q8, q8

	vld1.32 {q9}, [r3]!
	vcvt.f32.u32 q9, q9
	.loc 1 27 0
	.loc 1 29 0
.L3:
	.loc 1 22 0
.LVL3:
	vmul.f32	q10, q9, d0[0] @x = i * range/count
.LVL4:
	.loc 1 24 0
	vmul.f32	q11, q10, q10  @x2 = x * x
	.loc 1 25 0

	vmov q15, q3         @Load cc3 in q15
	vmov q14, q1	     @Load cc1 in q14
	vmul.f32 q13, q11, q11   @calculate x4

	vmla.f32 q15, q11, q4    @ cc3 + cc4*x2

	vmla.f32 q14, q11, q2	@cc1 + cc2*x2
	vmla.f32 q14, q13, q15  @ Final cos value

	vmul.f32	q10, q10, d0[1]    @x = x * FOUR_BY_PI
	vst1.32	{q14}, [r0]!               @ store result for cos
	.loc 1 27 0
	@start of tan
.LVL5:
	.loc 1 28 0
	vmul.f32	q11, q10, q10     @ x2 = x * x
	vmov	q15, q6                   @load tc1 in q15 
	vadd.f32 q9, q9, q8               @Increment "i" array
	vmla.f32 q15, q5, q11		  @tc1 + tc2 * x2
	vsub.f32	q14, q11, q7 	  @tc2 + x2
	vmul.f32 q15, q15, q10		  @x2 * Numerator
.LVL6:
	vrecpe.f32 q13, q14		  @ Reverse denominator
	add	ip, ip, #4		  @ Increment looper
	cmp	r2, ip		@ test for end of loop
	vmul.f32 q13, q13, q15		  @Final tan value
	vst1.32	{q13}, [r1]!		  @ store
	.loc 1 34 0
	.loc 1 21 0
	bhi	.L3
.LVL7:
.L4:
	.loc 1 37 0
	vpop	{q4-q7}
	ldmfd	sp!, {r4}
	bx	lr
.L7:
	.align	2
.L6:
	.word	-1163485514
	.word	1026158350
	.word	-1090521978
	.word	1065353104
	.word	1067645315   @ THIS IS FOUR_OVER_PI
	.word	1040826008
	.word	-1068843589
	.word	1082200313
	.word	0
	.word	1
	.word	2
	.word	3
	.cfi_endproc
.LFE0:
	.fnend
	.size	make_tables, .-make_tables
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LCFI0-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4f
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4f
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x90
	.uleb128 0x4f
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x10b
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x1
	.4byte	.LASF7
	.4byte	.LASF8
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x1
	.4byte	.LASF9
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.4byte	0xfc
	.uleb128 0x5
	.ascii	"c\000"
	.byte	0x1
	.byte	0x6
	.4byte	0xfc
	.byte	0x1
	.byte	0x50
	.uleb128 0x5
	.ascii	"t\000"
	.byte	0x1
	.byte	0x6
	.4byte	0xfc
	.byte	0x1
	.byte	0x51
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x6
	.4byte	0x102
	.byte	0x1
	.byte	0x52
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0x6
	.4byte	0x25
	.4byte	.LLST1
	.uleb128 0x8
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x102
	.byte	0x1
	.byte	0x5c
	.uleb128 0x9
	.ascii	"cc1\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x109
	.uleb128 0x9
	.ascii	"cc2\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x109
	.uleb128 0x9
	.ascii	"cc3\000"
	.byte	0x1
	.byte	0xb
	.4byte	0x109
	.uleb128 0x9
	.ascii	"cc4\000"
	.byte	0x1
	.byte	0xc
	.4byte	0x109
	.uleb128 0x9
	.ascii	"tc1\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x109
	.uleb128 0x9
	.ascii	"tc2\000"
	.byte	0x1
	.byte	0xf
	.4byte	0x109
	.uleb128 0x9
	.ascii	"tc3\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x109
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x25
	.4byte	.LLST2
	.uleb128 0x9
	.ascii	"x2\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x25
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x25
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0xc
	.4byte	0x25
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x1e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x10f
	.4byte	0x41
	.ascii	"make_tables\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF9:
	.ascii	"make_tables\000"
.LASF7:
	.ascii	"fn.c\000"
.LASF6:
	.ascii	"GNU C 4.4.1\000"
.LASF2:
	.ascii	"char\000"
.LASF3:
	.ascii	"count\000"
.LASF1:
	.ascii	"double\000"
.LASF4:
	.ascii	"range\000"
.LASF8:
	.ascii	"/home/user/Documents/BBCode/Project3\000"
.LASF0:
	.ascii	"float\000"
.LASF5:
	.ascii	"unsigned int\000"
	.ident	"GCC: (Sourcery G++ Lite 2010q1-202) 4.4.1"
	.section	.note.GNU-stack,"",%progbits
