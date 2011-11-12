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
	fdivs	s4, s15, s14
	.loc 1 25 0
	flds	s5, .L6
	flds	s6, .L6+4
	flds	s7, .L6+8
	flds	s8, .L6+12
	.loc 1 27 0
	flds	s9, .L6+16
	.loc 1 29 0
	flds	s10, .L6+20
	flds	s11, .L6+24
	flds	s12, .L6+28
.L3:
	.loc 1 22 0
	fmsr	s13, ip	@ int
	fuitos	s15, s13
.LVL3:
	fmuls	s15, s4, s15
.LVL4:
	.loc 1 24 0
	fmuls	s14, s15, s15 	@ x2 = x * x
	.loc 1 25 0
	fcpys	s13, s6		@ start computing approximation of cos(x)
	fmacs	s13, s14, s5
	fcpys	s3, s7
	fmacs	s3, s13, s14
	fcpys	s13, s3
	fcpys	s3, s8
	fmacs	s3, s13, s14
	fmrs	r4, s3
	str	r4, [r0, r3]	@ float . store c[i]. r0 points to c[0]
	.loc 1 27 0
	fmuls	s15, s15, s9 	@ start computing approximation of tan(x)
.LVL5:
	.loc 1 28 0
	fmuls	s14, s15, s15
	.loc 1 29 0
	fcpys	s13, s11
	fmacs	s13, s14, s10
	fmuls	s15, s15, s13
.LVL6:
	fsubs	s14, s14, s12
	fdivs	s15, s15, s14
	fmrs	r4, s15
	str	r4, [r1, r3]	@ float ; store t[i]. r1 points to t[0]
	.loc 1 34 0
	add	ip, ip, #1
	add	r3, r3, #4	@ increment offset in arrays
	.loc 1 21 0
	cmp	r2, ip		@ test for end of loop
	bhi	.L3
.LVL7:
.L4:
	.loc 1 37 0
	ldmfd	sp!, {r4}
	bx	lr
.L7:
	.align	2
.L6:
	.word	-1163485514
	.word	1026158350
	.word	-1090521978
	.word	1065353104
	.word	1067645315
	.word	1040826008
	.word	-1068843589
	.word	1082200313
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
