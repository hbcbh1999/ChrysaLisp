%include 'inc/func.inc'
%include 'inc/mail.inc'
%include 'inc/math.inc'

;;;;;;;;;;;
; test code
;;;;;;;;;;;

	TEST_SIZE equ 1000

	fn_function tests/global_child

		;wait a bit
		s_call sys_math, random, {1000000}, {r0}
		vp_add 1000000, r0
		s_call sys_task, sleep, {r0}

		;read mail commands
		for r14, 0, 10, 1
			s_call sys_mail, mymail, {}, {r0}
			for r15, 0, TEST_SIZE, 1
				if r15, !=, [r0 + (r15 * 8) + ml_msg_data]
					fn_debug_str 'Failed to verify data !'
					vp_ret
				endif
			next
			s_call sys_mem, free, {r0}
		next

		fn_debug_str 'Hello from global worker !'
		vp_ret

	fn_function_end
