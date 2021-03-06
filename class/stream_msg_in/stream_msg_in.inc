(import 'class/stream/stream.inc)

(def-class 'stream_msg_in 'stream)
(def-method 'create 'class/stream_msg_in/create 'static '(r0) '(r0))
(def-method 'new 'class/stream_msg_in/new 'static nil '(r0))
(def-method 'init 'class/stream_msg_in/init 'static '(r0 r1 r2))

(def-method 'read_ready 'class/stream_msg_in/read_ready 'final)
(def-method 'read_next 'class/stream_msg_in/read_next 'final)

(def-struct 'stream_msg_in 'stream)
	(ulong 'seqnum)
	(ulong 'state)
	(ptr 'mailbox)
	(struct 'list 'lh_list)
	(ulong 'ack_seqnum)
(def-struct-end)
