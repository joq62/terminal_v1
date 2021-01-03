all:
	erlc -o ebin src/*.erl;
	rm -rf ebin/* src/*.beam *.beam;
	rm -rf  *~ */*~  erl_cra*;
	echo Done
doc_gen:
	echo glurk not implemente
dtest:
	erl -pa ebin -s print_test start -sname print_test -setcookie abc
test:
	rm -rf ebin/* src/*.beam *.beam;
	rm -rf  *~ */*~  erl_cra*;
	erlc -o ebin src/*.erl;
	erl -pa ebin -s terminal_unit_tests start -sname terminal -setcookie abc
